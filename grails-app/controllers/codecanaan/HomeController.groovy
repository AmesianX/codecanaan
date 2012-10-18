package codecanaan

class HomeController {
    def springSecurityService

    def index() {

        //def userDetails = springSecurityService.principal
        //println userDetails

        [
            courses: Course.list(),
            jettyPort: session.jettyPort?session.jettyPort:1337
        ]
    }

    /**
     * Java Web Start ;-)
     */
    def webstart() {
        //response.contentType = 'text/xml'
        response.contentType = 'application/x-java-jnlp-file'
        response.addHeader('Content-disposition', 'inline; filename=webstart.jnlp')
        [jettyPort: session.jettyPort?session.jettyPort:1337]
    }

    /**
     * 設定連接埠
     */
    def port() {
        def port = params.value?params.value:1337

        try {
            port = new Integer(port)
        }
        catch (ex) {
            port = 1337
        }

        if (port < 1000) {
            port = 1337
        }
        else if (port > 65535) {
            port = 65535
        }
        session.jettyPort = port
        [port: port]
    }
}
