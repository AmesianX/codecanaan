package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

import org.springframework.social.facebook.*
import org.springframework.social.facebook.api.impl.*
import org.springframework.social.facebook.api.*

class UserController {

    def springSecurityService

    /**
     * 個人資料
     */
    @Secured(['ROLE_USER'])
    def profile() {
        def user = springSecurityService.currentUser
        
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
    @Secured(['ROLE_USER'])
    def facebookSync = {
        def user = springSecurityService.currentUser

        def facebookUser = FacebookUser.findByUser(user)
        if (facebookUser && facebookUser.accessToken) {
            try {
                def facebook = new FacebookTemplate(facebookUser.accessToken)
                def fbProfile = facebook.userOperations().userProfile

                user.fullName = fbProfile.name
                user.email = fbProfile.email
            }
            catch (e) {
                println e.message
            }
        }

        redirect url: '/'
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
