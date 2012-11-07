package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    def springSecurityService

    /**
     * 個人資料
     */
    def profile() {
        def user = springSecurityService.currentUser
        
        if (!user) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), user])
            redirect(url: '/')
            return
        }
        
        //儲存異動
        if (params.save) {
            user.properties = params
            user.save(flush: true)
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
        def user = springSecurityService.currentUser

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
}
