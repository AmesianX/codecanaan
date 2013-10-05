<html>
<head>
    <title>${post.title}</title>
    <meta name="layout" content="baseadmin">
    
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>Editing a Post</h3>
                    </div>
                    <div class="widget-content">

                        <g:hasErrors bean="${post}">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${post}" var="error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </g:hasErrors>

                        <g:form action="update" id="${post?.id}" class="form">

                            <!-- Include Form Fields -->
                            <g:render template="form_fields" />

                            <hr />

                            <div class="form-group">
                                
                                <!-- Submit -->
                                <g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.save.label')}" />

                                <!-- Cancel -->
                                <g:link action="show" params="[name: post.name]" class="btn btn-default">
                                    ${message(code: 'default.cancel.label')}
                                </g:link>

                            </div>

                        </g:form> <!-- /form -->

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-3">
                <div class="well">
                    <h4>Markdown Syntax</h4>
                    <p>更多有關 Markdown 格式的說明，請參考：<a href="http://markdown.tw/" target="_blank">Markdown 文件</a>。</p>
                </div>
            </div> <!-- /.col -->
        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
