<!--編輯課程-->
<g:form controller="content" action="ajaxSave" method="post">
    <div class="control-group">
        <label class="control-label" for="title">內容標題</label>
        <div class="controls">
            <g:textField name="title" value="${content.title}" class="input input-xlarge" />
        </div>
    </div>

    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-editor" data-toggle="tab">修改內容</a></li>
        <li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-editor">
            <div class="wmd-panel">
                <div id="wmd-button-bar"></div>
                <g:textArea name="description" cols="40" rows="20" value="${content.description}" class="wmd-input" id="wmd-input" />
            </div>
        </div>
        <div class="tab-pane" id="tab-preview">
            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="sourceType">程式碼類型</label>
        <div class="controls">
            <g:select name="sourceType" from="${codecanaan.SourceType?.values()}" keys="${codecanaan.SourceType.values()*.name()}" required="" value="${content.sourceType}"/>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="sourceCode">程式原始碼</label>
        <div class="controls">
            <g:textArea name="sourceCode" value="${content.sourceCode}" cols="40" rows="10" class="input input-xlarge" />
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="sourcePath">程式碼路徑</label>
        <div class="controls">
            <g:textField name="sourcePath" value="${content.sourcePath}" class="input input-xlarge" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="partialCode">部分程式碼</label>
        <div class="controls">
            <g:textArea name="partialCode" value="${content.partialCode}" cols="40" rows="10" class="input input-xlarge" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="answer">標準答案</label>
        <div class="controls">
            <g:textArea name="answer" value="${content.answer}" cols="40" rows="10" class="input input-xlarge" />
        </div>
    </div>

    <!--<pre>排序：${content.priority}</pre>-->

    <!--按鈕-->
    <g:submitToRemote url="[controller: 'content', action: 'ajaxSave', id: content.id]" class="btn btn-primary" value="更新" onSuccess="if(data.url)location.href=data.url" />
    <g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: content.id]" class="btn cancel-button">取消修改</g:link>
</g:form>
