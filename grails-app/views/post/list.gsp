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
    </div>
    <div class="span9">
        <h3>頁面列表</h3>
        <table class="table">
            <thead>
                <tr>
                    <th width="40">#</th>
                    <th>標題</th>
                    <th width="100">日期</th>
                    <th width="60">瀏覽次數</th>
                </tr>
            </thead>
            <tbody>
                <g:if test="${!posts}">
                    <tr>
                        <td colspan="4">沒有任何頁面</td>
                    </tr>
                </g:if>
                <g:each in="${posts}" var="post" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td><g:link controller="post" action="show" params="[name: post?.name]">${post.title}</g:link></td>
                        <td><g:formatDate format="yyyy-MM-dd" date="${post.lastUpdated}" /></td>
                        <td><span class="muted">${post.hits}</span></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
