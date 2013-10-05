package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class UserController {

    def springSecurityService
    def s3Service

    /**
     * 顯示使用者個人資料
     */
    def show(Long id) {
        def user = User.get(id)

        if (!user) {
            response.sendError 404
            return
        }

        def editable = springSecurityService.currentUser==user

        [user: user, editable: editable]
    }

    /**
     * View profile (current signin user)
     */
    @Secured(['ROLE_USER'])
    def profile() {
        def user = springSecurityService.currentUser
        
        [
            user: user,
            fbuser: FacebookUser.findByUser(user)
        ]
    }

    /**
     * 
     */
    @Secured(['ROLE_USER'])
    def editProfile() {
        def user = springSecurityService.currentUser

        [
            user: user,
            fbuser: FacebookUser.findByUser(user)
        ]
    }

    @Secured(['ROLE_USER'])
    def saveProfile() {
        def user = springSecurityService.currentUser

        //儲存異動
        if (params.save) {
            user.properties = params
            user.save(flush: true)
        }

        redirect action: 'profile'
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
    @Secured(['ROLE_TEACHER', 'ROLE_AUTHOR', 'ROLE_ADMIN'])
    def file() {
        def user = springSecurityService.currentUser

        []
    }

    /**
     * 檔案上傳
     */
    @Secured(['ROLE_TEACHER', 'ROLE_AUTHOR', 'ROLE_ADMIN'])
    def fileUpload() {

    }
}
