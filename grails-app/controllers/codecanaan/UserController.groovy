package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class UserController {

    def springSecurityService
    def s3Service

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
    def facebookSync() {
        def user = springSecurityService.currentUser

        //TODO: sync data from facebook

        redirect url: '/'
    }

    /**
     */
    @Secured(['ROLE_USER'])
    def file() {
        def user = springSecurityService.currentUser

        []
    }
}
