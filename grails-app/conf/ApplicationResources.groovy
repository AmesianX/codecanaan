def _bundleName = 'optimized'

modules = {
    'jquery-ui' {
        resource url: 'jquery-ui/css/smoothness/jquery-ui-1.9.1.custom.min.css'
		resource url: 'jquery-ui/js/jquery-ui-1.9.1.custom.min.js'
    }

    // Using jQuery File Upload Plug-in
    'jquery-fileupload' {
        dependsOn 'jquery'
        
        resource url: 'jquery-fileupload/css/jquery.fileupload-ui.css'
        resource url: 'jquery-fileupload/css/jquery.fileupload-ui-noscript.css',
            wrapper: { s -> "<noscript>$s</noscript>" }
    
        resource url: 'jquery-fileupload/js/jquery.iframe-transport.js'
        resource url: 'jquery-fileupload/js/jquery.fileupload.js'
        resource url: 'jquery-fileupload/js/jquery.fileupload-fp.js'
        resource url: 'jquery-fileupload/js/jquery.fileupload-ui.js'
    }
    
    'jquery-cslider' {
        dependsOn 'jquery'
        
        resource url: 'jquery-cslider/parallax-slider.css'
        
        resource url: 'jquery-cslider/jquery.cslider.js'
        resource url: 'jquery-cslider/slider.js'
    }
    
    'jquery-plugins' {
        dependsOn 'jquery'
        
        resource url: 'jquery-plugins/jquery.textarea.min.js'
    }

    common {
        dependsOn 'jquery, jquery-ui, jquery-plugins'
        
        resource url: 'js/common.js'
    }

    exercise {
        dependsOn 'jquery, common'
        
        resource url: 'js/exercise.js'
    }
    
    application {
        dependsOn 'common'
        resource url: 'js/application.js'
    }

    webfont {
    	resource url: 'js/webfont.js', disposition: 'head'
    }

    ie6 {
        resource url: 'universal-ie6-css/ie6.1.0.css',
            wrapper: { s -> "<!--[if IE 6]>$s<![endif]-->" }
    }

    pagedown {
        defaultBundle 'coding-tools'
        resource url: 'pagedown/pagedown.css'
        resource url: 'pagedown/Markdown.Converter.js', disposition: 'head'
        resource url: 'pagedown/Markdown.Sanitizer.js', disposition: 'head'
        resource url: 'pagedown/Markdown.Editor.js', disposition: 'head'
    }

    codemirror {
        defaultBundle 'coding-tools'
        resource url: 'codemirror/lib/codemirror.css'
        resource url: 'codemirror/lib/codemirror.js', disposition: 'head'
        resource url: 'codemirror/mode/clike/clike.js', disposition: 'head'
        resource url: 'codemirror/lib/util/runmode.js', disposition: 'head'
        //resource url: 'codemirror/lib/util/jquery.codemirror.js', disposition: 'head'
    }

    highlightjs {
        defaultBundle 'coding-tools'
        resource url: 'highlightjs/styles/vs.css'
        resource url: 'highlightjs/highlight.pack.js', disposition: 'head'
    }
   
    bootswatch {
        dependsOn 'bootstrap-js'
        defaultBundle 'bootstrap'
        
        //resource url: [dir: 'swatchmaker', file: 'swatchmaker.less'],
        //    attrs: [rel: 'stylesheet/less', type: 'css'],
        //    bundle: _bundleName
        
        //resource url: [dir: 'swatchmaker', file: 'swatchmaker-responsive.less'],
        //    attrs: [rel: 'stylesheet/less', type: 'css'],
        //    bundle: _bundleName

        resource url: 'stylesheets/bootstrap.min.css'
        resource url: 'stylesheets/bootstrap-responsive.min.css'
        resource url: 'stylesheets/docs.css'
    }
    
    'bootstrap-ext' {
        dependsOn 'bootswatch'
        defaultBundle 'bootstrap'

        resource url: 'bootstrap-ext/bootbox/bootbox.min.js'

        resource url: 'bootstrap-ext/datepicker/css/datepicker.css'
        resource url: 'bootstrap-ext/datepicker/js/bootstrap-datepicker.js'

        resource url: 'bootstrap-ext/timepicker/compiled/timepicker.css'
        resource url: 'bootstrap-ext/timepicker/js/bootstrap-timepicker.js'

        resource url: 'bootstrap-ext/bootstrap-lightbox.css'
        resource url: 'bootstrap-ext/bootstrap-lightbox.js'
    }
    
    'font-awesome' {
        dependsOn 'bootswatch'
        defaultBundle 'bootstrap'
        
        //resource url: [dir: 'font-awesome/less', file: 'font-awesome.less'],
        //    attrs: [rel: 'stylesheet/less', type:'css'], bundle: _bundleName

        //resource url: [dir: 'font-awesome/less', file: 'font-awesome-ie7.less'],
        //    attrs: [rel: 'stylesheet/less', type:'css'],
        //    wrapper: { s -> "<!--[if lte IE 7]>$s<![endif]-->" }

        resource url: 'stylesheets/font-awesome.css'
        resource url: 'stylesheets/font-awesome-ie7.css',
            wrapper: { s -> "<!--[if lte IE 7]>$s<![endif]-->" }
    }
    
    compass {
        dependsOn 'bootswatch'
        
        resource url: 'stylesheets/screen.css'
        resource url: 'stylesheets/print.css',
            attrs: [media: 'print'],
            bundle: "print"
        resource url: 'stylesheets/ie.css',
            wrapper: { s -> "<!--[if IE]>$s<![endif]-->" }
    }
    
    biwascheme {
        //resource url: 'biwascheme/biwascheme.js'
        resource url: 'biwascheme/biwascheme-min.js'
    }
}
