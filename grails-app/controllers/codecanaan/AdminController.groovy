package codecanaan

class AdminController {

    def index() {
    	
    }

    def userList() {
    	[users: User.list()]
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
