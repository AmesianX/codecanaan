package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class ContentController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
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

        content.sourceCode = "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello World\");\n    }\n}\n"
        content.sourceType = SourceType.JAVA
        content.sourcePath = 'Main.java'
        content.partialCode = "public class Main {\n    public static void main(String[] args) {\n        //write here\n    }\n}\n"
        content.answer = 'Hello World'
        content.priority = seq
        content.creator = user

        content.save(flush: true)

        redirect(
            controller: 'course',
            action: 'show',
            id: content.lesson?.course?.id,
            params: [
                lessonId: content.lesson?.id,
                contentId: content.id
            ]
        )
    }

    /**
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {
        def content = Content.get(id)
        def success = false

        if (content) {
            content.properties = params
            success = content.save(flush: true)
        }
        
        render(contentType: 'application/json') {
            [
                success: success,
                url: createLink(controller: 'course', action: 'show', id: content.lesson?.course?.id, params: [lessonId: content.lesson?.id, contentId: content.id]),
                message: success?'ok':renderErrors(bean: content)
            ]
        }
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
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course')
            return
        }

        def courseId = content.lesson?.course?.id
        def lessonId = content.lesson?.id

        try {
            content.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course', action: 'show', id: courseId, params: [lessonId: lessonId])
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(controller: 'course', action: 'show', id: courseId, params: [lessonId: lessonId, contentId: content.id])
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

}
