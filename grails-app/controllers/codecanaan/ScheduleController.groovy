package codecanaan

class ScheduleController {

	def springSecurityService

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

        [schedules: schedules]
    }

    /**
     * 教學進度詳細檢視
     */
    def show(Long id) {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def schedule = Schedule.get(id)

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)

        [schedule: schedule, scheduleLessons: scheduleLessons]
    }

    /**
     * 教學進度修改
     */
    def edit(Long id) {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def schedule = Schedule.get(id)

        def scheduleLessons = ScheduleLesson.findAllBySchedule(schedule)

        [schedule: schedule, scheduleLessons: scheduleLessons]
    }

    /**
     * 資料維護處理
     */
    def update(Long id) {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def schedule = Schedule.get(id)

        def itemIdList = (params.itemId instanceof String)?[params.itemId]:params.itemId

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
            schedule.save(flush: true)

            //更新課程單元連結

            def linkIdList = (params.linkId instanceof String)?[params.linkId]:params.linkId

            def beginDate = (params.beginDate instanceof String)?[params.beginDate]:params.beginDate
            def beginTime = (params.beginTime instanceof String)?[params.beginTime]:params.beginTime

            def endDate = (params.endDate instanceof String)?[params.endDate]:params.endDate
            def endTime = (params.endTime instanceof String)?[params.endTime]:params.endTime

            def deadlineDate = (params.deadlineDate instanceof String)?[params.deadlineDate]:params.deadlineDate
            def deadlineTime = (params.deadlineTime instanceof String)?[params.deadlineTime]:params.deadlineTime

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
        
        redirect(action: 'edit', id: schedule.id)
    }

    /**
     * 刪除學習進度
     */
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

        schedule.delete(flush: true)

        redirect(action: 'list')
    }

    /**
     * 管理使用者
     */
    def user(Long id) {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

        def schedule = Schedule.get(id)

        def userSchedules = UserSchedule.findAllBySchedule(schedule)

        [schedule: schedule, userSchedules: userSchedules]
    }

    /**
     * 加入新單元
     */
    def join(Long id) {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url: '/')
            return
        }

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
    def joinSave(Long id) {
        def schedule = Schedule.get(id)

        def lessonIdList = (params['lesson.id'] instanceof String)?[params['lesson.id']]:params['lesson.id']

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
     * 建立新單元（建立後直接回到單元顯示頁面）
     */
    def create() {
        def user = springSecurityService.currentUser
        
        //計算流水號
        def seq = Schedule.count()
        
        def schedule = new Schedule(params)
        
        //套用預設值
        schedule.name = "schedule-${seq+1}"
        schedule.title = "Schedule ${seq+1}"
        schedule.creator = user

        schedule.save(flush: true)

        //建立使用者與群組關連
        def link = UserSchedule.create(user, schedule, true)
        if (link) {
        	link.roleType = ScheduleRoleType.OWNER
        	link.save(flush: true)
        }

        redirect(
            action: 'list'
        )
    }
}
