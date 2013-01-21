package codecanaan

import javax.crypto.*
import javax.crypto.spec.*
import org.apache.commons.codec.binary.*

class WebstartController {
    
    def grailsApplication
    
    def grailsLinkGenerator
    
    def springSecurityService
    
    def index() { }
    
    def script() {
        def context = grailsApplication.mainContext
        def script = context.getResource('/webstart/launcher.groovy').file.text
        
        // Scripting 資料加密
        def key = new SecretKeySpec("thebestsecretkey".bytes, "AES")
        def c = Cipher.getInstance("AES");
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(script.getBytes("UTF-8"));
        script = new String(Hex.encodeHex(encVal));

        //Tell Google Robot don't catch this action
        response.addHeader('X-Robots-Tag', 'noindex, nofollow, nosnippet, noarchive')
        
        render(
           text: script,
           contentType: 'text/plain',
           encoding: 'UTF-8'
       )
    }

    /**
     * Java Web Start ;-)
     */
    def launcher() {
        def user = springSecurityService.currentUser
        
        //response.contentType = 'text/xml'
        //response.contentType = 'application/x-java-jnlp-file'
        response.addHeader('Content-disposition', 'inline; filename=webstart.jnlp')

		def serverIds = [1 ,2 ,3]
		Collections.shuffle(serverIds)

        render(
            //contentType: 'text/xml',
            contentType: 'application/x-java-jnlp-file',
            template: "webstart",
            model: [
                baseURL: grailsLinkGenerator.serverBaseURL,
                clientPort: user?.clientPort?user?.clientPort:1337,
				serverId: serverIds[0]
            ]
        )
    }
}
