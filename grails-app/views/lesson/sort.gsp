<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title>Sort</title>
</head>
<body>
<div class="row">
    <div class="span3">
        請用滑鼠上下拖曳右邊的內容清單，以重新調整內容排序。
    </div>
    <div class="span9">
        <g:form controller="lesson" action="sortUpdate" id="${lesson.id}" method="post">
            <legend>${lesson.title}</legend>
            <ul id="sortable" class="nav nav-tabs nav-stacked">
                <g:each in="${lesson.contents}" var="content" status="i">
                    <li><a href="#"><i class="icon icon-sort"></i> ${content.title}<g:hiddenField name="priority" value="${content.id}" /></a></li>
                </g:each>
            </li>

            <br/>
            <g:submitButton name="save" value="${message(code: 'default.button.update.label', default: 'Update')}" class="btn btn-primary" />
        </g:form>
    </div>
</div>
<r:script>
$(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
});
</r:script>
</body>
</html>
