package codecanaan

import com.the6hours.grails.springsecurity.facebook.FacebookAuthToken
import org.springframework.security.core.authority.GrantedAuthorityImpl
import org.springframework.security.core.GrantedAuthority

import org.springframework.social.facebook.*
import org.springframework.social.facebook.api.impl.*
import org.springframework.social.facebook.api.*

class FacebookAuthService {
    void onCreate(FacebookUser user, FacebookAuthToken token) {
        log.info("Creating user: $user for fb user: $token.uid")
    }

    void afterCreate(FacebookUser user, FacebookAuthToken token) {
        log.info("User created: $user for fb user: $token.uid")
    }
}