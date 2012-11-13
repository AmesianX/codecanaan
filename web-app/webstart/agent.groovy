import org.mortbay.jetty.Server
import org.mortbay.jetty.servlet.*
import groovy.servlet.*
import javax.servlet.http.*
import javax.servlet.ServletConfig
import groovy.json.*

//import groovy.swing.SwingBuilder
import javax.swing.*
import java.awt.*
import java.awt.event.*

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

//delete the .jnlp file
try {
    new File(System.properties['jnlpx.origFilenameArg'])?.delete()
}
catch(e) {
    //none
}

def osname = System.properties['os.name']
def isWindows = osname.toLowerCase().startsWith('windows')
def isMac = osname.toLowerCase().startsWith('mac')
def isLinux = osname.toLowerCase().startsWith('linux')

//download toolkits.zip
def toolkitsUrl = System.properties['core.toolkits.url'].toURL()

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

def httpOrigin = System.properties['core.http.origin']?System.properties['core.http.origin']:'*'
def clientPort = System.properties['core.client.port']?new Integer(System.properties['core.client.port']):1337

/*def swing = new SwingBuilder()
swing.edt {
    frame(title: 'CodeCanaan', defaultCloseOperation:JFrame.EXIT_ON_CLOSE, size: [320, 240], pack: false, show: true) {
        lookAndFeel("system")
        borderLayout()
        label("練習過程請勿關閉 port: ${clientPort}", constraints: BorderLayout.NORTH)
        button(
            text: '結束',
            actionPerformed: {
                System.exit(0)
            },
            constraints: BorderLayout.SOUTH
        )
    }
}*/

UIManager.lookAndFeel = UIManager.systemLookAndFeelClassName
UIManager.put('swing.boldMetal', Boolean.FALSE)

//工作列圖示
def iconFile = new File(tempdir, 'play-icon.png').absolutePath

//if (!SystemTray.isSupported()) {

def popup = new PopupMenu()
def trayIcon = new java.awt.TrayIcon(Toolkit.defaultToolkit.getImage(iconFile))
def tray = SystemTray.systemTray

// Create a popup menu components
MenuItem aboutItem = new MenuItem('About')
Menu displayMenu = new Menu('Display')
MenuItem portItem = new MenuItem('Port')
MenuItem exitItem = new MenuItem('Exit')

//Add components to popup menu
popup.add(aboutItem)
popup.addSeparator()
popup.add(displayMenu)
displayMenu.add(portItem)
popup.add(exitItem)

trayIcon.setPopupMenu(popup)

try {
    tray.add(trayIcon)
} catch (Exception e) {
    println('TrayIcon could not be added.')
}

def aboutAction = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
        JOptionPane.showMessageDialog null, 'CodeCanaan Client Tools'
    }
}
trayIcon.addActionListener(aboutAction)
aboutItem.addActionListener(aboutAction)

ActionListener listener = new ActionListener() {
    public void actionPerformed(ActionEvent e) {
        def item = (MenuItem)e.getSource();
        if ("Port".equals(item.label)) {
            trayIcon.displayMessage(
                'Client Port',
                "${clientPort}",
                TrayIcon.MessageType.INFO
            )            
        }
    }
};

portItem.addActionListener(listener)

exitItem.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
        tray.remove(trayIcon)
        System.exit(0)
    }
})


def counter = 0

SimpleGroovyServlet.run(clientPort) { ->
    response.addHeader('Access-Control-Allow-Origin', httpOrigin)
    response.contentType = 'application/json'
    
    def json = new JsonBuilder()

    def action = params['action']

    if (!action) return
    
    if (action == 'versions') {
        def versionCheck = {
            cmd ->
            try {
                def proc = cmd.execute()
                proc.waitForOrKill(10*1000)
                return [proc.exitValue(), "${proc.in.text}\n${proc.err.text}".trim()]
            }
            catch (e) {
                return [-1, e.message]
            }
        }

        def java_proc = versionCheck('java -version')
        def javac_proc = versionCheck('javac -version')
        def gcc_proc = versionCheck('gcc --version')
        def ruby_proc = versionCheck('ruby --version')            
        def python_proc = versionCheck('python --version')
        def groovy_proc = versionCheck('groovy --version')

        json.result {
            status 'success'
            message ''
            os (name: System.properties['os.name'], version: System.properties['os.version'])
            versions (
                java:   [exitValue: java_proc[0],   stdout: java_proc[1]],
                javac:  [exitValue: javac_proc[0],  stdout: javac_proc[1]],
                gcc:    [exitValue: gcc_proc[0],    stdout: gcc_proc[1]],
                ruby:   [exitValue: ruby_proc[0],   stdout: ruby_proc[1]],
                python: [exitValue: python_proc[0], stdout: python_proc[1]],
                groovy: [exitValue: groovy_proc[0], stdout: groovy_proc[1]]
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
    set tab1 to do script "cd '${cwd.absolutePath}' && clear && javac ${sourcePath} && script -q stdout.dump java ${sourceBase} && read -p 'Press ENTER to continue...' && exit"
    repeat until not exists tab1
    end repeat
end tell
"""
            def proc = ['osascript', 'execute.scpt'].execute(null, cwd)
            proc.waitFor()
            stdout << proc.in.text

            def dumpfile = new File(cwd, 'stdout.dump')
            dump << dumpfile.text
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

