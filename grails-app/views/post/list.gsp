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
    <div class="span3 bs-docs-sidebar">
        <ul class="nav nav-list bs-docs-sidenav">
            <li class="${type==codecanaan.PostType.ANNOUNCE?'active':''}">
                <g:link action="list" params="[type: 'ANNOUNCE']">
                    <i class="icon icon-chevron-right"></i>
                    <g:message code="postType.ANNOUNCE.label" />
                </g:link>
            </li>
            <li class="${type==codecanaan.PostType.STATIC?'active':''}">
                <g:link action="list" params="[type: 'STATIC']">
                    <i class="icon icon-chevron-right"></i>
                    <g:message code="postType.STATIC.label" />
                </g:link>
            </li>
        </ul>

        <hr class="soften" />
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <g:link action="create" params="[type:type]" class="btn"><g:message code="default.create.label" args="[message(code:'post.label')]" /></g:link>
        </sec:ifAnyGranted>
    </div>
    <div class="span9">
        <table class="table">
            <thead>
                <tr>
                    <th width="40">#</th>
                    <th><g:message code="post.title.label" /></th>
                    <th width="100"><g:message code="post.dateCreated.label" /></th>
                    <th width="60"><g:message code="post.hits.label" /></th>
                </tr>
            </thead>
            <tbody>
                <g:if test="${!posts}">
                    <tr>
                        <td colspan="4"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                    </tr>
                </g:if>
                <g:each in="${posts}" var="post" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td><g:link controller="post" action="show" params="[name: post?.name]">${post.title}</g:link></td>
                        <td><g:formatDate date="${post.lastUpdated}" type="date" style="SHOROT" /></td>
                        <td><span class="muted">${post.hits}</span></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
