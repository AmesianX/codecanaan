<!DOCTYPE html>
<html>
<head>
    <title><g:message code="default.administration.text" /></title>
    <meta name="layout" content="baseadmin">
</head>
<body>
<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <i class="icon-bar-chart"></i>
                        <h3>權限統計</h3>
                    </div>
                    <div class="widget-content">
                        <table class="table table-bordered table-striped">
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
                </div>
            </div>
            <div class="col-md-9">
                <div class="widget">
                    <div class="widget-header">
                        <i class="icon-user"></i>
                        <h3>Users Manager</h3>
                    </div>
                    <div class="widget-content">

                        <g:form action="userList" method="get" role="form">
                          <div class="input-group col-md-4 pull-right">
                            <input type="text" name="keyword" value="${params.keyword}" class="form-control" placeholder="keyword" />
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-default">
                                    Search
                                </button>
                            </span>
                          </div>
                        </g:form>
                        
                        <table class="table table-hover table-striped">
                            <thead>
                                <tr>
                                    <th width="25">#</th>
                                    <th width="100"><g:message code="user.username.label" /></th>
                                    <th width="200"><g:message code="user.email.label" /></th>
                                    <th width="150"><g:message code="user.fullName.label" /></th>
                                    <th width="100"><g:message code="default.dateCreated.label" /></th>
                                    <th width="120"><g:message code="user.authorities.label" /></th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${users}" var="user" status="i">
                                    <tr>
                                        <td><small>${offset+i+1}</small></td>
                                        <td>
                                            <g:link action="userEdit" id="${user.id}">
                                            <div>
                                                <i class="icon-user"></i>&nbsp;
                                                ${user.username}
                                            </div>
                                            </g:link>
                                        </td>
                                        <td><small>${user.email}</small></td>
                                        <td><small>${user.fullName}</small></td>
                                        <td>
                                            <small><g:formatDate date="${user.dateCreated}" type="date" style="SHORT" /></small>
                                        </td>
                                        <td>
                                            <small>${user.authorities?.size()>0?user.authorities.first().authority:''}</small>
                                            <span class="badge badge-info" rel="tooltip" title="${user.authorities.collect {it.authority}?.join(', ')}">${user.authorities?.size()}</span>
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="6" class="text-center">
                                        共 ${userCount} 筆使用者資料

                                        <div class="pull-right">
                                            <g:link action="userAdd" class="btn btn-default">
                                                <i class="icon icon-plus"></i>&nbsp;
                                                <!--新增使用者-->
                                                <g:message code="default.button.add.label" />
                                            </g:link>
                                        </div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="text-center">
                            <g:paginate controller="admin" action="userList" total="${userCount}" max="10" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
