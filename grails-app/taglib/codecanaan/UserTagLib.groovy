package codecanaan

class UserTagLib {
    def springSecurityService
    
    def emoticon = { attrs, body ->
       out << body() << (attrs.happy == 'true' ? " :-)" : " :-(")
    }
    
    def displayUserName = { attrs, body ->
        def user = springSecurityService.currentUser
        
        def display = user?.fullName
        
        if (!display) {
            display = user?.username
        }
        
        out << body() << display
    }
}
