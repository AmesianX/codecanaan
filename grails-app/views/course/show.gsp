<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <!--顯示課程列表-->
        <ul class="nav nav-pills nav-stacked">
            <li class="disabled"><a href="#">${course?.title}</a></li>
            <li class="${!lesson?'active':''}"><g:link controller="course" action="show" id="${course?.id}">課程首頁</g:link></li>
            <g:each in="${course?.lessons}" var="${row}" status="i">
                <li class="${row.id==lesson?.id?'active':''}">
                    <g:link controller="course" action="show" id="${course?.id}" params="[lessonId: row.id]"><i class="icon icon-book"></i> ${row.title}</g:link>
                </li>
            </g:each>
        </ul>
    </div>
    <div class="span9">
        <g:if test="${content}">
            <g:render template="content"/>
        </g:if>
        <g:elseif test="${lesson}">
            <g:render template="lesson"/>
        </g:elseif>
        <g:else>
            <g:render template="course"/>
        </g:else>
    </div>
</div>
<r:script>
(function () {
    var converter = new Markdown.Converter();
    $('div.markdown-source').each(function(index) {
        $(this).html(converter.makeHtml($(this).text()));
    });

    if ($('.wmd-panel').size() > 0) {
        var converter1 = Markdown.getSanitizingConverter();
        var editor1 = new Markdown.Editor(converter1);
        editor1.run();
    }

    var editor = CodeMirror.fromTextArea(document.getElementById("sourceCode"), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "text/x-csrc",
        indentUnit: 4
    });

    hljs.initHighlightingOnLoad();

    $('#play').click(function() {
        if (editor) {
            $.ajax({
                type: 'post',
                url: 'http://localhost:${jettyPort}/',
                data: {
                    action: 'play',
                    sourceType: $('#sourceType').val(),
                    sourcePath: $('#sourcePath').val(),
                    sourceCode: editor.getValue()
                },
                timeout: 180*1000,
                success: function(data) {
                    //alert("程式執行完畢");
                    $('#program-output').text(data.result.data.dump);
                },
                error: function(data) {
                    alert('Error: could not execute program.');
                } 
            });
        }
        return false;
    });
})();
</r:script>
</body>
</html>
