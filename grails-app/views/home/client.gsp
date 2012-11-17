<html>
<head>
<title>Client</title>
<meta name="layout" content="bootstrap"/>
<script src="http://www.java.com/js/deployJava.js"></script>
</head>
<body>
<div class="row">
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li class="disabled"><a href="#">客戶端工具</a></li>
            <li><a href="#client"><i class="icon icon-chevron-right"></i> 執行</a></li>
            <li><a href="#compatible"><i class="icon icon-chevron-right"></i> 相容性檢查</a></li>
            <li><a href="#versions"><i class="icon icon-chevron-right"></i> 軟體版本</a></li>
        </ul>
    </div>
    <div class="span9">
        
        <section id="client">
            <div class="page-header">
                <h1>執行</h1>
            </div>
            <div>
                <g:img dir="images" file="cloud_computing.png" style="padding:10px" />

                <!--WebStart啟動按鈕-->
                <g:link controller="home" action="webstart" class="btn btn-primary">
                    <i class="icon icon-download-alt"></i>
                    啟動客戶端工具
                </g:link>

                <div class="alert" style="margin-top:1em">提示！最新版本執行後<strong style="color:red">不會顯示視窗畫面</strong>，關閉客戶端工具請在工作列點選「<i class="icon icon-play"></i>」圖示，選擇選單的「Exit」以結束工具。</div>
            </div>
        </section>

        <section id="compatible">
            <div class="page-header">
                <h1>相容性檢查</h1>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th width="180">軟體名稱</th>
                        <th>建議版本</th>
                        <th>目前版本</th>
                        <th width="250">說明</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>瀏覽器（Browser）</td>
                        <td>Google Chrome</td>
                        <td>
                            <browser:choice>
                                <browser:isIE6>Upgrade to IE 8+</browser:isIE6>
                                <browser:isIE7>Upgrade to IE 8+</browser:isIE7>
                                <browser:isiPhone>Mobile</browser:isiPhone>
                                <browser:isiPad>Mobile</browser:isiPad>
                                <browser:otherwise>Supported</browser:otherwise>
                            </browser:choice>
                        </td>
                        <td>安裝 <a href="http://www.google.com/chrome" target="_blank">Chrome</a> 瀏覽器</td>
                    </tr>
                    <tr>
                        <td>User-Agent</td>
                        <td colspan="3"><small>${request.getHeader("User-Agent")}</small></td>
                    </tr>
                    <tr>
                        <td>Java Runtime</td>
                        <td>1.6 或 1.7</td>
                        <td><span id="jre-version"></span></td>
                        <td><a href="#" onclick="deployJava.installLatestJRE()">Install Java</a> 下載並安裝 <a href="http://www.java.com/" target="_blank">Java</a> 軟體</td>
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
        </section>

        <section id="versions">
            <div class="page-header">
                <h1>軟體版本</h1>
            </div>
            <div>
                客戶端工具狀態：<span id="client-status"></span><br/>
                作業系統：<span id="os-name"></span> / <span id="os-version"></span>
            </div>
            <div id="client-versions"></div>
        </section>
    </div>
</div>
<r:script>
(function() {

    $('#jre-version').html(deployJava.versionCheck('1.6+')?'<font color="green">Installed</a>':'<font color="red">Missing</font>'+'<br/><strong>'+deployJava.getJREs()+'</strong>');
    $('#jws-version').html(deployJava.isWebStartInstalled('1.6')?'<font color="green">Installed</a>':'<font color="red">Missing</font>');

    var pingClient = function() {
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

                    if (data.result.os) {
                        $('#os-name').text(data.result.os.name);
                        $('#os-version').text(data.result.os.version);
                    }

                    var versions = data.result.versions;
                    
                    for (var key in versions) {
                        if (versions.hasOwnProperty(key)) {
                            $('#client-versions').append((versions[key].exitValue==0?'<font color="green" class="pull-right">Installed</font>':'<font color="red" class="pull-right">Missing</font>')+'<h3>'+key+'</h3>'+'<pre>'+versions[key].stdout+'</pre>');
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

                setTimeout(pingClient, 3000);
            }
        });
    };

    pingClient();
})();
</r:script>
</body>
</html>