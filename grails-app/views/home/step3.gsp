<html>
<head>
<title>啟動客戶端工具</title>
<meta name="layout" content="bootstrap"/>
</head>
<body>

<!--Progress Tracker-->
<g:render template="progress" model="[step: 3]" />

<div class="clearlook-wrapper">
    <div class="padding-around textalign-center">
        <p>已經接近完成！接下來，請立即執行「客戶端工具」程式。</p>
    </div>
    
    <div class="row-fluid justfont hidden-if-clienttools-started">
        <div class="span6 padding-leftside">
        
            <h3>立即啟動客戶端工具</h3>
            
            <p>壹學院需要在您的電腦上執行「客戶端工具」程式，此程式用於幫助您建立整合開發環境（IDE），以支援程式碼的自動化編譯與測試。當您不需要使用「客戶端工具」時，可以隨時將它關閉。</p>
            
            <p><strong>關於「安全警告」</strong></p>
            
            <p>客戶端工具需要您的允許，才能夠存取開發工具的編譯指令，因此請設定「我接受風險且欲執行此應用程式」，建議您也將「一律信任此發行者的內容」打勾，避免每次執行都出現警告。</p>
            
            <p><g:img dir="images/help" file="clienttools-ask.png" /></p>

            <p><strong>關於「Windows 安全性警示」</strong></p>
            
            <p>看到這個訊息表示您已開啟「Windows 防火牆」設定，請選擇「解除封鎖」，因為客戶端工具需要連線到網際網路，才能為您下載教材所需的資料。</p>
            
            <p><g:img dir="images/help" file="firewall-ask-xp.png" /></p>
            
        </div>
        <div class="span6 padding-rightside">
        
            <h3>以 Java Web Start 方式啟動</h3>
        
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
            
            <p><strong>執行畫面</strong></p>
            
            <p>如果您看到「客戶端工具已執行」的訊息，就表示您的客戶端工具執行成功。</p>
            
            <p><g:img dir="images/help" file="clienttools-msg.png" /></p>
            
            <p><strong>如何關閉客戶端工具？</strong></p>
            
            <p>在系統常駐程式區（Windows 的右下方），找到客戶端工具的「<i class="icon icon-play"></i>」工具圖示，點擊滑鼠右鍵選擇「Exit」即可關閉客戶端工具。</p>
            
            <p><g:img dir="images/help" file="clienttools-tray.png" /></p>
            
        </div>
    </div>

    <div class="visible-if-clienttools-started hide">
        
        <!--<p class="textalign-center"><g:img dir="images/help" file="clienttools-msg.png" /></p>-->
        
        <p class="larger-font textalign-center margin-around padding-around"><i class="icon icon-ok icon-2x icon-green"></i> 客戶端工具已經啟動，您可以繼續下一個步驟！</p>
        
        <p class="textalign-center"><i class="icon icon-lightbulb"></i> 每次進行題庫練習前，請記得先啟動客戶端工具。</p>
    </div>

    <hr />
            
    <div class="padding-around textalign-center">
        <g:link action="step4" class="btn btn-large btn-primary">繼續下一個步驟 »</g:link>
    </div>
</div>

<div class="padding-around justfont remove-if-success hidden-if-clienttools-started">

    <h3>如果無法順利以 Java Web Start 方式啟動？</h3>
    
    <p>如果您已經<g:link action="step2">安裝 Java 軟體</g:link>，卻無法順利執行「webstart.jnlp」程式，建議您先嘗試這些步驟。</p>
    
    <ul>
        <li>暫時關閉防火牆與防毒軟體，再重新執行一次。</li>
        <li>暫時關閉瀏覽器的 Proxy 設定，再重新執行一次。</li>
    </ul>
    
    <p>當您仍然無法執行時，請使用我們提供的「ClientTools」手動下載版本。</p>
    
    <ul>
        <li>適用於 Windows XP / 7 作業系統（包含 32 及 64 位元） <a href="http://assets.codecanaan.com/standalone/ClientTools.zip" target="_blank">點此下載</a></li>
        <li>適用於 Mac OS X 作業系統（包含 32 及 64 位元） <a href="http://assets.codecanaan.com/standalone/ClientTools.zip" target="_blank">點此下載</a></li>
        <li>適用於 Linux 作業系統（包含 32 及 64 位元） <a href="http://assets.codecanaan.com/standalone/ClientTools.zip" target="_blank">點此下載</a></li>
    </ul>
    
    <p>所有提供下載的檔案，已通過防毒軟體檢測為 100% 安全，請放心下載執行。</p>
    
    <p>執行方法：將下載的檔案解壓縮，再執行位於「bin」資料夾下的「ClientTool」程式。</p>
</div>

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
                    $('.hidden-if-clienttools-started').hide();
                    $('.visible-if-clienttools-started').show();
                }
            },
            error: function(data) {
                setTimeout(pingClient, 5000);
            }
        });
    };

    pingClient();
})();
</r:script>

</body>
</html>
