<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="admin.label" /></title>
</head>
<body>
<table class="table">
    <thead>
        <tr>
            <th>#</th>
            <th>帳號</th>
            <th>信箱</th>
            <th>全名</th>
            <th>註冊日期</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${users}" var="user" status="i">
            <tr>
                <td>${i+1}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.fullName}</td>
                <td>${user.dateCreated?.format('yyyy/MM/dd')}</td>
            </tr>
        </g:each>
    </tbody>
</table>
</body>
</html>
