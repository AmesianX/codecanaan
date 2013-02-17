package codecanaan

import grails.gsp.PageRenderer

import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.GrantedAuthority

import org.springframework.social.facebook.*
import org.springframework.social.facebook.api.impl.*
import org.springframework.social.facebook.api.*

class FacebookAuthService {
    
    PageRenderer groovyPageRenderer

    void onCreate(FacebookUser fbuser, FacebookAuthToken token) {
        log.info("Creating user: $fbuser for fb user: $token.uid")

        try {
	        if (fbuser && fbuser.accessToken) {
		        def facebook = new FacebookTemplate(fbuser.accessToken)
		        def fbProfile = facebook.userOperations().userProfile

		        def user = fbuser.user
		        if (user) {
		        	//sync from facebook
		        	user.fullName = fbProfile.name
		        	user.email = fbProfile.email
		        	user.merge(flush: true)
		        
		            sendMail {
                        to user.email
                        subject "熱烈歡迎 ${user.fullName} 成為壹學院會員"
                        html groovyPageRenderer.render(template: "/email/welcome", model: [user: user])
                    }
		        }
	        }
        }
        catch (e) {
        	log.error e.message
        }
    }

    void afterCreate(FacebookUser user, FacebookAuthToken token) {
        log.info("User created: $user for fb user: $token.uid")
    }

    /*
    void updateToken(Object facebookUser, FacebookAuthToken token) {
        log.error "--- debug start ---"
        log.error facebookUser
        log.error token
    }
    */
}
