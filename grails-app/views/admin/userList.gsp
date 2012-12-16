<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="admin.label" /></title>
</head>
<body>
<div class="row">
    <div class="span3">
        <table class="table table-bordered table-condensed">
            <tbody>
                <g:each var="row" in="${statistics}">
                    <tr>
                        <td>${row.key}</td>
                        <td>${row.value}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
    <div class="span9">
        <div class="btn-group pull-right">
            <g:link controller="admin" action="userAdd" class="btn">
                <i class="icon icon-user"></i>
                <!--新增使用者-->
                <g:message code="default.add.label" args="[message(code:'user.label')]" />
            </g:link>
        </div>
        <form class="form-search">
          <div class="input-append">
            <input type="text" class="span2 search-query">
            <button type="submit" class="btn">Search</button>
          </div>
        </form>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th width="30">#</th>
                    <th width="80"><g:message code="user.username.label" /></th>
                    <th><g:message code="user.email.label" /></th>
                    <th width="90"><g:message code="user.fullName.label" /></th>
                    <th width="100"><g:message code="default.dateCreated.label" /></th>
                    <th width="150"><g:message code="user.authorities.label" /></th>
                    <th width="150"></th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${users}" var="user" status="i">
                    <tr>
                        <td><small>${offset+i+1}</small></td>
                        <td>${user.username}</td>
                        <td><small>${user.email}</small></td>
                        <td><small>${user.fullName}</small></td>
                        <td><small>${user.dateCreated?.format('yyyy/MM/dd')}</small></td>
                        <td>
                            <small>${user.authorities.collect {it.authority}?.first()}</small>
                            <span class="badge badge-info" rel="tooltip" title="${user.authorities.collect {it.authority}?.join(', ')}">${user.authorities?.size()}</span>
                        </td>
                        <td>
                            <a href="${request.contextPath}/j_spring_security_switch_user?j_username=${user.username}" class="btn btn-small">Switch</a>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <g:paginate controller="admin" action="userList" total="${userCount}" class="pagination-centered" />
    </div>
</div>
</body>
</html>
