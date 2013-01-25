package codecanaan

import grails.test.mixin.*
import org.junit.*
import org.codehaus.groovy.grails.commons.GrailsApplication

/**
 * 課程控制器測試
 */
@TestFor(CourseController)
@Mock([User, Course])
class CourseControllerTests extends GroovyTestCase {


    void setUp() {
        //產生課程控制器
        //controller = new CourseController()
    }

}
