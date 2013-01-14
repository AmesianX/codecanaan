package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(UserCourse)
@Mock([User,Course])
class UserCourseTests {
	def user=null
	def newCourse =null
	void setup(){
		user= new User(username: 'admin', password: 'admin').save();
		newCourse=new Course(
			name: 'tqc-plus-java6',
			title: 'TQC+ Java 物件導向程式語言',
			description: 'course-1 desc',
			creator: user
		).save()
	}
	
    void testSaveUserCourse() {
		UserCourse.create(user,newCourse,true)
		
		assert 1, UserCourse.findByUserAndCourse(user,newCourse).list().size()
    }
	
	void testSaveUserCourseWithRegType() {
		UserCourse.create(user,newCourse,RegType.USER,true)
		
		assert RegType.USER, UserCourse.findByUserAndCourse(user,newCourse).list().get(0).regType
	}
}
