package codecanaan

/**
 * 定義註冊類型
 */
public enum RegType {
    OWNER,  //課程著作權擁有者
    GUEST,  //訪客（僅限瀏覽）
    USER;   //註冊使用者
}

/**
 * 使用者和課程的關聯
 */
class UserCourse {
    
    String regInfo = ""                 //註冊資訊
    RegType regType = RegType.GUEST     //註冊類型

    Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    static belongsTo = [user: User, course: Course]

    static constraints = {
        regInfo nullable: true, empty: true
    }

    /**
     * 建立新的使用者課程關聯
     */
    static UserCourse create(User user, Course course, boolean flush = false) {
        new UserCourse(user: user, course: course).save(flush: flush, insert: true)
    }
}
