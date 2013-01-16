package codecanaan



import grails.plugins.springsecurity.SpringSecurityService
import grails.test.GrailsMock
import grails.test.GrailsUnitTestCase

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(UserTagLib)
class UserTagLibTests {	

    void testSomething() {		 
		tagLib.springSecurityService = new SpringSecurityService()
		def result= applyTemplate("<g:displayUserName />")
		assertNotNull result
    }
}
