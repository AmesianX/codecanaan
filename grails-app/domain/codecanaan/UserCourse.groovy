package codecanaan

/**
 * 使用者和課程的關聯
 */
class UserCourse {
    
	String reginfo	//註冊資訊

	Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    static belongsTo = [user: User, course: Course]

    static constraints = {
    	reginfo nullable: true, empty: true
    }

    /**
     * 建立新的使用者課程關聯
     */
	static UserCourse create(User user, Course course, boolean flush = false) {
		new UserCourse(user: user, course: course).save(flush: flush, insert: true)
	}
}
