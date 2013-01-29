<html>
<head>
<meta name="layout" content="bootstrap" />
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <g:form action="userUpdate" id="${schedule.id}" method="post">
                <legend>新增 / Add</legend>

                <p>輸入電子郵件信箱，將一位學生增加到此課程進度。</p>
                
                E-mail
                <g:textField name="username" value="" />
                <g:submitButton name="actionAddUser" value="${message(code:'default.button.create.label')}" class="btn btn-primary" />

            </g:form>

        </div>
        <div class="span9 clearlook-wrapper padding-around">

            <div class="margin-below pull-right">
                <!--返回-->
                <g:link controller="schedule" action="show" id="${schedule.id}" class="btn">
                    <i class="icon icon-chevron-left"></i>
                    <g:message code="default.button.goback.label" />
                </g:link>
            </div>

            <g:form action="userAction" id="${schedule.id}" method="post">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th width="30">#</th>
                            <th><g:message code="user.username.label" /></th>
                            <th><g:message code="user.fullName.label" /></th>
                            <th><g:message code="user.email.label" /></th>
                            <th width="100">身分</th>
                            <th width="100">建立日期</th>
                            <th><i class="icon icon-check"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:if test="${!userSchedules}">
                            <tr>
                                <td colspan="7"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                            </tr>
                        </g:if>
                        <g:each in="${userSchedules}" var="link" status="i">
                            <tr>
                                <td>${i+1}</td>
                                <td>${link.user?.username}</td>
                                <td>${link.user?.fullName}</td>
                                <td>${link.user?.email}</td>
                                <td>${link.roleType}</td>
                                <td>${link.dateCreated?.format('yyyy/MM/dd')}</td>
                                <td>
                                    <g:if test="${link.roleType!=codecanaan.ScheduleRoleType.OWNER}">
                                        <g:checkBox name="selected" value="${link.id}" checked="false" />
                                    </g:if>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>

                <div class="btn-toolbar pull-right">
                    <button name="delete" type="submit" class="btn btn-danger" onclick="alert('Are you sure???');">
                        <i class="icon icon-remove"></i>
                        ${message(code:'default.button.delete.label')}
                    </button>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
