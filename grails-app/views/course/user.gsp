<html>
<head>
<meta name="layout" content="bootstrap" />
<title><g:message code="course.label" /></title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <g:form action="userAction" id="${course.id}" method="post">
                <legend>
                    新增讀者
                </legend>

                <div class="input-prepend">
                    <span class="add-on"><i class="icon-envelope"></i></span>
                    <input class="span2" type="text" name="email" placeholder="Email address" style="width:15em" />
                </div>

                <button name="create" type="submit" class="btn">
                    <i class="icon icon-plus"></i>
                    ${message(code:'default.button.create.label')}
                </button>
            </g:form>
        </div>
        <div class="span9 clearlook-wrapper padding-around">

            <div class="margin-below pull-right">
                <!--返回-->
                <g:link action="show" id="${course.id}" class="btn">
                    <i class="icon icon-chevron-left"></i>
                    <g:message code="default.button.goback.label" />
                </g:link>
            </div>

            <g:form action="userAction" id="${course.id}" method="post">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th width="30">#</th>
                            <th><g:message code="user.username.label" /></th>
                            <th><g:message code="user.fullName.label" /></th>
                            <th><g:message code="user.email.label" /></th>
                            <th width="100">Type</th>
                            <th width="100">Issue Date</th>
                            <th width="30"><i class="icon icon-check"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        <g:if test="${!userCourses}">
                            <tr>
                                <td colspan="7"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                            </tr>
                        </g:if>
                        <g:each in="${userCourses}" var="link" status="i">
                            <tr>
                                <td>${i+1}</td>
                                <td>${link.user?.username}</td>
                                <td>${link.user?.fullName}</td>
                                <td>${link.user?.email}</td>
                                <td>${link.regType}</td>
                                <td>${link.dateCreated?.format('yyyy/MM/dd')}</td>
                                <td>
                                    <g:if test="${link.regType!=codecanaan.RegType.AUTHOR}">
                                        <g:checkBox name="selected" value="${link.id}" checked="false" />
                                    </g:if>
                                </td>
                            </tr>
                        </g:each>
                    </tbody>
                </table>

                <div class="btn-toolbar" style="text-align:right">
                    <g:submitButton name="delete" value="${message(code:'default.button.delete.label')}" class="btn btn-danger" onclick="return confirm('Are you sure???')" />
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
