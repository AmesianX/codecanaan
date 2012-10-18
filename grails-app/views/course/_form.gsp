<%@ page import="codecanaan.Course" %>



<div class="fieldcontain ${hasErrors(bean: course, field: 'contents', 'error')} ">
	<label for="contents">
		<g:message code="course.contents.label" default="Contents" />
		
	</label>
	<g:select name="contents" from="${codecanaan.Content.list()}" multiple="multiple" optionKey="id" size="5" value="${course?.contents*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: course, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${course?.name}"/>
</div>

