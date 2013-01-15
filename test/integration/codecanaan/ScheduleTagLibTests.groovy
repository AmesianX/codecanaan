package codecanaan



import grails.test.GroovyPagesTestCase;
import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.GroovyPageUnitTestMixin} for usage instructions
 */
class ScheduleTagLibTests extends GroovyPagesTestCase {
	def newScheduleLesson =null;
	void setUp(){
		newScheduleLesson = new ScheduleLesson(
			schedule: new Schedule(),
			lesson: new Lesson(),
			begin: (new Date()).previous(),
			end: (new Date()).previous(),
			deadline: (new Date()).previous()
		)
	}
	
    void "test Call ScheduleLesson answerAvailable Tag"() {
		def result= applyTemplate(
			'<schedule:answerAvailable test="${link}" >test ok</schedule:answerAvailable>'
			,[link:newScheduleLesson])
		
		assert "test ok" ,result
    }
}
