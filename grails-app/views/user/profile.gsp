<%@ page import="codecanaan.User" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <!--資訊-->
    </div>
    <div class="span9">
        <g:hasErrors bean="${user}">
        <ul class="errors" role="alert">
	        <g:eachError bean="${user}" var="error">
	        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
	        </g:eachError>
        </ul>
        </g:hasErrors>
        <g:form action="profile" method="post" class="form-horizontal">
	        <legend>${user.fullName?user.fullName:'NONAME'} 個人資料</legend>
	        <div class="control-group">
		        <label class="control-label">
			        帳號類型
		        </label>
		        <div class="controls">
			        <g:if test="${user?.username.startsWith('facebook_')}">
				        <span class="help-inline">連結 Facebook 帳號</span>
			        </g:if>
			        <g:else>
				        <span class="help-inline">會員帳號</span>
			        </g:else>
		        </div>
	        </div>
	        <div class="control-group">
		        <label class="control-label" for="username">
			        <g:message code="user.username.label" default="Username" />
		        </label>
		        <div class="controls">
		            <span class="help-inline">${user?.username}</span>
		        </div>
	        </div>
	        <div class="control-group ${hasErrors(bean: user, field: 'fullName', 'error')} ">
		        <label class="control-label" for="fullName">
			        <g:message code="user.fullName.label" default="Full Name" />
		        </label>
		        <div class="controls">
			        <g:textField name="fullName" value="${user?.fullName}" class="input input-medium" />
		        </div>
	        </div>
	        <div class="control-group ${hasErrors(bean: user, field: 'email', 'error')} ">
		        <label class="control-label" for="email">
			        <g:message code="user.email.label" default="Email" />
		        </label>
		        <div class="controls">
			        <g:textField name="email" value="${user?.email}" class="input input-xlarge" />
		        </div>
	        </div>
            <g:if test="${user.email}">
                <div class="control-group">
		            <label class="control-label" for="email">
			            <g:message code="user.avatar.label" default="Avatar" />
		            </label>
		            <div class="controls">
                        <avatar:gravatar email="${user.email}" size="128" />
                        <span class="help-block">Change your avatar at <a href="gravatar.com">gravatar.com</a><br/> We’re using ${user.email}</span>
		            </div>
	            </div>
            </g:if>
	        <div class="control-group ${hasErrors(bean: user, field: 'clientPort', 'error')} ">
		        <label class="control-label" for="clientPort">
			        <g:message code="user.clientPort.label" default="Client Port" />
		        </label>
		        <div class="controls">
			        <g:textField name="clientPort" value="${user?.clientPort}" class="input input-small" />
		        </div>
	        </div>
	        <div class="control-group">
		        <div class="controls">
			        <g:submitButton name="save" value="${message(code: 'default.button.update.label', default: 'Update')}" class="btn btn-primary" />
		        </div>
	        </div>
        </g:form>
    </div>
</div>
</body>
</html>
