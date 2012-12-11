package codecanaan

/**
 * 教學進度與教材單元關連
 */
class ScheduleLesson {

    Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    int priority = 0    //教學進度排序

    Date begin			//開放練習（允許學生撰寫練習）
    Date end			//結束練習（停止練習）
    Date deadline		//作答結束時間（繳交期限；到期後開放查詢解答）
    
    static belongsTo = [schedule: Schedule, lesson: Lesson]

    static constraints = {
    }

    static mapping = {
        sort 'priority'
    }

    /**
     * 建立新的使用者課程關聯
     */
    static ScheduleLesson create(Schedule schedule, Lesson lesson, boolean flush = false) {
        def link = new ScheduleLesson(schedule: schedule, lesson: lesson)
        link.save(flush: flush, insert: true)
    }
}
