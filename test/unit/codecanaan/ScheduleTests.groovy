package codecanaan

import java.util.Date;

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Schedule)
class ScheduleTests {

    void testSaveSchedule() {
		new Schedule(
			name:'Schedule1',
			title:'Schedule1',
			password:'pw'
		).save()
    }
}
