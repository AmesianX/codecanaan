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
    
    /**
     * CodeMirror Syntax Mode
     */
    def cmmode = { attr, body ->
        if (attr && attr.type) {
            if (attr.type.toString().toLowerCase()=='scheme') {
                out << 'text/x-scheme'
            }
            else if (attr.type.toString().toLowerCase()=='html') {
                out << 'text/html'
            }
            else {
                out << 'text/x-csrc'
            }
        }
    }

	def compact = { attr, body ->
		def c = body()?.trim()

		if (c) {
			c = (c =~ /\n+/).replaceAll('\n')
		}

		out << c
	}

    def starLabel = { attr, body ->
        if (attr.rank) {
            def rank = attr.rank
            for (def i=0; i<rank; i++) {
                out << '<i class="icon icon-star"></i>'
            }
            for (def j=0; j<(5-rank); j++) {
                out << '<i class="icon icon-star-empty"></i>'
            }
        }
    }

    /**
     * Display Human Readable File Size Number
     */
    def prettyFileSize = { attr, body ->
        if (attr.size) {
            def size = attr.size

            if (size >= 1024*1024) {
                out << "${(int)size/1024/1024} MB"
            }
            else if (size >= 1024) {
                out << "${(int)size/1024} KB"
            }
            else {
                out << "${size} bytes"
            }
        }
    }
}
