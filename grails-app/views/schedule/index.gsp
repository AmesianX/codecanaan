<html>
<head>
    <title><g:message code="schedule.label" /></title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3><g:message code="default.join.label" args="[message(code: 'schedule.label')]" /></h3>
                    </div>
                    <div class="widget-content">
                        <g:form action="register" method="post" role="form">

                            <div class="form-group">
                                <label for="name">
                                    <g:message code="schedule.name.label" />
                                </label>
                                <g:textField name="name" value="" class="form-control" />
                            </div>
                            

                            <div class="form-group">
                                <label for="password">
                                    <g:message code="schedule.password.label" />
                                </label>
                                <g:passwordField name="password" value="" class="form-control" />
                            </div>

                            <!-- Submit -->
                            <g:submitButton name="join" value="${message(code: 'default.join.text')}" class="btn btn-default" />

                        </g:form>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">

                <div class="widget stacked widget-table">
                    <div class="widget-header">
                        <i class="icon icon-tasks"></i>
                        <h3>
                            <g:message code="default.my.label" default="My {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
                        </h3>
                    </div>
                    <div class="widget-content">
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th width="40">#</th>
                                    <th>
                                        <g:message code="schedule.title.label" />
                                    </th>
                                    <th width="100">
                                        <g:message code="schedule.user.count.text" />
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${!schedules}">
                                    <tr>
                                        <td colspan="3" class="text-center">
                                            <g:message code="default.empty.label" />
                                        </td>
                                    </tr>
                                </g:if>
                                <g:each in="${schedules}" var="schedule" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td>
                                            <g:link controller="schedule" action="show" id="${schedule.id}">
                                            <div>
                                                ${schedule.title}
                                            </div>
                                            </g:link>
                                        </td>
                                        <td>
                                            ${statistics[schedule]}
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                            <tfoot>
                                <sec:ifAnyGranted roles="ROLE_TEACHER">
                                    <tr>
                                        <td colspan="3" class="text-right">
                                            <g:link action="create">
                                                <i class="icon icon-plus"></i>&nbsp;
                                                <g:message code="default.button.create.label" />
                                            </g:link>
                                        </td>
                                    </tr>
                                </sec:ifAnyGranted>
                            </tfoot>
                        </table>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
