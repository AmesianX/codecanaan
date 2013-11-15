<html>
<head>
    <title>${schedule?.title}</title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-9">
                <div class="widget widget-table stacked">
                    <div class="widget-header">
                        <i class="icon icon-tasks"></i>
                        <h3>${schedule?.title}</h3>

                    </div>
                    <div class="widget-content">

                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th width="40">#</th>
                                    <th><g:message code="lesson.title.label" /></th>
                                    <th width="100"><g:message code="scheduleLesson.begin.label" /></th>
                                    <th width="100"><g:message code="scheduleLesson.end.label" /></th>
                                    <th width="100"><g:message code="scheduleLesson.deadline.label" /></th>
                                </tr>
                            </thead>
                            <tbody>
                               <g:if test="${!scheduleLessons}">
                                    <tr>
                                        <td colspan="6" class="text-center">
                                            <g:message code="default.empty.label" />
                                        </td>
                                    </tr>
                                </g:if>
                                <g:each in="${scheduleLessons}" var="link" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td>
                                            <div class="btn-group pull-right">
                                                <schedule:answerAvailable test="${link}">
                                                    <!--觀看解答-->
                                                    <g:link action="answer" id="${link.id}" class="btn btn-default">
                                                        <g:message code="schedule.answer.text" />
                                                    </g:link>
                                                </schedule:answerAvailable>

                                                <sec:ifAllGranted roles="ROLE_TEACHER">
                                                    <g:link action="lessonReport" id="${link.id}" class="btn btn-default">
                                                        報表
                                                    </g:link>
                                                </sec:ifAllGranted>
                                            </div>

                                            <g:if test="${today >= link.begin && today <= link.end}">
                                                <g:link controller="lesson" action="show" id="${link.lesson.id}">
                                                <div>
                                                    ${link.lesson?.title}
                                                </div>
                                                </g:link>
                                            </g:if>
                                            <g:else>
                                                ${link.lesson?.title}
                                            </g:else>
                                            <div class="text-muted">
                                                <small>${link.lesson?.course?.title}</small>
                                            </div>
                                            <g:hiddenField name="linkId" value="${link.id}" />
                                        </td>
                                        <td>
                                            <g:formatDate date="${link.begin}" type="date" style="SHORT" /><br/>
                                            <g:formatDate date="${link.begin}" type="time" timeStyle="SHORT" />
                                        </td>
                                        <td>
                                            <g:formatDate date="${link.end}" type="date" style="SHORT" /><br/>
                                            <g:formatDate date="${link.end}" type="time" timeStyle="SHORT" />
                                        </td>
                                        <td>
                                            <g:formatDate date="${link.deadline}" type="date" style="SHORT" /><br/>
                                            <g:formatDate date="${link.deadline}" type="time" timeStyle="SHORT" />
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                            <g:if test="${editable}">
                                <tfoot>
                                    <tr>
                                        <td colspan="5" class="text-right">
                                            <g:link action="join" id="${schedule.id}">
                                                <i class="icon-plus"></i>&nbsp;
                                                <g:message code="default.button.add.label" />
                                            </g:link>
                                            
                                            <!-- Seperate -->
                                            <span class="text-muted">&nbsp;|&nbsp;</span>
                                            
                                            <g:link action="modify" id="${schedule.id}">
                                                <i class="icon-pencil"></i>&nbsp;
                                                <g:message code="default.button.modify.label" />
                                            </g:link>

                                            <!-- Seperate -->
                                            <span class="text-muted">&nbsp;|&nbsp;</span>

                                            <g:link action="report" id="${schedule.id}">
                                                <i class="icon-bar-chart"></i>&nbsp;
                                                Report
                                            </g:link>

                                        </td>
                                    </tr>
                                </tfoot>
                            </g:if>
                        </table>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>Basic Info</h3>
                    </div>
                    <div class="widget-content">

                        <table class="table">
                            <tbody>
                                <tr>
                                    <th width="100"><g:message code="schedule.title.label" /></th>
                                    <td>${schedule.title}</td>
                                </tr>
                                <tr>
                                    <th><g:message code="schedule.stage.label" /></th>
                                    <td>${schedule.stage}</td>
                                </tr>
                                <tr>
                                    <th><g:message code="schedule.name.label" /></th>
                                    <td>${schedule.name}</td>
                                </tr>
                                <tr>
                                    <th>
                                        <g:message code="schedule.school.label" />
                                    </th>
                                    <td>${schedule.school}</td>
                                </tr>
                                <tr>
                                    <th>
                                        <g:message code="schedule.department.label" />
                                    </th>
                                    <td>${schedule.department}</td>
                                </tr>

                                <tr>
                                    <th>
                                        <g:message code="schedule.user.count.text" />
                                    </th>
                                    <td>
                                        <g:if test="${editable}">
                                            <g:link action="user" id="${schedule.id}">
                                            <div>
                                                ${userSize}&nbsp;
                                                <i class="icon-user"></i>
                                            </div>
                                            </g:link>
                                        </g:if>
                                        <g:else>
                                            ${userSize}&nbsp;
                                            <i class="icon-user"></i>
                                        </g:else>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <g:message code="default.dateCreated.label" />
                                    </th>
                                    <td>
                                        <g:formatDate type="date" style="SHORT" date="${schedule.dateCreated}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <g:if test="${editable}">
                            <g:link action="edit" id="${schedule.id}" class="btn btn-default pull-right">
                                <i class="icon icon-edit"></i>&nbsp;
                                <g:message code="default.button.modify.label" />
                            </g:link>
                        </g:if>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
