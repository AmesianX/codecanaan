package codecanaan

/**
 * 定義群組角色類型
 */
public enum GroupRoleType {
    OWNER,  //群組擁有者
    MEMBER; //成員
}

/**
 * 使用者與群組關連
 */
class UserGroup {

	Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

    GroupRoleType roleType = GroupRoleType.MEMBER	//角色類型

    static belongsTo = [user: User, group: TheGroup]

    static constraints = {
    }

	/**
     * 建立新的使用者課程關聯
     */
	static UserGroup create(User user, TheGroup group, boolean flush = false) {
		new UserGroup(user: user, group: group).save(flush: flush, insert: true)
	}
}
