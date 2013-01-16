<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${course.title}</title>
</head>
<body>
<div class="row-fluid">
    <div class="span12 clearlook-wrapper">
        <div class="span3 padding-leftside">
            <!--課程單元列表-->
            <g:render template="/course/menu" />
        </div>
        <div class="span9 justfont padding-rightside">
            <g:if test="${authoring&&params.editor}">
                <!--切換編輯介面-->
                <g:render template="course_editor"/>
            </g:if>
            <g:else>
                <g:render template="course"/>
            </g:else>
        </div>
    </div>
</div>
</body>
</html>
