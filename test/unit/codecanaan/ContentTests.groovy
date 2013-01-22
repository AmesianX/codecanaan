package codecanaan

import grails.test.mixin.*
import org.junit.*

/**
 * 學習內容單元測試
 */
@TestFor(Content)
class ContentTests {

    Content _c;

    /**
     * 初始資料設定
     */
    void setUp() {
        _c = new Content(
            type:           ContentType.TUTORIAL,
            title:          'title1',
            description:    'description1'
        )
    }

    void "test save a new content"() {
        assertNotNull _c.save(flush: true)
        assertNotNull _c.id
        assertNotNull Content.get(_c.id)
        assert Content.findAllByTitle('title1').size()>0
    }

    void "test delete a content after save"() {
        assertNotNull _c.save(flush: true)
        assertNotNull Content.get(_c.id)
        _c.delete(flush: true)
        assertNull Content.get(_c.id)
    }

    void "test content fields update"() {
        assertNotNull _c.save(flush: true)
        
        assertNotNull Content.findByTitle('title1')
        assertNull Content.findByTitle('bible1')

        _c.title = "bible1"
        _c.save(flush: true)
        
        assertNull Content.findByTitle('title1')
        assertNotNull Content.findByTitle('bible1')
    }
}
