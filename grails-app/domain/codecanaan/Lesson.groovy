package codecanaan

class Lesson {

	String name			//單元名稱
	String title		//單元標題
	String description	//單元說明（Markdown）

	Date dateCreated	//建立日期
	Date lastUpdated	//修改日期

	User creator		//建立者

	int priority = 0    //排序

    /**
     * Contents
     */
	Collection contents

	static hasMany = [contents: Content]

	static mapping = {
		contents sort: 'priority'
	}

    /**
     * 單元必須依附課程存在
     */
	static belongsTo = [
	    course: Course
	]

    static constraints = {
    	course nullable: true
    	description nullable: true, blank: true, maxSize: 1024*1024
    	title blank: false
    	creator nullable: true
    }
}
