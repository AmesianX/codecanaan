def __bundleName = 'codecanaan'

modules = {

	overrides {
        
		
        jquery {
			// Overriding jquery bundle name
            //defaultBundle 'jquery'
            //resource id: 'js', disposition: 'defer'
		}

        modernizr {
            //defaultBundle 'jquery'
            //resource id: 'js', disposition: 'defer'
        }
        
        /*
		bootstrap {
			//defaultBundle __bundleName
		}
		
        */
        /*'font-awesome' {
            dependsOn 'bootstrap'
        }*/
	}

    'grails-errors-style' {
        resource url: 'css/errors.css'
    }

    // jQuery
    /*
    jquery {
        defaultBundle 'jquery'

        resource url: 'jquery/jquery-1.10.2.min.js'
    }
    */

    /*
    'jquery-core' {
        dependsOn 'jquery'
        //defaultBundle 'jquery'

        resource url: 'jquery-plugins/jquery-migrate-1.2.1.min.js'
    }
    */

    'jquery-migrate' {
        dependsOn 'jquery'

        resource url: 'jquery-plugins/jquery-migrate-1.2.1.js'
    }

    'jquery-plugins' {
        dependsOn 'jquery'
        //defaultBundle 'jquery'
        
        resource url: 'jquery-plugins/jquery.textarea.js'
        resource url: 'jquery-plugins/jquery.jfontsize.js'
        resource url: 'jquery-plugins/jquery.cookie.js'
        resource url: 'jquery-plugins/jquery.masonry.js'
        resource url: 'jquery-plugins/jquery.lazyload.min.js'
        //resource url: 'jquery-plugins/jquery.selectText.min.js'
    }

    // Flot is a pure JavaScript plotting library for jQuery,
    // with a focus on simple usage, attractive looks and interactive features.
    // http://www.flotcharts.org/
    'jquery-flot' {
        dependsOn 'jquery, jquery-plugins'
        //defaultBundle 'jquery'
        //defaultBundle 'jquery-plugins'

        resource url: 'baseadmin/js/plugins/flot/jquery.flot.js'
        resource url: 'baseadmin/js/plugins/flot/jquery.flot.pie.js'
        resource url: 'baseadmin/js/plugins/flot/jquery.flot.resize.js'
        resource url: 'baseadmin/js/charts/area.js'
        resource url: 'baseadmin/js/charts/donut.js'
    }

    'jquery-ui' {
        dependsOn 'jquery'
        //defaultBundle 'jquery'

        // jQuery UI with Lightness theme
        resource url: 'jquery-ui/js/jquery-ui.min.js'
        resource url: 'jquery-ui/themes/ui-lightness/jquery-ui.min.css'
    }

    // jQuery File Upload Plug-in
    // http://blueimp.github.io/jQuery-File-Upload/index.html
    // File Upload widget with multiple file selection, drag and drop support,
    // progress bar, validation and preview images, audio and video for jQuery.
    'jquery-fileupload' {
        dependsOn 'jquery, jquery-plugins'
        //defaultBundle 'jquery'

        //defaultBundle 'jquery-plugins'
		//defaultBundle __bundleName
        
        resource url: 'jquery-fileupload/css/jquery.fileupload-ui.css'
        resource url: 'jquery-fileupload/css/jquery.fileupload-ui-noscript.css',
            wrapper: { s -> "<noscript>$s</noscript>" }
    
        resource url: 'jquery-fileupload/js/jquery.iframe-transport.js'
        resource url: 'jquery-fileupload/js/jquery.fileupload.js'
        resource url: 'jquery-fileupload/js/jquery.fileupload-fp.js'
        resource url: 'jquery-fileupload/js/jquery.fileupload-ui.js'
    }
    
    'jquery-cslider' {
        dependsOn 'jquery, jquery-plugins'
        //defaultBundle 'jquery'
        //defaultBundle 'jquery-plugins'
        
        resource url: 'jquery-cslider/parallax-slider.css'
        resource url: 'jquery-cslider/jquery.cslider.js'

        // This is a fake file, actually it's a modernizr js file
        //resource url: 'jquery-cslider/slider.js'
    }

    // Twitter Bootstrap
    /*
    bootstrap {
        dependsOn 'jquery'

        //resource url: 'bootstrap/css/bootstrap.min.css'
        resource url: 'bootstrap/css/bootstrap.no-icons.min.css'
        resource url: 'bootstrap/css/bootstrap-theme.min.css'
        resource url: 'bootstrap/js/bootstrap.min.js'
    }
    */

    // Base Aadmin 3.0
    baseadmin {
        dependsOn 'bootstrap, font-awesome'

        resource url: 'baseadmin/css/base-admin-3.css'
        resource url: 'baseadmin/css/base-admin-3-responsive.css'
        resource url: 'baseadmin/css/pages/dashboard.css'
        resource url: 'baseadmin/css/custom.css'

        resource url: 'js/baseadmin.js'

        //resource url: 'baseadmin/js/Application.js'
    }

    'baseadmin-signin' {
        dependsOn 'baseadmin'

        resource url: 'baseadmin/css/pages/signin.css'
    }

    'baseadmin-reports' {
        dependsOn 'baseadmin'

        resource url: 'baseadmin/css/pages/reports.css'
    }

    'baseadmin-faq' {
        dependsOn 'baseadmin'

        resource url: 'baseadmin/js/plugins/faq/faq.css'
        resource url: 'baseadmin/js/plugins/faq/faq.js'
    }
   
    bootswatch {
        //dependsOn 'bootstrap-js'
        //defaultBundle 'bootstrap'
		//defaultBundle __bundleName
        
        //resource url: [dir: 'swatchmaker', file: 'swatchmaker.less'],
        //    attrs: [rel: 'stylesheet/less', type: 'css'],
        //    bundle: _bundleName
        
        //resource url: [dir: 'swatchmaker', file: 'swatchmaker-responsive.less'],
        //    attrs: [rel: 'stylesheet/less', type: 'css'],
        //    bundle: _bundleName

        //resource url: 'stylesheets/bootstrap.min.css'
        //resource url: 'stylesheets/bootstrap-responsive.min.css'
        //resource url: 'stylesheets/docs.css'
    }
    
    'bootstrap-ext' {
        dependsOn 'bootstrap'
		//defaultBundle __bundleName

        resource url: 'bootstrap-ext/bootbox/bootbox.min.js'

        resource url: 'bootstrap-ext/datepicker/css/datepicker.css'
        resource url: 'bootstrap-ext/datepicker/js/bootstrap-datepicker.js'

        resource url: 'bootstrap-ext/timepicker/compiled/timepicker.css'
        resource url: 'bootstrap-ext/timepicker/js/bootstrap-timepicker.js'

        resource url: 'bootstrap-ext/bootstrap-lightbox.css'
        resource url: 'bootstrap-ext/bootstrap-lightbox.js'
    }
    
    'font-awesome' {
        dependsOn 'bootstrap'

        //resource url: [dir: 'font-awesome/less', file: 'font-awesome.less'],
        //    attrs: [rel: 'stylesheet/less', type:'css'], bundle: _bundleName

        //resource url: [dir: 'font-awesome/less', file: 'font-awesome-ie7.less'],
        //    attrs: [rel: 'stylesheet/less', type:'css'],
        //    wrapper: { s -> "<!--[if lte IE 7]>$s<![endif]-->" }

        resource url: 'font-awesome/css/font-awesome.css'
        resource url: 'font-awesome/css/font-awesome-ie7.css',
            wrapper: { s -> "<!--[if lte IE 7]>$s<![endif]-->" }
    }
    
    compass {
        dependsOn 'bootswatch'
        //defaultBundle 'bootstrap'
		//defaultBundle __bundleName

        resource url: 'stylesheets/screen.css'
        resource url: 'stylesheets/print.css',
            attrs: [media: 'print'],
            bundle: "print"
        resource url: 'stylesheets/ie.css',
            wrapper: { s -> "<!--[if IE]>$s<![endif]-->" }
    }
    
    biwascheme {
		// BiwaScheme contains it's own jQuery lib,
		// don't bundle other js file.
        //resource url: 'biwascheme/biwascheme.js'
        resource url: 'biwascheme/biwascheme.min.js'
    }

    // Common JavaScript Library
    common {
        dependsOn 'jquery, jquery-migrate, jquery-ui, jquery-plugins, codemirror, pagedown, bootstrap-ext, baseadmin'
        
        defaultBundle 'common'
        //defaultBundle __bundleName

        resource url: 'js/common.js'
    }

    //測驗專用功能
    exercise {
        dependsOn 'jquery, common'

        defaultBundle 'common'
        //defaultBundle __bundleName
        
        resource url: 'js/exercise.js'
    }
    
    application {
        dependsOn 'common'
        //defaultBundle 'common'
        //defaultBundle __bundleName

        resource url: 'js/application.js'
    }

    webfont {
        //defaultBundle __bundleName
        //use built-in fonts first
        //resource url: 'js/webfont.js', disposition: 'head'
    }

    ie6 {
        resource url: 'universal-ie6-css/ie6.1.0.css',
            wrapper: { s -> "<!--[if IE 6]>$s<![endif]-->" }
    }

    pagedown {
        //defaultBundle 'coding-tools'
        //defaultBundle __bundleName
       
        //css
        resource url: 'pagedown/pagedown.css'
        
        //js
        resource url: 'pagedown/Markdown.Converter.js'
        resource url: 'pagedown/Markdown.Sanitizer.js'
        resource url: 'pagedown/Markdown.Editor.js'
    }

    codemirror {
        //defaultBundle 'coding-tools'
        //defaultBundle __bundleName
        
        //css
        resource url: 'codemirror/lib/codemirror.css'
        resource url: 'stylesheets/codemirror.css'
        //js
        resource url: 'codemirror/lib/codemirror.js'
        resource url: 'codemirror/mode/clike/clike.js'
        resource url: 'codemirror/mode/scheme/scheme.js'
        resource url: 'codemirror/mode/xml/xml.js'
        resource url: 'codemirror/mode/css/css.js'
        resource url: 'codemirror/mode/javascript/javascript.js'
        resource url: 'codemirror/mode/htmlmixed/htmlmixed.js'
        resource url: 'codemirror/addon/runmode/runmode.js'
        //resource url: 'codemirror/addon/fold/collapserange.js'
        resource url: 'codemirror/addon/fold/foldcode.js'
    }

    fancybox {
        dependsOn 'jquery'
        //defaultBundle __bundleName

        resource url: 'fancybox/source/jquery.fancybox.pack.js'
        resource url: 'fancybox/source/jquery.fancybox.css'
    }

    highlightjs {
        //defaultBundle 'coding-tools'
        //defaultBundle __bundleName

        resource url: 'highlightjs/styles/vs.css'
        resource url: 'highlightjs/highlight.pack.js', disposition: 'head'
    }
    
    // Java deployment script from oracle
    deployJava {
        resource url: 'js/deployJava.js'
    }
}
