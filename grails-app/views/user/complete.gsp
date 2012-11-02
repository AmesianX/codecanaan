<%@ page import="codecanaan.User" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<g:hasErrors bean="${user}">
<ul class="errors" role="alert">
	<g:eachError bean="${user}" var="error">
	<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
	</g:eachError>
</ul>
</g:hasErrors>
<g:form action="complete" method="post" class="form-horizontal">
	<legend>請填寫個人資料</legend>
	<div class="control-group">
		<label class="control-label">
			帳號類型
		</label>
		<div class="controls">
			<g:if test="${user?.username.startsWith('facebook_')}">
				<span class="help-inline">使用 Facebook 帳號登入</span>
			</g:if>
			<g:else>
				<span class="help-inline">一般帳號</span>
			</g:else>
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: user, field: 'fullName', 'error')} ">
		<label class="control-label" for="fullName">
			<g:message code="user.fullName.label" default="Full Name" />
		</label>
		<div class="controls">
			<g:textField name="fullName" value="${user?.fullName}"/>
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: user, field: 'email', 'error')} ">
		<label class="control-label" for="email">
			<g:message code="user.email.label" default="Email" />
		</label>
		<div class="controls">
			<g:textField name="email" value="${user?.email}"/>
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<g:submitButton name="save" value="${message(code: 'default.button.update.label', default: 'Update')}" class="btn btn-primary" />
		</div>
	</div>
</g:form>
</body>
</html>
