<%@ page import="codecanaan.User" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${content?.title}</title>
</head>
<body>
<div class="row">
    <div class="span3">
    </div>
    <div class="span9">
        <h2>${content?.title}</h2>
        <div class="markdown-source">${content?.description?.encodeAsHTML()}</div>
        
        <hr class="soften" />
        
        <small><g:message code="content.lastUpdated.label" default="Last Updated" />: ${content?.lastUpdated}</small>
    </div>
</div>
</body>
</html>
