package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class LessonController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lessonList: Lesson.list(params), lessonTotal: Lesson.count()]
    }

    /**
     * 建立新單元（建立後直接回到單元顯示頁面）
     */
    def create() {
        def user = springSecurityService.currentUser
        def lesson = new Lesson(params)
        
        //套用預設值
        lesson.name = "lesson-${Lesson.count()+1}"
        lesson.title = "Lesson ${Lesson.count()+1}"
        lesson.description = "Write lesson description here."
        lesson.creator = user

        lesson.save(flush: true)

        redirect(controller: 'course', action: 'show', id: lesson.course.id, params: [lessonId: lesson.id])
    }

    def save() {
        def lesson = new Lesson(params)
        if (!lesson.save(flush: true)) {
            render(view: "create", model: [lesson: lesson])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'lesson.label', default: 'Lesson'), lesson.id])
        redirect(action: "show", id: lesson.id)
    }

    /**
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {
        def lesson = Lesson.get(id)

        if (lesson) {
            lesson.properties = params
            lesson.save(flush: true)
        }

        render(contentType: 'application/json') {
            [url: createLink(controller: 'course', action: 'show', id: lesson?.course?.id, params: [lessonId: lesson?.id])]
        }
    }

    def show(Long id) {
        def lesson = Lesson.get(id)
        if (!lesson) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(action: "list")
            return
        }

        [lesson: lesson]
    }

    def edit(Long id) {
        def lesson = Lesson.get(id)
        if (!lesson) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(action: "list")
            return
        }

        [lesson: lesson]
    }

    def update(Long id, Long version) {
        def lesson = Lesson.get(id)
        if (!lesson) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lesson.version > version) {
                lesson.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'lesson.label', default: 'Lesson')] as Object[],
                          "Another user has updated this Lesson while you were editing")
                render(view: "edit", model: [lesson: lesson])
                return
            }
        }

        lesson.properties = params

        if (!lesson.save(flush: true)) {
            render(view: "edit", model: [lesson: lesson])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'lesson.label', default: 'Lesson'), lesson.id])
        redirect(action: "show", id: lesson.id)
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
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(controller: 'course', action: 'show', id: courseId)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lesson.label', default: 'Lesson'), id])
            redirect(controller: 'course', action: 'show', id: courseId, params: [lessonId: lesson.id])
        }
    }
}
