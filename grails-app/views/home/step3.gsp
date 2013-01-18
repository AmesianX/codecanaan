<html>
<head>
<title>啟動客戶端工具</title>
<meta name="layout" content="bootstrap"/>
</head>
<body>

<!--Progress Tracker-->
<g:render template="progress" model="[step: 3]" />

<div class="row-fluid clearlook-wrapper justfont">

    <p style="text-align:center">
        已經接近完成！接下來，請立即執行「客戶端工具」程式。
    </p>
    
    <hr/>
    
    <div class="span12">

        <div class="span6 padding-leftside">
        
            <h3>立即啟動客戶端工具</h3>
            
            <p>壹學院需要在您的電腦上執行「客戶端工具」程式，此程式用於幫助您建立整合開發環境（IDE），以支援程式碼的自動化編譯與測試。當您不需要使用「客戶端工具」時，可以隨時將它關閉。</p>
            
            <p><strong>防火牆設定</strong></p>
            
            <p><strong>安全設定</strong></p>
            
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
        </div>
    
    </div>

    <hr style="clear:both" />
    
    <div style="text-align:center">
        <g:link action="step4" class="btn btn-large btn-primary">繼續下一個步驟 »</g:link>
    </div>
</div>

<div class="padding-around justfont remove-if-success">

    <h3>如果無法順利以 Java Web Start 方式啟動？</h3>
    
    <p>如果您已經<g:link action="step2">安裝 Java 軟體</g:link>，卻無法順利執行「webstart.jnlp」程式，建議您先嘗試這些步驟。</p>
    
    <ul>
        <li>暫時關閉防火牆與防毒軟體，再重新執行一次。</li>
        <li>暫時關閉瀏覽器的 Proxy 設定，再重新執行一次。</li>
    </ul>
    
    <p>當您仍然無法執行時，請使用我們提供的「ClientTools」手動下載版本。</p>
    
    <ul>
        <li>適用於 Windows XP / 7 作業系統（包含 32 及 64 位元） <a href="${resource(dir:'standalone',file:'ClientTools.zip')}" target="_blank">點此下載</a></li>
        <li>適用於 Mac OS X 作業系統（包含 32 及 64 位元） <a href="${resource(dir:'standalone',file:'ClientTools.zip')}" target="_blank">點此下載</a></li>
        <li>適用於 Linux 作業系統（包含 32 及 64 位元） <a href="${resource(dir:'standalone',file:'ClientTools.zip')}" target="_blank">點此下載</a></li>
    </ul>
    
    <p>所有提供下載的檔案，已通過防毒軟體檢測為 100% 安全，請放心下載執行。</p>
    
    <p>執行方法：將下載的檔案解壓縮，再執行位於「bin」資料夾下的「ClientTool」程式。</p>
</div>

</body>
</html>
