<html>
<head>
<title>獲取免費課程</title>
<meta name="layout" content="bootstrap"/>
</head>
<body>

<!--Progress Tracker-->
<g:render template="progress" model="[step: 4]" />

<div class="row-fluid clearlook-wrapper justfont">

    <p style="text-align:center">
        恭喜您已完成所有步驟！現在您即將展開數位學習的奇幻漂流。
    </p>
    
    <hr/>
    
    <div class="span12">

        <div class="span8 padding-leftside">
        
            <h3>服務條款</h3>
            <g:render template="terms_zh_TW" />
            
            <p>壹學院需要在您的電腦上執行「客戶端工具」程式，此程式用於幫助您建立整合開發環境（IDE），以支援程式碼的自動化編譯與測試。當您不需要使用「客戶端工具」時，可以隨時將它關閉。</p>
            
            <p><strong>防火牆設定</strong></p>
            
            <p><strong>安全設定</strong></p>
            
        </div>
        
        <div class="span8 padding-rightside">
            <!--付費課程廣告-->
        </div>
    
    </div>

    <hr style="clear:both" />
    
    <div style="text-align:center">
        <g:link action="step4" class="btn btn-large btn-primary">開始使用課程 »</g:link>
    </div>
</div>

</body>
</html>
