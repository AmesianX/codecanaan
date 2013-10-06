<html>
<head>
    <title>${schedule?.title}</title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-plus-sign"></i>
                        <h3><g:message code="default.button.add.label" /></h3>
                    </div>
                    <div class="widget-content">
                        <g:form action="userUpdate" id="${schedule.id}" method="post">
                            <div class="input-group">
                                <span class="input-group-addon">
                                    <i class="icon-envelope"></i>
                                </span>
                                <input class="form-control" type="text" name="username" placeholder="example@gmail.com" style="font-size:.75em" />
                                <span class="input-group-btn">
                                    <button name="actionAddUser" type="submit" class="btn btn-default">
                                        <i class="icon-plus"></i>
                                    </button>
                                </span>
                            </div>
                        </g:form>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget widget-table stacked">
                    <div class="widget-header">
                        <i class="icon icon-user"></i>
                        <h3>${schedule?.title}</h3>
                    </div>
                    <div class="widget-content">
                        <g:form action="userAction" id="${schedule.id}" method="post">
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="40">#</th>
                                        <th><g:message code="user.username.label" /></th>
                                        <th><g:message code="user.fullName.label" /></th>
                                        <th><g:message code="user.email.label" /></th>
                                        <th width="100">身分</th>
                                        <th width="100">建立日期</th>
                                        <th><i class="icon icon-check"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:if test="${!userSchedules}">
                                        <tr>
                                            <td colspan="7"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                                        </tr>
                                    </g:if>
                                    <g:each in="${userSchedules}" var="link" status="i">
                                        <tr>
                                            <td>${i+1}</td>
                                            <td>
                                                <i class="icon-user"></i>&nbsp;
                                                ${link.user?.username}
                                            </td>
                                            <td>${link.user?.fullName}</td>
                                            <td>${link.user?.email}</td>
                                            <td>${link.roleType}</td>
                                            <td>${link.dateCreated?.format('yyyy/MM/dd')}</td>
                                            <td>
                                                <g:if test="${link.roleType!=codecanaan.ScheduleRoleType.OWNER}">
                                                    <g:checkBox name="selected" value="${link.id}" checked="false" />
                                                </g:if>
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>

                                <tfoot>
                                    <tr>
                                        <td colspan="7" class="text-right">
                                            <div class="btn-toolbar">
                                                <button name="delete" type="submit" class="btn btn-danger" onclick="alert('Are you sure???');">
                                                    <g:message code="default.button.delete.label" />
                                                </button>

                                                <g:link action="show" id="${schedule.id}" class="btn btn-default">
                                                    <g:message code="default.button.cancel.label" />
                                                </g:link>
                                            </div>
                                        </td>
                                    </tr>
                                </tfoot>

                            </table>
                        </g:form>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->