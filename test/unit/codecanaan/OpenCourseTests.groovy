package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(OpenCourse)
@Mock([Course])
class OpenCourseTests {


    /**
     * 測試將一門課程加入開放式課程清單
     */
    void testOpenTheCourse() {
        def c = new Course(
            name: 'course-to-open-1',
            title: 'Open Course Test',
            description: 'This Course Will be Open Course'
        )
        
        assertNotNull c.save()
        
        OpenCourse.openTheCourse(c)
        
        assert OpenCourse.findByCourse(c)?.course==c
    }
}
