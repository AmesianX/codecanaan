package codecanaan

class Course {

	String name			//課程名稱
	String title		//課程標題
	String description	//課程說明（Markdown）

	Date dateCreated	//建立日期
	Date lastUpdated	//修改日期

	User creator		//建立者
	
	Collection lessons

	static hasMany = [lessons: Lesson]
	
	static mapping = {
		lessons sort: 'priority'
	}

    static constraints = {
    	description blank: true, maxSize: 1024*1024
    	title blank: false
    	creator nullable: true
    }
}
