package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserTests {

	void testAddAdministrator() {
		assertNotNull new User(username: 'admin', password: 'admin').save();
    }
}
