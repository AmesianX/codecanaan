<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.administration.text" /></title>
</head>
<body>
<g:form controller="admin" action="userEditSave" id="${user.id}" method="post" class="form-horizontal">

    <legend><g:message code="default.edit.label" args="[message(code:'user.label')]" /></legend>

    <div>
        <g:renderErrors bean="${user}" />
    </div>

    <div class="control-group">
        <label class="control-label" for="inputEmail">
            <g:message code="user.username.label" />
        </label>
        <div class="controls">
            <g:textField name="username" value="${user.username}" class="input input-medium" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="inputEmail">
            <g:message code="user.password.label" />
        </label>
        <div class="controls">
            <g:passwordField name="password" value="" class="input input-medium" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="inputEmail">
            <g:message code="user.fullName.label" />
        </label>
        <div class="controls">
            <g:textField name="fullName" value="${user.fullName}" class="input input-medium" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="inputEmail">
            <g:message code="user.email.label" />
        </label>
        <div class="controls">
            <g:textField name="email" value="${user.email}" class="input input-xlarge" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">
            Options
        </label>
        <div class="controls">
            <label class="checkbox">
                <g:checkBox name="enabled" value="true" checked="${user.enabled}" /> Enabled
            </label>
        </div>
    </div>


    <div class="control-group">
        <label class="control-label">
            Authorities
        </label>
        <div class="controls">
            <g:each in="${roles}" var="role">
                <label class="checkbox">
                    <g:checkBox name="roles" value="${role.authority}" checked="${user.authorities?.contains(role)}" /> ${role.authority}
                </label>
            </g:each>
        </div>
    </div>
    
    <div class="control-group">
        <div class="controls">
            <g:submitButton name="actionCreate" value="${message(code:'default.button.update.label')}" class="btn btn-primary" />

            <g:link action="userDelete" id="${user.id}" class="btn btn-danger" onclick="return confirm('Are you sure???');"><g:message code="default.button.delete.label" /></g:link>

            <g:link action="index" class="btn"><g:message code="default.button.cancel.label" /></g:link>

            <a href="${request.contextPath}/j_spring_security_switch_user?j_username=${user.username}" class="btn">Switch</a>
        </div>
    </div>
</g:form>
</body>
</html>
