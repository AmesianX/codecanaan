package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class CourseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [courseList: Course.list(params), courseTotal: Course.count()]
    }

    /**
     * 建立新課程
     */
    def create() {
        def course = new Course(params)
        course.name = "course-${Course.count()}"
        course.description = "Write your course description here."
        [course: course]
    }

    /**
     * 儲存新建的課程
     */
    def save() {
        def course = new Course(params)
        if (!course.save(flush: true)) {
            render(view: "create", model: [course: course])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), course.id])
        redirect(action: "show", id: course.id)
    }

    def show(Long id) {
        def course = Course.get(id)
        if (!course) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        def lesson = null

        if (params.lessonId) {
            lesson = Lesson.get(params.lessonId)
        }

        def content = null

        if (params.contentId) {
            content = Content.get(params.contentId)
        }

        def editor = params.editor?true:false

        [
            course: course, lesson: lesson, content: content, editor: editor,
            jettyPort: session.jettyPort?session.jettyPort:1337
        ]
    }

    def edit(Long id) {
        def course = Course.get(id)
        if (!course) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        [course: course]
    }

    /**
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {
        def course = Course.get(id)

        if (course) {
            course.properties = params
            course.save(flush: true)
        }
        
        render(contentType: 'text/json') {
            [url: createLink(controller: 'course', action: 'show', id: course?.id)]
        }
    }

    def update(Long id, Long version) {
        def course = Course.get(id)
        if (!course) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (course.version > version) {
                course.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'course.label', default: 'Course')] as Object[],
                          "Another user has updated this Course while you were editing")
                render(view: "edit", model: [course: course])
                return
            }
        }

        course.properties = params

        if (!course.save(flush: true)) {
            render(view: "edit", model: [course: course])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), course.id])
        redirect(action: "show", id: course.id)
    }

    def delete(Long id) {
        def course = Course.get(id)
        if (!course) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        try {
            course.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "show", id: id)
        }
    }
}
