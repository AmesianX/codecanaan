package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class CourseController {

    def springSecurityService

    def courseService

    static allowedMethods = [save: "POST", update: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    /*
     * 課程列表：只列出已選修課程
     */
    @Secured(['ROLE_USER'])
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

        links = UserSchedule.findAllByUser(user)

        def schedules = []

        links.each {
            link ->
            schedules << link.schedule
        }

        [courses: courses, schedules: schedules]
    }

    /**
     * 顯示課程內容（重要實作）
     */
    def show(Long id) {
        def course = Course.get(id)

        if (!course) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        //檢查修改權限
        def authoring = courseService.isAuthor(course, springSecurityService.currentUser)

        [
            course: course,
            authoring: authoring
        ]
    }

    /**
     * 註冊新課程
     */
    def register() {
        def user = springSecurityService.currentUser

        def coupon = Coupon.findBySerialCode(params.serialCode)

        def msg = message(code: 'course.registration.invalid.message')

        if (coupon) {
            if (coupon.valid && !coupon.registered) {
                coupon.user = user
                coupon.registered = true
                coupon.save(flush: true)

                //建立使用者與課程連結
                if (coupon.course) {
                    def link = UserCourse.findOrCreateByUserAndCourse(user, coupon.course)
                    link.regInfo = "register with coupon ${coupon.serialCode}"
                    link.regType = RegType.USER
                    
                    if (link.save(flush: true)) {
                        msg = message(code: 'course.registration.valid.message')
                    }
                }

                //建立使用者與學習進度連結
                if (coupon.schedule) {
                    def link = UserSchedule.findOrCreateByUserAndSchedule(user, coupon.schedule)
                    link.roleType = ScheduleRoleType.MEMBER

                    link.save(flush: true)
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
        course.title = "請填寫此課程顯示的標題名稱"
        course.description = "在這裡撰寫課程說明\nWrite your course description here."
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
        link.regInfo = "first creator"
        link.regType = RegType.AUTHOR    //登記為作者
        link.save(flush: true)

        flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), course.id])
        redirect(action: "show", id: course.id, params: [editor: true])
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
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {
        def course = Course.get(id)

        if (!course) {
            response.sendError 404
            return
        }

        //update
        course.properties = params
        def success = course.save(flush: true)
        
        render(contentType: 'application/json') {
            [
                success: success,
                url: createLink(action: 'show', id: course.id),
                message: success?'ok':renderErrors(bean: course)
            ]
        }
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

    /**
     * 使用者連結維護列表
     */
    def user(Long id) {
        def course = Course.get(id)

        if (!course) {
            response.sendError 404
            return
        }

        [
            course: course,
            userCourses: UserCourse.findAllByCourse(course)
        ]
    }

    /**
     * 使用者連結維護處理
     */
    def userAction(Long id) {
        def course = Course.get(id)

        if (!course) {
            response.sendError 404
            return
        }

        //建立使用者連結
        if (params.create) {
            def user = User.findByUsernameOrEmail(params.username, params.username)

            if (user) {
                def link = UserCourse.findOrCreateWhere(user: user, course: course)

                //已有"作者"權限就不進行權限變更
                if (link.regType != RegType.AUTHOR) {
                    link.regType = RegType.USER
                }

                //儲存連結
                if (link.save(flush: true)) {
                    //連結成功
                    flash.message = message(code: 'default.created.message', args: [1, message(code: 'user.label')])
                }
            }

        }
        else if (params.delete) {
            def ok = 0

            params.list('selected').each {
                linkId->

                def link = UserCourse.get(linkId)

                if (link) {
                    ok++
                    link.delete(flush: true)
                }
            }
            flash.message = message(code: 'default.deleted.message', args: [ok, message(code: 'user.label')])
        }

        redirect action: 'user', id: course.id
    }

    /**
     * 探索新課程
     */
    def explore() {
        [courses: Course.findAllByName('tqc-plus-java6')]
    }
}
