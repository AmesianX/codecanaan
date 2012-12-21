<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="row">
    <div class="span12">

        <div class="pull-right">
            <g:link action="show" id="${schedule.id}" class="btn">
                <!--返回-->
                <i class="icon icon-arrow-left"></i>
                <g:message code="default.button.goback.label" />
            </g:link>
        </div>
        
        <div class="page-header">
            <h1>
                <i class="icon icon-tasks"></i>
                ${schedule?.title}
                <small><g:message code="schedule.label" default="Schedule" /></small>
            </h1>
        </div>

        <g:form action="update" id="${schedule.id}" method="post" class="form-horizontal">

            <div class="control-group">
                <label class="control-label" for="title">
                    <g:message code="schedule.title.label" />
                </label>
                <div class="controls">
                    <g:textField name="title" value="${schedule.title}" class="input input-xlarge" />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="name">
                    <g:message code="schedule.name.label" />
                </label>
                <div class="controls">
                    <g:textField name="name" value="${schedule.name}" class="input input-medium" />
                </div>
            </div>

            <div class="control-group">
                <label class="control-label" for="password">
                    <g:message code="schedule.password.label" />
                </label>
                <div class="controls">
                    <g:passwordField name="password" value="${schedule.password}" class="input input-medium" />
                </div>
            </div>

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

            <div class="btn-toolbar">
                <!--更新-->
                <g:submitButton name="actionUpdate" value="${message(code:'default.button.update.label')}" class="btn btn-primary" />

                <g:link action="show" id="${schedule.id}" class="btn"><g:message code="default.button.cancel.label" /></g:link>

                <!--刪除已選-->
                <g:submitButton name="actionDelete" value="${message(code:'default.button.delete.selected.label')}" class="btn btn-danger pull-right" onclick="return confirm('Are you sure???')" />
            </div>
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
