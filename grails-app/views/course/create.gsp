<html>
<head>
<meta name="layout" content="bootstrap" />
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
        </div>
        <div class="span9">
            <legend><g:message code="default.create.label" args="[entityName]" /></legend>
            <g:hasErrors bean="${course}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${course}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save" class="form-horizontal">
                <g:hiddenField name="name" value="${course?.name}" />
                <g:hiddenField name="description" value="${course?.description}" />
                <div class="control-group ${hasErrors(bean: course, field: 'title', 'error')} ">
                    <label class="control-label" for="title">
                        <g:message code="course.title.label" default="Title" />
                    </label>
                    <div class="controls">
                        <g:textField name="title" placeholder="${course?.title}"/>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                        <g:link class="btn">${message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
                    </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
