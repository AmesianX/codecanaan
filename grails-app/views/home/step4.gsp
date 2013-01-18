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

        <div class="span9 padding-leftside">
        
            <section>
                <h3>服務條款</h3>
                <g:render template="terms_zh_TW" />
                            
                <label>
                    <g:checkBox name="agree" value="" checked="true" />
                    我已經閱讀並同意遵守上述條款內容
                </label>
            </section>
            
            <section>            
                <h3>會員獨享</h3>    

                <p>壹學院不定期舉辦各類課程及活動，只提供給已註冊的會員朋友，如果您不想錯過這些訊息，請接收系統自動寄發的電子報。若您以後不願意繼續收到郵件，只要在個人設定區取消訂閱即可。</p>

                <label>
                    <g:checkBox name="enableNews" value="" checked="true" />
                    我願意收到最新課程及活動訊息（電子報）
                </label>                
            </section>
            
            <section>
                <h3>免費課程</h3>
                
                <p>壹學院正在推行「開放式數位課程（Open CourseWare）」計畫，您可以依個人學習需求勾選需要的課程項目，我們將會為您保留這些課程的使用權利。</p>
                
                <g:each in="${courses}" var="course" status="i">
                
                    <label>
                        <g:checkBox name="courses" value="${course.id}" checked="false" />
                        ${course.title}
                    </label>    
                
                </g:each>
                
            </section>
        </div>
        
        <div class="span3 padding-rightside">
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
