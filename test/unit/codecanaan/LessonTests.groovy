package codecanaan

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Lesson)
@Mock([Lesson,Content])
class LessonTests {

    void testAddContentsToLesson() {
        def content1 = new Content(
            type: ContentType.TUTORIAL,
            title: 'title1',
            sourceCode: "### this is contents\n\ndescriptions",
            question: 'question1',
            answer: 'ans1',
			description:"",
            partial: 'partial1'
        ).save(failOnError: true, flush: true)

        def content2 = new Content(
            type: ContentType.CODE,
            title: 'title2',
            sourceCode: "### this is contents 2\n\ndescriptions",
            question: 'question2',
            answer: 'ans2',
			description:"",
			partial: 'partial2'
        ).save(failOnError: true, flush: true)
		

		
        def lesson = new Lesson(
			name: 'lesson-1',
			title: '基本認識',
			description: 'lesson-1 desc'
		)
		
		
        assertNotNull lesson
        	.addToContents(content1)
        	.addToContents(content2)
        	.save(failOnError: true, flush: true)
    }
}
