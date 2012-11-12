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
        <label class="control-label" for="sourcePath">程式碼路徑</label>
        <div class="controls">
            <g:textField name="sourcePath" value="${content.sourcePath}" class="input input-xlarge" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="sourceCode">程式原始碼</label>
        <div class="controls">
            
        </div>
    </div>

    <!--實作練習-->
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="#" id="cmdDump"><i class="icon icon-play"></i> 執行測試</a></li>
            </ul>
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-sourceCode" data-toggle="tab">標準程式碼</a></li>
        <li><a href="#tab-partialCode" data-toggle="tab">填空程式碼</a></li>
        <li><a href="#tab-answer" data-toggle="tab">標準輸出</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-sourceCode">
            <!--程式碼-->
            <g:textArea name="sourceCode" value="${content.sourceCode}" data-mode="text/x-csrc" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
        <div class="tab-pane" id="tab-partialCode">
            <!--部分答案-->
            <g:textArea name="partialCode" value="${content.partialCode}" data-mode="text/x-csrc" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
        <div class="tab-pane" id="tab-answer">
            <!--標準輸出-->
            <g:textArea name="answer" value="${content.answer}" data-mode="text/plain" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
    </div>

    <!--按鈕-->
    <g:submitToRemote url="[controller: 'content', action: 'ajaxSave', id: content.id]" class="btn btn-primary" value="更新" before="\$.each(editors, function(index, val){editors[index].save();});" onSuccess="if(data.url)location.href=data.url" />
    <g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: content.id]" class="btn cancel-button">取消修改</g:link>
</g:form>
