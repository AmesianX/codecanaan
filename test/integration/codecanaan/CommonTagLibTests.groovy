package codecanaan



import grails.test.GroovyPagesTestCase
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */

class CommonTagLibTests extends GroovyPagesTestCase {

	
	void testJustfontTag() {
		//因為容易發生 BUG，Justfont 已經停用參數化設計
		assert applyTemplate('<g:justfont />').contains("justfont")

	}
}
