package codecanaan

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*
import grails.plugins.springsecurity.*

/**
 * 「課程單元」單元測試
 */
@TestFor(LessonController)
@Mock([Course,Lesson,CourseService,SpringSecurityService])
@TestMixin(GrailsUnitTestMixin)
class LessonControllerTests {

    def courseService

    void setUp() {
        courseService = new CourseService()
    }

    void tearDown() {
        // Tear down logic here
    }

    void "test controller exists"() {
        assertNotNull controller
        assertNotNull request
    }

    void "test create action without passing course"() {
        def model = controller.create()

        //因為沒有傳入 course.id 所以傳回 404 error
        assert 404 == response.status

    }

    void "test create action with a course"() {
        
        def course = new Course()

        courseService.createCourseFromTemplate(course)

        assertNotNull course.save()

        //傳入課程
        params.course = course
        
        def model = controller.create()

        //單元建立成功後會重新導向編輯單元的頁面
        assert response.status == 302
        assert response.redirectedUrl == '/lesson/show/1?editor=true'
    }
}
