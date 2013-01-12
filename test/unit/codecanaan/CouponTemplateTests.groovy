package codecanaan

import static org.junit.Assert.*

import java.util.Date;

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(CouponTemplate)
@Mock([Course])
class CouponTemplateTests {
	def newCourse=null;
    void setUp() {
        newCourse= new Course(
			name: 'tqc-plus-java6',
			title: 'TQC+ Java 物件導向程式語言',
			description: 'course-1 desc',
		).save();
	
    }



    void testCouponTemplateCreate() {
		CouponTemplate.create(
			"AA",
			"org",
			30,
			newCourse
		)
		
		assert 1,CouponTemplate.list().size()
    }
}
