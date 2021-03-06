package codecanaan



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Post)
@Mock([User])
class PostTests {

    void testCreate() {
        assertNotNull new Post(
            name: '-name-',
            title: '-title-',
            content: '-content-',
            type: PostType.ANNOUNCE,
            tag: 'tag1, tag2',
            creator: new User()
        ).save()
    }
}
