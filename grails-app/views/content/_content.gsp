<%@ page import="codecanaan.*" %>

<!--檢查作者權限-->
<g:if test="${authoring}">
    <g:render template="content_toolbar" />
</g:if>

<!--內容顯示-->

<g:if test="${content.type==ContentType.SLIDE}">
    <!--簡報-->

    <!--內嵌簡報-->
    <iframe id="deckjs-iframe" width="100%" height="400" src="${createLink(controller:'content', action:'deckjs', id:content.id)}" style="width:100%;height:480px;border:none"></iframe>
    <r:script>
        $('#deckjs-iframe').focus();
    </r:script>

    <!--練習-->
    <sec:ifLoggedIn>
        <label class="checkbox"><g:checkBox name="cmdCheck" value="YES" checked="${record?.passed}" /> 打勾代表你已經閱讀完畢</label>
    </sec:ifLoggedIn>
</g:if>
<g:elseif test="${content.type==ContentType.TUTORIAL}">
    <!--講義-->

    <section>
        <!--標題區-->
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

    </section>

    <sec:ifLoggedIn>
        <!--附加程式碼-->
        <g:if test="${content.sourceCode}">
            <h2>程式碼</h2>
            <g:if test="${content.sourcePath}">
                <g:link controller="content" action="downloadSource" id="${content.id}" params="[file: content.sourcePath]" target="_blank" rel="tooltip" data-placement="right" title="點擊右鍵將檔案下載到指定位置">
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

</g:elseif>
<g:elseif test="${content.type==ContentType.QUIZ}">
    <!--測驗題-->

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
    </section>

    <sec:ifLoggedIn>
        <!--隨堂測驗-->

        <g:if test="${content.quizType==QuizType.SHORT_ANSWER}">
            <!--簡答題-->
            <p>請在方框內填寫你的答案。</p>
            <div class="margin-around">
                <g:textArea name="myanswer" value="${record?.answer?.trim()?:content.quizOption?.trim()}" class="input input-xlarge" rows="5" /><br/>
            </div>
        </g:if>
        <g:elseif test="${content.quizType==QuizType.SINGLE_CHOICE}">
            <p>請選擇合適的答案（單選）。</p>
            <div class="margin-around">
                <g:radioGroup name="myanswer" labels="${content.quizOption?.trim()?.split('\n')?.collect{it?.trim()}}" values="${content.quizOption?.trim()?.split('\n')?.collect{it?.trim()}}" value="${record?.answer?.trim()}" >
                    <label>${it.radio} ${it.label}</label>
                </g:radioGroup>
            </div>
        </g:elseif>
        <g:elseif test="${content.quizType==QuizType.MULTIPLE_CHOICE}">
            <p>請選擇合適的答案（多選題）。</p>
            <div class="margin-around">
                <g:set var="stdAnswers" value="${content?.answer?.trim()?.split('\n').collect{it?.trim()}}" />
                <g:set var="lastAnswers" value="${record?.answer?.trim()?.split('\n').collect{it?.trim()}}" />
                <g:each in="${content.quizOption?.trim()?.split('\n')?.collect{it?.trim()}}" var="label" status="i">
                    <label><g:checkBox name="myanswer" value="${label}" checked="${lastAnswers?.contains(label)}" data-answer="${stdAnswers?.contains(label)}" /> ${label}</label>
                </g:each>
            </div>
        </g:elseif>
        <g:elseif test="${content.quizType==QuizType.TRUE_FALSE}">
            <p>是非題。</p>
            <div class="margin-around">
                <g:radioGroup name="myanswer" labels="['True', 'False']" values="['TRUE', 'FALSE']" value="${record?.answer?.trim().toUpperCase()}" >
                    <label>${it.radio} ${it.label}</label>
                </g:radioGroup>
            </div>
        </g:elseif>

        <button id="cmdSubmit" data-type="${content.quizType}" class="btn btn-primary">回答</button>
    </sec:ifLoggedIn>

</g:elseif>
<g:elseif test="${content.type==ContentType.CODE}">
    <!--實作題-->
    
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

</g:elseif>

<!--會員必須先登入-->
<sec:ifNotLoggedIn>
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <!--訪客無法練習-->
        請先以會員帳號登入，才能取得完整的學習內容。
    </div>
</sec:ifNotLoggedIn>

<!--內容換頁機制-->
<div class="pagination pagination-centered pagination-large">
    <ul>
        <g:set var="currentIndex" value="${lesson.contents.indexOf(content)}" />
        <g:set var="firstIndex" value="${0}" />
        <g:set var="lastIndex" value="${lesson.contents.size()-1}" />
        
        <!--上一題-->
        <g:if test="${content&&currentIndex>firstIndex}">
            <li><g:link action="show" id="${lesson.contents[currentIndex-1]?.id}">« 上一題</g:link></li>
        </g:if>
        <g:else>
            <li class="disabled"><span>« 上一題</span></li>
        </g:else>

        <li class="disabled hidden-phone"><span>第 ${currentIndex + 1} 題 / 共 ${lastIndex + 1} 題</span></li>

        <!--下一題-->
        <g:if test="${content&&currentIndex<lastIndex}">
            <li>
                <g:link action="show" id="${lesson.contents[currentIndex+1]?.id}">下一題 »</g:link>
            </li>
        </g:if>
        <g:else>
            <li class="disabled"><span>下一題 »</span></li>
        </g:else>
    </ul>
</div>

<!--隱藏變數-->
<g:hiddenField name="sourcePath" value="${content.sourcePath}" />
<g:hiddenField name="sourceType" value="${content.sourceType}" />
<g:hiddenField name="sourceCode" value="${content.sourceCode}" />
<g:hiddenField name="partialCode" value="${content.partialCode}" />
<g:hiddenField name="output" value="${content.output}" />
<g:hiddenField name="answer" value="${content.answer}" />
