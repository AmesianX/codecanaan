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
                        <i class="icon icon-tasks"></i>
                        <h3>${schedule.title}</h3>
                    </div>
                    <div class="widget-content">
                        <ul class="nav nav-pills nav-stacked">
                        <g:each in="${courses}" var="course" status="i">
                            <li>
                                <a href="#${course.name}">${course.title}</a>
                            </li>
                        </g:each>
                        </ul>
                    </div>
                </div> <!-- /.widget -->

            </div> <!-- /.col-md-3 -->

            <div class="col-md-9">

                <g:form action="joinSave" id="${schedule.id}" method="post">
                    <g:each in="${courses}" var="course" status="i">

                        <div class="widget widget-table stacked" id="${course.name}">
                            <div class="widget-header">
                                <i class="icon icon-book"></i>
                                <h3>${course.title}</h3>
                            </div>
                            <div class="widget-content">
                                <table class="table table-bordered table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th width="40">#</th>
                                            <th>
                                                <g:message code="lesson.title.label" />
                                            </th>
                                            <th width="50" align="center">
                                                <i class="icon icon-check"></i>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <g:if test="${!courses}">
                                            <tr>
                                                <td colspan="3"><g:message code="default.empty.label" /></td>
                                            </tr>
                                        </g:if>
                                        <g:each in="${course.lessons}" var="lesson" status="j">
                                            <tr>
                                                <td>${j+1}</td>
                                                <td>
                                                    <div class="combine-check" data-lesson="${lesson.id}" style="cursor:pointer">${lesson.title}</div>
                                                </td>
                                                <td>
                                                    <g:if test="${existsLessonIdList.contains(lesson.id)}">
                                                        <i class="icon icon-check"></i>
                                                    </g:if>
                                                    <g:else>
                                                        <g:checkBox name="lesson.id" value="${lesson.id}" checked="false" />
                                                    </g:else>
                                                </td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3" class="text-right">
                                                <g:submitButton name="save" value="${message(code: 'default.save.label', default:'Save')}" class="btn btn-primary" />

                                                <g:link controller="schedule" action="show" id="${schedule.id}" class="btn btn-default" ><g:message code="default.cancel.label" default="Cancel" /></g:link>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div> <!-- /.widget -->
                        
                    </g:each>
                    
                </g:form>

                

            </div> <!-- /.col-md-9 -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

<r:script>
$(function() {
    $('.combine-check').click(function() {
        $('input[name="lesson.id"][value="'+$(this).data('lesson')+'"]').trigger('click');
    });
});
</r:script>

</body>
</html>
