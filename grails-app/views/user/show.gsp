<html>
<head>
    <title>${user.fullName}</title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">

    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-user"></i>
                        <h3>Avatar</h3>
                    </div>
                    <div class="widget-content">
                        <g:if test="${user?.email}">
                            <div class="textalign-center">
                                <avatar:gravatar email="${user.email}" size="128" title="大頭貼" id="avatar" />
                            </div>
                        </g:if>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">

                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-user"></i>
                        <h3>${user.fullName} (${user.username})</h3>
                    </div>
                    <div class="widget-content">


                        <!-- Full Name -->
                        <dl class="dl-horizontal">
                            <dt><g:message code="user.fullName.label" /></dt>
                            <dd>
                                ${user?.fullName}
                            </dd>
                        </dl>

                        <!-- School -->
                        <dl class="dl-horizontal">
                            <dt><g:message code="user.school.label" /></dt>
                            <dd>${user?.school?:'<span class="text-muted">(empty)</span>'}</dd>
                        </dl>

                        <!-- Department -->
                        <dl class="dl-horizontal">
                            <dt><g:message code="user.department.label" /></dt>
                            <dd>${user?.department?:'<span class="text-muted">(empty)</span>'}</dd>
                        </dl>
                        
                        <dl class="dl-horizontal">
                            <dt>經驗值</dt>
                            <dd>${user.experience}</dd>
                        </dl>

                        <dl class="dl-horizontal">
                            <dt>完成題數</dt>
                            <dd>${totalComplete}</dd>
                        </dl>

                        <div class="well">
                            <div class="markdown-source">${user?.description?:'尚未填寫說明檔'}</div>
                        </div>



                    </div>
                </div> <!-- /.widget -->

            </div> <!-- /.col-md-9 -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

</body>
</html>
