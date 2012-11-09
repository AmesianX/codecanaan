package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class CourseController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    /*
     * 課程列表：只列出已選修課程
     */
    def list() {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def links = UserCourse.findAllByUser(user)

        def courses = []

        links.each {
            link ->
            courses << link.course
        }

        links = UserGroup.findAllByUser(user)

        def groups = []

        links.each {
            link ->
            groups << link.group
        }

        [courses: courses, groups: groups]
    }

    /**
     * 註冊新課程
     */
    def register() {
        def user = springSecurityService.currentUser

        def coupon = Coupon.findBySerialCode(params.serialCode)

        def msg = "序號無效"

        if (coupon) {
            if (coupon.valid && !coupon.registered) {
                coupon.user = user
                coupon.registered = true
                coupon.save(flush: true)

                if (coupon.course) {
                    def link = UserCourse.findOrCreateByUserAndCourse(user, coupon.course)
                    link.reginfo = "reg. with ${coupon.serialCode}"
                    link.regtype = RegType.USER
                    
                    if (link.save(flush: true)) {
                        msg = "註冊成功"
                    }
                }

            }
        }

        flash.message = msg

        redirect(action: 'list')
    }

    /**
     * 建立新課程
     */
    def create() {
        def course = new Course(params)
        course.name = "course-${Course.count()+1}"
        course.description = "Write your course description here."
        [course: course]
    }

    /**
     * 儲存新建的課程
     */
    def save() {
        def user = springSecurityService.currentUser

        def course = new Course(params)

        //建立者
        course.creator = user

        if (!course.save(flush: true)) {
            render(view: "create", model: [course: course])
            return
        }

        def link = UserCourse.findOrCreateByUserAndCourse(user, course)
        link.reginfo = "first creator"
        link.regtype = RegType.OWNER    //登記為擁有者
        link.save(flush: true)

        flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), course.id])
        redirect(action: "show", id: course.id)
    }

    /**
     * 重新排序單元清單
     */
    def sort(Long id) {
        def course = Course.get(id)
        
        [course: course]
    }
    
    /**
     * 儲存排序資料
     */
    def sortUpdate(Long id) {
        def course = Course.get(id)
        
        if (params.priority) {
            def priorities = (params.priority instanceof String)?[params.priority]:params.priority
            
            def i = 0
            priorities.each {
                lessonId ->
                
                def lesson = Lesson.get(lessonId)
                
                if (lesson) {
                    lesson.priority = ++i
                    lesson.save(flush: true)
                }
            }
        }
        
        redirect(controller: 'course', action: 'show', id: course?.id)
    }

    /**
     * 顯示課程內容（重要實作）
     */
    def show(Long id) {
        def user = springSecurityService.currentUser

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
            
            //點擊次數 +1
            content.hits ++
            content.save(flush: true)
        }

        //是否啟用 on-the-fly editor
        def editor = params.editor?true:false

        //取得記錄
        def record = Record.findByUserAndContent(user, content)

        //檢查修改權限
        def authoring = user && (course.creator==user)

        [
            user: user,
            course: course,
            lesson: lesson,
            content: content,
            record: record,
            editor: editor,
            authoring: authoring,
            clientPort: user?.clientPort?user.clientPort:1337
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
        
        render(contentType: 'application/json') {
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

    /**
     * 刪除課程
     */
    def delete(Long id) {
        def course = Course.get(id)
        if (!course) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        try {
            //先移除使用者
            UserCourse.findAllByCourse(course).each {
                link ->
                link.delete(flush: true)
            }

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
