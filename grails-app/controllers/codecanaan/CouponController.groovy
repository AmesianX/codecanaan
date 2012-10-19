package codecanaan

class CouponController {
    static scaffold = true

    /**
     * 產生課程兌換券
     */
    def generate() {
        def course = Course.get(params.courseId)

        def couponList = []

        int size = 0
        try {
            size = new Integer(params.size)
        }
        catch (ex) {
            //ex
        }

        def prefix = params.prefix
        def organization = params.organization

        def history = []

        for(def i=0; i<size; i++) {
        	
        	def code = gencode()

        	//避免重複
        	while (history.contains(code)) {
        		code = gencode()
        	}

        	def serialCode = "${prefix}-${code}"

        	def coupon = new Coupon(course: course, serialCode: serialCode, organization: organization)

        	if (coupon.save(flush: true)) {
	            couponList << coupon.serialCode
        	}
        }

        render(contentType: 'application/json') {
            couponList
        }
    }

    private gencode() {
    	def random = new Random()
    	def md5code = "${new Date().time}${random.nextInt(10000)}".encodeAsMD5()
    	def code = new StringBuffer()
    	(1..5).each { i->
    		code << md5code[i]
    	}
    	return code
    }
}
