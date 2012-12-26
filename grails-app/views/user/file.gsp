<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.file.management.label" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <!--資訊-->
    </div>
    <div class="span9">
        <g:form action="fileUpload" method="post" enctype="multipart/form-data">
            <input type="file" name="file" />
        </g:form>
    </div>
</div>
</body>
</html>
