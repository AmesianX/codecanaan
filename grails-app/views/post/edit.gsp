<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
<g:hasErrors bean="${post}">
	<ul class="errors" role="alert">
		<g:eachError bean="${post}" var="error">
		<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
		</g:eachError>
	</ul>
</g:hasErrors>
<g:form action="update" class="form-horizontal" id="${post?.id}">
	<div class="control-group ${hasErrors(bean: post, field: 'title', 'error')} ">
		<label class="control-label" for="title">
			<g:message code="post.title.label" default="Title" />
			<span class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:textField name="title" value="${post?.title}" class="input input-xlarge" />
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: post, field: 'content', 'error')} ">
		<label class="control-label" for="title">
			<g:message code="post.content.label" default="Content" />				
		</label>
		<div class="controls">
	        <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-editor" data-toggle="tab">單元說明</a></li>
                <li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab-editor">
                    <div class="wmd-panel">
                        <div id="wmd-button-bar"></div>
                        <g:textArea name="content" cols="40" rows="20" value="${post?.content}" class="wmd-input enable-tabkey" id="wmd-input" />
                    </div>
                </div>
                <div class="tab-pane" id="tab-preview">
                    <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                </div>
            </div>
		</div>
	</div>
	<div class="control-group ${hasErrors(bean: post, field: 'tag', 'error')} ">
		<label class="control-label" for="tag">
			<g:message code="post.tag.label" default="Tag" />
		</label>
		<div class="controls">
			<g:textField name="tag" value="${post?.tag}" class="input input-large" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:link class="btn">${message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>
		</div>
	</div>
</g:form>
</body>
</html>
