<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.administration.text" /></title>
</head>
<body>
<div class="container-fluid margin-below">
    <div class="row-fluid clearlook-wrapper justfont">
        <div class="span3 padding-around">
            <h3>內容維護</h3>
            <ul class="icons">
                <li>
                    <g:link controller="post" action="create">
                        <i class="icon-file"></i>
                        發佈新頁面
                    </g:link>
                </li>
            </ul>
        </div>
        <div class="span3 padding-around">
            <h3>會員資料維護</h3>
            <ul class="icons">
                <li>
                    <g:link controller="admin" action="userList">
                        <i class="icon-user"></i>
                        列出會員資料
                    </g:link>
                </li>
                <li>
                    <g:link controller="admin" action="userAdd">
                        <i class="icon-user"></i>
                        新增會員
                    </g:link>
                </li>
            </ul>
        </div>
        <div class="span3 padding-around">
            <h3>課程資料維護</h3>
            <ul class="icons">
                <li>
                    <g:link controller="admin" action="couponList">
                        <i class="icon-barcode"></i>
                        課程序號管理
                    </g:link>
                </li>
                <li>
                    <g:link controller="admin" action="courseTemplate">
                        <i class="icon-book"></i>
                        教學內容範本維護
                    </g:link>
                </li>
            </ul>
        </div>
        <div class="span3 padding-around">
            <h3>系統維護</h3>
            <ul class="icons">
                <li>
                    <g:link action="memoryUsage">
                        <i class="icon-ok"></i>
                        顯示記憶體使用量
                    </g:link>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row-fluid clearlook-wrapper">
        <div class="span12 textalign-center padding-around">
            <g:img dir="images" file="admin_fake.png" />
        </div>
    </div>
</div>
</body>
</html>
