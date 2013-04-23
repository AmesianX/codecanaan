/**
 * CodeCanaan Client Tools 客戶端工具
 * 服務啟動程式（Launcher）
 */

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

/*
System.getenv().each {
k,v->
println "${k} = ${v}"
}
*/

println "-----=[ System Properties ]=-----"
System.properties.each {
    k, v->
    println "${k} = ${v}"
}

def osname = System.properties['os.name']
def isWindows = osname.toLowerCase().startsWith('windows')
def isMac = osname.toLowerCase().startsWith('mac')
def isLinux = osname.toLowerCase().startsWith('linux')

def clientMode = System.properties['core.client.mode']
def examUrl = System.properties['core.exam.url']

def env = [:]   //Map
def envp = []   //List

if (isWindows) {

    //read environment variables (for windows special processing)
    System.getenv().each {
        k,v->
        //Special letter case detection
        if (['PATH', 'JAVA_HOME', 'CLASSPATH'].contains(k.toUpperCase())) {
            k = k.toUpperCase()
        }
        
        env[k] = v
    }

    //auto-detect path
    def proc = "cmd /C javac -version".execute()
    
    proc.waitForOrKill(10*1000)
    
    if (proc.exitValue() != 0) {
        //missing javac
        def pf = new File(System.getenv('ProgramFiles'))
        def jdir = new File(pf, 'Java')
        if (jdir.exists()) {
            //C:\Program Files\Java exists
            
            def java_home = System.getenv('JAVA_HOME')
            
            if (java_home && !new File(java_home).exists()) {
                java_home = null
            }
            
            //deep search
            if (!java_home) {
                jdir.eachFile() {
                    dir->
                    if (dir.exists() && dir.isDirectory()) {
                        if (dir.name.startsWith('jdk')) {
                            if (dir.name.contains('1.6')||
                                dir.name.contains('1.7')) {
                                //use this path as JAVA_HOME
                                java_home = dir.absolutePath
                            }
                        }
                    }
                }
            }
            
            if (java_home != null) {
                //set JAVA_HOME
                env['JAVA_HOME'] = "${java_home}"
                
                //set PATH
                env['PATH'] = "${java_home}\\bin;${env['PATH']}"
                
                //set CLASSPATH
                env['CLASSPATH'] = ".;${java_home}\\lib"
            }
        }
    }
    
    //MinGW path fix
    def mdir = new File("${System.getenv('SystemDrive')}\\MinGW\\bin")
    if (mdir.exists()) {
        env['PATH'] = "${mdir.absolutePath};${env['PATH']}"
    }
}
else {
    System.getenv().each { k,v-> env[k]=v }
}

env.each {
    key, value->
    envp << "${key}=${value}"
}

envp.each{println it}

