package codecanaan

/**
 * 批次產生序號時，先將輸入的表單資料存一份到此樣板
 */
class CouponTemplate {

	String prefix		//前置碼
	String organization //組織
	int validDays		//有效天數

    //Course course 		//授權課程
    static belongsTo = [course: Course]
 
    static constraints = {

    }

    static CouponTemplate create(String prefix, String organization, int validDays, Course course) {
    	new CouponTemplate(
			prefix: prefix,
			organization: organization,
			validDays: validDays, 
	    	course: course
    	).save(flush: true)
    }
}
