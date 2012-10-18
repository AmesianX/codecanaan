<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
	<div class="btn-group pull-right">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
			課程操作
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><g:link controller="course" action="create">新增課程</g:link></li>
		</ul>
	</div>
    <h3>我的課程</h3>
    <ul>
        <g:each in="${courseList}" var="course">
            <li><g:link controller="course" action="show" id="${course.id}">${course.title}</g:link> <span class="muted">(${course.name})</span></li>
        </g:each>
    </ul>
</div>
</body>
</html>
