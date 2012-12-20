<!DOCTYPE html>
<%@ page import="codecanaan.ContentType" %>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="row">

    <div class="span3">
        <ul class="nav nav-pills nav-stacked">
            <li class="disabled">
                <g:link action="answer" id="${scheduleLesson.id}">
                    ${scheduleLesson.lesson?.title}
                    <small><g:message code="schedule.answer.text" /></small>
                </g:link>
            </li>
            <g:each in="${scheduleLesson.lesson?.contents}" var="content">
                <li>
                    <g:link action="answer" id="${scheduleLesson.id}" params="['content.id':content.id]">
                        ${content.title}
                    </g:link>
                </li>
            </g:each>
        </ul>
    </div>
    <div class="span9">
        
        <g:if test="${content}">
            <div class="page-header">
                <h2>
                    ${content.title}
                    <small><g:message code="content.contentType.${content.type}" /></small>
                </h2>
            </div>

            <div class="markdown-source">${content.description?.encodeAsHTML()}</div>

            <hr />

            <g:if test="${content.type==ContentType.CODE}">
                Source Code
                <pre><code>${content.sourceCode?.encodeAsHTML()}</code></pre>
                Output
                <pre>${content.answer?.encodeAsHTML()}</pre>
            </g:if>
            <g:elseif test="${content.type==ContentType.QUIZ}">
                Answer
                <pre>${content.answer?.encodeAsHTML()}</pre>
            </g:elseif>
            <g:else>
                <g:message code="default.none.text" />
            </g:else>
        </g:if>
        <g:else>
            <div class="page-header">
                <h2>${scheduleLesson.lesson?.title}</h2>
            </div>
            <div class="markdown-source">${scheduleLesson.lesson.description?.encodeAsHTML()}</div>
        </g:else>

    </div>
</div>
</body>
</html>
