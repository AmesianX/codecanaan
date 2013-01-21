// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// Secure Passwords in private config file
grails.config.locations = [
    //"file:${userHome}/.grails/${appName}-config.properties",
    "file:${userHome}/.grails/${appName}-config.groovy"
]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.app.context = '/'

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml'],
    woff:          'font/x-woff',
    ttf:           'font/ttf',
    eot:           'font/eot',
    otf:           'font/opentype'
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*', '*.js', '*.css', '*.zip']

// Perhaps some reason we want to prevent bundling on CSS files: for "less"
grails.resources.bundle.excludes = ['**/*.less']


//grails.resources.mappers.cached.excludes = ['**/*']
//grails.resources.mappers.googleclosurecompiler.excludes = ['**/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
        grails.serverURL = "http://dev.codecanaan.com:8080"
        
        //disable resource path hash ?_debugResources=y
        grails.resource.debug = true
        grails.resources.mapper.hashandcache.excludes = ['**/*']
		
		// Don't enable CDN for development
		grails.resources.mappers.baseurl.enabled = false

		// Don't enable cached-resources
		//grails.resources.mappers.
		//grails.resources.mapper.hashandcache.excludes = ['**/*']
		grails.resources.mapper.cached.excludes = ['**/*']

		//grails.resources.debug = true 
    }
    test {
        // dirty fix "Cannot create a bundle from resource" warning
        grails.resources.mappers.bundle.excludes = ['**/*'] 
    }
    production {
    
        grails.logging.jul.usebridge = false
        grails.serverURL = "http://codecanaan.com"
        //grails.serverURL = "http://dev.codecanaan.com:8080"

		// Using baseurl feature to enable CDN deployment
		grails.resources.mappers.baseurl.enabled = true
		grails.resources.mappers.baseurl.default = "http://static.codecanaan.com/static"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    appenders {
        console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    }

    info "grails.app"

    debug 'codecanaan'
    
    //SpringSecurity Facebook
    debug   'com.the6hours', 'grails.app.taglib.com.the6hours'
    
    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// LessCSS Compiller
//grails.lesscss.resources.compress = true

//The default level is SIMPLE_OPTIMIZATIONS, options ADVANCED_OPTIMIZATIONS
grails.resources.mappers.googleclosurecompiler.compilation_level='SIMPLE_OPTIMIZATIONS'
//grails.resources.mappers.googleclosurecompiler.compilation_level='ADVANCED_OPTIMIZATIONS'
//grails.resources.mappers.googleclosurecompiler.compilerOptions = [
//    languageIn: CompilerOptions.LanguageMode.ECMASCRIPT5
//]

//grails.cached.resources.flatten = false
//grails.cached.resources.shortlinks = false
//grails.cached.resources.shorten = true

// Twitter Bootstrap
grails.plugins.twitterbootstrap.fixtaglib = true
//grails.plugins.twitterbootstrap.defaultBundle = 'bootstrap'
// Bundle all resources to codecanaan
grails.plugins.twitterbootstrap.defaultBundle = 'codecanaan'

// JustFont
grails.justfont.appId = '04a33145MnLiu8AI4KNCkfQQX18d_e3RX0f8GVpfG1diW5LYhaoiIuChsq61MXXmmv1-DTv5O0x8Q-M6wDVACDJxtEeI-_zEH2erPVBnvn_O0rNYUxTAysJ7bMYsPVRNRtxxKcR7LU_kpdARwG4Q_xXHkyzrSTEhAPHewUyTug7fj48gBxY='

// Analytics
grails.analytics.account = 'UA-298440-14'
grails.analytics.domainName = 'codecanaan.com'

// Avatar
avatarPlugin {
    //defaultGravatarUrl="""http://yourdomain.com/images/default-gravatar-80.png"""
    gravatarRating="G"
}

//--------------- SpringSecurity ------------------------

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'codecanaan.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'codecanaan.UserRole'
grails.plugins.springsecurity.authority.className = 'codecanaan.Role'

grails.plugins.springsecurity.useSwitchUserFilter = true
grails.plugins.springsecurity.controllerAnnotations.staticRules = [
   '/j_spring_security_switch_user': ['ROLE_ADMIN']
]

//RememberMe Filters
/*
grails.plugins.springsecurity.rememberMe.cookieName='xyz_remember_me'
grails.plugins.springsecurity.rememberMe.alwaysRemember=false
grails.plugins.springsecurity.rememberMe.tokenValiditySeconds=31*24*60*60
grails.plugins.springsecurity.rememberMe.parameter='_spring_security_remember_me'
grails.plugins.springsecurity.rememberMe.key='xyzApp'
grails.plugins.springsecurity.rememberMe.useSecureCookie=false
grails.plugins.springsecurity.rememberMe.persistent=false
*/
grails.plugins.springsecurity.rememberMe.alwaysRemember = true
grails.plugins.springsecurity.rememberMe.persistent = true
grails.plugins.springsecurity.rememberMe.persistentToken.domainClassName = 'codecanaan.PersistentLogin'

//SpringSecurity Facebook
grails.plugins.springsecurity.facebook.permissions='email,user_about_me'
grails.plugins.springsecurity.facebook.filter.type='redirect'
grails.plugins.springsecurity.facebook.domain.classname='codecanaan.FacebookUser'
grails.plugins.springsecurity.facebook.appId='--appid--'
grails.plugins.springsecurity.facebook.secret='--secret--'

aws {
    domain="s3.amazonaws.com"
    accessKey="-accessKey-"
    secretKey="-secretKey-"
    bucketName="-bucketName-"
}

google {
    adsense.adClient = 'ca-pub-0839975967683137'
}

