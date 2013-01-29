<html>
<head>
<meta name="layout" content="bootstrap" />
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <!--empty-->
        </div>
        <div class="span9 clearlook-wrapper padding-around">

            <div class="page-header">
                <h1>
                    <i class="icon icon-tasks"></i>
                    ${schedule?.title}
                    <small><g:message code="schedule.label" default="Schedule" /></small>
                </h1>
            </div>

            <g:form action="joinSave" id="${schedule.id}" method="post">
                <g:each in="${courses}" var="course" status="i">
                    <h3>${course.title}</h3>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th width="30">#</th>
                                <th><g:message code="lesson.title.label" default="Lesson Title" /></th>
                                <th width="30" align="center"><i class="icon icon-check"></i></th>
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
                                    <td>${lesson.title}</td>
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
                    </table>
                </g:each>
                <g:submitButton name="save" value="${message(code: 'default.save.label', default:'Save')}" class="btn btn-primary" />
                <g:link controller="schedule" action="show" id="${schedule.id}" class="btn" ><g:message code="default.cancel.label" default="Cancel" /></g:link>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
