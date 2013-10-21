<html>
<head>
    <title>修改密碼</title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-user"></i>
                        <h3>Avatar</h3>
                    </div>
                    <div class="widget-content">
                        <g:if test="${user?.email}">
                            <div class="textalign-center">
                                <avatar:gravatar email="${user.email}" size="128" title="大頭貼" id="avatar" />
                                <p><small>Change your avatar at <a href="gravatar.com">gravatar.com</a><br/> We’re using ${user.email}</small></p>
                            </div>
                        </g:if>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>
                            <!-- Change Password -->
                            <g:message code="user.action.passwd.label" />
                        </h3>
                    </div>
                    <div class="widget-content">

                        <g:hasErrors bean="${user}">
                            <div class="alert alert-warning">
                                <g:renderErrors bean="${user}" as="list" />
                            </div>
                        </g:hasErrors>

                        <g:form action="savePasswd" method="post" role="form" class="form-horizontal">

                            <!-- E-Mail -->
                            <div class="form-group">
                                <label for="email" class="col-md-2 control-label">
                                    <g:message code="user.email.label" />
                                </label>
                                <div class="col-md-10">
                                    <g:textField name="email" value="${user?.email}" class="form-control" disabled="" />
                                </div>
                            </div>

                            <!-- Username -->
                            <div class="form-group">
                                <label for="username" class="col-md-2 control-label">
                                    <g:message code="user.username.label" />
                                </label>
                                <div class="col-md-10">
                                    <g:textField name="username" value="${user?.username}" class="form-control" disabled="" />
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="form-group">
                                <label for="password" class="col-md-2 control-label">
                                    <g:message code="user.password.label" />
                                </label>
                                <div class="col-md-10">
                                    <g:passwordField name="password" value="" class="form-control" />
                                </div>
                            </div>

                            <hr />

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">

                                    <!-- Save Button -->
                                    <g:submitButton name="save" value="${message(code: 'default.button.update.label')}" class="btn btn-primary" />

                                    <!-- Cancel Button -->
                                    <g:link action="profile" class="btn btn-default">
                                        <g:message code="default.button.cancel.label" />
                                    </g:link>

                                </div>
                            </div>

                        </g:form> <!-- /.form -->
                        
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

<r:script>
$(function() {

    $('.avatar').addClass('img-thumbnail');

    $('.value-adjuster').click(function() {
        var interval = parseInt($(this).data('interval'));
        var element = $('#'+$(this).data('element'));

        var max = parseInt($(element).data('max'));
        var min = parseInt($(element).data('min'));

        var newValue = parseInt(element.val())+interval;
        if (newValue > max) newValue = max;
        if (newValue < min) newValue = min;
        
        element.val(newValue);

        return false;
    });
});
</r:script>
</body>
</html>
