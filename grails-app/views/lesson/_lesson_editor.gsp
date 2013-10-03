<div class="widget widget-stacked">
    <div class="widget-content">
        <g:form action="ajaxSave" method="post" role="form">

            <div class="form-group">
                <label for="title">
                    <g:message code="lesson.title.label" />
                </label>
                <g:textField name="title" value="${lesson.title}" class="form-control" />
            </div>

            <div class="form-group">
                <label for="name">
                    <g:message code="lesson.name.label" />
                </label>
                <g:textField name="name" value="${lesson.name}" class="form-control" />
            </div>


            <div class="form-group">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab-editor" data-toggle="tab">
                            <g:message code="lesson.description.label" />
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
                            <g:textArea name="description" cols="40" rows="20" value="${lesson.description}" class="wmd-input enable-tabkey form-control" id="wmd-input" />
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-preview">
                        <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                    </div>
                </div>
            </div>
                
            <div class="form-group">
                <!-- Submit -->
                <g:submitToRemote url="[action: 'ajaxSave', id: lesson.id]" class="btn btn-primary" value="${message(code: 'default.button.update.label')}" onSuccess="if(data.success){if(data.url)location.href=data.url;}else{bootbox.alert(data.message);}" />

                <!-- Cancel -->
                <g:link action="show" id="${lesson.id}" class="btn btn-default">
                    <g:message code="default.button.cancel.label" />
                </g:link>
            </div>
        </g:form>
    </div>
</div>