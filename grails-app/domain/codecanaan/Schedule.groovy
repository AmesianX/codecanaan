package codecanaan

/**
 * 用戶群組
 */
class Schedule {

	String name
	String title

	User creator

	Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    static constraints = {
    }
}
