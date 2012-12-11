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
                    <th>學習進度</th>
                    <th width="100">代碼</th>
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
                        <td><span class="muted">${schedule.name}</span></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
