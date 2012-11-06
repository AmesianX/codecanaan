<!--編輯單元-->
<g:form controller="lesson" action="ajaxSave" method="post">
    <div class="control-group">
        <label class="control-label" for="title">單元名稱</label>
        <div class="controls">
            <g:textField name="title" value="${lesson.title}" />
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-editor" data-toggle="tab">單元說明</a></li>
        <li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-editor">
            <div class="wmd-panel">
                <div id="wmd-button-bar"></div>
                <g:textArea name="description" cols="40" rows="20" value="${lesson.description}" class="wmd-input" id="wmd-input" />
            </div>
        </div>
        <div class="tab-pane" id="tab-preview">
            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
        </div>
    </div>
    <!--按鈕區-->
    <g:submitToRemote url="[controller: 'lesson', action: 'ajaxSave', id: lesson.id]" class="btn btn-primary" value="更新" onSuccess="if(data.url)location.href=data.url" />
    <g:link action="show" id="${course.id}" params="[lessonId: lesson.id]" class="btn">取消修改</g:link>
</g:form>
