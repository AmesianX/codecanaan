package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(SystemConfig)
class SystemConfigTests {

    void testConfig() {
    
        def c = new SystemConfig(key: 'config.key', value: 'empty')
        
        assertNotNull c.save()
    }
    
    void testCreateConfig() {
    
        def c1 = new SystemConfig(key: 'key1', value: 'val1')
        def c2 = new SystemConfig(key: 'key2', value: 'val2')
        
        assertNotNull c1.save()
        assertNotNull c2.save()
        
        assert SystemConfig.get('key1')?.value == 'val1'
        assert SystemConfig.get('key2')?.value == 'val2'
    }
    
    void testRead() {
        def c3 = new SystemConfig(key: 'key3', value: 'val3')
        
        assertNotNull c3.save()
        
        //正常取得資料
        assert SystemConfig.read('key3') == 'val3'
        
        //抓不到資料會噴 Null
        assertNull SystemConfig.read('key3__')
        
        //加上第二個參數取代 Null
        assert SystemConfig.read('key3__', 'null1') == 'null1'
    }
    
    void testWrite() {
        SystemConfig.write('test.key1', 'test1')
        SystemConfig.write('test.key2', 'test2')

        assert SystemConfig.read('test.key1')=='test1'
        assert SystemConfig.read('test.key2')=='test2'
    }
}
