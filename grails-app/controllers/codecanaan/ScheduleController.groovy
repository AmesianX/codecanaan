package codecanaan

class ScheduleController {

	def springSecurityService

    def index() { }

    /**
     * 建立新單元（建立後直接回到單元顯示頁面）
     */
    def create() {
        def user = springSecurityService.currentUser
        
        //計算流水號
        def seq = TheGroup.count()
        
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
            controller: 'course',
            action: 'list'
        )
    }
}
