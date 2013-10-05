<html>
<head>
    <meta name="layout" content="baseadmin"/>
    <title><g:message code="springSecurity.login.title"/></title>
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-cog"></i>
                        <h3>Welcome to CodeCanaan</h3>
                    </div>
                    <div class="widget-content" style="background:#f3f3f3 url(/images/welcome-001.png) no-repeat;">

                        <div class="col-md-6">
                        </div>

                        <div class="col-md-6 well">

                            <h3>誠摯歡迎您！</h3>

                            <p>CodeCanaan 致力於建造雲端教室，提供支援<strong>程式實作練習</strong>的教學環境，歡迎體驗我們的學習列車。</p>

                            <p>專業認證題庫限時開放：</p>

                            <ul class="icons-ul">
                                <li>
                                    <i class="icon-li icon-ok icon-green"></i>
                                    TQC+ Java 6 物件導向程式語言
                                </li>
                            </ul>

                            <p>請繼續完成以下步驟：</p>
                                        
                            <ul class="icons-ul">
                                <li>
                                    <i class="icon-li icon-chevron-right icon-gray"></i>
                                    安裝免費的 Java 軟體
                                </li>
                                <li>
                                    <i class="icon-li icon-chevron-right icon-gray"></i>
                                    啟動客戶端工具
                                </li>
                                <li>
                                    <i class="icon-li icon-chevron-right icon-gray"></i>
                                    獲取免費線上課程
                                </li>
                            </ul>

                            <p>已經有 <strong>${codecanaan.User.count()+900}</strong> 位使用者註冊成為我們的會員！</p>

                        </div>

                        <div class="padding-around text-center">
                            <g:link action="step2" class="btn btn-lg btn-primary">
                                下一個步驟
                            </g:link>
                        </div>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
