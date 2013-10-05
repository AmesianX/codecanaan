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
		        
		            /*sendMail {
                        to user.email
                        subject "歡迎 ${user.fullName} 成為壹學院會員"
                        html groovyPageRenderer.render(template: "/email/welcome", model: [user: user])
                    }*/
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

    /**
     * Called when we have a new facebook user, called on first login to create all required
     * data structures. Replaces .createAppUser and .createRoles methods.
     *
     * @param token facebook authentication token
     */
    FacebookUser create(FacebookAuthToken token) {
        log.info("Create domain for facebook user $token.uid")

        //Use Spring Social Facebook to load details for current user from Facebook API
        Facebook facebook = new FacebookTemplate(token.accessToken.accessToken)
        FacebookProfile fbProfile = facebook.userOperations().userProfile
        String email = fbProfile.email
        String username = fbProfile.username
        String firstName = fbProfile.firstName
        String lastName = fbProfile.lastName

        User person = new User(
                username: username,
                password: token.accessToken.accessToken, //not really necessary
                enabled: true,
                accountExpired:  false,
                accountLocked: false,
                passwordExpired: false,

                //fill with data loaded from Facebook API
                fullName: [firstName, lastName].join(' '),
                email: email
        )
        person.save()
        UserRole.create(person, Role.findByAuthority('ROLE_USER'))
        UserRole.create(person, Role.findByAuthority('ROLE_FACEBOOK'))
        FacebookUser fbUser = new FacebookUser(
                uid: token.uid,
                accessToken: token.accessToken.accessToken,
                accessTokenExpires: token.accessToken.expireAt,
                user: person
        )
        fbUser.save()
        return fbUser
    }

    /*
    void updateToken(Object facebookUser, FacebookAuthToken token) {
        log.error "--- debug start ---"
        log.error facebookUser
        log.error token
    }
    */
}
