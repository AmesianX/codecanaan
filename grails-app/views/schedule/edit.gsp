<html>
<head>
    <title><g:message code="schedule.label" /></title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-edit"></i>
                        <h3><g:message code="default.edit.label" args="[message(code: 'schedule.label')]" /></h3>
                    </div>
                    <div class="widget-content">

                        <!-- Show Errors -->
                        <g:hasErrors bean="${schedule}">
                        <div class="alert alert-warning">
                            <ul class="errors" role="alert">
                            <g:eachError bean="${schedule}" var="error">
                                <li><g:message error="${error}" /></li>
                            </g:eachError>
                            </ul>
                        </div>
                        </g:hasErrors>

                        <g:form action="update" id="${schedule.id}" class="form-horizontal" role="form">

                            <!-- Title -->
                            <div class="form-group">
                                <label class="control-label col-md-2" for="title">
                                    <g:message code="schedule.title.label" />
                                </label>
                                <div class="col-md-8">
                                    <g:textField name="title" value="${schedule.title}" class="form-control" />
                                </div>
                            </div>

                            <!-- Name -->
                            <div class="form-group">
                                <label class="control-label col-md-2" for="name">
                                    <g:message code="schedule.name.label" />
                                </label>
                                <div class="col-md-8">
                                    <g:textField name="name" value="${schedule.name}" class="form-control" />
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="form-group">
                                <label class="control-label col-md-2" for="password">
                                    <g:message code="schedule.password.label" />
                                </label>
                                <div class="col-md-8">
                                    <g:passwordField name="password" value="${schedule.password}" class="form-control" />
                                </div>
                            </div>
                            
                            <!-- School -->
                            <div class="form-group">
                                <label class="control-label col-md-2" for="school">
                                    <g:message code="schedule.school.label" />
                                </label>
                                <div class="col-md-8">
                                    <g:textField name="school" value="${schedule?.school}" class="form-control" />
                                </div>
                            </div>

                            <!-- Department -->
                            <div class="form-group">
                                <label class="control-label col-md-2" for="department">
                                    <g:message code="schedule.department.label" />
                                </label>
                                <div class="col-md-8">
                                    <g:textField name="department" value="${schedule?.department}" class="form-control" />
                                </div>
                            </div>

                            <hr />

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-8">
                                    <!-- Submit -->
                                    <g:submitButton name="actionUpdate" value="${message(code:'default.button.update.label')}" class="btn btn-primary" />

                                    <!-- Cancel -->
                                    <g:link action="show" id="${schedule.id}" class="btn btn-default">
                                        <g:message code="default.button.cancel.label" />
                                    </g:link>

                                    <!-- Delete -->
                                    <g:link action="delete" id="${schedule.id}" class="btn btn-danger pull-right">
                                        <i class="icon icon-remove"></i>&nbsp;
                                        <g:message code="default.button.remove.label" />
                                    </g:link>
                                </div>
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
