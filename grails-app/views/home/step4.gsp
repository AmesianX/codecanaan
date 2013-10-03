<html>
<head>
    <title>獲取免費課程</title>
    <meta name="layout" content="baseadmin"/>
    <meta name="display.subnavbar" content="disable" />
    <meta name="display.footer" content="disable" />
</head>
<body>

<g:form controller="home" action="works" method="post">

    <div class="main">

        <div class="container">

            <div class="row">

                <div class="col-md-8">

                    <div class="widget stacked">
                        <div class="widget-header">
                            <i class="icon icon-pencil"></i>
                            <h3>服務條款</h3>
                        </div>
                        <div class="widget-content">
                            <g:render template="terms_zh_TW" />
                                        
                            <label>
                                <g:checkBox name="agree" value="yes" checked="true" />&nbsp;
                                我已閱讀且同意上述條款內容
                            </label>

                            <div class="padding-around textalign-center">
                                <button type="submit" class="btn btn-lg btn-primary">
                                    開始使用課程
                                </button>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.col -->

                <div class="col-md-4">

                    <div class="widget stacked">
                        <div class="widget-header">
                            <i class="icon-pencil"></i>
                            <h3>免費課程</h3>
                        </div>
                        <div class="widget-content">

                            <p>軟體壹學院正在推行「開放式課程（Open CourseWare）」計畫，您可以依個人學習需求勾選需要的課程項目，我們將會為您保留免費使用課程的權利。</p>
                            
                            <g:each in="${courses}" var="course" status="i">
                            
                                <label>
                                    <g:checkBox name="courses" value="${course.id}" checked="false" />&nbsp;
                                    ${course.title}
                                </label>    
                            
                            </g:each>
                        </div>
                    </div> <!-- /.widget -->

                    <div class="widget stacked">
                        <div class="widget-header">
                            <i class="icon-pencil"></i>
                            <h3>會員獨享</h3>
                        </div>
                        <div class="widget-content">

                            <p>軟體壹學院不定期舉辦各類課程及活動，只提供給已註冊的會員朋友，如果您不想錯過這些訊息，請接收系統自動寄發的電子報。若您以後不願意繼續收到郵件，只要在個人設定區取消訂閱即可。</p>

                            <label>
                                <g:checkBox name="enableNews" value="true" checked="true" />&nbsp;
                                我同意收到電子報
                            </label>                
                        </div>
                    </div>

                </div> <!-- /.col -->

            </div> <!-- /.row -->

        </div> <!-- /.container -->

    </div> <!-- /.main -->

</g:form>

<r:script>
(function() {
    $("button[type='submit']").click(function() {
    
        if (!$("input[name='agree']").is(':checked')) {
            bootbox.alert('您必須同意服務條款才能使用課程！');
            return false;
        }
    });
})();
</r:script>

</body>
</html>
