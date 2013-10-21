package codecanaan

import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

class ScheduleController {

	def springSecurityService

    def scheduleService

    /**
     * 列出登入使用者的教學進度
     */
    def index() {
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
            redirect action: 'index'
            return
        }

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)
        
        def editable = false

        def userSchedule = UserSchedule.findByUserAndSchedule(user, schedule)

        if (userSchedule?.roleType == ScheduleRoleType.OWNER) {
            editable = true
        }

        [
            userSize: UserSchedule.countBySchedule(schedule),
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
            schedule: scheduleLesson.schedule,
            lesson: scheduleLesson.lesson,
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

        // Not exists.
        if (!schedule) {
            response.sendError 404
            return
        }

        [
            schedule: schedule
        ]
    }

    /**
     * 資料維護處理
     */
    @Secured(['ROLE_TEACHER'])
    @Transactional
    def update(Schedule schedule) {

        if (schedule == null) {
            response.sendError 404
            return
        }

        if (schedule.hasErrors()) {
            respond schedule.errors, view: 'edit'
            return
        }

        schedule.save flush: true

        redirect ${propertyName}

        //redirect action: 'show', id: schedule.id
    }

    /**
     * Modify schedule details
     */
    @Secured(['ROLE_TEACHER'])
    def modify(Long id) {

        def schedule = Schedule.get(id)

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)

        [schedule: schedule, scheduleLessons: scheduleLessons]
    }

    /**
     * Save schedule details modification
     */
    @Secured(['ROLE_TEACHER'])
    def modifySave(Long id) {

        def schedule = Schedule.get(id)

        if (params.actionUpdate) {

            //更新基本資料
            //schedule.properties = params
            schedule.save(flush: true)

            // IDs from check box
            def itemIdList = params.list('itemId')

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

                if (itemIdList.contains(linkId)) {

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
                }
                else {
                    def link = ScheduleLesson.get(linkId)
                    link.delete(flush: true)
                }

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

        def schedule = Schedule.get(id)

        if (schedule) {

            // 先移除使用者與進度的連結
            UserSchedule.findAllBySchedule(schedule).each {
                link ->
                link.delete(flush: true)
            }

            // 再移除單元連結
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
        }

        redirect action: 'index'
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

        def stageValues = []


        def currentChineseYear = new Date().year - 11

        stageValues << "${currentChineseYear+1}學年度上學期"
        stageValues << "${currentChineseYear}學年度下學期"
        stageValues << "${currentChineseYear}學年度上學期"
        stageValues << "${currentChineseYear-1}學年度下學期"
        stageValues << "${currentChineseYear-1}學年度上學期"
        stageValues << '認證研習班'
        
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
                return
            }
        }
        else {
            schedule.title = "${user.fullName}的教學進度"

            schedule.school = user.school
            schedule.department = user.department
            schedule.stage = stageValues.first()
        }


        [
            stageValues: stageValues,
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

        if (user && schedule) {
            // 檢查密碼
            if (schedule.password == params.password) {

                // 先檢查是否已經有連結
                def link = UserSchedule.findByUserAndSchedule(user, schedule)

                // 建立新的連結
                if (!link) {
                    link = new UserSchedule(user: user, schedule: schedule)

                    // 預設的角色是一般成員（MEMBER）
                    link.roleType = ScheduleRoleType.MEMBER
                
                    // 儲存
                    if (link.save(flush: true)) {
                        flash.message = "您已經參與學習進度：${schedule.title}"
                    }
                    else {
                        flash.message = "無法加入學習進度。"
                    }
                }
            }
        }

        redirect action: 'index'
    }
}
