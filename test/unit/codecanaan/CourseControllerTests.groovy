package codecanaan

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * 課程單元測試
 */
@TestFor(CourseController)
@Mock([Course,CourseService])
@TestMixin(GrailsUnitTestMixin)
class CourseControllerTests {

    void setUp() {
        // Setup logic here
    }

    void tearDown() {
        // Tear down logic here
    }

    void "test controller exists"() {
        assertNotNull controller
    }
    
    void "test create action"() {
        //call create action
		def model = controller.create()
		assertNotNull controller.response.text;
		assertNotNull model.course

		def course = model.course
		assert course.name
		assert course.title
		assert course.description
    }
}
