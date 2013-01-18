package codecanaan

import grails.test.*
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */

class GoogleTagLibTests extends GroovyPagesTestCase {

    void testAnalyticsTag() {
        //因為需要 grailsApplication 所以放在整合測試
		assert applyTemplate('<google:analytics/>').contains("var _gaq = _gaq || [];")
    }
}
