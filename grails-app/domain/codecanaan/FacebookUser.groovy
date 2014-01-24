package codecanaan
/**
 * Facebook 帳號資料
 */
class FacebookUser {

	/**
	 * Facebook 帳號序號（ID）
	 */
    long uid

	/**
	 * 存取 Facebook Graph API 的授權碼
	 */
    String accessToken
    
	/**
	 * Access Token 有效期時間
	 */
    Date accessTokenExpires

    static belongsTo = [user: User]

    static constraints = {
        uid unique: true
    }
}
