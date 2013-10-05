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
                        <g:form action="modifySave" id="${schedule.id}" method="post" class="form-horizontal">

                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th width="40">#</th>
                                        <th><g:message code="lesson.title.label" /></th>
                                        <th width="120"><g:message code="scheduleLesson.begin.label" /></th>
                                        <th width="120"><g:message code="scheduleLesson.end.label" /></th>
                                        <th width="120"><g:message code="scheduleLesson.deadline.label" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <g:each in="${scheduleLessons}" var="link" status="i">
                                        <tr>
                                            <td>
                                                <g:checkBox name="itemId" value="${link.id}" checked="true" />
                                                <g:hiddenField name="linkId" value="${link.id}" />
                                            </td>
                                            <td>
                                                ${link.lesson?.title}<br/>
                                                <span class="text-muted">${link.lesson?.course?.title}</span>
                                            </td>
                                            <td>
                                                <input name="beginDate" type="text" value="${link.begin?.format('yyyy/MM/dd')}" class="form-control">
                                                <input name="beginTime" type="text" value="${link.begin?.format('HH:mm:ss')}" class="form-control">
                                            </td>
                                            <td>
                                                <input name="endDate" type="text" value="${link.end?.format('yyyy/MM/dd')}" class="form-control">
                                                <input name="endTime" type="text" value="${link.end?.format('HH:mm:ss')}" class="form-control">
                                            </td>
                                            <td>
                                                <input name="deadlineDate" type="text" value="${link.deadline?.format('yyyy/MM/dd')}" class="form-control">
                                                <input name="deadlineTime" type="text" value="${link.deadline?.format('HH:mm:ss')}" class="form-control">
                                            </td>
                                        </tr>
                                    </g:each>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5" class="text-right">
                                            <!--更新-->
                                            <g:submitButton name="actionUpdate" value="${message(code:'default.button.update.label')}" class="btn btn-primary" />

                                            <!-- Cancel -->
                                            <g:link action="show" id="${schedule.id}" class="btn btn-default">
                                                <g:message code="default.button.cancel.label" />
                                            </g:link>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>

                        </g:form>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-3">
                <div class="well">
                    <h4>
                        <i class="icon-lightbulb"></i>&nbsp;
                        Extra Info
                    </h4>

                    <p>繳交日期結束後，系統將會自動公佈解答給學員查詢。</p>
                </div>
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

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
