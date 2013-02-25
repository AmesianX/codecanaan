<%@ page import="codecanaan.*" %>
<section>
    <!--標題-->
    <div class="page-header">
        <h1>${content.title}</h1>
        <g:if test="${content.subtitle}">
            <p><small>${content.subtitle}</small></p> 
        </g:if>
        <g:if test="${content.authors}">
            <p><small>作者：
                ${content.authors}
            </small></p> 
        </g:if>
        <g:if test="${content.level}">
            <p><small>難易度：<g:starLabel rank="${content.level}" /></small></p> 
        </g:if>
    </div>

    <%--內容顯示--%>
    <g:render template="content_display" />
    
</section>

<h2>
    <!--開始練習-->
    <g:message code="content.exercise.start.text" />
    <!--tagline-->
    <small><g:message code="content.exercise.start.tagline" /></small>    
</h2>

<sec:ifLoggedIn>
    <!--實作練習-->
    <div class="btn-toolbar">
        <div class="btn-group">
            <a href="${createLink(controller:'content',action:'source',id:content?.id,params: [file: "${content.sourcePath}"])}" id="cmdPlay" class="btn btn-success">
                <i class="icon icon-play"></i>
                執行測試
            </a>
        </div>
        <div class="btn-group">
            <a href="#" id="cmdSave" class="btn btn-small">
                <span class="hide visible-while-save-progress"><i class="icon icon-spinner icon-spin"></i></span>
                <span class="hidden-while-save-progress"><i class="icon icon-save"></i></span>
                儲存
            </a>
            <a href="#" id="cmdUndo" class="btn btn-small"><i class="icon icon-undo"></i> 復原</a>
            <a href="#" id="cmdRedo" class="btn btn-small"><i class="icon icon-repeat"></i> 取消復原</a>
            <a href="#" id="cmdReset" class="btn btn-small"><i class="icon icon-magic"></i> 清除重做</a>
        </div>
    </div>

    <ul class="nav nav-tabs" id="editorTab">
        <li class="active"><a href="#tab-editor" data-toggle="tab">
            <span class="hide visible-while-save-progress"><i class="icon icon-spinner icon-spin"></i></span>
            <span class="hidden-while-save-progress"><i class="icon icon-file"></i></span>
            ${content.sourcePath}
        </a></li>
        <li><a href="#tab-output" data-toggle="tab">執行結果</a></li>
        <li><a href="#tab-stdoutput" data-toggle="tab">標準輸出</a></li>
        <g:if test="${authoring}">
            <li><a href="#tab-source" data-toggle="tab">解答程式碼</a></li>
        </g:if>
    </ul>
    <div class="tab-content">
    
        <div class="tab-pane active" id="tab-editor">
            <g:textArea name="sourceEdit" value="${record?.sourceCode?:content.partialCode}" data-mode="${cmmode(type:content.sourceType)}" data-height="500" cols="60" rows="20" class="codemirror-auto" style="height:500px" />
        </div>
        <div class="tab-pane" id="tab-output">
            <g:if test="${content.sourceType==SourceType.HTML}">
                <iframe id="output" src="${createLink(controller:'content',action:'source',id:content.id)}" width="100%" height="500" border="0" style="border:none"></iframe>
            </g:if>
            <g:else>
                <pre id="program-output" style="height:500px;overflow:auto">${record?.output}</pre>
            </g:else>
        </div>
        <div class="tab-pane" id="tab-stdoutput">
            <g:if test="${content.sourceType==SourceType.HTML}">
                <iframe src="${createLink(controller:'content',action:'source',id:content.id, params: [source: true])}" width="100%" height="500" border="0" style="border:none"></iframe>
            </g:if>
            <g:else>
                <pre style="height:500px;overflow:auto">${content.output}</pre>
            </g:else>
        </div>
        <g:if test="${authoring}">
            <div class="tab-pane" id="tab-source"><pre style="height:500px;overflow:auto"><code class="no-highlight code-font codemirror-auto-runmode cm-s-default" data-mode="${cmmode(type:content.sourceType)}">${content.sourceCode?.encodeAsHTML()}</code></pre></div>
        </g:if>
    </div>
</sec:ifLoggedIn>

