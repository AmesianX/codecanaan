<html>
<head>
<meta name="layout" content="bootstrap"/>
</head>
<body>
<h1>程式設計教學系統</h1>
<hr class="soften" />
<div class="row">
    <div class="span6">
        <p><font size="6" class="popover-me logo-font" title="關於 CodeCanaan" data-content="根據聖經記載，Canaan（迦南）是上帝賜給以色列人祖先的應許之地，選民在流奶與蜜的迦南美地自由安居。CodeCanaan 是程式設計學習者的迦南美地，我們致力於創造一個自由開放且樂趣無窮的學習環境。">CodeCanaan</font><br/>專為程式設計課程研發的教學軟體</p>
        <r:script>$('.popover-me').popover({trigger: 'hover'});</r:script>
        <ul>
            <li>免安裝維護軟體，有 Java 及瀏覽器即可執行</li>
            <li>整合 Facebook 帳號登入</li>
            <li>支援 Markdown 友善編輯及預覽</li>
            <li>支援程式碼實作練習，簡化程式執行及測試</li>
            <li>開放原始碼專案，採用 MIT License 授權</li>
        </ul>

        <hr class="soften" />

        <!--WebStart啟動按鈕-->
        <sec:ifLoggedIn>
            <g:link controller="home" action="webstart" class="btn btn-primary">啟動客戶端工具</g:link>

            <div class="pull-right">
                <label>
                    設定連接埠
                    <g:remoteField controller="home" action="port" update="message"
                   name="port" value="${jettyPort}" class="input input-small" /></label>
            </div>
            <div id="message" style="clear:both"></div>

            <div class="alert alert-info">開始練習實作題之前，請先啟動客戶端工具（如果有已經啟動的客戶端工具請先關閉）。</div>

        </sec:ifLoggedIn>
    </div>
    <div class="span6">
        <div style="z-index:9999;position:absolute;color:#ccc"><div style="margin:auto;padding:20% 20%;"><span class="logo-font" style="font-size:3em">CodeCanaan</span><br/><br/><span class="code-font" style="color:#00ff00">printf("Hello");</span></div></div>
        <g:img dir="images" file="imac.png" />
    </div>
</div>
</body>
</html>