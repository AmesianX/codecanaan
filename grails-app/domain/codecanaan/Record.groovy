package codecanaan

class Record {

	//User user
	//Content content

    /**
     * 程式碼
     */
	String sourceCode

	/**
	 * 執行結果
	 */
	String output

    /**
     * 回答
     */
	String answer

	boolean passed = false

    Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    static belongsTo = [user: User, content: Content]

    static constraints = {
        sourceCode  nullable: true, empty: true, maxSize: 1024*1024
        output nullable: true, empty: true, maxSize: 1024*1024
        answer nullable: true, empty: true, maxSize: 255
        passed nullable: false
    }
}
