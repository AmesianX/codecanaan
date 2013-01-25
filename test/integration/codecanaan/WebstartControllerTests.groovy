package codecanaan

import grails.test.mixin.*
import org.junit.*
import org.codehaus.groovy.grails.commons.GrailsApplication

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */

class WebstartControllerTests extends GroovyTestCase {

    void testSomething() {
		def wc = new WebstartController()
		wc.script()
		assertNotNull wc.response.text;
    }
}
