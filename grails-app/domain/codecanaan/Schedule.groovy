package codecanaan

/**
 * 學習進度
 */
class Schedule {

    /**
     * 代碼
     */
	String name

	/**
	 * 標題名稱（例如：物件導向程式語言）
	 */
	String title

    /**
     * 學校
     */
    String school

    /**
     * 系所
     */
    String department

    /**
     * 期別（101學年度下學期、2013年春季班）
     */
    String stage

    /**
     * 學習進度安全密碼（防止惡意加入）
     */
	String password

    /**
     * 建立者
     */
	User creator

    /**
     * 建立日期
     */
	Date dateCreated
    
    /**
     * 修改日期
     */
    Date lastUpdated

    static constraints = {
    	password nullable: true, blank: true
    }
}
