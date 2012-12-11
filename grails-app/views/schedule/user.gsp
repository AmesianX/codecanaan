<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="schedule.label" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <g:form action="userUpdate" id="${schedule.id}" method="post">
            <legend>Add User</legend>

            E-mail Or Username
            <g:textField name="username" value="" />
            <g:submitButton name="actionAddUser" value="${message(code:'default.button.create.label')}" class="btn" />

        </g:form>

    </div>
    <div class="span9">

        <div class="pull-right">
            <g:link controller="schedule" action="show" id="${schedule.id}" class="btn"><g:message code="default.button.goback.label" /></g:link>
        </div>

        <table class="table">
            <thead>
                <tr>
                    <th width="30">#</th>
                    <th><g:message code="user.username.label" /></th>
                    <th><g:message code="user.fullName.label" /></th>
                    <th><g:message code="user.email.label" /></th>
                    <th width="100">Type</th>
                    <th width="100">Issue Date</th>
                </tr>
            </thead>
            <tbody>
                <g:if test="${!userSchedules}">
                    <tr>
                        <td colspan="3"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
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
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
