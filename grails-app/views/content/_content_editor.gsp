<!--編輯課程-->
<g:form controller="content" action="ajaxSave" method="post">

    <legend><g:message code="content.contentType.${content.type}" /></legend>

    <p class="pull-right">標記 <span class="required-mark">*</span> 為必填欄位</p>
    
    <div class="control-group">
        <label class="control-label required" for="title">
            <!--內容標題-->
            <g:message code="content.title.label" />
            <!--必填-->
            <span class="required-mark">*</span>
        </label>
        <div class="controls">
            <g:textField name="title" value="${content.title}" class="input input-xlarge" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="subtitle">
            <!--副標題-->
            <g:message code="content.subtitle.label" />
        </label>
        <div class="controls">
            <g:textField name="subtitle" value="${content.subtitle}" class="input input-xlarge" />
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="authors">
            <!--作者-->
            <g:message code="content.authors.label" />
        </label>
        <div class="controls">
            <g:textField name="authors" value="${content.authors}" class="input input-xlarge" />
        </div>
    </div>
    
    <div class="control-group">
        <label class="control-label" for="alias">
            <!--別名-->
            <g:message code="content.alias.label" />
        </label>
        <div class="controls">
            <g:textField name="alias" value="${content.alias}" class="input input-medium" />
        </div>
    </div>

     <div class="control-group">
        <label class="control-label" for="level">
            <!--別名-->
            <g:message code="content.level.label" />
        </label>
        <div class="controls">
            <g:select name="level" from="${1..5}" value="${content.level}" />
        </div>
    </div>

    <!--教材內容-->
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#tab-editor" data-toggle="tab">
                <!-- [教材內容] -->
                <g:message code="content.description.label" />
            </a>
        </li>
        <li>
            <a href="#tab-preview" data-toggle="tab">
                <!-- [內容預覽] -->
                <g:message code="default.preview.label" args="[message(code: 'content.label')]" />
            </a>
        </li>
        <li>
            <a href="#tab-attachment" data-toggle="tab">
                <!-- [附件] -->
                附件
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-editor">
            <div class="wmd-panel wmd-editor">
                <div id="wmd-button-bar"></div>
                <g:textArea name="description" cols="40" rows="20" value="${content.description}" class="wmd-input enable-tabkey" id="wmd-input" />
            </div>
        </div>
        <div class="tab-pane" id="tab-preview">
            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
        </div>
        <div class="tab-pane" id="tab-attachment">
            <iframe id="attachment-frame" src="${createLink(action:'attachmentList', id: content?.id)}"></iframe>
        </div>
    </div>

    <!--提示內容-->
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#tab-hint-editor" data-toggle="tab">
                提示內容
            </a>
        </li>
        <li>
            <a href="#tab-hint-preview" data-toggle="tab">
                提示預覽
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-hint-editor">
            <div class="wmd-panel wmd-editor" data-suffix="-hint">
                <div id="wmd-button-bar-hint"></div>
                <g:textArea name="hint" cols="40" rows="20" value="${content.hint}" class="wmd-input enable-tabkey" id="wmd-input-hint" />
            </div>
        </div>
        <div class="tab-pane" id="tab-hint-preview">
            <div id="wmd-preview-hint" class="wmd-panel wmd-preview"></div>
        </div>
    </div>

    <!--教案內容-->
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#tab-material-editor" data-toggle="tab">
                教案內容
            </a>
        </li>
        <li>
            <a href="#tab-material-preview" data-toggle="tab">
                教案預覽
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-material-editor">
            <div class="wmd-panel wmd-editor" data-suffix="-material">
                <div id="wmd-button-bar-material"></div>
                <g:textArea name="material" cols="40" rows="20" value="${content.material}" class="wmd-input enable-tabkey" id="wmd-input-material" />
            </div>
        </div>
        <div class="tab-pane" id="tab-material-preview">
            <div id="wmd-preview-material" class="wmd-panel wmd-preview"></div>
        </div>
    </div>

    <!--測驗題-->
    <legend>以下為測驗題專用欄位</legend>

    <div class="control-group">
        <label class="control-label" for="quizType">
            <!--測驗類型-->
            <g:message code="content.quizType.label" />
        </label>
        <div class="controls">
            <g:select name="quizType" from="${codecanaan.QuizType?.values()}" keys="${codecanaan.QuizType.values()*.name()}" required="" value="${content.quizType?.name()}" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="quizOption">
            <!--測驗選項-->
            <g:message code="content.quizOption.label" />
        </label>
        </label>
        <div class="controls">
            <g:textArea name="quizOption" value="${content.quizOption}" class="input input-xlarge" rows="5" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="answer">
            <!--標準答案-->
            <g:message code="content.answer.label" />
        </label>
        </label>
        <div class="controls">
            <g:textArea name="answer" value="${content.answer}" class="input input-xlarge" rows="5" />
        </div>
    </div>

    <!--實作題-->
    <legend>以下為實作題專用欄位</legend>

    <div class="control-group">
        <label class="control-label" for="sourceType">
            <!--程式碼類型-->
            <g:message code="content.sourceType.label" />
        </label>
        <div class="controls">
            <g:select name="sourceType" from="${codecanaan.SourceType?.values()}" keys="${codecanaan.SourceType.values()*.name()}" required="" value="${content.sourceType?.name()}" />
        </div>
    </div>

    <div class="control-group">
        <label class="control-label" for="sourcePath">
            <!--程式碼路徑-->
            <g:message code="content.sourcePath.label" />
        </label>
        </label>
        <div class="controls">
            <g:textField name="sourcePath" value="${content.sourcePath}" class="input input-xlarge" />
        </div>
    </div>

    <!--實作練習-->
    <div class="btn-group pull-right">
        <a href="#" id="cmdDump" class="btn btn-success">
            <i class="icon icon-play"></i> 
            <!--執行測試-->
            <g:message code="default.execution.text" />
        </a>
    </div>
    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-sourceCode" data-toggle="tab">
            <!--程式原始碼-->
            <g:message code="content.sourceCode.label" />
        </a></li>
        <li><a href="#tab-partialCode" data-toggle="tab">
            <!--填空程式碼-->
            <g:message code="content.partialCode.label" />
        </a></li>
        <li><a href="#tab-output" data-toggle="tab">
            <!--標準輸出-->
            <g:message code="content.output.label" />
        </a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-sourceCode">
            <!--程式碼-->
            <g:textArea name="sourceCode" value="${content.sourceCode}" data-mode="${cmmode(type:content.sourceType)}" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
        <div class="tab-pane" id="tab-partialCode">
            <!--部分答案-->
            <g:textArea name="partialCode" value="${content.partialCode}" data-mode="${cmmode(type:content.sourceType)}" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
        <div class="tab-pane" id="tab-output">
            <!--標準輸出-->
            <g:textArea name="output" value="${content.output}" data-mode="text/plain" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
    </div>
    <section>
        <!--按鈕區-->
        <g:submitToRemote url="[controller: 'content', action: 'ajaxSave', id: content.id]" class="btn btn-primary" value="${message(code: 'default.button.update.label')}" before="\$.each(editors, function(index, val){editors[index].save();});" onSuccess="if(data.success){if(data.url)location.href=data.url;}else{bootbox.alert(data.message);}" />
        <g:link action="show" id="${content.id}" class="btn cancel-button">
            <!--取消-->
            <g:message code="default.button.cancel.label" />
        </g:link>
    </section>
</g:form>
