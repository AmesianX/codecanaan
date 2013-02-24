package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class ContentController {

    def springSecurityService
    
    def s3Service

    def courseService

    static allowedMethods = [save: "POST", update: "POST"]

    /**
     * 顯示內容
     */
    def show(Long id) {
        def user = springSecurityService.currentUser

        def content = Content.get(id)

        if (!content) {
            response.sendError 404
            return
        }

        // 點擊次數 +1
        // content.hits ++
        // content.save(flush: true)

        //取得記錄
        def record = Record.findByUserAndContent(user, content)

        //檢查修改權限
        def authoring = courseService.isAuthor(content.lesson?.course, user)

        [
            course: content.lesson?.course,
            lesson: content.lesson,
            content: content,
            record: record,
            authoring: authoring,
            clientPort: user?.clientPort?user.clientPort:1337
        ]
    }


    /**
     * 直接建立內容後回到瀏覽頁面
     */
    @Secured(['ROLE_USER'])
    def create() {
        def user = springSecurityService.currentUser

        //參數未指定單元不予建立
        if (!params.lesson || !params.lesson.id) {
            response.sendError 404
            return
        }

        def lesson = Lesson.get(params.lesson?.id)

        //單元無法找到不予建立
        if (!lesson) {
            response.sendError 404
            return
        }
        
        def content = new Content(params)

        //預設為講義
        if (!content.type) {
            content.type = ContentType.TUTORIAL
        }
        //預設為 JAVA 語言
        if (!content.sourceType) {
            content.sourceType = SourceType.JAVA
        }

        //從範本讀取內容設定
        courseService.createContentFromTemplate(content)

        //內容建立者
        content.creator = user

        //預設作者為建立者
        content.authors = user.fullName

        //儲存
        content.save(flush: true)

        //訊息
        flash.message = "內容已經建立"

        //編輯模式
        redirect action: 'show', id: content.id, params: [editor: true]
    }

    /**
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {

        def content = Content.get(id)

        if (!content) {
            response.sendError 404
            return
        }

        content.properties = params
        def success = content.save(flush: true)
        
        render(contentType: 'application/json') {[
            success: success,
            url: createLink(action: 'show', id: content.id),
            message: success?'ok':renderErrors(bean: content)
        ]}
    }

    /**
     * Ajax 更新作答資料
     */
    def ajaxSaveRecord(Long id) {
        def user = springSecurityService.currentUser

        def content = Content.get(id)

        def record = Record.findOrCreateByUserAndContent(user, content)

        if (record) {
            record.properties = params
            record.save(flush: true)
        }

        [record: record]
    }


    /**
     * 刪除內容
     */
    def delete(Long id) {
        def content = Content.get(id)
        
        if (!content) {
            response.sendError 404
            return
        }

        try {
            content.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'lesson', action: 'show', id: content.lesson?.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: 'show', id: content.id)
        }
    }

    /**
     * 下載原始碼
     */
    def source(Long id) {
        
        def user = springSecurityService.currentUser
        
        def content = Content.get(id)
        
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(url: '/')
            return
        }

        if (params.attachment != null) {
            //fixme: 資料夾斜線處理
            def filename = content.sourcePath?content.sourcePath:'untitled.txt'
            
            response.addHeader('Content-disposition', "attachment; filename=${filename}")
        }

        def contentType = 'text/plain'

        //TODO: mime support
        if (content.sourceType==SourceType.HTML) {
            contentType = 'text/html'
        }

        def text = content.partialCode
       
        // ?source=true 查詢原始碼
        if (params.boolean('source')) {
            text = content.sourceCode
        }
        else {
            def record = Record.findByUserAndContent(user, content)

            if (record) {
                text = record.sourceCode
            }
        }

        render text: text, contentType: contentType, encoding: "UTF-8"
    }

    /**
     * 燈號圖片
     */
    def light(Long id) {
        //tell browsers do not cache this
        cache false

        def user 
        
        if (params.uid) {
            user = User.get(params.uid)
        }
        else {
            user = springSecurityService.currentUser
        }

        def content = Content.get(id)
        def record = Record.findByUserAndContent(user, content)

        def imageFile = null

        if (!record) {
             imageFile = new File(request.session.servletContext.getRealPath('/images/gray_light_small.png'))
        }
        else if (record.passed) {
             imageFile = new File(request.session.servletContext.getRealPath('/images/green_light_small.png'))
        }
        else {
             imageFile = new File(request.session.servletContext.getRealPath('/images/red_light_small.png'))
        }

        def imageData = imageFile.bytes

        response.setHeader('Content-disposition', 'inline; filename=light.png') 
        response.contentType = 'image/png'
        response.addHeader "Content-Length", "${imageData.length}"
        response.outputStream << imageData
        response.outputStream.flush()
    }

    /**
     * 產生簡報
     */
    def deckjs(Long id) {
        def content = Content.get(id)
        
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course')
            return
        }

        [content: content]
    }
    
    /**
     * 讀取附件
     */
    def attachment(Long id) {
        def content = Content.get(id)
        
        if (!content) {
            response.sendError 404
            return
        }

        def file = params.file

        log.info "request.format = ${request.format}"
        log.info "response.format = ${response.format}"
        log.info "request.forwardURI = ${request.forwardURI}"


        /*
        if (response.format == 'all') {
        }
        else if (response.format == 'xml') {
            file = "${file}.xml"
        }
        else if (response.format == 'json') {
            file = "${file}.json"
        }
        */

        // 重 HTTP REQUEST URI 網址重新取回檔案名稱
        file = request.forwardURI.split('/').last()

        // 將已編碼 URL 還原
        file = URLDecoder.decode(file)

        def obj_path = "attachment/${content.lesson?.course?.id}/${content.lesson?.id}/${content.id}/${file}"
        
        try {
            log.info "Try to get ${obj_path}"
            def object = s3Service.getObject(obj_path)
            response.outputStream << object.dataInputStream
        }
        catch (e) {
            log.error "Could not read ${file} from s3 object ${obj_path}"
            e.printStackTrace()
            response.sendError 404
        }
    }
    
    /**
     * 附件上傳及清單（顯示在 iframe 頁框內）
     */
    def attachmentList(Long id) {
        def content = Content.get(id)
        
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course')
            return
        }
        
        [
            content: content,
            files: s3Service.getObjectList("attachment/${content.lesson?.course?.id}/${content.lesson?.id}/${content.id}")
        ]
    }
    
    /**
     * 儲存上傳的附件檔案
     */
    def attachmentSave(Long id) {
        def content = Content.get(id)
        
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course')
            return
        }
        
        params.files.each {
            i,file->
            
            if (!file.isEmpty()) {
                //儲存已上傳的檔案
                log.info "Process file ${file.originalFilename} upload to ${content}."
                s3Service.saveObject "attachment/${content.lesson?.course?.id}/${content.lesson?.id}/${content.id}/${file.originalFilename}", file.contentType, file.inputStream, file.size
            }
        }
        
        redirect action: 'attachmentList', id: content.id
    }
    
    def attachmentDelete(Long id) {
        def content = Content.get(id)
        
        params.list('selected').each {
            path->
            //移除檔案
            s3Service.deleteObject path
        }
        
        redirect action: 'attachmentList', id: content.id
    }
    
    /**
     * 暫存程式碼（類型、路徑、內容）
     */
    def ajaxSaveTemp() {
        //保存程式碼類型
        session['__tempSourceType'] = params.sourceType;

        //保存程式碼路徑
        session['__tempSourcePath'] = params.sourcePath;
        
        //保存程式碼內容
        session['__tempSourceCode'] = params.sourceCode;
        
        render(contentType: 'application/json') {[
            success: true
        ]}
    }

    /**
     * 顯示暫存程式碼
     */
    def temp() {
        def sourceType = session['__tempSourceType']
        def sourcePath = session['__tempSourcePath']
        def sourceCode = session['__tempSourceCode']

        def contentType = 'text/plain'

        if (sourceType == 'HTML') {
            contentType = 'text/html'
        }

        render contentType: contentType, text: sourceCode
    }
    
    /**
     * BiwaScheme
     */
    def biwascheme() {
        [sourceCode: session['__tempSourceCode']]
    }
}
