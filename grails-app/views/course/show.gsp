<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${course.title}</title>
</head>
<body>
<div class="row">
    <div class="span3">
        <!--課程單元列表-->
        <g:render template="/course/menu" />
    </div>
    <div class="span9 justfont">
        <g:if test="${authoring&&params.editor}">
            <!--切換編輯介面-->
            <g:render template="course_editor"/>
        </g:if>
        <g:else>
            <g:render template="course"/>
        </g:else>
    </div>
</div>
</body>
</html>
