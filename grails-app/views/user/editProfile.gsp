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
                        <i class="icon icon-pencil"></i>
                        <h3>Avatar</h3>
                    </div>
                    <div class="widget-content">
                        <g:if test="${user?.email}">
                            <div class="textalign-center">
                                <avatar:gravatar email="${user.email}" size="128" title="大頭貼" />
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
                        <g:if test="${user?.email}">
                            <g:hasErrors bean="${user}">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${user}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </g:hasErrors>
                            <g:form action="saveProfile" method="post" role="form">

                                <!-- Name -->
                                <div class="form-group">
                                    <label for="fullName">
                                        <g:message code="user.fullName.label" />
                                    </label>
                                    <g:textField name="fullName" value="${user?.fullName}" class="form-control" />
                                </div>

                                <!-- E-Mail -->
                                <div class="form-group">
                                    <label for="email">
                                        <g:message code="user.email.label" />
                                    </label>
                                    <g:textField name="email" value="${user?.email}" class="form-control" disabled="" />
                                </div>

                                <!-- School -->
                                <div class="form-group">
                                    <label for="school">
                                        <g:message code="user.school.label" />
                                    </label>
                                    <g:textField name="school" value="${user?.school}" class="form-control" />
                                </div>

                                <!-- Department -->
                                <div class="form-group">
                                    <label for="department">
                                        <g:message code="user.department.label" />
                                    </label>
                                    <g:textField name="department" value="${user?.department}" class="form-control" />
                                </div>

                                <!-- Description -->
                                <div class="form-group">
                                    <ul class="nav nav-tabs">
                                        <li class="active">
                                            <a href="#tab-editor" data-toggle="tab">
                                                <g:message code="user.description.label" />
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#tab-preview" data-toggle="tab">
                                                <g:message code="default.preview.text" />
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab-editor">
                                            <div class="wmd-panel wmd-editor">
                                                <div id="wmd-button-bar"></div>
                                                <g:textArea name="description" cols="40" rows="20" value="${user?.description}" class="wmd-input enable-tabkey form-control" id="wmd-input" />
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="tab-preview">
                                            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Client Tools Port -->
                                <div class="form-group">
                                    <label class="control-label" for="clientPort">
                                        <g:message code="user.clientPort.label" />
                                    </label>
                                    <div class="input-group">

                                        <span class="input-group-btn">
                                            <button class="btn btn-default value-adjuster" data-element="clientPort" data-interval="-1">
                                                <i class="icon icon-minus"></i>
                                            </button>
                                        </span>

                                        <g:textField name="clientPort" value="${user?.clientPort}" class="form-control textalign-center" data-min="1327" data-max="1347" readonly="" />

                                        <span class="input-group-btn">
                                            <button class="btn btn-default value-adjuster" data-element="clientPort" data-interval="1">
                                                <i class="icon icon-plus"></i>
                                            </button>
                                        </span>
                                    </div>
                                </div>

                                <!-- Permissions (read-only) -->
                                <div class="form-group">
                                    <label>
                                        <g:message code="user.authorities.label" />
                                    </label>
                                    <ul class="icons">
                                        <g:each in="${user.authorities?.collect{it.authority}}" var="authority" status="i">
                                            <li><small>
                                                <i class="icon-ok"></i>
                                                ${authority}
                                            </small></li>
                                        </g:each>
                                    </ul>
                                </div>
                                
                                <hr />

                                <!-- Save Button -->
                                <g:submitButton name="save" value="${message(code: 'default.button.update.label')}" class="btn btn-primary" />

                                <!-- Cancel Button -->
                                <g:link action="profile" class="btn btn-default">
                                    <g:message code="default.button.cancel.label" />
                                </g:link>

                            </g:form> <!-- /.form -->

                        </g:if>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

<r:script>
$(function() {

    $('#avatar').addClass('img-thumbnail');
    
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
