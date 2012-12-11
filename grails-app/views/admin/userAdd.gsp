<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="admin.label" /></title>
</head>
<body>
<g:form controller="admin" action="userAddSave" method="post">
	<legend>會員資料</legend>

	<div>
	    <g:renderErrors bean="${user}" />
	</div>

	<g:message code="user.username.label" />
	<g:textField name="username" value="${user.username}" />

	<br/>

	<g:message code="user.password.label" />
	<g:passwordField name="password" value="" />

	<br/>

	<g:message code="user.fullName.label" />
	<g:textField name="fullName" value="${user.fullName}" />

	<br/>

	<g:message code="user.email.label" />
	<g:textField name="email" value="${user.email}" />

	<br/>

	<g:submitButton name="actionCreate" value="${message(code:'default.button.create.label')}" class="btn btn-primary" />

	<g:link action="index" class="btn"><g:message code="default.button.cancel.label" /></g:link>
</g:form>
</body>
</html>
