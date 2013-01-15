package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(UserRole)
@Mock([User, Role])
class UserRoleTests {
	def role1 =null
	def user1 =null
	def user2 =null
	void setUp(){
		User.metaClass.encodePassword = {}
		
		role1 = Role.findOrSaveByAuthority('ROLE_USER')
		user1 = new User(username: 'student', password: 'student', enabled: true).save(failOnError: true, flush: true)
		user2 = new User(username: 'teacher', password: 'teacher', enabled: true).save(failOnError: true, flush: true)
		UserRole.create(user1,role1)
	}
    void "test call UserRole create" () {
		UserRole.create(user2,role1)
		
		assert 2, UserRole.list().size() 
    }
	
	void "test call UserRole remove" () {
		assertNotNull UserRole.findByRole(role1)
		
		println UserRole.findByRole(role1).id
		
		UserRole.remove(user1, role1, true)
		
		assertNull UserRole.findByRoleAndUser(role1, user1)
	}
	
	void "test ccall UserRole hashCode" () {
		assertNotNull UserRole.findByRole(role1).hashCode()
		
	}
}
