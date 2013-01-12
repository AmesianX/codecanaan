package codecanaan

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

        //點擊次數 +1
        content.hits ++
        content.save(flush: true)

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
    def create() {
        def user = springSecurityService.currentUser

        //計算流水號
        def seq = 0
        def lesson = Lesson.get(params.lesson.id)
        if (lesson && lesson.contents) {
            seq = lesson.contents?.size()
        }

        def content = new Content(params)

        //套用預設值
        if (!content.type) {
            content.type = ContentType.TUTORIAL
        }

        //println lesson
        //println seq

        content.title = "${content.type} ${seq+1}"
        content.description = '''Write contents here using **Markdown** syntax.'''

        if (content.type == ContentType.CODE) {
            content.sourceCode = "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n"
            content.sourceType = SourceType.JAVA
            content.sourcePath = 'Main.java'
            content.partialCode = "public class Main {\n    public static void main(String[] args) {\n        //write here\n    }\n}\n"
            content.answer = 'Hello World'
        }

        content.priority = seq
        content.creator = user

        content.save(flush: true)

        redirect(action: 'show', id: content.id)
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
    def downloadSource(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(url: '/')
            return
        }

        //fixme: 資料夾斜線處理
        def filename = content.sourcePath?content.sourcePath:'untitled.txt'
        response.addHeader('Content-disposition', "attachment; filename=${filename}")

        render(text: content.sourceCode, contentType:"text/plain", encoding:"UTF-8")
    }

    /**
     * 燈號圖片
     */
    def light(Long id) {
        //tell browsers do not cache this
        cache false

        def user = springSecurityService.currentUser
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
        
        try {
            def object = s3Service.getObject("attachment/${content.lesson?.course?.id}/${content.lesson?.id}/${content.id}/${params.file}")
            
            response.outputStream << object.dataInputStream
        }
        catch (e) {
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
}
