package codecanaan



import grails.test.GroovyPagesTestCase
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */

class CommonTagLibTests extends GroovyPagesTestCase {

    void testAnalyticsTag() {
		assert applyTemplate('<g:analytics/>').contains("var _gaq = _gaq || [];")
    }
	
	void testJustfontTag() {
		
		def attr=[
			ct1:'.justfont pre',
			ct2:".justfont p, .justfont li",
			ct3:".justfont h2, .justfont h3, .justfont h4, .justfont h5, .justfont h6, .justfont h1 small",
			ct4:".justfont h1",
			ct5:".justfont blockquote"
		]
		
		print attr.ct1
		
		def tagHtml='<g:justfont ct1="${ct1}" ct2="${ct2}" '+
			' ct3="${ct3}" ct4="${ct4}" ct5="${ct5}" />'
			
		def result=applyTemplate(tagHtml,attr)
		
		
		assert result.contains("{'ct1':'.justfont pre','ct2':{'0':'.justfont p','1':'.justfont li'}")

	}
}
