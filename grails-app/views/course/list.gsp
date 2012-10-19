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
    <sec:ifLoggedIn>
        <div class="btn-group pull-right">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                課程操作
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><g:link controller="course" action="create">新增課程</g:link></li>
            </ul>
        </div>
    </sec:ifLoggedIn>
    <h3>我的課程</h3>
    <ul>
        <g:each in="${courses}" var="course">
            <li><g:link controller="course" action="show" id="${course.id}">${course.title}</g:link> <span class="muted">(${course.name})</span></li>
        </g:each>
    </ul>
    <hr class="soften" />
    <g:form action="register" method="post">
        <legend>註冊新課程</legend>
        請輸入一組有效的課程序號<br/>
        <g:textField name="serialCode" value="" /><br/>
        <g:submitButton name="submit" value="註冊課程" class="btn" />
    </g:form>
</div>
</body>
</html>
