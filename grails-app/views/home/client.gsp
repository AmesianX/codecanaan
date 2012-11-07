<html>
<head>
<title>Client</title>
<meta name="layout" content="bootstrap"/>
<script src="http://www.java.com/js/deployJava.js"></script>
</head>
<body>
<div class="row">
    <div class="span3">
        <!--WebStart啟動按鈕-->
        <div>
            <g:link controller="home" action="webstart" class="btn btn-primary">
                <i class="icon icon-download-alt"></i>
                啟動客戶端工具
            </g:link>
        </div>
    </div>
    <div class="span9">
        <h3>相容性檢查</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>軟體名稱</th>
                    <th>建議版本</th>
                    <th>目前版本</th>
                    <th>說明</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Java Runtime</td>
                    <td>1.6 或 1.7</td>
                    <td><span id="jre-version"></span></td>
                    <td>下載並安裝 <a href="http://www.java.com/" target="_blank">Java</a> 軟體</td>
                </tr>
                <tr>
                    <td>Java Web Start</td>
                    <td>與 Java Runtime 相同</td>
                    <td><span id="jws-version"></span></td>
                    <td>請正確安裝 Java 軟體</td>
                </tr>
                <tr>
                    <td>Java 開發工具（JDK）</td>
                    <td>1.6 以上</td>
                    <td><span id="jdk-version">無法辨別</span></td>
                    <td>安裝 <a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">JDK</a> 軟體</td>
                </tr>
            </tbody>
        </table>
        
        <h3>客戶端工具</h3>
        
        狀態：<span id="client-status"></span>
        
        <div id="client-versions"></div>
    </div>
</div>
<r:script>
(function() {
    $('#jre-version').html('<strong>'+deployJava.getJREs()+'</strong>');
    $('#jws-version').html(deployJava.isWebStartInstalled('1.6')?'<font color="green">Installed</a>':'<font color="red">Missing</font>');

    $.ajax({
        type: 'post',
        url: 'http://localhost:${clientPort}/',
        data: {
            action: 'versions'
        },
        timeout: 30*1000,
        success: function(data) {
            if (data && data.result && data.result.status=='success') {
                $('#client-status').html('<font color="green">已啟動</font>');
                var versions = data.result.versions;
                
                for (var key in versions) {
                    if (versions.hasOwnProperty(key)) {
                        $('#client-versions').append((versions[key].exitValue==0?'<font color="green" class="pull-right">Installed</font>':'<font color="red" class="pull-right">Missing</font>')+'<h4>'+key+'</h4>'+'<pre>'+versions[key].stdout+'</pre>');
                    }
                }
                
                
                if (versions.java && versions.java.exitValue==0 && versions.javac && versions.javac.exitValue==0) {
                    $('#jdk-version').html('<font color="green">Installed</font>');
                }
                else {
                    $('#jdk-version').html('<font color="red">Missing</font>');
                }
            }
            else {
                $('#client-status').html('<font color="red">發生錯誤</font>');
            }
        },
        error: function(data) {
            $('#client-status').html('<font color="red">未啟動</font>');
        }
    });

})();
</r:script>
</body>
</html>
