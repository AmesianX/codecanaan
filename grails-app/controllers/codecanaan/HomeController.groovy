package codecanaan

import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class HomeController {

    def springSecurityService
    
    def grailsLinkGenerator

    /**
     * 首頁
     */
    def index() {
    
        // 如果已經登入
        // 先檢查 User.works（是否已經通過「開始使用」步驟）
        // 如果 User.works == FALSE 則先跳到步驟 II
       
        if (springSecurityService.isLoggedIn()) { 
            
            def user = springSecurityService.currentUser
            
            if (!user?.works) {
                redirect action: 'step2'
                return
            }
        }

        // 取得首頁公告資料    
        def posts = Post.findAll(max: 10, sort: 'dateCreated', order: 'desc') {
            type == PostType.ANNOUNCE
        }

        [
            posts: posts,
            courses: Course.list()
        ]
    }
    
    /**
     * 「開始使用」步驟二、安裝 Java 軟體
     */
    @Secured(['ROLE_USER'])
    def step2() {
        []
    }
    
    /**
     * 「開始使用」步驟三、啟動客戶端工具
     */
    @Secured(['ROLE_USER'])
    def step3() {
        []
    }
    
    /**
     * 「開始使用」步驟四、條款及獲取免費課程
     */
    @Secured(['ROLE_USER'])
    def step4() {
        []
    }
    
    /**
     * 客戶端工具
     */
    def client() {
        def user = springSecurityService.currentUser
        
        [
            clientPort: user?.clientPort?user.clientPort:1337
        ]
    }
}
