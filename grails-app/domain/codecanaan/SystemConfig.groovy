package codecanaan

class SystemConfig {

    String key
    String value

    static mapping = {
        id name: 'key', generator: 'assigned'
		key column: 'key_name'
    }

    static constraints = {
    }
    
    /**
     * 讀取一組設定
     *
     * @param key 設定代碼
     * @param valueIfNull 若沒有資料（Null）用此參數回傳
     *
     */
    static String read(String key, String valueIfNull = null) {
        def c = SystemConfig.get(key)
        
        if (c && c.value != null) {
            return c.value
        }
        else {
            return valueIfNull
        }
    }
    
    /**
     * 寫入一組設定
     *
     * @param key 設定代碼
     * @param value 設定值（字串不可為 Null）
     */
    static void write(String key, String value) {
        def c = SystemConfig.findOrCreateByKey(key)
        c.value = value
        c.save(flush: true)
    }
}
