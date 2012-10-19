package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userList: User.list(params), userTotal: User.count()]
    }

    def create() {
        [user: new User(params)]
    }

    def save() {
        def user = new User(params)
        if (!user.save(flush: true)) {
            render(view: "create", model: [user: user])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(action: "show", id: user.id)
    }

    def show(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [user: user]
    }

    /**
     * 檢查個人資料是否完整
     */
    def check = {
        def user = springSecurityService.currentUser

        if (!user) {
            redirect(url:'/')
            return
        }

        def hasError = false
        if (!user.email) hasError = true
        if (!user.fullName) hasError = true

        if (hasError) {
            redirect(controller: 'user', action: 'complete')
            return
        }
        else {
            redirect(url: '/')
            return
        }
    }

    /**
     * 繼續填寫個人資料
     */
    def complete(Long id) {
        def userDetails = springSecurityService.principal
        
        def user = User.get(userDetails.id)

        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(url: '/')
            return
        }

        //儲存異動
        if (params.save) {
            user.email = params.email
            user.fullName = params.fullName

            if (user.save(flush: true)) {
                redirect(url: '/')
                return
            }
        }

        [user: user]
    }

    def edit(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [user: user]
    }

    def update(Long id, Long version) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (user.version > version) {
                user.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [user: user])
                return
            }
        }

        user.properties = params

        if (!user.save(flush: true)) {
            render(view: "edit", model: [user: user])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
        redirect(action: "show", id: user.id)
    }

    def delete(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            user.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
}
