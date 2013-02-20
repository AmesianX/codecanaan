package codecanaan

import grails.plugins.springsecurity.Secured

class ScheduleController {

	def springSecurityService

    def scheduleService

    def index() {
        redirect action: 'list'
    }

    /**
     * 列出登入使用者的教學進度
     */
    def list() {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def links = UserSchedule.findAllByUser(user)

        def schedules = []

        links.each {
            link ->
            schedules << link.schedule
        }

        def statistics = [:]

        schedules.each {
            schedule->
            statistics[schedule] = UserSchedule.countBySchedule(schedule)
        }

        [
            schedules: schedules,
            statistics: statistics
        ]
    }

    /**
     * 教學進度詳細檢視
     */
    @Secured(['ROLE_USER'])
    def show(Long id) {

        def user = springSecurityService.currentUser

        def schedule = Schedule.get(id)

        if (!schedule) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'schedule.label'), id])
            redirect action: 'list'
            return
        }

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)
        
        def editable = false

        def userSchedule = UserSchedule.findByUserAndSchedule(user, schedule)

        if (userSchedule?.roleType == ScheduleRoleType.OWNER) {
            editable = true
        }

        [
            schedule: schedule,
            scheduleLessons: scheduleLessons,
            editable: editable,
            today: new Date()
        ]
    }

    /**
     * 觀看解答
     */
    @Secured(['ROLE_USER'])
    def answer(Long id) {
        def scheduleLesson = ScheduleLesson.get(id)

        //學習進度不存在
        if (!scheduleLesson) {
            response.sendError 404
            return
        }

        //使用者沒有參與此學習進度
        if (!scheduleService.hasUser(scheduleLesson.schedule, springSecurityService.currentUser)) {
            response.sendError 404
            return
        }

        def today = new Date()

        [
            scheduleLesson: scheduleLesson,
            content: Content.get(params.content?.id)
        ]
    }

    /**
     * 報表
     */
    @Secured(['ROLE_USER'])
    def report(Long id) {
        def scheduleLesson = ScheduleLesson.get(id)
        def schedule = scheduleLesson.schedule
        [
            schedule: schedule,
            users: UserSchedule.findAllBySchedule(schedule)*.user,
            lesson: scheduleLesson.lesson
        ]
    }

    /**
     * 教學進度修改
     */
    @Secured(['ROLE_TEACHER'])
    def edit(Long id) {

        def schedule = Schedule.get(id)

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)

        [schedule: schedule, scheduleLessons: scheduleLessons]
    }

    /**
     * 資料維護處理
     */
    @Secured(['ROLE_TEACHER'])
    def update(Long id) {

        def schedule = Schedule.get(id)

        def itemIdList = params.list('itemId')

        if (params.actionDelete && itemIdList) {
            itemIdList.each {
                itemId->

                def link = ScheduleLesson.get(itemId)
                link.delete(flush: true)
            }
        }

        if (params.actionUpdate) {

            //更新基本資料
            schedule.title = params.title
            schedule.name = params.name
            schedule.password = params.password
            schedule.save(flush: true)

            //更新課程單元連結
            def linkIdList = params.list('linkId')

            def beginDate = params.list('beginDate')
            def beginTime = params.list('beginTime')

            def endDate = params.list('endDate')
            def endTime = params.list('endTime')

            def deadlineDate = params.list('deadlineDate')
            def deadlineTime = params.list('deadlineTime')

            int i = 0;
            linkIdList.each {
                linkId ->

                def link = ScheduleLesson.get(linkId)

                try {
                    link.begin = Date.parse('yyyy/MM/dd HH:mm:ss', "${beginDate[i]} ${beginTime[i]}")
                }
                catch (e) { /* nothing */ }

                try {
                    link.end = Date.parse('yyyy/MM/dd HH:mm:ss', "${endDate[i]} ${endTime[i]}")
                }
                catch (e) { /* nothing */ }

                try {
                    link.deadline = Date.parse('yyyy/MM/dd HH:mm:ss', "${deadlineDate[i]} ${deadlineTime[i]}")
                }
                catch (e) { /* nothing */ }

                link.save(flush: true)

                i++
            }
        }
        
        redirect(action: 'show', id: schedule.id)
    }

    /**
     * 刪除學習進度
     */
    @Secured(['ROLE_TEACHER'])
    def delete(Long id) {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def schedule = Schedule.get(id)

        //先移除使用者與進度的連結
        UserSchedule.findAllBySchedule(schedule).each {
            link ->
            link.delete(flush: true)
        }

        //再移除單元連結
        ScheduleLesson.findAllBySchedule(schedule).each {
            link ->
            link.delete(flush: true)
        }

        try {
            schedule.delete(flush: true)
        }
        catch (e) {
            //error
        }

        redirect action: 'list'
    }

    /**
     * 管理使用者
     */
    @Secured(['ROLE_TEACHER'])
    def user(Long id) {

        def user = springSecurityService.currentUser

        def schedule = Schedule.get(id)

        def userSchedules = UserSchedule.findAllBySchedule(schedule)

        [schedule: schedule, userSchedules: userSchedules]
    }

    /**
     * 使用者資料維護
     */
    @Secured(['ROLE_TEACHER'])
    def userAction(Long id) {

        if (params.delete) {
            params.list('selected').each {
                linkId ->

                UserSchedule.get(linkId)?.delete(flush: true)
            }
        }

        redirect action: 'user', id: id
    }

    /**
     * 加入新單元
     */
    @Secured(['ROLE_TEACHER'])
    def join(Long id) {

        def user = springSecurityService.currentUser

        def schedule = Schedule.get(id)

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)

        def existsLessonIdList = []

        scheduleLessons.each {
            existsLessonIdList << it.lesson.id
        }

        def links = UserCourse.findAllByUser(user)

        def courses = []

        links.each {
            link ->
            courses << link.course
        }

        [courses: courses, schedule: schedule, existsLessonIdList: existsLessonIdList]
    }

    /**
     * 使用者連結維護
     */
    @Secured(['ROLE_TEACHER'])
    def userUpdate(Long id) {

        def schedule = Schedule.get(id)

        def user = User.findByUsernameOrEmail(params.username, params.username)

        if (user) {
            def link = UserSchedule.findOrCreateWhere(user: user, schedule: schedule)

            link.save(flush: true)
        }

        redirect action: 'user', id: schedule.id
    }

    /**
     * 儲存已選取的單元
     */
    @Secured(['ROLE_TEACHER'])
    def joinSave(Long id) {
        def schedule = Schedule.get(id)

        def lessonIdList = params.list('lesson.id')

        if (lessonIdList) {

            int priority = ScheduleLesson.countBySchedule(schedule)

            lessonIdList.each {
                lessonId ->
                def lesson = Lesson.get(lessonId)

                if (lesson) {
                    
                    def link = ScheduleLesson.findOrCreateWhere(
                        schedule: schedule,
                        lesson: lesson
                    )

                    if (link) {
                        link.priority = priority++
                        link.begin = new Date()
                        link.end = new Date().plus(14)
                        link.deadline = new Date().plus(7)

                        link.save(flush: true)
                    }
                }


            }
        }

        redirect(action: 'show', id: schedule.id)
    }

    /**
     * 建立新的學習進度
     */
    @Secured(['ROLE_TEACHER'])
    def create() {
        
        def user = springSecurityService.currentUser

        def schedule = new Schedule(params)

        if (params.save != null) {
            // 套用預設值
            schedule.name = new Date().format('yyyyMMdd-HHmmss')
            schedule.creator = user

            if (schedule.save(flush: true)) {

                // 建立使用者與群組關連
                def link = UserSchedule.create(user, schedule, true)
                if (link) {
                    link.roleType = ScheduleRoleType.OWNER
                    link.save(flush: true)
                }
                
                // 儲存成功進入
                redirect action: 'show', id: schedule.id
            }
        }
        else {
            schedule.title = "${user.fullName}的教學進度"
        }

        [
            schedule: schedule
        ]
    }

    /**
     * 使用者加入到學習進度
     */
    @Secured(['ROLE_USER'])
    def register() {
        def user = springSecurityService.currentUser

        def schedule = Schedule.findByName(params.name)

        if (schedule && schedule.password == params.password) {
            
            def link = UserSchedule.findOrCreateWhere(user: user, schedule: schedule)

            //防呆：擁有者重新註冊一次不改變權限
            if (link.roleType != ScheduleRoleType.OWNER) {
                link.roleType = ScheduleRoleType.MEMBER
            }

            link.save(flush: true)
        }
        redirect action: 'list'
    }
}
