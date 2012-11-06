package codecanaan

class Lesson {

	String name			//單元名稱
	String title		//單元標題
	String description	//單元說明（Markdown）

	Date dateCreated	//建立日期
	Date lastUpdated	//修改日期

	User creator		//建立者

	int priority = 0    //排序

	Collection contents

	static hasMany = [contents: Content]

	static mapping = {
		contents sort: 'priority'
	}

	static belongsTo = [course: Course]

    static constraints = {
    	course nullable: true
    	description blank: true, maxSize: 1024*1024
    	title blank: false
    	creator nullable: true
    }
}
