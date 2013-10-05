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
                                        <td colspan="6"><div style="text-align:center"><g:message code="default.empty.label" /></div></td>
                                    </tr>
                                </g:if>
                                <g:each in="${scheduleLessons}" var="link" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td>
                                            <div class="btn-group pull-right">
                                                <schedule:answerAvailable test="${link}">
                                                    <!--觀看解答-->
                                                    <g:link action="answer" id="${link.id}" class="btn">
                                                        <g:message code="schedule.answer.text" />
                                                    </g:link>
                                                </schedule:answerAvailable>

                                                <sec:ifAllGranted roles="ROLE_TEACHER">
                                                    <g:link action="report" id="${link.id}" class="btn">
                                                        報表
                                                    </g:link>
                                                </sec:ifAllGranted>
                                            </div>

                                            <g:if test="${today >= link.begin && today <= link.end}">
                                                <g:link controller="lesson" action="show" id="${link.lesson.id}">${link.lesson?.title}</g:link>
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
                                            <g:formatDate date="${link.begin}" type="time" style="SHORT" />
                                        </td>
                                        <td>
                                            <g:formatDate date="${link.end}" type="date" style="SHORT" /><br/>
                                            <g:formatDate date="${link.end}" type="time" style="SHORT" />
                                        </td>
                                        <td>
                                            <g:formatDate date="${link.deadline}" type="date" style="SHORT" /><br/>
                                            <g:formatDate date="${link.deadline}" type="time" style="SHORT" />
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                            <g:if test="${editable}">
                                <tfoot>
                                    <tr>
                                        <td colspan="5" class="text-right">
                                            <g:link controller="schedule" action="join" id="${schedule.id}">
                                                <i class="icon-plus"></i>&nbsp;
                                                增加新單元
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
                                        <g:link action="user" id="${schedule.id}">
                                            ${userSize}&nbsp;
                                            <i class="icon-user"></i>
                                        </g:link>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <g:message code="default.dateCreated.label" />
                                    </th>
                                    <td>
                                        <g:formatDate type="DATE" date="${schedule.dateCreated}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <g:if test="${editable}">
                            <!--功能清單-->
                            <div class="btn-group pull-right">
                                <g:link action="edit" id="${schedule.id}" class="btn btn-default">
                                    <i class="icon icon-edit"></i>&nbsp;
                                    <g:message code="default.button.modify.label" />
                                </g:link>
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <g:link controller="schedule" action="delete" id="${schedule.id}" onclick="return confirm('Are you sure???')">
                                            <i class="icon icon-remove"></i>&nbsp;
                                            <g:message code="default.button.remove.label" />
                                        </g:link>
                                    </li>
                                </ul>
                            </div>

                            <br />
                            <br />
                        </g:if>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
