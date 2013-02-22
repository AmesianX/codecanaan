<html>
<head>
<meta name="layout" content="bootstrap" />
<title><g:message code="schedule.label" /></title>
</head>
<body>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12 clearlook-wrapper padding-around">
                <g:if test="${editable}">
                    <!--功能清單-->
                    <div class="btn-group pull-right">
                        <a class="btn dropdown-toggle" data-toggle="dropdown">
                            <i class="icon icon-wrench"></i>
                            <g:message code="default.page.options.label" default="Options" />
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="schedule" action="edit" id="${schedule.id}">
                                    <i class="icon icon-edit"></i>
                                    <!--修改學習進度-->
                                    修改進度設定
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="schedule" action="join" id="${schedule.id}">
                                    <i class="icon icon-book"></i>
                                    <!--加入單元-->
                                    增加授課內容
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="schedule" action="user" id="${schedule.id}">
                                    <i class="icon icon-user"></i>
                                    <!--加入使用者-->
                                    學員名單維護
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="schedule" action="delete" id="${schedule.id}" onclick="return confirm('Are you sure???')">
                                    <i class="icon icon-remove"></i>
                                    <!--刪除學習進度-->
                                    刪除學習進度
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </g:if>

                <div class="page-header">
                    <h1>
                        <i class="icon icon-tasks"></i>
                        ${schedule?.title}
                    </h1>
                </div>

                <dl class="dl-horizontal">
                    <dt><g:message code="schedule.name.label" /></dt>
                    <dd>${schedule.name}</dd>
                </dl>
                <dl class="dl-horizontal">
                    <dt><g:message code="schedule.school.label" /></dt>
                    <dd>${schedule.school}</dd>
                </dl>
                <dl class="dl-horizontal">
                    <dt><g:message code="schedule.department.label" /></dt>
                    <dd>${schedule.department}</dd>
                </dl>
                <dl class="dl-horizontal">
                    <dt>人數</dt>
                    <dd>${userSize}</dd>
                </dl>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="30">#</th>
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
                                    <div class="muted"><small>${link.lesson?.course?.title}</small></div>
                                    <g:hiddenField name="linkId" value="${link.id}" />
                                </td>
                                <td><small class="muted">${link.begin?.format('yyyy/MM/dd HH:mm:ss')}</small></td>
                                <td><small class="muted">${link.end?.format('yyyy/MM/dd HH:mm:ss')}</small></td>
                                <td><small class="muted">${link.deadline?.format('yyyy/MM/dd HH:mm:ss')}</small></td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
