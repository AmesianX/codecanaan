
<%@ page import="codecanaan.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-content" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list content">
			
				<g:if test="${content?.source}">
				<li class="fieldcontain">
					<span id="source-label" class="property-label"><g:message code="content.description.label" default="Source" /></span>
					
						<span class="property-value" aria-labelledby="source-label"><g:fieldValue bean="${content}" field="source"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.output}">
				<li class="fieldcontain">
					<span id="output-label" class="property-label"><g:message code="content.output.label" default="Output" /></span>
					
						<span class="property-value" aria-labelledby="output-label"><g:fieldValue bean="${content}" field="output"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="content.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${content}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.partial}">
				<li class="fieldcontain">
					<span id="partial-label" class="property-label"><g:message code="content.partial.label" default="Partial" /></span>
					
						<span class="property-value" aria-labelledby="partial-label"><g:fieldValue bean="${content}" field="partial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.answer}">
				<li class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="content.answer.label" default="Answer" /></span>
					
						<span class="property-value" aria-labelledby="answer-label"><g:fieldValue bean="${content}" field="answer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="content.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${content?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="content.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${content?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.priority}">
				<li class="fieldcontain">
					<span id="priority-label" class="property-label"><g:message code="content.priority.label" default="Priority" /></span>
					
						<span class="property-value" aria-labelledby="priority-label"><g:fieldValue bean="${content}" field="priority"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="content.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${content}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${content?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="content.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${content}" field="type"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${content?.id}" />
					<g:link class="edit" action="edit" id="${content?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
