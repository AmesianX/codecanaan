<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <g:form action="register" method="post">
            <legend>註冊新課程</legend>
            課程序號<br/>
            <g:textField name="serialCode" value="" class="input input-medium" placeholder="輸入有效的課程序號" /><br/>
            <g:submitButton name="submit" value="註冊課程" class="btn" />
        </g:form>
    </div>
    <div class="span9">
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
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>課程名稱</th>
                    <th>代碼</th>
                </tr>
            </thead>
            <tbody>
                <g:if test="${!courses}">
                    <tr>
                        <td colspan="3">您尚未註冊任何課程</td>
                    </tr>
                </g:if>
                <g:each in="${courses}" var="course" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td><g:link controller="course" action="show" id="${course.id}">${course.title}</g:link></td>
                        <td><span class="muted">${course.name}</span></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
