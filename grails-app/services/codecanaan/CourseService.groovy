package codecanaan

class CourseService {

    /*
     * 檢查使用者是否有作者（編輯）權限
     */
    def isAuthor(Course course, User user) {
    	if (!user) return false
        def link = UserCourse.findByUserAndCourse(user, course)
        return link && link.regType == RegType.AUTHOR
    }
}
