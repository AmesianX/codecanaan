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

    def ELLIPSIS = '...'

    /**
     * Truncating(Shorten) Text
     */ 
    def truncate = { attrs, body ->
        def maxLength = attrs.maxlength
        if (maxLength == null || !maxLength.isInteger() || maxLength.toInteger() <= 0) {
            throw new Exception("The attribute 'maxlength' must an integer greater than 3. Provided value: $maxLength")
        } else {
            maxLength = maxLength.toInteger()
        }
        if (maxLength <= ELLIPSIS.size()) {
            throw new Exception("The attribute 'maxlength' must be greater than 3. Provided value: $maxLength")
        }
        if (body().length() > maxLength) {
            out << /<abbr title="${body().encodeAsHTML()}">${body()[0..maxLength - (ELLIPSIS.size() + 1)].encodeAsHTML()}$ELLIPSIS<\/abbr>/
        } else {
            out << body().encodeAsHTML()
        }
    }
}
