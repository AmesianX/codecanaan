package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Record)
@Mock([User,Content])
class RecordTests {

    void testAddRecord() {
    	assertNotNull new Record(
    		user: new User(),
    		content: new Content(),
    		sourceCode: '--code--',
    		answer: '--stdout--',
    		passed: true
    	)
    }

    void testFindRecordOrCreateBy() {
    	assertNotNull Record.findOrCreateByUserAndContent(
			new User(),
    		new Content()
    	)
    }
}
