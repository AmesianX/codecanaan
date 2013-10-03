<section id="versions">
    <div class="page-header">
        <h3>軟體版本</h3>
    </div>
    <div>
        客戶端工具狀態：<span id="client-status"></span><br/>
        作業系統：<span id="os-status"></span>
    </div>
    <div id="client-versions"></div>
</section>

<r:script>
(function() {

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
                        $('#os-status').text(data.result.os.name + '/' + data.result.os.version);
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