package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(ScheduleService)
@Mock([ScheduleLesson, User, UserSchedule, Schedule, Lesson])
class ScheduleServiceTests {
	def newScheduleLesson=null

	void setUp(){
		UserSchedule.create(new User(), new Schedule(), true)	
		newScheduleLesson=new ScheduleLesson(
			schedule: new Schedule(), 
			lesson: new Lesson(),
			begin: new Date(), 
			end: new Date(), 
			deadline: new Date())
	}
	
    void testHasUser() {
		def ss=new ScheduleService()
		assertTrue ss.hasUser(new Schedule(), new User())
    }
	void testAnswerAvailable() {
		def ss=new ScheduleService()
		assertFalse ss.answerAvailable(newScheduleLesson)
	}
}
