package codecanaan

class Coupon {
	String serialCode			//序號
	boolean registered = false	//已被註冊
	boolean valid = true		//是否有效
	String organization			//發券單位
    String memo                 //備忘

	User user 			//序號使用者
	Course course 		//授權課程
    Schedule schedule   //學習進度

	Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    //static belongsTo = [course: Course]

    static constraints = {
    	serialCode nullable: false, empty: false
    	user nullable: true
    	course nullable: false
        schedule nullable: true
    	organization nullable: true, empty: true
        memo nullable: true, empty: true
    }
}
