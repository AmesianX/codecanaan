def dev = grails.util.GrailsUtil.isDevelopmentEnv()
def configTagLib = org.codehaus.groovy.grails.commons.ApplicationHolder.application.config.grails.plugins.twitterbootstrap.fixtaglib
def configDefaultBundle = org.codehaus.groovy.grails.commons.ApplicationHolder.application.config.grails.plugins.twitterbootstrap.defaultBundle
if (!configDefaultBundle && !configDefaultBundle.equals(false)) {
    configDefaultBundle = 'bundle_bootstrap'
}

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
        dependsOn 'bootstrap-custom'

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

    'bootswatch-css' {
        defaultBundle configDefaultBundle
        if (configTagLib) {
            dependsOn 'bootstrap-fixtaglib'
        }

        resource url: [dir: 'bootswatch', file: (dev ? 'united.css' : 'united.min.css')], disposition: 'head', exclude:'minify'       
    }
    
    'bootswatch-responsive-css' {
        defaultBundle configDefaultBundle
        dependsOn 'bootswatch-css'

        resource url:[plugin: 'twitter-bootstrap', dir: 'css', file: (dev ? 'bootstrap-responsive.css' : 'bootstrap-responsive.min.css')], disposition: 'head', exclude:'minify'
    }

    'bootstrap-custom' {
        dependsOn 'bootstrap-js,bootswatch-responsive-css'
    }
}