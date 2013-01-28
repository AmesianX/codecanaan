<%@ page import="codecanaan.*" %>
<section>
    <!--標題-->
    <div class="page-header">
        <h1>${content.title} <small><g:message code="content.contentType.${content.type}" default="Content" /></small></h1>
        <g:if test="${content.subtitle}">
            <p><small>${content.subtitle}</small></p> 
        </g:if>
        <g:if test="${content.authors}">
            <p><small>作者：
                ${content.authors}
            </small></p> 
        </g:if>
        <g:if test="${content.level}">
            <p><small>難易度：
                <g:each in="${1..content.level}"><i class="icon icon-star"></i></g:each><g:each in="${1..5-content.level}"><i class="icon icon-star-empty"></i></g:each>
            </small></p> 
        </g:if>
    </div>

    <!--內容-->
    <g:if test="${content.description}">
        <div class="markdown-source font-resizable">${content.description?.encodeAsHTML()}</div>
    </g:if>
    
    <!--提示-->
    <g:if test="${content.hint}">
        <h2>提示</h2>
        <div class="markdown-source">${content.hint?.encodeAsHTML()}</div>
    </g:if>

    <!--教案-->
    <g:if test="${content.material}">
        <h2>教案</h2>
        <div class="markdown-source">${content.material?.encodeAsHTML()}</div>
    </g:if>

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
            <a href="#" id="cmdPlay" class="btn btn-large btn-success"><i class="icon icon-play"></i> 執行測試</a>
        </div>
        <div class="btn-group">
            <a href="#" id="cmdSave" class="btn btn-large">
                <span class="hide visible-while-save-progress"><i class="icon icon-spinner icon-spin"></i></span>
                <span class="hidden-while-save-progress"><i class="icon icon-save"></i></span>
                儲存
            </a>
            <a href="#" id="cmdUndo" class="btn btn-large"><i class="icon icon-undo"></i> 復原</a>
            <a href="#" id="cmdRedo" class="btn btn-large"><i class="icon icon-repeat"></i> 取消復原</a>
            <a href="#" id="cmdReset" class="btn btn-large"><i class="icon icon-magic"></i> 清除重做</a>
        </div>
    </div>

    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-editor" data-toggle="tab">
            <span class="hide visible-while-save-progress"><i class="icon icon-spinner icon-spin"></i></span>
            <span class="hidden-while-save-progress"><i class="icon icon-file"></i></span>
            ${content.sourcePath}
        </a></li>
        <li><a href="#tab-myoutput" data-toggle="tab">執行結果</a></li>
        <li><a href="#tab-output" data-toggle="tab">標準輸出</a></li>
        <g:if test="${authoring}">
            <li><a href="#tab-source" data-toggle="tab">解答程式碼</a></li>
        </g:if>
    </ul>
    <div class="tab-content">
    
        <div class="tab-pane active" id="tab-editor">
            <g:textArea name="sourceEdit" value="${record?.sourceCode?:content.partialCode}" data-mode="${cmmode(type:content.sourceType)}" data-height="500" cols="40" rows="20" class="codemirror-auto" />
        </div>
        <div class="tab-pane" id="tab-myoutput"><pre id="program-output" style="height:500px;overflow:auto">${record?.output}</pre></div>
        <div class="tab-pane" id="tab-output"><pre style="height:500px;overflow:auto">${content.output}</pre></div>
        <g:if test="${authoring}">
            <div class="tab-pane" id="tab-source"><pre style="height:500px;overflow:auto"><code class="no-highlight code-font codemirror-auto-runmode cm-s-default" data-mode="${cmmode(type:content.sourceType)}">${content.sourceCode?.encodeAsHTML()}</code></pre></div>
        </g:if>
    </div>
</sec:ifLoggedIn>

