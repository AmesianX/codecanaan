
<%@ page import="codecanaan.Content" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'content.label', default: 'Content')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-content" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-content" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="source" title="${message(code: 'content.description.label', default: 'Source')}" />
					
						<g:sortableColumn property="output" title="${message(code: 'content.output.label', default: 'Output')}" />
					
						<g:sortableColumn property="question" title="${message(code: 'content.question.label', default: 'Question')}" />
					
						<g:sortableColumn property="partial" title="${message(code: 'content.partial.label', default: 'Partial')}" />
					
						<g:sortableColumn property="answer" title="${message(code: 'content.answer.label', default: 'Answer')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'content.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contentList}" status="i" var="content">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${content.id}">${fieldValue(bean: content, field: "source")}</g:link></td>
					
						<td>${fieldValue(bean: content, field: "output")}</td>
					
						<td>${fieldValue(bean: content, field: "question")}</td>
					
						<td>${fieldValue(bean: content, field: "partial")}</td>
					
						<td>${fieldValue(bean: content, field: "answer")}</td>
					
						<td><g:formatDate date="${content.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contentTotal}" />
			</div>
		</div>
	</body>
</html>
