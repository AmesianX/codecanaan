package codecanaan

/**
 * 定義註冊類型
 */
public enum RegType {
    AUTHOR,  //課程作者及協作者
    TEACHER, //課程教師
    STUDENT, //課程學生
    USER,    //註冊使用者（目前沒有作用）
    GUEST;   //訪客（僅限瀏覽）
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
     *
     * @param user 使用者
     * @param course 課程
     * @param flush 是否直接寫入資料庫
     *
     */
    static UserCourse create(User user, Course course, boolean flush = false) {
        def uc = UserCourse.findOrCreateWhere(user: user, course: course)
        uc.save(flush: flush)
    }

    /**
     * 建立新的使用者課程關聯（同時設定權限）
     * 
     * @param user 使用者
     * @param course 課程
     * @param regType 註冊類型
     * @param flush 是否直接寫入資料庫
     *
     */
    static UserCourse create(User user, Course course, RegType regType, boolean flush = false) {
    
        // Create or Update
        def uc = UserCourse.findOrCreateWhere(user: user, course: course)
        uc.regType = regType
        uc.save(flush: flush)
    }
}
