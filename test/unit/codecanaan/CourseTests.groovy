package codecanaan



import java.util.Collection;
import java.util.Date;

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Course)
@Mock([User,Lesson])

class CourseTests {
	def user=null 
	def lesson =null
	void setUp() {
		User.metaClass.encodePassword = {}
		user= new User(username: 'admin', password: 'admin').save();
		lesson = new Lesson(
			name: 'lesson-1',
			title: '基本認識',
			description: 'lesson-1 desc',
			creator: user
		).save()
	}


    void testAddCourse() {

		assertNotNull new Course(
            name: 'tqc-plus-java6',
            title: 'TQC+ Java 物件導向程式語言',
            description: 'course-1 desc',
            creator: user
        ).save()
	
		
    }

	void testCourseAddLesson() {
		
		def newCourse= new Course(
			name: 'tqc-plus-java6',
			title: 'TQC+ Java 物件導向程式語言',
			description: 'course-1 desc',
			creator: user
			
		).addToLessons(lesson).save();
		
		assertNotNull newCourse
		
		assert Course.findById(newCourse.id).lessons.get(0)==lesson
		
	}
	
	

}
