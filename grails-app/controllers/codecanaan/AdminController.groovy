package codecanaan

import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.web.mapping.LinkGenerator

@Secured(['ROLE_ADMIN'])
class AdminController {

    LinkGenerator grailsLinkGenerator

    def index() {
    	
    }

    def userList(Integer max) {
        def statistics = [:]

        def users = []
        def userCount = 0

        params.max = Math.min(max ?: 10, 100)

        if (params.keyword) {
            def query = "from User as u where u.username like :keyword or u.fullName like :keyword or u.email like :keyword"
            users = User.findAll(query, [keyword: "%${params.keyword}%"])
        }
        else {
            users = User.list(params)
            userCount = User.count()
        }

        Role.list().each {
            role->
            statistics[role.authority] = UserRole.countByRole(role)
        }

    	[
            users: users,
            userCount: userCount,
            offset: params.offset?params.offset.toLong():0,
            statistics: statistics
        ]
    }

    def userEdit(Long id) {
        [
            user: User.get(id),
            roles: Role.list()
        ]
    }

    def userEditSave(Long id) {

        if (!params.password) {
            params.remove('password')
        }

        def roles = (params.roles instanceof String)?[params.roles]:params.roles

        params.remove('roles')

        def user = User.get(id)

        user.properties = params

        // if(!user)

        //create UserRole link
        roles.each {
            authority->

            def role = Role.findByAuthority(authority)

            if (role) {
                def link = UserRole.findByUserAndRole(user, role)

                if (!link) {
                    UserRole.create(user, role)
                }
            }
        }
        UserRole.findAllByUser(user).each {
            link->
            if (!roles.contains(link.role.authority)) {
                link.delete(flush: true)
            }
        }

        if (!user.save(flush: true)) {
            render(view: 'userEdit', model: [user: user])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label'), "${user.fullName}(${user.username})"])
        redirect action: 'userList'
    }

    def userAdd() {
    	def user = new User()

    	[user: user]
    }

    def userAddSave() {
    	def user = new User(params)

    	if (!user.save(flush: true)) {
            render(view: 'userAdd', model: [user: user])
            return
        }

    	flash.message = message(code: 'default.created.message', args: [message(code: 'user.label'), user.id])
        redirect action: 'userAdd'
    }
}
