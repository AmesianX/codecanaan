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

def osname = System.properties['os.name']
def isWindows = osname.toLowerCase().startsWith('windows')
def isMac = osname.toLowerCase().startsWith('mac')
def isLinux = osname.toLowerCase().startsWith('linux')

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
    
    def json = new JsonBuilder()

    def action = params['action']

    if (!action) return
    
    if (action == 'versions') {
    
        def java_proc = "java -version".execute()
        java_proc.waitForOrKill(10*1000)
        
        def javac_proc = "javac -version".execute()
        javac_proc.waitForOrKill(10*1000)
        
        def gcc_proc = "gcc --version".execute()
        gcc_proc.waitForOrKill(10*1000)
        
        def ruby_proc = "ruby --version".execute()
        ruby_proc.waitForOrKill(10*1000)
        
        def python_proc = "python --version".execute()
        python_proc.waitForOrKill(10*1000)
        
        json.result {
            status 'success'
            versions (
                java: [exitValue: java_proc.exitValue(), stdout: "${java_proc.in.text}\n${java_proc.err.text}"],
                javac: [exitValue: javac_proc.exitValue(), stdout: "${javac_proc.in.text}\n${javac_proc.err.text}"],
                gcc: [exitValue: gcc_proc.exitValue(), stdout: "${gcc_proc.in.text}\n${gcc_proc.err.text}"],
                ruby: [exitValue: ruby_proc.exitValue(), stdout: "${ruby_proc.in.text}\n${ruby_proc.err.text}"],
                python: [exitValue: python_proc.exitValue(), stdout: "${python_proc.in.text}\n${python_proc.err.text}"]
            )
        }
        println json.toString()
    
        return
    }

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
    def sourceBase = sourcePath.split('\\.')[0]

    try {
        if (isWindows) {
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
        else if (isMac) {
        /*
   tell application "Terminal"
       tell window 1
           set title displays custom title to true
           set title displays device name to false
           set title displays shell path to false
           set title displays file name to false
           set custom title to "script"
       end tell
   end tell
        */
            def batchFile = new File(cwd, 'execute.scpt')
            batchFile << """tell app "Terminal"
    activate
    do script with command "javac -encoding utf-8 ${sourcePath} && java ${sourceBase}"
end tell
return
"""
            def proc = ['osascript', 'execute.scpt'].execute(null, cwd)
            proc.waitFor()
            stdout << proc.in.text

            dump << stdout
        }
    }
    catch (ex) {
        logError << ex.message
    }

    json.result {
        status 'success'
        data (info: logInfo.toString(), error: logError.toString(), stdout: stdout.toString(), dump: dump.toString())
    }
    println json.toString()
}

