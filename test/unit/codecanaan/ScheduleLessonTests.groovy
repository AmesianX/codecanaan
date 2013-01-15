package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(ScheduleLesson)
@Mock([Schedule, Lesson])
class ScheduleLessonTests {

    void testSaveScheduleLesson() {
		ScheduleLesson.create(new Schedule(), new Lesson(), true)
		
		assert 1 , ScheduleLesson.list().size()
    }
}
