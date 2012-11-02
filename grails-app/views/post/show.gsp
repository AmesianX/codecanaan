<%@ page import="codecanaan.User" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${post?.title}</title>
</head>
<body>
<div class="row">
    <div class="span3">
    </div>
    <div class="span9">
        <h2>${post?.title}</h2>
        <div class="markdown-source">${post?.content}</div>
        
        <hr class="soften" />
        
        <small><g:message code="post.lastUpdated.label" default="Last Updated" />: ${post?.lastUpdated}</small>
        
        <div>
            <!--controls-->
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:if test="${!post?.id}">
                    <g:link controller="post" action="create" params="[name: post?.name]" class="btn">建立</g:link>
                </g:if>
                <g:else>
                    <g:link controller="post" action="edit" id="${post?.id}" class="btn">修改</g:link>
                </g:else>
            </sec:ifAllGranted>
        </div>
    </div>
</div>
</body>
</html>
