<%@ page import="codecanaan.User" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${post?.title}</title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 clearlook-wrapper">
        <div class="span3 padding-leftside">
            <div class="margin-below">
                <google:adsense width="160" height="600" />
            </div>
        </div>
        <div class="span9 padding-rightside justfont">
            <div class="page-header">
                <h2>${post?.title}</h2>
            </div>
            
            <div class="markdown-source">${post?.content?.encodeAsHTML()}</div>
            
            <hr />
            
            <small><g:message code="post.lastUpdated.label" default="Last Updated" />: <g:formatDate date="${post?.lastUpdated}" type="datetime" style="MEDIUM" /></small>
            
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <div class="padding-around">
                    <!--controls-->
                    <g:if test="${!post?.id}">
                        <g:link controller="post" action="create" params="[name: post?.name]" class="btn btn-small"><g:message code="default.button.create.label" /></g:link>
                    </g:if>
                    <g:else>
                        <g:link controller="post" action="edit" id="${post?.id}" class="btn btn-small"><g:message code="default.button.edit.label" /></g:link>
                    </g:else>
                </div>
            </sec:ifAllGranted>
        </div>
    </div>
</div>
</body>
</html>
