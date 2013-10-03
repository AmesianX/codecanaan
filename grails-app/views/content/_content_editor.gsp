<%@ page import="codecanaan.*" %>
<g:form controller="content" action="ajaxSave" method="post" role="form">

    <p class="pull-right">標記 <span class="required-mark">*</span> 為必填欄位</p>
    
    <div class="form-group">
        <label for="title">
            <g:message code="content.title.label" />
            <span class="required-mark">*</span>
        </label>

        <g:textField name="title" value="${content.title}" class="form-control" />
    </div>

    <div class="form-group advanced-region">
        <label for="subtitle">
            <g:message code="content.subtitle.label" />
        </label>
        <g:textField name="subtitle" value="${content.subtitle}" class="form-control" />
    </div>
    
    <div class="form-group advanced-region">
        <label for="authors">
            <g:message code="content.authors.label" />
        </label>
        <g:textField name="authors" value="${content.authors}" class="form-control" />
    </div>
    
    <div class="form-group advanced-region">
        <label for="alias">
            <g:message code="content.alias.label" />
        </label>
        <div class="controls">
            <g:textField name="alias" value="${content.alias}" class="form-control" />
        </div>
    </div>

     <div class="form-group">
        <label for="level">
            <g:message code="content.level.label" />
        </label>
        <g:select name="level" from="${1..5}" value="${content.level}" class="form-control" />
    </div>

    <div class="form-group advanced-region">
        <label for="type">
            <g:message code="content.type.label" />
        </label>
        <g:select name="type" from="${ContentType?.values()}" keys="${ContentType.values()*.name()}" required="" value="${content.type?.name()}" class="form-control" />
    </div>

    <div class="form-group">
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#tab-editor" data-toggle="tab">
                    <g:message code="content.description.label" />
                    <span class="required-mark">*</span>
                </a>
            </li>
            <li>
                <a href="#tab-preview" data-toggle="tab">
                    <g:message code="default.preview.label" args="[message(code: 'content.label')]" />
                </a>
            </li>
            <li>
                <a href="#tab-attachment" data-toggle="tab">
                    附件
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-editor">
                <div class="wmd-panel wmd-editor">
                    <div id="wmd-button-bar"></div>
                    <g:textArea name="description" cols="40" rows="20" value="${content.description}" class="wmd-input enable-tabkey form-control" id="wmd-input" />
                </div>
            </div>
            <div class="tab-pane" id="tab-preview">
                <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
            </div>
            <div class="tab-pane" id="tab-attachment">
                <iframe id="attachment-frame" src="${createLink(action:'attachmentList', id: content?.id)}"></iframe>
            </div>
        </div>
    </div>

    <div class="advanced-region">

        <div class="form-group">
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
                        <g:textArea name="hint" cols="40" rows="20" value="${content.hint}" class="wmd-input enable-tabkey form-control" id="wmd-input-hint" />
                    </div>
                </div>
                <div class="tab-pane" id="tab-hint-preview">
                    <div id="wmd-preview-hint" class="wmd-panel wmd-preview"></div>
                </div>
            </div>
        </div>

        <div class="form-group">
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
                        <g:textArea name="material" cols="40" rows="20" value="${content.material}" class="wmd-input enable-tabkey form-control" id="wmd-input-material" />
                    </div>
                </div>
                <div class="tab-pane" id="tab-material-preview">
                    <div id="wmd-preview-material" class="wmd-panel wmd-preview"></div>
                </div>
            </div>
        </div>

    </div>

    <!-- 測驗題 -->
    <section class="${content?.type!=ContentType.QUIZ?'advanced-region':''}">
        
        <legend>
            <i class="icon icon-paper-clip"></i>&nbsp;
            測驗題專用欄位
        </legend>

        <div class="form-group">
            <label for="quizType">
                <!-- 測驗類型 -->
                <g:message code="content.quizType.label" />
            </label>
            <g:select name="quizType" from="${QuizType?.values()}" keys="${QuizType.values()*.name()}" required="" value="${content.quizType?.name()}" class="form-control" />
        </div>

        <div class="form-group">
            <label for="quizOption">
                <!-- 測驗選項 -->
                <g:message code="content.quizOption.label" />
            </label>
            <g:textArea name="quizOption" value="${content.quizOption}" class="form-control" rows="5" />
        </div>

        <div class="form-group">
            <label for="answer">
                <!-- 標準答案 -->
                <g:message code="content.answer.label" />
            </label>
            <g:textArea name="answer" value="${content.answer}" class="form-control" rows="5" />
        </div>
    </section>

    <!-- 實作題 -->
    <section class="${content?.type!=ContentType.CODE?'advanced-region':''}">
        
        <legend>
            <i class="icon icon-paper-clip"></i>&nbsp;
            實作題專用欄位
        </legend>

        <div class="form-group">
            <label for="sourceType">
                <!-- 程式碼類型 -->
                <g:message code="content.sourceType.label" />
            </label>
            <g:select name="sourceType" from="${SourceType?.values()}" keys="${SourceType.values()*.name()}" required="" value="${content.sourceType?.name()}" class="form-control" />
        </div>

        <div class="form-group">
            <label for="sourcePath">
                <!--程式碼路徑-->
                <g:message code="content.sourcePath.label" />
                <span class="required-mark">*</span>
            </label>
            </label>
            <g:textField name="sourcePath" value="${content.sourcePath}" class="form-control" />
        </div>

        <!-- 實作練習 -->
        <div class="pull-right">
            <a href="${createLink(controller:'content',action:'temp')}" id="cmdDump" class="btn btn-success">
                <i class="icon icon-play"></i>&nbsp;
                <!-- 執行測試 -->
                <g:message code="default.execution.text" />
            </a>
        </div>
        <ul class="nav nav-tabs" id="editorTab">
            <li class="active">
                <a href="#tab-sourceCode" data-toggle="tab">
                    <!-- 程式原始碼 -->
                    <g:message code="content.sourceCode.label" />
                    <span class="required-mark">*</span>
                </a>
            </li>
            <li>
                <a href="#tab-partialCode" data-toggle="tab">
                    <!-- 填空程式碼 -->
                    <g:message code="content.partialCode.label" />
                </a>
            </li>
            <li>
                <a href="#tab-output" data-toggle="tab">
                    <!-- 標準輸出 -->
                    <g:message code="content.output.label" />
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-sourceCode">
                <!-- 程式碼 -->
                <g:textArea name="sourceCode" value="${content.sourceCode}" data-mode="${cmmode(type:content.sourceType)}" data-height="500" cols="40" rows="20" class="codemirror-auto" />
            </div>
            <div class="tab-pane" id="tab-partialCode">
                <!-- 部分答案 -->
                <g:textArea name="partialCode" value="${content.partialCode}" data-mode="${cmmode(type:content.sourceType)}" data-height="500" cols="40" rows="20" class="codemirror-auto" />
            </div>
            <div class="tab-pane" id="tab-output">
                <!-- 標準輸出 -->
                <g:if test="${content.sourceType==SourceType.HTML}">
                    <iframe id="output" src="${createLink(controller:'content',action:'source',id:content.id, params: [source: true])}" width="100%" height="500" border="0" style="border:none"></iframe>
                </g:if>
                <g:else>
                    <g:textArea name="output" value="${content.output}" data-mode="text/plain" data-height="500" cols="40" rows="20" class="codemirror-auto" />
                </g:else>
            </div>
        </div>
    </section>

    <hr />
    
    <div class="checkbox pull-right">
        <label>
            <input type="checkbox" id="show-advanced" />
            進階設定
        </label>
    </div>

    <!-- Submit -->
    <g:submitToRemote url="[controller: 'content', action: 'ajaxSave', id: content.id]" class="btn btn-primary" value="${message(code: 'default.button.update.label')}" before="\$.each(editors, function(index, val){editors[index].save();});" onSuccess="if(data.success){if(data.url)location.href=data.url;}else{bootbox.alert(data.message);}" />

    <!-- Cancel -->
    <g:link action="show" id="${content.id}" class="btn btn-default cancel-button">
        <g:message code="default.button.cancel.label" />
    </g:link>

</g:form>
<r:script>
$('.advanced-region').hide();
$('#show-advanced').change(function() {
    if ($(this).attr('checked')) {
        $('.advanced-region').show();
    }
    else {
        $('.advanced-region').hide();
    }
    return false;
});
</r:script>
