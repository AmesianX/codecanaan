package codecanaan

class GroupController {

	def springSecurityService

    def index() { }

    /**
     * 建立新單元（建立後直接回到單元顯示頁面）
     */
    def create() {
        def user = springSecurityService.currentUser
        
        //計算流水號
        def seq = TheGroup.count()
        
        def group = new TheGroup(params)
        
        //套用預設值
        group.name = "group-${seq+1}"
        group.title = "Group ${seq+1}"
        group.creator = user

        group.save(flush: true)

        //建立使用者與群組關連
        def link = UserGroup.create(user, group, true)
        if (link) {
        	link.roleType = GroupRoleType.OWNER
        	link.save(flush: true)
        }

        redirect(
            controller: 'course',
            action: 'list'
        )
    }
}