class FileBinaryCategory{    
    def static leftShift(File file, URL url) {
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

//移除瀏覽器下載的 .jnlp 暫存檔案
try {
    new File(System.properties['jnlpx.origFilenameArg'])?.delete()
}
catch(e) {
    //none
}

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
    //mapper(type: 'flatten')
}

def httpOrigin = System.properties['core.http.origin']?System.properties['core.http.origin']:'*'
def clientPort = System.properties['core.client.port']?new Integer(System.properties['core.client.port']):1337


//Swing UI Look And Feel
UIManager.lookAndFeel = UIManager.systemLookAndFeelClassName
UIManager.put('swing.boldMetal', Boolean.FALSE)


/*----------- 顯示工作列圖示 ------------*/

if(SystemTray.isSupported()) {

    //讀取 Tray Icon 圖示檔
    def iconFile = new File(tempdir, 'play-icon.png').absolutePath

    if (isWindows || isLinux) {
        iconFile = new File(tempdir, 'play-icon-16.png').absolutePath
    }

    def popup = new PopupMenu()
    def trayIcon = new java.awt.TrayIcon(Toolkit.defaultToolkit.getImage(iconFile))
    def tray = SystemTray.systemTray

    // Create a popup menu components
    MenuItem aboutItem = new MenuItem('About')
    MenuItem exitItem = new MenuItem('Exit')

    //Add components to popup menu
    popup.add(aboutItem)
    popup.add(exitItem)

    trayIcon.setPopupMenu(popup)

    try {
        tray.add(trayIcon)
    } catch (Exception e) {
        println 'TrayIcon could not be added.'
        println e.message
    }

    def aboutAction = new ActionListener() {
        public void actionPerformed(ActionEvent e) {
            JOptionPane.showMessageDialog null, 'CodeCanaan Client Tools'
        }
    }

    trayIcon.addActionListener(aboutAction)
    aboutItem.addActionListener(aboutAction)

    exitItem.addActionListener(new ActionListener() {
        public void actionPerformed(ActionEvent e) {
            tray.remove(trayIcon)
            System.exit(0)
        }
    })
}

/*---------- 關閉已執行服務 -----------*/

//shutdown previous server
try {
    new URL("http://localhost:${clientPort}/?action=shutdown").text
}
catch (e) {
	println e.message
}


/*--------------------=[ 測驗模式 ]=--------------------------*/

def quickCmd = {
    cmd ->
    try {
        if (isWindows) {
            cmd = "cmd /C ${cmd}"
        }
        def proc = cmd.execute(envp, null)
        proc.waitForOrKill(10*1000)
        return proc.exitValue()
    }
    catch (e) {
        println "Error: ${e.message}"
    }
    return -1
}

if (isWindows && clientMode=='exam') {
    // 關閉非必要系統服務
    quickCmd("taskkill /f /im explorer.exe")

    // 關閉其他應用程式
    quickCmd("taskkill /f /im iexplore.exe")
    quickCmd("taskkill /f /im chrome.exe")
    quickCmd("taskkill /f /im firefox.exe")
    quickCmd("taskkill /f /im msnmsgr.exe")
    quickCmd("taskkill /f /im notepad.exe")
    quickCmd("taskkill /f /im WINWORD.EXE")
    quickCmd("taskkill /f /im Skype.exe")
    quickCmd("taskkill /f /im wordpad.exe")
    quickCmd("taskkill /f /im taskmgr.exe")
    quickCmd("taskkill /f /im YahooMessenger.exe")
    quickCmd("taskkill /f /im DrScheme.exe")

    // 移除非系統磁碟機
    quickCmd("mountvol D: /d")

    // 重新啟動瀏覽器
    def pathToPF = System.getenv('ProgramFiles')

    quickCmd("\"${pathToPF}\\Google\\Chrome\\Application\\chrome.exe\" ${examUrl} --kiosk --incognito --disable-plugins --user-agent=CodeCanaan --no-default-browser-check")
}

/*--------- 主動通知使用者 ------------*/

//彈出訊息
Thread.start {
    JOptionPane.showMessageDialog(null, "<html>客戶端工具已執行！<br/>Client Tools executed.")
}

/*---------- 軟體版本檢查 -------------*/

def versionCheck = {
    cmd ->
    try {
    
        if (isWindows) {
            cmd = "cmd /C ${cmd}"
        }
        
        def proc = cmd.execute(envp, null)
        proc.waitForOrKill(10*1000)
        
        def output = "";

        if (isWindows) {
            output = "${proc.in.getText('MS950')}\n${proc.err.getText('MS950')}".trim()
        }
        else {
            output = "${proc.in.text}\n${proc.err.text}".trim()
        }
        
        return [
            exitValue: proc.exitValue(),
            stdout: output
        ]
    }
    catch (e) {
        return [
            exitValue: -1,
            stdout: e.message
        ]
    }
}

def counter = 0

SimpleGroovyServlet.run(clientPort) { ->
    response.addHeader('Access-Control-Allow-Origin', httpOrigin)
    response.contentType = 'application/json'
    
    def json = new JsonBuilder()

    def action = params['action']

    if (!action) return

    if (action == 'shutdown') {
        System.exit(0)
        return
    }
    
    if (action == 'versions') {
        json.result {
            status 'success'
            message ''
            os (name: System.properties['os.name'], version: System.properties['os.version'])
            versions (
                java:   versionCheck('java -version'),
                javac:  versionCheck('javac -version'),
                gcc:    versionCheck('gcc --version'),
                'g++':  versionCheck('g++ --version'),
                ruby:   versionCheck('ruby --version'),
                python: versionCheck('python --version'),
                groovy: versionCheck('groovy --version')
            )
        }
        println json.toString()
        return
    }

    def sourcePath = params['sourcePath']
    def sourceCode = params['sourceCode']
    def sourceType = params['sourceType']
    
    //Current Working Directory
    def cwd = new File(tempdir, "tmp${counter++}")
    cwd.mkdir()

    def sourceFile = new File(cwd, sourcePath)
    sourceFile.write(sourceCode, 'UTF-8')

    def logInfo = new StringBuffer()
    def logError = new StringBuffer()
    def stdout = new StringBuffer()
    def dump = new StringBuffer()

    //get class name for Java files
    def sourceBase = sourcePath.split('\\.')[0]

    def envp2 = []
    
    envp2 << "CC_CLIENT_CWD=${cwd.absolutePath}"
    envp2 << "CC_CLIENT_FILE=${sourcePath}"
    envp2 << "CC_CLIENT_FILEBASE=${sourceBase}"
    
    //copy envp2 to envp
    envp2.each { envp << it }

    //type of build scripts
    def type = sourceType.toLowerCase()

    try {
        if (isWindows) {
            /* Windows */
            def proc = [
                'cmd', '/C',
                'start',
                "..\\windows\\${type}\\build.bat"
            ].execute(envp, cwd)
        }
        else if (isMac) {
            /* Mac OS X */
            def cmdbuff = new StringBuffer();
            
            cmdbuff << "cd ${cwd.absolutePath};"
            envp2.each { cmdbuff << "export ${it};" }
            cmdbuff << "sh ../mac/${type}/build.sh;"
            cmdbuff << "exit"
            
            def proc = [
                'osascript',
                '../terminal.scpt',
                cmdbuff.toString()
            ].execute(envp, cwd)
        }
        else if (isLinux) {
            /* Linux */
            def proc = [
                'gnome-terminal',
                '-t', 'CodeCanaan',
                '-x', 'sh', "../linux/${type}/build.sh"
            ].execute(envp, cwd)
        }

        //等待程式執行完成的訊號
        while (!new File(cwd, '.complete').exists()) {
            sleep(500)
        }
        
        def dumpfile = new File(cwd, '.stdout')
        
        if (isWindows) {
            //Windows Using MS950 Encoding for Text Files
            dump << dumpfile.getText('MS950')
        }
        else {
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

