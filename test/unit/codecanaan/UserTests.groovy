package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserTests {

    void testAddAdministrator() {
		
		
       def user= new User(username: 'admin', password: 'admin').save();
	   
	   println user;
	   
	   assertNotNull user;
    }
}
