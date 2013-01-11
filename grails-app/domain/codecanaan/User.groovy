package codecanaan

class User {

	transient springSecurityService

	String fullName		//全名
	String email		//電子郵件
	
	int clientPort = 1337   //客戶端工具連接埠

    Date dateCreated    //建立日期
    Date lastUpdated    //修改日期

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		fullName nullable: true, size: 2..25
		email nullable: true, email: true
		username blank: false, unique: true
		password blank: false
		clientPort range: 1000..65535
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}
	
	/**
	 * @see http://stackoverflow.com/questions/8516837/how-to-unit-test-controllers-that-use-springsecurityservice
	 */
	protected void encodePassword() {
        // SpringSecutiryService is not injected in tests.
		
        if (springSecurityService)
        	password = springSecurityService.encodePassword(password)
	}
}
