package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class LessonController {

    def springSecurityService

    //課程服務
    def courseService

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    /* 顯示單元內容 */
    def show(Long id) {
        def user = springSecurityService.currentUser
        def lesson = Lesson.get(id)

        if (!lesson) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(action: "list")
            return
        }

        //檢查修改權限
        def authoring = courseService.isAuthor(lesson.course, user)

        [
            course: lesson.course,
            lesson: lesson,
            authoring: authoring,
            stats: courseService.getLessonStats(lesson, user),
            records: courseService.getLessonRecords(lesson, user)
        ]
    }

    /**
     * 建立新單元（建立後直接回到單元顯示頁面）
     */
    @Secured(['ROLE_USER'])
    def create() {

        def user = springSecurityService.currentUser
        
        //檢查必要參數
        if (!params.course || !params.course?.id) {
            response.sendError 404
            return
        }
        
        //從參數找出指定的課程
        def course = Course.get(params.course?.id)

        //單元必須設定在某個課程下
        if (!course) {
            response.sendError 404
            return
        }

        //建立單元
        def lesson = new Lesson(params)
        
        //從範本套用預設值
        courseService.createLessonFromTemplate(lesson)

        //設定擁有者
        lesson.creator = user

        //儲存
        lesson.save flush: true

        //訊息
        flash.message = "新單元 ${lesson.title} 已經建立"

        //進入編輯模式
        redirect action: 'show', id: lesson.id, params: [editor: true]
    }

    /**
     * 更新單元資料（使用 AJAX）
     */
    def ajaxSave(Long id) {

        def lesson = Lesson.get(id)

        if (!lesson) {
            response.sendError 404
            return
        }

        lesson.properties = params
        def success = lesson.save(flush: true)
        
        render(contentType: 'application/json') {[
            success: success,
            url: createLink(action: 'show', id: lesson.id),
            message: success?'ok':renderErrors(bean: lesson)
        ]}
    }
    
    /**
     * 重新排序教材內容清單
     */
    def sort(Long id) {
        def lesson = Lesson.get(id)
        
        [lesson: lesson]
    }
    
    /**
     * 儲存排序資料
     */
    def sortUpdate(Long id) {
        def lesson = Lesson.get(id)

        if (!lesson) {
            response.sendError 404
            return
        }

        if (params.priority) {
            def priorities = (params.priority instanceof String)?[params.priority]:params.priority
            
            def i = 0
            priorities.each {
                contentId ->
                
                def content = Content.get(contentId)
                
                if (content) {
                    content.priority = ++i
                    content.save(flush: true)
                }
            }
        }
        
        redirect(action: 'show', id: lesson.id)
    }

    /**
     * 刪除單元
     */
    def delete(Long id) {
        
        def lesson = Lesson.get(id)

        if (!lesson) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(controller: 'course')
            return
        }

        def courseId = lesson.course?.id

        try {
            lesson.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lesson.label', default: 'Lesson'), lesson.title])
            redirect(controller: 'course', action: 'show', id: courseId)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lesson.label', default: 'Lesson'), lesson.title])
            redirect(action: 'show', id: lesson.id)
        }
    }
}
