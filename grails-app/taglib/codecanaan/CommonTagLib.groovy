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
}
