<%@ page import="codecanaan.*" %>
<section>
    <!--標題區-->
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

<sec:ifLoggedIn>
    <!--附加程式碼-->
    <g:if test="${content.sourceCode}">
        <h2>程式碼</h2>
        <g:if test="${content.sourcePath}">
            <g:link controller="content" action="source" id="${content.id}" params="[file: content.sourcePath, attachment: true]" target="_blank" rel="tooltip" data-placement="right" title="點擊右鍵將檔案下載到指定位置">
                <i class="icon icon-file"></i> ${content.sourcePath}
            </g:link>
            （檔案下載）
        </g:if>
        <pre><code class="no-highlight code-font codemirror-auto-runmode cm-s-default" data-mode="${cmmode(type:content.sourceType)}">${content.sourceCode}</code></pre>
    </g:if>

    <!--練習-->
    <h2>動手時間</h2>
    <label class="checkbox"><g:checkBox name="cmdCheck" value="YES" checked="${record?.passed}" /> 打勾代表你已經閱讀完畢</label>
</sec:ifLoggedIn>

