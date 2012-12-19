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

        Role.list().each {
            role->
            statistics[role.authority] = UserRole.countByRole(role)
        }

        params.max = Math.min(max ?: 10, 100)

    	[
            users: User.list(params),
            userCount: User.count(),
            offset: params.offset?params.offset.toLong():0,
            statistics: statistics
        ]
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
