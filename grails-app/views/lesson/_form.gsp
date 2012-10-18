<%@ page import="codecanaan.Lesson" %>



<div class="fieldcontain ${hasErrors(bean: lesson, field: 'contents', 'error')} ">
	<label for="contents">
		<g:message code="lesson.contents.label" default="Contents" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${lesson?.contents?}" var="c">
    <li><g:link controller="content" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="content" action="create" params="['lesson.id': lesson?.id]">${message(code: 'default.add.label', args: [message(code: 'content.label', default: 'Content')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: lesson, field: 'course', 'error')} required">
	<label for="course">
		<g:message code="lesson.course.label" default="Course" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="course" name="course.id" from="${codecanaan.Course.list()}" optionKey="id" required="" value="${lesson?.course?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: lesson, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="lesson.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${lesson?.name}"/>
</div>

