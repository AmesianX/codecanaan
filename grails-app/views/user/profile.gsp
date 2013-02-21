<html>
<head>
<meta name="layout" content="bootstrap" />
<title>修改個人資料</title>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">
            <!--資訊-->
            <g:if test="${user?.email}">
                <div class="textalign-center">
                    <avatar:gravatar email="${user.email}" size="128" title="大頭貼" />
                    <p><small>Change your avatar at <a href="gravatar.com">gravatar.com</a><br/> We’re using ${user.email}</small></p>
                </div>
            </g:if>
        </div>
        <div class="span9 clearlook-wrapper padding-around">
            <g:hasErrors bean="${user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="profile" method="post" class="form-horizontal">
                <legend><!--個人資料--><g:message code="user.profile.text" /></legend>

                <g:if test="${fbuser}">
                    <!--Facebook 帳號-->
                    <div class="control-group">
                        <label class="control-label">
                            <g:message code="user.login.type.facebook.text" />
                        </label>
                        <div class="controls">
                            <span class="help-inline">
                                <!--連結 Facebook 帳號-->
                                <a href="http://www.facebook.com/profile.php?id=${fbuser.uid}" target="_blank">
                                    <avatar:facebook user="${fbuser.uid}" size="50" />
                                </a>
                            </span>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class="control-group">
                        <label class="control-label" for="username">
                            <g:message code="user.login.type.normal.text" />
                        </label>
                        <div class="controls">
                            <span class="help-inline">${user?.username}</span>
                        </div>
                    </div>
                </g:else>

                <%--姓名--%>
                <div class="control-group ${hasErrors(bean: user, field: 'fullName', 'error')} ">
                    <label class="control-label" for="fullName">
                        <g:message code="user.fullName.label" />
                    </label>
                    <div class="controls">
                        <g:textField name="fullName" value="${user?.fullName}" class="input input-medium" />
                    </div>
                </div>

                <%--電子郵件--%>
                <div class="control-group ${hasErrors(bean: user, field: 'email', 'error')} ">
                    <label class="control-label" for="email">
                        <g:message code="user.email.label" />
                    </label>
                    <div class="controls">
                        <g:textField name="email" value="${user?.email}" class="input input-xlarge" disabled="" />
                    </div>
                </div>

                <%--學校--%>
                <div class="control-group ${hasErrors(bean: user, field: 'school', 'error')} ">
                    <label class="control-label" for="school">
                        <g:message code="user.school.label" />
                    </label>
                    <div class="controls">
                        <g:textField name="school" value="${user?.school}" class="input input-large" />
                    </div>
                </div>

                <%--系所--%>
                <div class="control-group ${hasErrors(bean: user, field: 'department', 'error')} ">
                    <label class="control-label" for="department">
                        <g:message code="user.department.label" />
                    </label>
                    <div class="controls">
                        <g:textField name="department" value="${user?.department}" class="input input-large" />
                    </div>
                </div>

                <%--個人簡介--%>
                <div class="control-group ${hasErrors(bean: user, field: 'description', 'error')} ">
                    <div class="controls">
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <a href="#tab-editor" data-toggle="tab">
                                    <small><g:message code="user.description.label" /></small>
                                </a>
                            </li>
                            <li>
                                <a href="#tab-preview" data-toggle="tab">
                                    <small><g:message code="default.preview.text" /></small>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-editor">
                                <div class="wmd-panel wmd-editor">
                                    <div id="wmd-button-bar"></div>
                                    <g:textArea name="description" cols="40" rows="20" value="${user?.description}" class="wmd-input" id="wmd-input" />
                                </div>
                            </div>
                            <div class="tab-pane" id="tab-preview">
                                <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--客戶端工具連接埠-->
                <div class="control-group ${hasErrors(bean: user, field: 'clientPort', 'error')} ">
                    <label class="control-label" for="clientPort">
                        <g:message code="user.clientPort.label" />
                    </label>
                    <div class="controls">
                        <div class="input-prepend input-append">
                            <button class="btn value-adjuster" data-element="clientPort" data-interval="-1"><i class="icon icon-minus"></i></button>
                            <g:textField name="clientPort" value="${user?.clientPort}" class="input span4 textalign-center" data-min="1327" data-max="1347" readonly="" />
                            <button class="btn value-adjuster" data-element="clientPort" data-interval="1"><i class="icon icon-plus"></i></button>
                        </div>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">
                        <g:message code="user.authorities.label" />
                    </label>
                    <div class="controls">
                        <ul class="icons">
                            <g:each in="${user.authorities?.collect{it.authority}}" var="authority" status="i">
                                <li><small>
                                    <i class="icon-ok"></i>
                                    ${authority}
                                </small></li>
                            </g:each>
                        </ul>
                    </div>
                </div>
                
                <!--按鈕區-->
                <div class="form-actions">
                    <g:submitButton name="save" value="${message(code: 'default.button.update.label')}" class="btn btn-primary" />
                    <g:link action="show" id="${user?.id}" class="btn">檢視個人資料</g:link>
                </div>
            </g:form>
        </div>
    </div>
</div>
<r:script>
$(function() {
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
