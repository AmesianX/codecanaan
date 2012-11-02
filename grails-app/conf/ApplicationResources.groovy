modules = {
    application {
        resource url: 'js/application.js'
    }

    webfont {
    	resource url: 'js/webfont.js', disposition: 'head'
    }

    pagedown {
        resource url: [dir: 'pagedown', file: 'pagedown.css'],
            attrs: [media: 'screen']
		resource url: [dir: 'pagedown', file: 'Markdown.Converter.js']
		resource url: [dir: 'pagedown', file: 'Markdown.Sanitizer.js']
        resource url: [dir: 'pagedown', file: 'Markdown.Editor.js']
    }

    ie6 {
        resource url: [dir: 'universal-ie6-css', file: 'ie6.1.0.css'],
            attrs: [media: 'screen'],
            wrapper: { s -> "<!--[if IE 6]>$s<![endif]-->" }
    }

    compass {
        dependsOn 'custom-bootstrap'

        resource url: [dir: 'stylesheets', file: 'screen.css'], attrs: [media: 'screen, projection'], disposition: 'head'
        resource url: [dir: 'stylesheets', file: 'print.css'], attrs: [media: 'print'], disposition: 'head'
        resource url: [dir: 'stylesheets', file: 'ie.css'], attrs: [media: 'screen'], wrapper: { s -> "<!--[if IE]>$s<![endif]-->" }
    }

    codemirror {
        resource url: [dir: 'codemirror/lib', file: 'codemirror.css'], attrs: [media: 'screen']
        resource url: [dir: 'codemirror/lib', file: 'codemirror.js']
        resource url: [dir: 'codemirror/mode/clike', file: 'clike.js']
        resource url: [dir: 'codemirror/lib/util', file: 'runmode.js']
        //resource url: [dir: 'codemirror/lib/util', file: 'jquery.codemirror.js']
    }

    highlightjs {
        resource url: [dir: 'highlightjs/styles', file: 'vs.css'],
            attrs: [media: 'screen']
        resource url: [dir: 'highlightjs', file: 'highlight.pack.js']
    }
   
    'custom-bootstrap' {
        dependsOn 'bootstrap-js'
        
        resource url: [dir: 'less', file: 'custom-bootstrap.less'], attrs:[rel: "stylesheet/less", type:'css']
        /*
        resource url: [dir: 'fontawesome/css', file: 'font-awesome.css'],
            attrs: [media: 'screen']
        resource url: [dir: 'fontawesome/css', file: 'font-awesome-ie7.css'],
            attrs: [media: 'screen'],
            wrapper: { s -> "<!--[if lte IE 7]>$s<![endif]-->" }*/
    }
}
