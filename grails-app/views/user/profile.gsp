<html>
<head>
    <title>修改個人資料</title>
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
                            <!--個人資料-->
                            <g:message code="user.profile.text" />
                        </h3>
                    </div>
                    <div class="widget-content">

                        <g:hasErrors bean="${user}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${user}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <div class="col-md-3">
                            <!-- Account Type -->
                            <g:if test="${fbuser}">
                                <!-- Facebook User -->
                                <div class="textalign-center">
                                    <!--連結 Facebook 帳號-->
                                    <a href="http://www.facebook.com/profile.php?id=${fbuser.uid}" target="_blank">
                                        <avatar:facebook user="${fbuser.uid}" size="50" />
                                    </a>
                                    <br/>
                                    <i class="icon-facebook-sign"></i>&nbsp;
                                    <g:message code="user.login.type.facebook.text" />
                                </div>
                            </g:if>
                            <g:else>
                                <!-- Built-in User -->
                                <div class="control-group">
                                    <label class="control-label" for="username">
                                        <g:message code="user.login.type.normal.text" />
                                    </label>
                                    <div class="controls">
                                        <span class="help-inline">${user?.username}</span>
                                    </div>
                                </div>
                            </g:else>
                        </div>

                        <div class="col-md-9">
                            <!-- Full Name -->
                            <dl class="dl-horizontal">
                                <dt><g:message code="user.fullName.label" /></dt>
                                <dd>
                                    ${user?.fullName}
                                </dd>
                            </dl>

                            <!-- E-Mail -->
                            <dl class="dl-horizontal">
                                <dt><g:message code="user.email.label" /></dt>
                                <dd>
                                    ${user?.email}&nbsp;&nbsp;
                                    (<g:link action="passwd"><g:message code="user.action.passwd.label" /></g:link>)
                                </dd>
                            </dl>

                            <!-- School -->
                            <dl class="dl-horizontal">
                                <dt><g:message code="user.school.label" /></dt>
                                <dd>${user?.school?:'<span class="text-muted">(empty)</span>'}</dd>
                            </dl>

                            <!-- Department -->
                            <dl class="dl-horizontal">
                                <dt><g:message code="user.department.label" /></dt>
                                <dd>${user?.department?:'<span class="text-muted">(empty)</span>'}</dd>
                            </dl>
                            
                        </div>
                        
                        <div class="col-md-3">
                            <!-- empty block -->
                        </div>
                        
                        <div class="col-md-9 well">
                            <div class="markdown-source">${user?.description?:'尚未填寫說明檔'}</div>
                        </div>

                        <hr />
                        
                        <!-- Operations -->
                        <div class="text-right">
                            <g:link action="editProfile" class="btn btn-default">
                                <i class="icon icon-pencil"></i>&nbsp;
                                <g:message code="default.button.modify.label"></g:message>
                            </g:link>
                        </div>
                        
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
