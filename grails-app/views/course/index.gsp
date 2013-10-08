<html>
<head>
    <meta name="layout" content="baseadmin" />
    <title>課程首頁</title>
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
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
                                        <!--註冊-->
                                        <g:message code="default.register.text" />
                                    </button>
                                </span>
                            </div>
                        </g:form>

                    </div>
                </div> <!-- /.widget -->

                <div class="well">
                    <h4>Extra Info</h4>
                    <p>如果您想加入新課程，但沒有課程序號，請先向授課教師索取。</p>
                </div>

            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked widget-table">
                    <div class="widget-header">
                        <i class="icon icon-book"></i>
                        <h3>
                            <!-- My Course -->
                            <g:message code="default.my.label" args="[message(code: 'course.label', default: 'Course')]" />
                        </h3>
                    </div>
                    <div class="widget-content">
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th width="40">#</th>
                                    <th><g:message code="course.title.label" /></th>
                                </tr>
                            </thead>
                            <tbody>
                               <g:if test="${!courses}">
                                    <tr>
                                        <td colspan="3" class="text-center">
                                            <g:message code="default.empty.label" />
                                        </td>
                                    </tr>
                                </g:if>
                                <g:each in="${courses}" var="course" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td>
                                            <g:link action="show" id="${course.id}">
                                            <div>
                                                ${course.title}
                                            </div>
                                            </g:link>
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                            <tfoot>
                                <sec:ifAnyGranted roles="ROLE_AUTHOR">
                                    <tr>
                                        <td colspan="3" class="text-right">
                                            <a href="#" id="create-course">
                                                <i class="icon icon-plus"></i>&nbsp;
                                                <g:message code="default.button.create.label" />
                                            </a>
                                        </td>
                                    </tr>
                                </sec:ifAnyGranted>
                            </tfoot>
                        </table>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

<r:script>
$('a#create-course').click(function() {
    bootbox.prompt("請輸入新課程名稱?", function(title) {                
        if (title) {
            $.ajax({
                type: "POST",
                url: "${createLink(action:'ajaxCreate')}",
                data: { title: title }
            })
            .done(function( result ) {
                if (result.success) {
                    location.href = result.redirectUrl;
                }
                else {
                    bootbox.alert(result.errors);
                }
            });
        }
    });
});
</r:script>
</body>
</html>
