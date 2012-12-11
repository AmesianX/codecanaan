def _bundleName = 'optimized'

modules = {
    'jquery-ui' {
        defaultBundle _bundleName
        
        resource url: [dir: 'jquery-ui/css/smoothness', file: 'jquery-ui-1.9.1.custom.min.css']
		resource url: [dir: 'jquery-ui/js', file: 'jquery-ui-1.9.1.custom.min.js']
    }

    common {
        resource url: 'js/common.js'
    }

    exercise {
        dependsOn 'common'

        resource url: 'js/exercise.js'
    }
    
    application {
        defaultBundle _bundleName
        
        resource url: 'js/application.js'
    }

    webfont {
        defaultBundle _bundleName
        
    	resource url: 'js/webfont.js', disposition: 'head'
    }

    pagedown {
        defaultBundle _bundleName
        
        resource url: [dir: 'pagedown', file: 'pagedown.css']

		resource url: [dir: 'pagedown', file: 'Markdown.Converter.js']
		resource url: [dir: 'pagedown', file: 'Markdown.Sanitizer.js']
        resource url: [dir: 'pagedown', file: 'Markdown.Editor.js']
    }

    ie6 {
        resource url: [dir: 'universal-ie6-css', file: 'ie6.1.0.css'],
            attrs: [media: 'screen'],
            wrapper: { s -> "<!--[if IE 6]>$s<![endif]-->" }
    }

    codemirror {
        defaultBundle _bundleName
    
        resource url: [dir: 'codemirror/lib', file: 'codemirror.css']
        
        resource url: [dir: 'codemirror/lib', file: 'codemirror.js']
        resource url: [dir: 'codemirror/mode/clike', file: 'clike.js']
        resource url: [dir: 'codemirror/lib/util', file: 'runmode.js']
        //resource url: [dir: 'codemirror/lib/util', file: 'jquery.codemirror.js']
    }

    highlightjs {
        defaultBundle _bundleName
        
        resource url: [dir: 'highlightjs/styles', file: 'vs.css']
        
        resource url: [dir: 'highlightjs', file: 'highlight.pack.js']
    }
   
    bootswatch {
        dependsOn 'bootstrap-js'
        defaultBundle _bundleName
        
        resource url: [dir: 'bootswatch/swatchmaker', file: 'swatchmaker.less'], attrs: [rel: 'stylesheet/less', type: 'css'], bundle: _bundleName
        
        resource url: [dir: 'bootswatch/swatchmaker', file: 'swatchmaker-responsive.less'], attrs: [rel: 'stylesheet/less', type: 'css'], bundle: _bundleName

        resource url: [dir: 'stylesheets', file: 'docs.css'], bundle: _bundleName
    }
    
    'bootstrap-lightbox' {
        dependsOn 'bootswatch'
        defaultBundle _bundleName
        
        resource url: [dir: 'bootstrap-lightbox', file: 'bootstrap-lightbox.css'], bundle: _bundleName
        
        resource url: [dir: 'bootstrap-lightbox', file: 'bootstrap-lightbox.js']
    }

    'bootstrap-ext' {
        dependsOn 'bootswatch'
        defaultBundle _bundleName

        resource url: 'bootstrap-ext/bootbox/bootbox.min.js'

        resource url: 'bootstrap-ext/datepicker/css/datepicker.css'
        resource url: 'bootstrap-ext/datepicker/js/bootstrap-datepicker.js'

        resource url: 'bootstrap-ext/timepicker/compiled/timepicker.css'
        resource url: 'bootstrap-ext/timepicker/js/bootstrap-timepicker.js'
    }
    
    'font-awesome' {
        dependsOn 'bootswatch'
        defaultBundle _bundleName
        
        resource url: [dir: 'font-awesome/less', file: 'font-awesome.less'],
            attrs: [rel: 'stylesheet/less', type:'css'], bundle: _bundleName

        resource url: [dir: 'font-awesome/less', file: 'font-awesome-ie7.less'],
            attrs: [rel: 'stylesheet/less', type:'css'],
            wrapper: { s -> "<!--[if lte IE 7]>$s<![endif]-->" }
    }
    
    compass {
        dependsOn 'bootswatch'
        defaultBundle _bundleName
        
        resource url: [dir: 'stylesheets', file: 'screen.css']
        
        resource url: [dir: 'stylesheets', file: 'print.css'], attrs: [media: 'print'], disposition: 'head'
        resource url: [dir: 'stylesheets', file: 'ie.css'], attrs: [media: 'screen'], wrapper: { s -> "<!--[if IE]>$s<![endif]-->" }
    }
    
}
