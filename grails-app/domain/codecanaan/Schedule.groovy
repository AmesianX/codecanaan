package codecanaan

/**
 * 用戶群組
 */
class Schedule {

	String name
	String title

	String password		//學習進度安全密碼（防止惡意加入）

	User creator

	Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    static constraints = {
    	password nullable: true, blank: true
    }
}
