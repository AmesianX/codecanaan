package codecanaan

class CommonTagLib {
    def justfont = { attr, body ->
        out << render(template: '/taglib/justfont')
    }

    def analytics = { attr, body ->
        out << render(template: '/taglib/analytics')
    }
}
