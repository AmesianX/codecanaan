<html>
<head>
	<title><g:message code="default.administration.text" /></title>
	<meta name="layout" content="baseadmin">
</head>
<body>
<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>新帳號申請表</h3>
                    </div>
                    <div class="widget-content">
						<g:form action="userAddSave" method="post" role="form" class="form-horizontal">

							<g:hasErrors bean="${user}">
							<div class="alert alert-warning">
							    <g:renderErrors bean="${user}" />
							</div>
							</g:hasErrors>

							<div class="form-group">
								<label for="username" class="col-md-2 control-label">
									<g:message code="user.username.label" />
								</label>
								<div class="col-md-10">
									<g:textField name="username" value="${user.username}" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="col-md-2 control-label">
									<g:message code="user.password.label" />
								</label>
								<div class="col-md-10">
									<g:passwordField name="password" value="" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label for="fullName" class="col-md-2 control-label">
									<g:message code="user.fullName.label" />
								</label>
								<div class="col-md-10">
									<g:textField name="fullName" value="${user.fullName}" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="col-md-2 control-label">
									<g:message code="user.email.label" />
								</label>
								<div class="col-md-10">
									<g:textField name="email" value="${user.email}" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-2">
								</div>
								<div class="col-md-10">
									<!-- Submit Button -->
									<g:submitButton name="actionCreate" value="${message(code:'default.button.create.label')}" class="btn btn-primary" />

									<!-- Cancel Button -->
									<g:link action="userList" class="btn btn-default">
										<g:message code="default.button.cancel.label" />
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
