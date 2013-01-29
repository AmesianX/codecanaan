<html>
<head>
<title>獲取免費課程</title>
<meta name="layout" content="bootstrap"/>
</head>
<body>
<div class="container-fluid">
    <!--Progress Tracker-->
    <g:render template="progress" model="[step: 4]" />

    <div class="row-fluid">
        <div class="span12">
            <p class="larger-font textalign-center padding-around margin-around">
                恭喜您已完成所有步驟！現在您即將展開數位學習的奇幻漂流。
            </p>
        </div>
    </div>

    <g:form controller="home" action="works" method="post">
        <div class="clearlook-wrapper">
            <div class="row-fluid justfont">

                <div class="span8 padding-leftside">
                
                    <section>
                        <h2>服務條款</h2>
                        <g:render template="terms_zh_TW" />
                                    
                        <label>
                            <g:checkBox name="agree" value="yes" checked="true" />
                            我已經閱讀並同意遵守上述條款內容
                        </label>
                    </section>
                    
                    <section>            
                        <h2>會員獨享</h2>    

                        <p>軟體壹學院不定期舉辦各類課程及活動，只提供給已註冊的會員朋友，如果您不想錯過這些訊息，請接收系統自動寄發的電子報。若您以後不願意繼續收到郵件，只要在個人設定區取消訂閱即可。</p>

                        <label>
                            <g:checkBox name="enableNews" value="true" checked="true" />
                            我願意收到最新課程及活動訊息（電子報）
                        </label>                
                    </section>
                    
                </div>
                
                <div class="span4 padding-rightside">

                    <section>
                        <h2>免費課程</h2>
                        
                        <p>軟體壹學院正在推行「開放式課程（Open CourseWare）」計畫，您可以依個人學習需求勾選需要的課程項目，我們將會為您保留免費使用課程的權利。</p>
                        
                        <g:each in="${courses}" var="course" status="i">
                        
                            <label>
                                <g:checkBox name="courses" value="${course.id}" checked="false" />
                                ${course.title}
                            </label>    
                        
                        </g:each>
                        
                    </section>
                    
                    <!--付費課程廣告-->
                </div>
            
            </div>

            <hr />
            
            <div class="padding-around textalign-center">
                <button type="submit" class="btn btn-large btn-primary">
                    <i class="icon icon-double-angle-right"></i>
                    繼續開始使用課程
                </button>
            </div>
        </div>
    </g:form>
</div>

<r:script>
(function() {
    $("button[type='submit']").click(function() {
    
        if (!$("input[name='agree']").is(':checked')) {
            bootbox.alert('您尚未同意軟體壹學院的服務條款！');
            return false;
        }
    });
})();
</r:script>

</body>
</html>
