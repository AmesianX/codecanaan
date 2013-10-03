<html>
<head>
    <meta name="layout" content="baseadmin" />
    <title>課程首頁</title>
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-4">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3><g:message code="course.registration.text" /></h3>
                    </div>
                    <div class="widget-content">
                        
                        <g:form action="register" method="post">
                            <div class="input-group">
                                <g:textField name="serialCode" value="" class="form-control" placeholder="${message(code:'course.registration.placeholder.text')}" />
                                <span class="input-group-btn">
                                    <button type="submit" name="coupon" class="btn btn-default">
                                        <i class="icon icon-chevron-right"></i>
                                        <!--註冊-->
                                        <g:message code="default.register.text" />
                                    </button>
                                </span>
                            </div>
                        </g:form>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-8">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-book"></i>
                        <h3>
                            <!-- My Course -->
                            <g:message code="default.my.label" args="[message(code: 'course.label', default: 'Course')]" />
                        </h3>
                    </div>
                    <div class="widget-content">

                        <sec:ifAnyGranted roles="ROLE_AUTHOR">
                            <div class="btn-group pull-right">
                                <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon icon-wrench"></i>&nbsp;
                                    <!--Operations-->
                                    <g:message code="default.operations.label" />
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <g:link controller="course" action="create">
                                            <i class="icon icon-book"></i>
                                            <!--新增課程-->
                                            <g:message code="default.add.label" default="Add {0}" args="[message(code: 'course.label', default: 'Course')]" />
                                        </g:link>
                                    </li>
                                </ul>
                            </div>
                        </sec:ifAnyGranted>

                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th width="30">#</th>
                                    <th><g:message code="course.title.label" /></th>
                                </tr>
                            </thead>
                            <tbody>
                               <g:if test="${!courses}">
                                    <tr>
                                        <td colspan="3"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                                    </tr>
                                </g:if>
                                <g:each in="${courses}" var="course" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td><g:link controller="course" action="show" id="${course.id}">${course.title}</g:link></td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
