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
            source: "### this is contents\n\ndescriptions",
            output: 'output1',
            question: 'question1',
            answer: 'ans1',
            partial: 'partial1'
        ).save()

        def content2 = new Content(
            type: ContentType.CODE,
            title: 'title2',
            source: "### this is contents 2\n\ndescriptions",
            output: 'output2',
            question: 'question2',
            answer: 'ans2',
            partial: 'partial2'
        ).save()

        def lesson = new Lesson(name: 'lesson1')
        
        assertNotNull lesson
        	.addToContents(content1)
        	.addToContents(content2)
        	.save()
    }
}
