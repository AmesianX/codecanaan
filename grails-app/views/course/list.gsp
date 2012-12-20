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
            <legend><g:message code="course.registration.text" /></legend>
            <div class="input-append">
                <g:textField name="serialCode" value="" class="span2" placeholder="${message(code:'course.registration.placeholder.text')}" />
                <button type="submit" class="btn">
                    <i class="icon icon-chevron-right"></i>
                    <!--註冊-->
                    <g:message code="default.register.text" />
                </button>
            </div>            
        </g:form>
    </div>
    <div class="span9">
        <sec:ifAnyGranted roles="ROLE_AUTHOR">
            <!--功能清單-->
            <div class="btn-group pull-right">
                <a class="btn dropdown-toggle" data-toggle="dropdown">
                    <i class="icon icon-wrench"></i>
                    <g:message code="default.page.options.label" default="Options" />
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <sec:ifAllGranted roles="ROLE_AUTHOR">
                        <li>
                            <g:link controller="course" action="create">
                                <i class="icon icon-book"></i>
                                <!--新增課程-->
                                <g:message code="default.add.label" default="Add {0}" args="[message(code: 'course.label', default: 'Course')]" />
                            </g:link>
                        </li>
                    </sec:ifAllGranted>
                </ul>
            </div>
        </sec:ifAnyGranted>

        <div class="page-header">
            <h1>
                <i class="icon icon-book"></i>
                <g:message code="default.my.label" default="My {0}" args="[message(code: 'course.label', default: 'Course')]" />
            </h1>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th width="30">#</th>
                    <th><g:message code="course.title.label" /></th>
                    <th width="100">ID</th>
                </tr>
            </thead>
            <tbody>
               <g:if test="${!courses}">
                    <tr>
                        <td colspan="3"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
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
