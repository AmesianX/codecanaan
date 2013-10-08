<!DOCTYPE html>
<html>
<head>
    <title><g:message code="default.administration.text" /></title>
    <meta name="layout" content="baseadmin">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="widget">
                <div class="widget-header">
                    <i class="icon-file"></i>
                    <h3>內容維護</h3>
                </div>
                <div class="widget-content">
                    <ul class="icons-ul">
                        <li>
                            <g:link controller="post" action="create">
                                <i class="icon-li icon-file"></i>
                                發佈新頁面
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget">
                <div class="widget-header">
                    <i class="icon-user"></i>
                    <h3>會員資料維護</h3>
                </div>
                <div class="widget-content">
                    <ul class="icons-ul">
                        <li>
                            <g:link controller="admin" action="userList">
                                <i class="icon-li icon-user"></i>
                                列出會員資料
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="admin" action="userAdd">
                                <i class="icon-li icon-user"></i>
                                新增會員
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget">
                <div class="widget-header">
                    <i class="icon-book"></i>
                    <h3>課程資料維護</h3>
                </div>
                <div class="widget-content">
                    <ul class="icons-ul">
                        <li>
                            <g:link controller="admin" action="couponList">
                                <i class="icon-li icon-barcode"></i>
                                課程序號管理
                            </g:link>
                        </li>
                        <li>
                            <g:link controller="admin" action="courseTemplate">
                                <i class="icon-li icon-book"></i>
                                教學內容範本維護
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="widget">
                <div class="widget-header">
                    <i class="icon-wrench"></i>
                    <h3>系統維護</h3>
                </div>
                <div class="widget-content">
                    <ul class="icons-ul">
                        <li>
                            <g:link action="memoryUsage">
                                <i class="icon-li icon-dashboard"></i>
                                顯示記憶體使用量
                            </g:link>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
