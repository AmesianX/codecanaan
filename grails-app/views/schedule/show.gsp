<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="row">
    <div class="span12">
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_AUTHOR">
            <!--功能清單-->
            <div class="btn-group pull-right">
                <a class="btn dropdown-toggle" data-toggle="dropdown">
                    <i class="icon icon-wrench"></i>
                    <g:message code="default.page.options.label" default="Options" />
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <g:link controller="schedule" action="delete" id="${schedule.id}" onclick="return confirm('Are you sure???')">
                            <i class="icon icon-book"></i>
                            <!--刪除學習進度-->
                            <g:message code="default.delete.label" default="Delete {0}" args="[message(code: 'schedule.label', default: 'Schedule')]" />
                        </g:link>
                    </li>
                    <li>
                        <g:link controller="schedule" action="join" id="${schedule.id}">
                            <i class="icon icon-book"></i>
                            <!--加入單元-->
                            <g:message code="default.join.label" default="Join {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                        </g:link>
                    </li>
                    <li>
                        <g:link controller="schedule" action="user" id="${schedule.id}">
                            <i class="icon icon-user"></i>
                            <!--加入使用者-->
                            <g:message code="default.join.label" default="Join {0}" args="[message(code: 'user.label')]" />
                        </g:link>
                    </li>
                </ul>
            </div>
        </sec:ifAnyGranted>

        <div class="page-header">
            <h1>
                <i class="icon icon-tasks"></i>
                ${schedule?.title}
                <small><g:message code="schedule.label" default="Schedule" /></small>
            </h1>
        </div>

        <g:form action="showUpdate" id="${schedule.id}" method="post">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th width="30">#</th>
                        <th><g:message code="lesson.title.label" /></th>
                        <th width="100"><g:message code="scheduleLesson.begin.label" /></th>
                        <th width="100"><g:message code="scheduleLesson.end.label" /></th>
                        <th width="100"><g:message code="scheduleLesson.deadline.label" /></th>
                        <th width="30" align="center"><i class="icon icon-check"></i></th>
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
                                ${link.lesson?.title}
                                <div class="muted"><small>${link.lesson?.course?.title}</small></div>
                                <g:hiddenField name="linkId" value="${link.id}" />
                            </td>
                            <td>
                                <div class="input-append date datepicker" data-date="${link.begin?.format('yyyy/MM/dd')}" data-date-format="yyyy/mm/dd">
                                    <input name="beginDate" class="span2" size="16" type="text" value="${link.begin?.format('yyyy/MM/dd')}" style="width:6em;font-size:9pt">
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                                <div class="input-append bootstrap-timepicker-component">
                                    <input name="beginTime" type="text" class="timepicker-default input-small" value="${link.begin?.format('HH:mm:ss')}" style="width:5em;font-size:9pt">
                                    <span class="add-on"><i class="icon-time"></i></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-append date datepicker" data-date="${link.end?.format('yyyy/MM/dd')}" data-date-format="yyyy/mm/dd">
                                    <input name="endDate" class="span2" size="16" type="text" value="${link.end?.format('yyyy/MM/dd')}" style="width:6em;font-size:9pt">
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                                <div class="input-append bootstrap-timepicker-component">
                                    <input name="endTime" type="text" class="timepicker-default input-small" value="${link.end?.format('HH:mm:ss')}" style="width:6em;font-size:9pt">
                                    <span class="add-on"><i class="icon-time"></i></span>
                                </div>
                            </td>
                            <td>
                                <div class="input-append date datepicker" data-date="${link.deadline?.format('yyyy/MM/dd')}" data-date-format="yyyy/mm/dd">
                                    <input name="deadlineDate" class="span2" size="16" type="text" value="${link.deadline?.format('yyyy/MM/dd')}" style="width:6em;font-size:9pt">
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                                <div class="input-append bootstrap-timepicker-component">
                                    <input name="deadlineTime" type="text" class="timepicker-default input-small" value="${link.deadline?.format('HH:mm:ss')}" style="width:6em;font-size:9pt">
                                    <span class="add-on"><i class="icon-time"></i></span>
                                </div>
                            </td>
                            <td>
                                <g:checkBox name="itemId" value="${link.id}" checked="false" />
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <!--更新-->
            <g:submitButton name="actionUpdate" value="${message(code:'default.button.update.label')}" class="btn btn-primary" />
            <!--刪除已選-->
            <g:submitButton name="actionDelete" value="${message(code:'default.button.delete.selected.label')}" class="btn" onclick="return confirm('Are you sure???')" />
        </g:form>
    </div>
</div>
<r:script>
(function() {
    $('.datepicker').datepicker();
    $('.timepicker-default').timepicker({
        minuteStep: 5,
        template: 'dropdown',
        showSeconds: true,
        showMeridian: false,
        defaultTime: 'value'
    });
})();
</r:script>
</body>
</html>
