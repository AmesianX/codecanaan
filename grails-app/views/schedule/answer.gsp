<%@ page import="codecanaan.ContentType" %>
<html>
<head>
    <title><g:message code="schedule.label" /></title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">

    <div class="container">

        <div class="row">

            <div class="col-md-3">

                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-book"></i>
                        <h3>Table of Contents</h3>
                    </div>
                    <div class="widget-content">
                        <ul class="nav nav-pills nav-stacked">
                            <g:each in="${scheduleLesson.lesson?.contents}" var="row">
                                <li class="${row.id!=content?.id?:'active'}">
                                    <g:link action="answer" id="${scheduleLesson.id}" params="['content.id':row.id]">
                                        ${row.title}
                                    </g:link>
                                </li>
                            </g:each>
                        </ul>
                    </div>
                </div> <!-- /.widget -->

            </div> <!-- /.col-md-3 -->


            <div class="col-md-9">

                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pushpin"></i>
                        <h3>${content?.title}</h3>
                    </div>
                    <div class="widget-content">

                        <g:if test="${content}">

                            <ol class="breadcrumb">
                                <li>
                                    <g:link action="show" id="${schedule?.id}">${schedule?.title}</g:link>
                                </li>
                                <li>
                                    <g:link action="answer" id="${scheduleLesson.id}">${lesson?.title}</g:link>
                                </li>
                                <li class="active">${content?.title}</li>
                            </ol>

                            <div class="page-header">
                                <h2>
                                    ${content.title}
                                    <small><g:message code="content.contentType.${content.type}" /></small>
                                </h2>
                            </div>

                            <!-- Justfont -->
                            <div class="justfont">
                                <div class="markdown-source">${content.description?.encodeAsHTML()}</div>
                            </div>

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

                            <ol class="breadcrumb">
                                <li>
                                    <g:link action="show" id="${schedule?.id}">${schedule?.title}</g:link>
                                </li>
                                <li class="active">${lesson?.title}</li>
                            </ol>

                            <div class="page-header">
                                <h2>${scheduleLesson.lesson?.title}</h2>
                            </div>
                            <div class="markdown-source">${scheduleLesson.lesson.description?.encodeAsHTML()}</div>
                        </g:else>

                    </div>
                </div> <!-- /.widget -->

            </div> <!-- /.col-md-9 -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

</body>
</html>
