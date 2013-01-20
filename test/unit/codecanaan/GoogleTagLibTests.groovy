package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
@TestFor(GoogleTagLib)
class GoogleTagLibTests {

    void testAdsense() {
		def result= applyTemplate("<google:adsense width=\"160\" height=\"160\" />")
		assertNotNull result
    }

}
