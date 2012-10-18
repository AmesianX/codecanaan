package codecanaan

import org.springframework.dao.DataIntegrityViolationException

class ContentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contentList: Content.list(params), contentTotal: Content.count()]
    }

    /**
     * 直接建立內容後回到瀏覽頁面
     */
    def create() {
        def content = new Content(params)

        //套用預設值
        if (!content.type) {
            content.type = ContentType.TUTORIAL
        }

        content.title = "${content.type} ${content.lesson?.contents?.size()+1}"
        content.description = '''Write contents here using **Markdown** syntax.'''
        content.output = ''
        content.question = ''
        content.answer = ''
        content.partial = ''

        content.save(flush: true)

        redirect(
            controller: 'course',
            action: 'show',
            id: content.lesson?.course?.id,
            params: [
                lessonId: content.lesson?.id,
                contentId: content.id
            ]
        )
    }

    def save() {
        def content = new Content(params)
        
        if (!content.save(flush: true)) {
            render(view: "create", model: [content: content, lesson: lesson])
            return
        }

        log.info "Link content to lesson: ${lesson}"

        if (lesson) {
            lesson.addToContents(content)
            lesson.save(flush: true)
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'content.label', default: 'Content'), content.id])
        redirect(action: "show", id: content.id)
    }

    /**
     * Ajax 更新資料
     */
    def ajaxSave(Long id) {
        def content = Content.get(id)

        if (content) {
            content.properties = params
            content.save(flush: true)
        }

        render(contentType: 'text/json') {
            [url: createLink(controller: 'course', action: 'show', id: content.lesson?.course?.id, params: [lessonId: content.lesson?.id, contentId: content.id])]
        }
    }

    def show(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        [content: content]
    }

    def edit(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        [content: content]
    }

    def update(Long id, Long version) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (content.version > version) {
                content.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'content.label', default: 'Content')] as Object[],
                          "Another user has updated this Content while you were editing")
                render(view: "edit", model: [content: content])
                return
            }
        }

        content.properties = params

        if (!content.save(flush: true)) {
            render(view: "edit", model: [content: content])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'content.label', default: 'Content'), content.id])
        redirect(action: "show", id: content.id)
    }

    def delete(Long id) {
        def content = Content.get(id)
        if (!content) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
            return
        }

        try {
            content.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'content.label', default: 'Content'), id])
            redirect(action: "show", id: id)
        }
    }
}
