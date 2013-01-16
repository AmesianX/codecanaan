package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(UserCourse)
@Mock([User,Course])
class UserCourseTests {

    void testSaveUserCourse() {

		UserCourse.create(new User(),new Course(),true)
		
		assert 1, UserCourse.findByUserAndCourse(user,newCourse).list().size()
		
    }
	
	void testSaveUserCourseWithRegType() {

		UserCourse.create(new User(),new Course(),RegType.USER,true)
		
		assert RegType.USER, UserCourse.findByUserAndCourse(user,newCourse).list().get(0).regType

	}
}
