<%@ page import="codecanaan.Content" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div id="create-content" class="content container" role="main">
    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${content}">
    <ul class="errors" role="alert">
        <g:eachError bean="${content}" var="error">
        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
    </ul>
    </g:hasErrors>
    <g:form action="save" class="form-horizontal">
        <g:render template="form"/>
        <div class="control-group">
            <div class="controls">
                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </div>
        </div>
    </g:form>
</div>
</body>
</html>
