<html>
<head>
    <title><g:message code="course.label" /></title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>新增讀者 / Add New User</h3>
                    </div>
                    <div class="widget-content">

                        <g:form action="userAction" id="${course.id}" method="post">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="icon-envelope"></i>
                                </span>
                                <input class="form-control" type="text" name="email" placeholder="example@gmail.com" />

                                <span class="input-group-btn">
                                    <button name="create" type="submit" class="btn btn-default">
                                        <i class="icon icon-plus"></i>
                                        ${message(code:'default.button.create.label')}
                                    </button>
                                </span>
                            </div>
                        </g:form>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-8">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>管理課程使用者 / Course User Management</h3>
                    </div>
                    <div class="widget-content">
                        
                        <div class="pull-right">
                            <!--返回-->
                            <g:link action="show" id="${course.id}" class="btn btn-default">
                                <i class="icon icon-chevron-left"></i>&nbsp;
                                <g:message code="default.button.goback.label" />
                            </g:link>
                        </div>

                        <div class="page-header">
                            <h3>
                                <i class="icon icon-book"></i>&nbsp;
                                ${course.title}
                            </h3>
                        </div>

                        <g:form action="userAction" id="${course.id}" method="post">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="30">#</th>
                                        <th><g:message code="user.username.label" /></th>
                                        <th><g:message code="user.fullName.label" /></th>
                                        <th><g:message code="user.email.label" /></th>
                                        <th width="100">Type</th>
                                        <th width="100">Issue Date</th>
                                        <th width="30"><i class="icon icon-check"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:if test="${!userCourses}">
                                        <tr>
                                            <td colspan="7"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                                        </tr>
                                    </g:if>
                                    <g:each in="${userCourses}" var="link" status="i">
                                        <tr>
                                            <td>${i+1}</td>
                                            <td>${link.user?.username}</td>
                                            <td>${link.user?.fullName}</td>
                                            <td>${link.user?.email}</td>
                                            <td>${link.regType}</td>
                                            <td>${link.dateCreated?.format('yyyy/MM/dd')}</td>
                                            <td>
                                                <g:if test="${link.regType!=codecanaan.RegType.AUTHOR}">
                                                    <g:checkBox name="selected" value="${link.id}" checked="false" />
                                                </g:if>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>

                            <div class="btn-toolbar" style="text-align:right">
                                <g:submitButton name="delete" value="${message(code:'default.button.delete.label')}" class="btn btn-danger" onclick="return confirm('Are you sure???')" />
                            </div>
                        </g:form>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
