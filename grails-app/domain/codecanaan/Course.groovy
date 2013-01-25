package codecanaan

/**
 * 課程
 */
class Course {

    /**
     * 課程名稱
     */
	String name
	
	/**
	 * 課程標題
	 */
	String title
	
	/**
	 * 課程說明（Markdown）
	 */
	String description

    /**
     * 課程包含的單元
     */
	Collection lessons
    
    /*---------- 系統欄位 ----------*/
	
	/**
	 * 建立日期
	 */
	Date dateCreated
	
	/**
	 * 修改日期
	 */
	Date lastUpdated

    /**
     * 課程建立者
     */
	User creator
	
	static hasMany = [lessons: Lesson]
	
	static mapping = {
		lessons sort: 'priority'
	}

    static constraints = {
    	name unique: true
    	description blank: true, maxSize: 1024*1024
    	title blank: false
    	creator nullable: true
    }
}
