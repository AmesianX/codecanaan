<html>
<head>
<title>安裝 Java 軟體</title>
<meta name="layout" content="bootstrap"/>
<script src="http://www.java.com/js/deployJava.js"></script>
</head>
<body>

<!--Progress Tracker-->
<g:render template="progress" model="[step: 2]" />

<div class="row-fluid clearlook-wrapper justfont">
    <div class="span12">

        <div class="padding-around textalign-center">
            <p>您的帳號已經通過驗證。接下來，請為您的電腦安裝 Java 軟體！</p>
        </div>
        
        <hr/>

        <div class="padding-around margin-around">
            
            <h3>自動偵測 Java 版本</h3>
            
            <p>如果瀏覽器顯示「需要您的授權才能執行 Java。」<br/>請按「永遠在這個網站上執行」按鈕。</p>
            
            <ul>
                <li>Java <span id="jre-version"></span></li>
                <li>Java Web Start <span id="jws-version"></span></li>
            </ul>
            
            <p class="muted"><small>以上自動偵測結果僅供參考，若您確定電腦已經安裝 Java，<br/>請直接忽略「無法偵測」的訊息，並繼續下一個步驟。</small></p>
            
            <div class="visible-if-java-installed hide">
                <p class="textalign-center larger-font"><i class="icon icon-ok icon-2x icon-green"></i> 已偵測到 Java 軟體，您可以繼續下一個步驟！</p>
            </div>
            
        </div>
            
        
        <div class="padding-around margin-around hidden-if-java-installed">

            <h3>立即安裝最新版 Java 軟體</h3>
            
            <g:img dir="images" file="java_logo_200px.png" class="pull-right" />
            
            <p><strong>什麼是 Java？</strong></p>
            
            <p>Java 可讓您玩線上遊戲、與世界各地的人聊天、計算貸款利息，並檢視 3D 影像，但還不只如此。Jave 更可整合作為企業運算基礎的企業內部網路應用程式和其他電子商務解決方案。</p>
            
            <p><strong>為什麼壹學院需要 Java？</strong></p>
            
            <p>壹學院網站使用「Java Web Start」技術開發，瀏覽器需要搭配 Java 6 以上版本，才能執行「客戶端工具」，並取得完整的教材功能。</p>
            
            <p><strong>如何安裝 Java？</strong></p>
            
            <p>Java 是免費的軟體，您不需要支付任何費用。請從「<a href="http://www.java.com/zh_TW/" target="_blank">Java</a>」網站取得最新版本的安裝程式，此程式是由 Oracle（甲骨文）公司所提供。</p>
            
            <p><a href="http://www.java.com/zh_TW/download/manual.jsp?locale=zh_TW" target="_blank">下載適合用於所有作業系統的 Java</a></p>
            
            <p><strong>下載後如何安裝？</strong></p>
            
            <div class="java-install-details">
                
                <p>執行下載的「.exe」安裝程式，等待歡迎畫面出現。</p>
                
                <p><g:img dir="images/help" file="java-install-xp-1.png" style="display:none" /></p>
                
                <p>等待下載安裝 Java 所需的檔案，如果您的網路速度太慢或不穩，可能需要等待比較長的時間。</p>
                
                <p><g:img dir="images/help" file="java-install-xp-2.png" style="display:none" /></p>
                
                <p>看到「您已經成功安裝 Java」代表安裝過程順利；如果發生錯誤，請重新再執行一次安裝程式，或重新開機後再試一次。</p>
                
                <p><g:img dir="images/help" file="java-install-xp-3.png" style="display:none" /></p>
                
            </div>

            <button class="show-details btn">顯示每個步驟的畫面</button>
            
        </div>
            
        <hr/>
            
        <div class="padding-around textalign-center">
            <g:link action="step3" class="btn btn-large btn-primary">繼續下一個步驟 »</g:link>
        </div>
    </div>
</div>

<r:script>
(function() {

    $('button.show-details').toggle(function() {
        $('div.java-install-details img').show();
    }, function() {
        $('div.java-install-details img').hide();
    });

    var hasJava = deployJava.versionCheck('1.6+');
    var hasJavaWS = deployJava.isWebStartInstalled('1.6+');
    
    // IF Java IS INSTALLED
    if (hasJava && hasJavaWS) {
        $('.visible-if-java-installed').show();
        $('.hidden-if-java-installed').hide();
    }

    $('#jre-version').html(hasJava?'<font color="green"><i class="icon icon-ok"></i> 已安裝</a>':'<font color="orange">無法偵測</font>'+' <small>'+deployJava.getJREs()+'</small>');
    $('#jws-version').html(hasJavaWS?'<font color="green"><i class="icon icon-ok"></i> 已安裝</a>':'<font color="orange">無法偵測</font>');


})();
</r:script>

</body>
</html>
