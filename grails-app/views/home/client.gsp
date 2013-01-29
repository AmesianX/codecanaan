<html>
<head>
<title>Client</title>
<meta name="layout" content="bootstrap"/>
<script src="http://www.java.com/js/deployJava.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <ul class="nav nav-pills nav-stacked" style="font-size:11pt">
                <li class="disabled"><a href="#">客戶端工具</a></li>
                <li>
                    <g:link action="client">
                        <i class="icon icon-chevron-right"></i>
                        執行
                    </g:link>
                </li>
                <li>
                    <g:link action="client" params="[section: 'compatible']">
                        <i class="icon icon-chevron-right"></i>
                        相容性檢查
                    </g:link>
                </li>
                <li>
                    <g:link action="client" params="[section: 'versions']">
                        <i class="icon icon-chevron-right"></i>
                        軟體版本
                    </g:link>
                </li>
            </ul>
        </div>
        <div class="span9 clearlook-wrapper padding-around justfont">
            <g:render template="${section}" />
        </div>
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
