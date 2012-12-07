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
            <div class="input-append">
                <g:textField name="serialCode" value="" class="span2" placeholder="輸入課程序號" />
                <button type="submit" class="btn"><i class="icon icon-chevron-right"></i> 註冊</button>
            </div>            
        </g:form>
    </div>
    <div class="span9">
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_AUTHOR">
            <div class="btn-group pull-right">
                <a class="btn" href="#">
                    課程操作
                </a>
                <a class="btn dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <sec:ifAllGranted roles="ROLE_AUTHOR">
                        <li>
                            <g:link controller="course" action="create">
                                <i class="icon icon-book"></i>
                                新增課程
                            </g:link>
                        </li>
                    </sec:ifAllGranted>
                    <sec:ifAllGranted roles="ROLE_AUTHOR">
                        <li>
                            <g:link controller="schedule" action="create">
                                <i class="icon icon-group"></i>
                                新增群組
                            </g:link>
                        </li>
                    </sec:ifAllGranted>
                </ul>
            </div>
        </sec:ifAnyGranted>

        <div class="page-header">
            <h1><i class="icon icon-book"></i> 學習園地</h1>
        </div>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#course" data-toggle="tab"><i class="icon icon-book"></i> 我的課程</a></li>
            <li><a href="#group" data-toggle="tab"><i class="icon icon-group"></i> 我的群組</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="course">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="30">#</th>
                            <th>課程名稱</th>
                            <th width="100">代碼</th>
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
            <div class="tab-pane" id="group">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="30">#</th>
                            <th>群組名稱</th>
                            <th width="100">代碼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:if test="${!schedules}">
                            <tr>
                                <td colspan="3">您尚未加入任何群組</td>
                            </tr>
                        </g:if>
                        <g:each in="${schedules}" var="schedule" status="i">
                            <tr>
                                <td>${i+1}</td>
                                <td>${schedule.title}</td>
                                <td><span class="muted">${schedule.name}</span></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
