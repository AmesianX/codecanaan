<!--編輯課程-->
<g:form action="ajaxSave" method="post" class="form-horizontal">
    <div class="control-group">
        <label class="control-label" for="title"><g:message code="course.title.label" /></label>
        <div class="controls">
            <g:textField name="title" value="${course.title}" class="input input-xlarge" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="name"><g:message code="course.name.label" /></label>
        <div class="controls">
            <g:textField name="name" value="${course.name}" class="input input-medium" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="name">
            <g:message code="default.options.text" />
        </label>
        <div class="controls">
            <label>
                <g:checkBox name="isOpenCourse" value="true" checked="${isOpenCourse}" />
                開放式課程
            </label>
        </div>
    </div>

    <div class="control-group">
        <div class="controls">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab-editor" data-toggle="tab">
                        <g:message code="course.description.label" />
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
                        <g:textArea name="description" cols="40" rows="20" value="${course.description}" class="wmd-input enable-tabkey" id="wmd-input" />
                    </div>
                </div>
                <div class="tab-pane" id="tab-preview">
                    <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-actions">
        <g:submitToRemote url="[controller: 'course', action: 'ajaxSave', id: course.id]" class="btn btn-primary" value="${message(code: 'default.button.update.label')}" onSuccess="if(data.success){if(data.url)location.href=data.url;}else{bootbox.alert(data.message);}" />
        <g:link action="show" id="${course.id}" class="btn"><g:message code="default.button.cancel.label" /></g:link>
    </div>
</g:form>
