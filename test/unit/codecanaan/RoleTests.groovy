package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Role)
class RoleTests {

    void testAddRole() {
		def role1 = Role.findOrSaveByAuthority('ROLE_USER')
        def role2 = Role.findOrSaveByAuthority('ROLE_FACEBOOK')
        def role3 = Role.findOrSaveByAuthority('ROLE_ADMIN')
        def role4 = Role.findOrSaveByAuthority('ROLE_AUTHOR')
        def role5 = Role.findOrSaveByAuthority('ROLE_STUDENT')
        def role6 = Role.findOrSaveByAuthority('ROLE_TEACHER')
		
		assert 6 , Role.list().size()
    }
}
