package codecanaan



import grails.plugins.springsecurity.SpringSecurityService
import grails.test.GrailsMock
import grails.test.GrailsUnitTestCase

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(UserTagLib)
class UserTagLibTests {	
	void setUp(){
      tagLib.springSecurityService = new SpringSecurityService()
	}

    void testSomething() {		 
		def result= applyTemplate("<g:displayUserName />")
		assertNotNull result
    }
}
