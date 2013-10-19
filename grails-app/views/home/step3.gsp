<html>
<head>
    <title>啟動客戶端工具</title>
    <meta name="layout" content="baseadmin" />
    <meta name="display.subnavbar" content="disable" />
    <meta name="display.footer" content="disable" />
    <r:require modules="baseadmin-faq" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">

                <div class="widget stacked ">
                    <div class="widget-header">
                        <i class="icon-cog"></i>
                        <h3>啟動客戶端工具</h3>
                    </div> <!-- /.widget-header -->
                    <div class="widget-content">

                        <div class="row">

                            <div class="col-md-4">
                                <r:img dir="images" file="deco-001.png" />
                            </div> <!-- /.col-md-4 -->

                            <div class="col-md-8">

                                <div class="x-client-executed" style="display:none">
                                    <div class="page-header">
                                        <h3>
                                            <i class="icon icon-ok icon-green"></i>&nbsp;
                                            已經執行客戶端工具
                                        </h3>
                                    </div>
                                </div>
                                
                                <div class="x-client-not-executed" style="display:none">
                                    <div class="page-header">
                                        <h3>
                                            <i class="icon icon-warning-sign icon-gray"></i>&nbsp;
                                            請執行客戶端工具
                                        </h3>
                                    </div>
                                </div>

                                <p>軟體壹學院需要在您的電腦上執行「客戶端工具」程式，此程式用於幫助您建立整合開發環境（IDE），以支援程式碼的自動化編譯與測試。當您不需要使用「客戶端工具」時，可以隨時將它關閉。</p>

                                <p>執行「客戶端工具」的方法有下列兩種：</p>

                                <ol>
                                    <li>Java Web Start（推薦）</li>
                                    <li>下載應用程式的壓縮檔</li>
                                </ol>

                                <p>建議您先嘗試使用 Java Web Start 啟動方式。</p>

                            </div> <!-- /.col-md-8 -->

                        </div>

                        <div class="padding-around text-center">
                            <g:link action="step4" class="btn btn-lg btn-primary">
                                下一個步驟
                            </g:link>

                            <br/>
                            <br/>
                            <g:link action="step2">
                                <i class="icon icon-caret-left"></i>&nbsp;
                                返回上一個步驟
                            </g:link>
                        </div>
            
                    </div> <!-- /.widget-content -->

                </div> <!-- /.widget -->
                        
            </div> <!-- /.col -->

            <div class="col-md-3">

                <div class="well">
                    <h4>
                        <i class="icon icon-lightbulb"></i>&nbsp;
                        Extra Info
                    </h4>
                    <p>每次進行題庫練習前，請記得先啟動客戶端工具。</p>
                </div>
            </div> <!-- /.col -->

        </div> <!-- /.row -->

        <div class="row">
            <div class="col-md-5">
                <div class="widget stacked ">
                    <div class="widget-header">
                        <i class="icon-cloud"></i>
                        <h3>方法一、以 Java Web Start 方式啟動</h3>
                    </div> <!-- /.widget-header -->
                    <div class="widget-content">

                        <!--WebStart啟動按鈕-->
                        <p>請點下方「<i class="icon icon-play"></i>」圖示的按鈕。</p>
                        
                        <span class="effect-round-corner margin-below" style="background:#dadada;padding:10px;display:inline-block">
                            <g:link controller="webstart" action="launcher" class="btn btn-success btn-large">
                                <i class="icon icon-play"></i>
                                啟動客戶端工具
                            </g:link>
                        </span>
                        
                        <p>瀏覽器會下載一個命名「webstart.jnlp」的檔案，如果它沒有被自動開啟，請手動點選檔案執行。</p>
                        
                        <p>瀏覽器出現「這種類型的檔案可能會損害您的電腦，您要保留 webstart.jnlp 這個檔案嗎？」請選擇「保留」。</p>
                        
                        <p>建議您設定「永遠開啟這類檔案」，以方便日後執行客戶端工具。</p>
                        
                    </div> <!-- /.widget-content -->
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-4">

                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-download-alt"></i>
                        <h3>方法二、下載應用程式壓縮檔</h3>
                    </div> <!-- /.widget-header -->
                    <div class="widget-content">

                        <p>如果 Java Web Start 無法執行，請使用應用程式壓縮檔。</p>

                        <p>請下載壓縮檔：<a href="http://assets.codecanaan.com/standalone/ClientTools.zip" target="_blank">ClientTools.zip</a></p>
                        
                        <ul class="icons-ul">
                            <li>
                                <i class="icon-li icon-windows"></i>
                                適用於 Windows XP / 7 作業系統（包含 32 及 64 位元）
                            </li>
                            <li>
                                <i class="icon-li icon-apple"></i>
                                適用於 Mac OS X 作業系統（包含 32 及 64 位元）
                            </li>
                            <li>
                                <i class="icon-li icon-linux"></i>
                                適用於 Linux 作業系統（包含 32 及 64 位元）
                            </li>
                        </ul>

                        <p>執行方法：請將下載的檔案解壓縮到桌面，再開啟位於「bin」資料夾下的「ClientTool」程式執行檔。</p>
                        
                        <p>檔案已通過防毒軟體檢測。</p>
            
                    </div> <!-- /.widget-content -->
                </div> <!-- /.widget -->

            </div> <!-- /.col -->

        </div> <!-- /.row -->

        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked ">
                    <div class="widget-header">
                        <i class="icon-question-sign"></i>
                        <h3>常見問題說明</h3>
                    </div> <!-- /.widget-header -->
                    <div class="widget-content">

                        <ul class="faq-list">
                            <li>
                                <h4>如何確認客戶端工具已執行成功？</h4>

                                <p>如果您看到畫面顯示如下圖「客戶端工具已執行」的訊息，就表示您的客戶端工具已經執行成功。</p>

                                <p><g:img dir="images/help" file="clienttools-msg.png" /></p>
                            </li>
                            <li>
                                <h4>如何關閉客戶端工具？</h4>

                                <p>在系統常駐程式區（Windows 的右下方），找到客戶端工具的「<i class="icon icon-play"></i>」工具圖示，點擊滑鼠右鍵選擇「Exit」即可關閉客戶端工具。</p>

                                <p><g:img dir="images/help" file="clienttools-tray.png" /></p>
                            </li>
                            <li>
                                <h4>關於出現「安全警告」的處理</h4>

                                <p>客戶端工具需要您的允許，才能夠存取開發工具的編譯指令，因此請設定「我接受風險且欲執行此應用程式」，建議您也將「一律信任此發行者的內容」打勾，避免每次執行都出現警告。</p>
                        
                                <p><g:img dir="images/help" file="clienttools-ask.png" /></p>
                            </li>
                            <li>
                                <h4>關於出現「Windows 安全性警示」的處理</h4>
                                
                                <p>看到這個訊息表示您已開啟「Windows 防火牆」設定，請選擇「解除封鎖」，因為客戶端工具需要連線到網際網路，才能為您下載教材所需的資料。</p>
                                
                                <p><g:img dir="images/help" file="firewall-ask-xp.png" /></p>
                            </li>
                            <li>
                                <h4>無法正常使用客戶端工具？</h4>

                                <p>請先<g:link action="step2">檢查 Java 軟體</g:link>是否已安裝。</p>

                                <p>建議您使用 Google Chrome 瀏覽器。。</p>
                        
                                <p>暫時關閉防火牆與防毒軟體。</p>

                                <p>暫時關閉瀏覽器的 Proxy 設定。</p>

                                <p>安裝軟體或修改設定後，請先關閉瀏覽器，再重新執行一次</p>
                                
                            </li>
                        </ul>

                    </div> <!-- /.widget-content -->
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

<r:script>
(function() {

    // Show FAQ
    $('.faq-list').goFaq();

    // Ping ClientTools
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
                    $('.x-client-executed').show();
                    $('.x-client-not-executed').hide();
                }
            },
            error: function(data) {
                $('.x-client-not-executed').show();
                setTimeout(pingClient, 5000);
            }
        });
    };
    pingClient();
})();
</r:script>

</body>
</html>