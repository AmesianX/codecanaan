package codecanaan

import static org.junit.Assert.*

import java.util.Date;

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Coupon)
@Mock([Course])
class CouponTests {
	

	def newCourse =null
	
	void setUp(){

		newCourse=new Course(
			name: 'tqc-plus-java6',
			title: 'TQC+ Java 物件導向程式語言',
			description: 'course-1 desc'
		).save()
	}


    void testSaveCoupon() {
		assertNotNull new Coupon(
			serialCode:"12345678",
			registered: false,
			valid: true,
			organization: "test",
			memo: "memo",
			course: newCourse
		).save(failOnError: true, flush: true)
		
		
//		String serialCode           //序號
//		boolean registered = false  //已被註冊
//		boolean valid = true        //是否有效
//		String organization         //發券單位
//		String memo                 //備忘
    }
}
