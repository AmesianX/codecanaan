import org.mortbay.jetty.Server
import org.mortbay.jetty.servlet.*
import groovy.servlet.*
import javax.servlet.http.*
import javax.servlet.ServletConfig
import groovy.json.*

import groovy.swing.SwingBuilder
import javax.swing.*
import java.awt.*

class FileBinaryCategory{    
    def static leftShift(File file, URL url){    
       url.withInputStream {is->
            file.withOutputStream {os->
                def bs = new BufferedOutputStream( os )
                bs << is                    
            }
        } 
    }    
}

class SimpleGroovyServlet extends HttpServlet {
    def requestHandler
    def context
    void init(ServletConfig config) {
        super.init(config)
        context = config.servletContext
    }
    void service(HttpServletRequest request, HttpServletResponse response) {
        requestHandler.binding = new ServletBinding(request, response, context)
        use (ServletCategory) {
            requestHandler.call()
        }
    }
    static void run(int port, Closure requestHandler) {
        def servlet = new SimpleGroovyServlet(requestHandler: requestHandler)
        def jetty = new Server(port)
        def context = new Context(jetty, '/', Context.SESSIONS)
        context.addServlet(new ServletHolder(servlet), '/*')
        jetty.start()
    }
}

//download toolkits.zip
def toolkitsUrl = System.properties['codecanaan.toolkits.url'].toURL()

//create temp dir
def tempfile = File.createTempFile('temp', '.dump')
def tempdir = new File(tempfile.parentFile, tempfile.name.split('\\.')[0])
tempdir.mkdir()

def toolkits = new File(tempdir, 'toolkits.zip')
use (FileBinaryCategory) {
    toolkits << toolkitsUrl
}

//unzip toolkits
def ant = new AntBuilder();
ant.unzip(src: toolkits, dest: tempdir, overwrite: 'true') {
    mapper(type: 'flatten')
}

def httpOrigin = System.properties['http.origin']?System.properties['http.origin']:'*'
def jettyPort = System.properties['jetty.port']?new Integer(System.properties['jetty.port']):1337

def swing = new SwingBuilder()
swing.edt {
    frame(title: 'CodeCanaan', defaultCloseOperation:JFrame.EXIT_ON_CLOSE, size: [320, 240], pack: false, show: true) {
        lookAndFeel("system")
        borderLayout()
        label("練習過程請勿關閉 port: ${jettyPort}", constraints: BorderLayout.NORTH)
        button(
            text: '結束',
            actionPerformed: {
                System.exit(0)
            },
            constraints: BorderLayout.SOUTH
        )
    }
}

def counter = 0

SimpleGroovyServlet.run(jettyPort) { ->
    response.addHeader('Access-Control-Allow-Origin', httpOrigin)
    response.contentType = 'application/json'

    def action = params['action']

    if (!action) return

    def sourcePath = params['sourcePath']
    def sourceCode = params['sourceCode']

    //Current Working Directory
    def cwd = new File(tempdir, "${counter++}")
    cwd.mkdir()

    def sourceFile = new File(cwd, sourcePath)
    sourceFile.write(sourceCode, 'UTF-8')

    def logInfo = new StringBuffer()
    def logError = new StringBuffer()
    def stdout = new StringBuffer()
    def dump = new StringBuffer()

    //get class name for Java files
    def sourceBase = sourcePath.name.split('\\.')[0]

    try {
        def batchFile = new File(cwd, 'execute.bat')
        batchFile << """@echo off
REM java -version
javac -encoding utf-8 ${sourcePath} && ..\\execdump.exe stdout.dump "java ${sourceBase}"
pause
exit
"""
        def proc = ['cmd', '/C', 'start', '/WAIT', batchFile.absolutePath].execute(null, cwd)
        proc.waitFor()
        stdout << proc.in.text

        def dumpfile = new File(cwd, 'stdout.dump')
        dump << dumpfile.getText('MS950')
    }
    catch (ex) {
        logError << ex.message
    }

    def json = new JsonBuilder()
    json.result {
        status 'success'
        data (info: logInfo.toString(), error: logError.toString(), stdout: stdout.toString(), dump: dump.toString())
    }
    println json.toString()
}

