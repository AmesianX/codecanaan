package codecanaan

/**
 * 開放式課程清單；被歸類到此表中的課程，使用者可以免費註冊使用
 */
class OpenCourse {
    
    /**
     * 建立日期
     */    
    Date dateCreated
    
    /**
     * 修改日期
     */
    Date lastUpdated

    static belongsTo = [course: Course]

    static constraints = {
    
    }
    
    /**
     * 將參數指定的課程列為開放式課程
     * 
     * @param course 課程
     *
     */
    static void openTheCourse(Course course) {
        def oc = OpenCourse.findOrCreateByCourse(course)
        
        oc.save(flush: true)
    }
}
