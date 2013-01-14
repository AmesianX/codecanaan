package codecanaan

class CommonTagLib {
    def justfont = { attr, body ->
        if (attr.force) {
            out << render(template: '/taglib/justfont_force')
        }
        else {
            out << render(template: '/taglib/justfont')
        }
    }

    def analytics = { attr, body ->
        out << render(template: '/taglib/analytics')
    }
}
