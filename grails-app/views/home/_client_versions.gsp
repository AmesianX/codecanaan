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
                    
                    $('#client-status').html('<span class="text-success">已啟動</span>');

                    if (data.result.os) {
                        $('#os-status').text(data.result.os.name + '/' + data.result.os.version);
                    }

                    var versions = data.result.versions;
                    
                    for (var key in versions) {
                        if (versions.hasOwnProperty(key)) {
                            $('#client-versions').append((versions[key].exitValue==0?'<span class="text-success" class="pull-right">Installed</span>':'<span class="text-danger" class="pull-right">Missing</span>')+'<h3>'+key+'</h3>'+'<pre>'+versions[key].stdout+'</pre>');
                        }
                    }
                    
                    
                    if (versions.java && versions.java.exitValue==0 && versions.javac && versions.javac.exitValue==0) {
                        $('#jdk-version').html('<span class="text-success">Installed</span>');
                    }
                    else {
                        $('#jdk-version').html('<span class="text-danger">Missing</span>');
                    }
                }
                else {
                    $('#client-status').html('<span class="text-danger">發生錯誤</span>');
                }
            },
            error: function(data) {
                $('#client-status').html('<span class="text-danger">未啟動</span>');

                setTimeout(pingClient, 3000);
            }
        });
    };

    pingClient();
})();
</r:script>