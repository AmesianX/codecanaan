<!DOCTYPE html>
<%@ page import="codecanaan.Course" %>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <sec:ifAllGranted roles="ROLE_STUDENT">
            <g:form action="register" method="post">
                <legend><g:message code="default.join.label" args="[message(code: 'schedule.label')]" /></legend>

                <label>
                    <g:message code="schedule.name.label" /><br/>
                    <g:textField name="name" value="" class="input input-medium" />
                </label>
                
                <label>
                    <g:message code="schedule.password.label" /><br/>
                    <g:passwordField name="password" value="" class="input input-small" />
                </label>

                <g:submitButton name="join" value="${message(code: 'default.join.text')}" class="btn" />

            </g:form>
        </sec:ifAllGranted>
    </div>
    <div class="span9">
        <sec:ifAnyGranted roles="ROLE_TEACHER">
            <!--功能清單-->
            <div class="btn-group pull-right">
                <a class="btn dropdown-toggle" data-toggle="dropdown">
                    <i class="icon icon-wrench"></i>
                    <g:message code="default.page.options.label" default="Options" />
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><!--新增學習進度-->
                        <g:link controller="schedule" action="create">
                            <i class="icon icon-group"></i>
                            <g:message code="default.add.label" default="Add {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
                        </g:link>
                    </li>
                </ul>
            </div>
        </sec:ifAnyGranted>

        <div class="page-header">
            <h1>
                <i class="icon icon-tasks"></i>
                <g:message code="default.my.label" default="My {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
            </h1>
        </div>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th width="30">#</th>
                    <th><g:message code="schedule.label" /></th>
                    <th width="100"><g:message code="schedule.user.count.text" /></th>
                </tr>
            </thead>
            <tbody>
                <g:if test="${!schedules}">
                    <tr>
                        <td colspan="3"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                    </tr>
                </g:if>
                <g:each in="${schedules}" var="schedule" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td><g:link controller="schedule" action="show" id="${schedule.id}">${schedule.title}</g:link></td>
                        <td><span class="muted">${statistics[schedule]}</span></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
