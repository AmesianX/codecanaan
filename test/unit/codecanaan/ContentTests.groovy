package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Content)
class ContentTests {


    void testSaveContent() {
        assertNotNull new Content(
            type: ContentType.TUTORIAL,
            title: 'title1',
            source: "### this is contents\n\ndescriptions",
            output: 'output1',
            question: 'question1',
            answer: 'ans1',
            partial: 'partial1',
            description: "description1"
        ).save(failOnError: true, flush: true)

 
    }

    void testDeleteContent() {
        def testContent= new Content(
            type: ContentType.TUTORIAL,
            title: 'title1',
            source: "### this is contents\n\ndescriptions",
            answer: 'ans1',
            partial: 'partial1',
            description: "description1"
        ).save()
        
        testContent.delete()
        assertNull Content.findById(testContent.id)
    }

    void testUpdateContentTitle() {
        def testContent= new Content(
            type: ContentType.TUTORIAL,
            title: 'title1',
            source: "### this is contents\n\ndescriptions",
            answer: 'ans1',
            partial: 'partial1',
            description: "description1"
        ).save()
        
		testContent.title="title2"
		testContent.save()
		
		def getTestContent=Content.findById(testContent.id);
		
        assert getTestContent.title=="title2" 
    }
}
