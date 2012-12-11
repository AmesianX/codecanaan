package codecanaan

/**
 * 定義群組角色類型
 */
public enum ScheduleRoleType {
    OWNER,  //群組擁有者
    MEMBER; //成員
}

/**
 * 使用者與教學進度關連
 */
class UserSchedule {

    Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    ScheduleRoleType roleType = ScheduleRoleType.MEMBER //角色類型

    static belongsTo = [user: User, schedule: Schedule]

    static constraints = {
    }

    /**
     * 建立新的使用者課程關聯
     */
    static UserSchedule create(User user, Schedule schedule, boolean flush = false) {
        def link = new UserSchedule(user: user, schedule: schedule)
        link.save(flush: flush, insert: true)
    }
}
