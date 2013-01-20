package codecanaan

class CourseService {

    /**
     * 檢查使用者是否有作者（編輯）權限
     */
    def isAuthor(Course course, User user) {
    	if (!user) return false
        def link = UserCourse.findByUserAndCourse(user, course)
        return link && link.regType == RegType.AUTHOR
    }
    
    /**
     * 取得某個單元下所有練習的統計
     */
    def getLessonStats(Lesson lesson, User user) {
        def stats = [:]
        
        stats.empty = 0 //未練習
        stats.ok = 0 //已完成
        stats.error = 0 //練習中

        if (user) {
            lesson.contents?.each {
                content->
                      
                def record = Record.findByUserAndContent(user, content)
                if (record) {
                    if (record.passed) {
                        stats.ok ++
                    }
                    else {
                        stats.error ++
                    }
                }
                else {
                    stats.empty ++
                }
            }
        }
        else {
            stats.empty = lesson.contents?.size()
        }
        
        return stats
    }

    /**
     * 取得單元下每題的練習記錄
     */
    def getLessonRecords(Lesson lesson, User user) {
        def result = [:]

        lesson.contents.each {
            content->

            result[content] = Record.findByContentAndUser(content, user)
        }

        return result
    }
}
