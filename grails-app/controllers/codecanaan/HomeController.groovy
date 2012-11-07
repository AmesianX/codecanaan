package codecanaan

class HomeController {
    def springSecurityService

    def index() {
        [
            posts: Post.findAllByType(PostType.ANNOUNCE, [max: 10]),
            courses: Course.list(),
            jettyPort: session.jettyPort?session.jettyPort:1337
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
        response.contentType = 'application/x-java-jnlp-file'
        response.addHeader('Content-disposition', 'inline; filename=webstart.jnlp')

        render(
            contentType: 'application/x-java-jnlp-file',
            template: "webstart",
            model: [
                jettyPort: user?.clientPort?user?.clientPort:1337
            ]
        )
    }
}
