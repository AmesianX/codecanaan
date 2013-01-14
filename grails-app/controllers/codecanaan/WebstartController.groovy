package codecanaan

class WebstartController {
    
    def grailsApplication
    
    def index() { }
    
    def script() {
        def context = grailsApplication.mainContext
        def scriptFile = context.getResource('/webstart/launcher.groovy').file
        
        render(
           text: scriptFile.text,
           contentType: 'text/plain',
           encoding: 'UTF-8'
       )
    }
}
