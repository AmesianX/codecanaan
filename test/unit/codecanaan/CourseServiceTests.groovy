package codecanaan

import grails.test.mixin.*
import org.junit.*

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

/**
 * 課程服務單元測試
 */
@TestFor(CourseService)
@Mock([User, Course, Lesson, Content, Record, UserCourse])
class CourseServiceTests {

    //課程服務
    def courseService

	void setUp(){
		//overwrite User.encodePassword
		//本來要用 injection 但是在 domain 無法注入，在sevice 與 taglib 目前測試沒有問題
		//User.metaClass.encodePassword = {}
		
		courseService = new CourseService()
	}

	void "test service"() {
	    assertNotNull courseService
	}

	void "test create course"() {
	    //create without passing a course
        assertNotNull courseService.createCourseFromTemplate()

        //manually create course
        def course = new Course()
        
        //course is empty
        assert !course.name
        assert !course.title
        assert !course.description
        
        //fetch course content from template
        courseService.createCourseFromTemplate(course)

        //course has values now
        assert course.name?.size() > 0
        assert course.title?.size() > 0
        assert course.description.size() > 0

        assertNotNull course.save()
    }

    void "test isAuthor"() {
        //建立新課程與使用者
        def course = new Course()
        def user = new User()
		
		//註冊前不是作者
		assert !courseService.isAuthor(course, user)

        //註冊成作者
		UserCourse.create(user, course, RegType.AUTHOR)

        //使用者為該課程作者
		assert courseService.isAuthor(course, user)
    }
	
	void "test get lesson stats"() {
		//建立單元與使用者
		def user = new User()
		def lesson = new Lesson()
       
        //在單元下新增內容
        lesson.addToContents(new Content())
        lesson.addToContents(new Content())

        //檢查單元下的內容數量
        assertEquals 2, lesson.contents?.size()

		//取得單元的練習記錄統計
		def stats = courseService.getLessonStats(lesson, user)

		assertEquals 2, stats.empty + stats.ok + stats.error
	}
}
