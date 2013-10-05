<%@ page import="codecanaan.Course" %>
<html>
<head>
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <meta name="layout" content="baseadmin" />
    <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
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

            <div class="col-md-7">

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
                                <g:each in="${schedules}" var="schedule" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td>
                                            <g:link controller="schedule" action="show" id="${schedule.id}">
                                                ${schedule.title}
                                            </g:link>
                                        </td>
                                        <td>
                                            ${statistics[schedule]}
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3" align="center">Total: ${schedules?.size()?:0}</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->


            <div class="col-md-2">
                <!-- Operations drop-down menu, teacher permission required -->
                <sec:ifAnyGranted roles="ROLE_TEACHER">
                    <div class="btn-group">
                        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <i class="icon icon-wrench"></i>&nbsp;
                            <g:message code="default.operations.label" />
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="schedule" action="create">
                                    <i class="icon icon-group"></i>&nbsp;
                                    <g:message code="default.add.label" default="Add {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </sec:ifAnyGranted>
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
