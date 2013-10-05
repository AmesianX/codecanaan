package codecanaan

/**
 * User Domain Class
 */
class User {

    /**
     * SpringSecurity
     */
	transient springSecurityService

    /**
     * 使用者全名
     */
	String fullName
	
	/**
	 * 使用者電子郵件信箱
	 */
	String email
	
	/**
	 * 個人介紹（Markdown）
	 */
	String description
	
	/**
	 * 客戶端工具連接埠
	 */
	int clientPort = 1337

    /**
     * 學校（或公司）
     */
    String school

    /**
     * 系所（或部門）
     */
    String department

    /**
     * 登入帳號名稱（系統欄位）
     */
	String username
	
	/**
	 * 密碼
	 */
	String password
	
	/**
	 * 帳號是否啟用
	 */
	boolean enabled
	
	/**
	 * 帳號過期
	 */
	boolean accountExpired
	
	/**
	 * 帳號鎖定
	 */
	boolean accountLocked
	
	/**
	 * 密碼過期
	 */
	boolean passwordExpired

    /**
     * 是否通過所有「開始使用」的步驟
     */
    boolean works = false

    /**
     * 是否接收電子郵件
     */
    boolean enableNews = true
    
    /**
     * 經驗值；
     * 閱讀講義或簡報 +1、
     * 通過測驗 +2、
     * 通過實作題 +3
     */
    int experience = 0

    /**
     * 帳號建立日期
     */
    Date dateCreated
    
    /**
     * 資料更新日期
     */
    Date lastUpdated
    
    /**
     * Required fields: fullName, email, username, password
     */
	static constraints = {
        username nullable: false, blank: false, unique: true
        password nullable: false, blank: false
		fullName nullable: false, blank: false, size: 2..25
		email nullable: false, blank: false, email: true
		description nullable: true, empty: true
		school nullable: true, blank: true
		department nullable: true, blank: true
        clientPort range: 1000..65535
	}

	static mapping = {
		password column: '`password`'
	}

    /**
     * 取得使用者擁有的權限（角色）
     *
     * @return 角色（Role）集合
     */
	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

    /**
     * 資料新增時先將密碼加密
     */
	def beforeInsert() {
		encodePassword()
	}

    /**
     * 資料更新時先將密碼加密
     */
	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}
	
	/**
	 * 密碼加密編碼，使用 SpringSecurity.encodePassword()
	 */
	protected void encodePassword() {
        password = springSecurityService.encodePassword(password)
	}
}
