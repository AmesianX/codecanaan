<!--編輯課程-->
<g:form controller="course" action="ajaxSave" method="post">
    <div class="control-group">
        <label class="control-label" for="title">課程名稱</label>
        <div class="controls">
            <g:textField name="title" value="${course.title}" />
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-editor" data-toggle="tab">課程說明</a></li>
        <li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-editor">
            <div class="wmd-panel">
                <div id="wmd-button-bar"></div>
                <g:textArea name="description" cols="40" rows="20" value="${course.description}" class="wmd-input" id="wmd-input" />
            </div>
        </div>
        <div class="tab-pane" id="tab-preview">
            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
        </div>
    </div>
    <g:submitToRemote url="[controller: 'course', action: 'ajaxSave', id: course.id]" class="btn btn-primary" value="更新" onSuccess="if(data.url)location.href=data.url" />
    <g:link action="show" id="${course.id}" class="btn">取消修改</g:link>
</g:form>
