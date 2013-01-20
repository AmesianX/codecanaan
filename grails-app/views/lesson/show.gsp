<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>${lesson.title}</title>
</head>
<body>
<div class="row-fluid clearlook-wrapper">
    <div id="menu-container" class="span3 padding-leftside">
        <!--課程單元列表-->
        <g:render template="/course/menu" />
    </div>
    <div id="content-container" class="span9 padding-rightside justfont">
        <g:if test="${authoring&&params.editor}">
            <!--切換編輯介面-->
            <g:render template="lesson_editor"/>
        </g:if>
        <g:else>
            <g:render template="lesson"/>
        </g:else>
    </div>
</div>
</body>
</html>
