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
	}
    void "test call UserRole create" () {
		UserRole.create(user1,role1,true)
		
		assert 2, UserRole.list().size() 
    }
	
	void "test call UserRole remove" () {
		
		UserRole.create(user1,role1,true)
		
		assertNotNull UserRole.findByRole(role1)
		
		UserRole.remove(user1, role1, true)
		
		assertNull UserRole.findByRoleAndUser(role1, user1)
	}
	
	void "test ccall UserRole hashCode" () {
		UserRole.create(user1,role1,true)
		assertNotNull UserRole.findByRole(role1).hashCode()
		
	}
}
