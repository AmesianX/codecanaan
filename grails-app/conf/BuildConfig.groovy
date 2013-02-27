grails.servlet.version = "2.5" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
grails.project.war.file = "target/${appName}.war"

// Enable tomcat fork run
//grails.project.fork.run = true
// uncomment (and adjust settings) to fork the JVM to isolate classpaths
/*
grails.project.fork = [
	run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256],
	war: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256],
	console: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
]
*/

// Exclude files from a generated war
grails.war.resources = { stagingDir, args ->
    //delete (file: "${stagingDir}/WEB-INF/lib/hibernate-core-3.3.1.GA.jar")
    delete { fileset(dir: "${stagingDir}/bootswatch", includes: '*') }
    delete { fileset(dir: "${stagingDir}/swatchmaker", includes: '*') }
    delete { fileset(dir: "${stagingDir}/font-awesome", includes: '*') }
    delete { fileset(dir: "${stagingDir}/images", includes: '*.psd') }
    delete { fileset(dir: "${stagingDir}/sass", includes: '*') }
    delete { fileset(dir: "${stagingDir}/fancybox", includes: '*') }
};

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.

        runtime 'mysql:mysql-connector-java:5.1.22'

        compile 'org.springframework.social:spring-social-core:1.0.2.RELEASE'
        compile 'org.springframework.social:spring-social-facebook:1.0.2.RELEASE'

        runtime 'net.java.dev.jets3t:jets3t:0.9.0'
        
        compile 'commons-codec:commons-codec:1.7'

        test 'com.googlecode.jmockit:jmockit:1.0'
    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.9.1"
      
        // Mail Support
        compile ":mail:1.0.1"

        // Twitter Bootstrap
        runtime ":twitter-bootstrap:2.3.0"

        // HTML resource management enhancements
        // to replace g.resource etc.
        // Note: keep upgrade to latest version.
        runtime ":resources:1.2.RC3"
        //runtime ":resources:1.1.6"

        // Uncomment these (or add new ones) to enable additional resources capabilities
        //runtime ":zipped-resources:1.0-vary-header"
        runtime ":zipped-resources:1.0.1"
        runtime ":cached-resources:1.1"
        //runtime ":yui-minify-resources:0.1.4"

        //Google Closure Compiler plugin for Grails
        //This plugin compiles/optimizes your javascript resources with the Google Closure Compiler.
        //It provides three compilation levels. WHITESPACE_ONLY, SIMPLE_OPTIMIZATIONS and ADVANCED_OPTIMIZATIONS.
        compile ":closure-compiler:0.9.1"

        build ":tomcat:$grailsVersion"
        
        build ":svn:1.0.2"
        
        compile ":spring-security-facebook:0.12.2"
        
        //build ":lesscss-resources:1.3.0.3"

        //runtime ":database-migration:1.1"

        compile ':cache:1.0.1'
       
        //fix for cached-resources
        compile ":cache-headers:1.1.5"

        compile ":browser-detection:0.4.3"

		runtime ":modernizr:2.6.2"

        compile ":codenarc:0.18.1"

		// Google Chart Plugin
		// 移除原因：功能不完整且效果不佳
		//compile ":google-chart:0.5.2"
    }
}
