package codecanaan



import org.junit.*
import grails.test.mixin.*

@TestFor(LessonController)
@Mock(Lesson)
class LessonControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/lesson/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.lessonInstanceList.size() == 0
        assert model.lessonInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.lessonInstance != null
    }

    void testSave() {
        controller.save()

        assert model.lessonInstance != null
        assert view == '/lesson/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/lesson/show/1'
        assert controller.flash.message != null
        assert Lesson.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/lesson/list'

        populateValidParams(params)
        def lesson = new Lesson(params)

        assert lesson.save() != null

        params.id = lesson.id

        def model = controller.show()

        assert model.lessonInstance == lesson
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/lesson/list'

        populateValidParams(params)
        def lesson = new Lesson(params)

        assert lesson.save() != null

        params.id = lesson.id

        def model = controller.edit()

        assert model.lessonInstance == lesson
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/lesson/list'

        response.reset()

        populateValidParams(params)
        def lesson = new Lesson(params)

        assert lesson.save() != null

        // test invalid parameters in update
        params.id = lesson.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/lesson/edit"
        assert model.lessonInstance != null

        lesson.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/lesson/show/$lesson.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        lesson.clearErrors()

        populateValidParams(params)
        params.id = lesson.id
        params.version = -1
        controller.update()

        assert view == "/lesson/edit"
        assert model.lessonInstance != null
        assert model.lessonInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/lesson/list'

        response.reset()

        populateValidParams(params)
        def lesson = new Lesson(params)

        assert lesson.save() != null
        assert Lesson.count() == 1

        params.id = lesson.id

        controller.delete()

        assert Lesson.count() == 0
        assert Lesson.get(lesson.id) == null
        assert response.redirectedUrl == '/lesson/list'
    }
}
