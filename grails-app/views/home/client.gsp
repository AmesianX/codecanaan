<html>
<head>
    <title>Client</title>
    <meta name="layout" content="baseadmin"/>
    <r:require modules="deployJava, baseadmin-faq" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-content">
                        <ul class="nav nav-pills nav-stacked" style="font-size:11pt">
                            <li class="disabled"><a href="#">客戶端工具</a></li>
                            <li>
                                <g:link action="client">
                                    <i class="icon-chevron-right"></i>
                                    執行
                                </g:link>
                            </li>
                            <li>
                                <g:link action="client" params="[section: 'compatible']">
                                    <i class="icon-chevron-right"></i>
                                    相容性檢查
                                </g:link>
                            </li>
                            <li>
                                <g:link action="client" params="[section: 'versions']">
                                    <i class="icon-chevron-right"></i>
                                    軟體版本
                                </g:link>
                            </li>
                            <li>
                                <g:link action="client" params="[section: 'faq']">
                                    <i class="icon-chevron-right"></i>
                                    常見問題
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-content">
                        <g:render template="${section}" />
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
