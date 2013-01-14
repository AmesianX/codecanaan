package codecanaan

class HomeController {
    def springSecurityService
    
    def grailsLinkGenerator

    def index() {
        def posts = Post.findAll(max: 10, sort: 'dateCreated', order: 'desc') {
            type == PostType.ANNOUNCE
        }

        [
            posts: posts,
            courses: Course.list()
        ]
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

    /**
     * Java Web Start ;-)
     */
    def webstart() {
        def user = springSecurityService.currentUser
        
        //response.contentType = 'text/xml'
        //response.contentType = 'application/x-java-jnlp-file'
        response.addHeader('Content-disposition', 'inline; filename=webstart.jnlp')
        
        render(
            //contentType: 'text/xml',
            contentType: 'application/x-java-jnlp-file',
            template: "webstart",
            model: [
                baseURL: grailsLinkGenerator.serverBaseURL,
                clientPort: user?.clientPort?user?.clientPort:1337
            ]
        )
    }
}
