<html>
<head>
    <title><g:message code="course.label" /></title>
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
                        <h3>新增讀者 / Add New User</h3>
                    </div>
                    <div class="widget-content">

                        <g:form action="userAction" id="${course.id}" method="post">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="icon-envelope"></i>
                                </span>

                                <input class="form-control" type="text" name="email" placeholder="example@gmail.com" style="font-size:.75em" />

                                <span class="input-group-btn">
                                    <button name="create" type="submit" class="btn btn-default">
                                        <i class="icon-plus"></i>
                                        <!--${message(code:'default.button.create.label')}-->
                                    </button>
                                </span>
                            </div>
                        </g:form>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-book"></i>
                        <h3>${course.title}</h3>
                    </div>
                    <div class="widget-content">
                        
                        <g:form action="userAction" id="${course.id}" method="post">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="40">#</th>
                                        <th><g:message code="user.username.label" /></th>
                                        <th><g:message code="user.fullName.label" /></th>
                                        <th><g:message code="user.email.label" /></th>
                                        <th width="100">Type</th>
                                        <th width="100">Issue Date</th>
                                        <th width="40"><i class="icon icon-check"></i></th>
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
                                            <td>
                                                <i class="icon icon-user"></i>&nbsp;
                                                ${link.user?.username}
                                            </td>
                                            <td>${link.user?.fullName}</td>
                                            <td>${link.user?.email}</td>
                                            <td>${link.regType}</td>
                                            <td>
                                                <g:formatDate date="${link.dateCreated}" type="date" style="SHORT" />
                                            </td>
                                            <td>
                                                <g:if test="${link.regType!=codecanaan.RegType.AUTHOR}">
                                                    <g:checkBox name="selected" value="${link.id}" checked="false" />
                                                </g:if>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>

                            <hr />

                            <!-- Delete -->
                            <g:submitButton name="delete" value="${message(code:'default.button.delete.label')}" class="btn btn-danger" onclick="return confirm('Are you sure???')" />

                            <!-- Cancel -->
                            <g:link action="show" id="${course.id}" class="btn btn-default">
                                <g:message code="default.button.cancel.label" />
                            </g:link>
                            
                        </g:form>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
