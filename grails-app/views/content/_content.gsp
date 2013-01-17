<!--檢查作者權限-->
<g:if test="${authoring}">
    <div class="btn-toolbar pull-right">

        <a href="#" class="btn" id="cmdResizeFont">
            <i class="icon icon-font"></i>
            <!--縮放字體-->
            <g:message code="default.resizefont.text" />
        </a>

        <!--新增內容選單-->
        <g:render template="/content/addmenu" />

        <div class="btn-group">
            <g:link action="show" id="${content.id}" params="[editor: true]" class="btn">
                <i class="icon icon-edit"></i>
                <g:message code="default.edit.label" default="Edit {0}" args="[message(code: 'content.label', default: 'Content')]" />
            </g:link>
            <a class="btn dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li>
                    <g:link controller="content" action="delete" id="${content.id}" onclick="confirm('Are you sure???');">
                        <i class="icon icon-remove"></i>
                        <!--刪除內容-->
                        <g:message code="default.delete.label" args="[message(code: 'content.label')]" />
                    </g:link>
                </li>
            </ul>
        </div>
    </div>
</g:if>

<!--內容顯示-->
<section>
    <g:if test="${content.type==codecanaan.ContentType.SLIDE}">
        <!--簡報-->
        <div class="page-header">
            <g:link controller="content" action="deckjs" id="${content.id}" class="btn pull-right" target="_blank"><i class="icon icon-fullscreen"></i> Full Screen</g:link>
            <h1>${content.title} <small><g:message code="content.contentType.${content.type}" default="Content" /></small></h1>
        </div>
        <iframe width="100%" height="400" src="${createLink(controller:'content', action:'deckjs', id:content.id)}" style="width:100%;height:480px;border:none"></iframe>
    </g:if>
    <g:else>
        <div class="page-header">
            <h1>${content.title} <small><g:message code="content.contentType.${content.type}" default="Content" /></small></h1>
        </div>
        <!--講義或練習-->
        <div class="markdown-source">${content.description?.encodeAsHTML()}</div>
    </g:else>
</section>

<hr />

<sec:ifLoggedIn>
    <!--程式碼區塊-->
    <g:if test="${content.type!=codecanaan.ContentType.CODE}">
        <g:if test="${content.sourceCode}">
            <g:if test="${content.sourcePath}">
                <g:link controller="content" action="downloadSource" id="${content.id}" target="_blank" rel="tooltip" data-placement="right" title="點擊右鍵將檔案下載到指定位置">
                    <i class="icon icon-file"></i> ${content.sourcePath}
                </g:link>
                （檔案下載）
            </g:if>
            <pre><code class="code-font">${content.sourceCode}</code></pre>
            <hr />
        </g:if>
    </g:if>
    
    <h3>
        <!--開始練習--><g:message code="content.exercise.start.text" />
        <small><g:message code="content.exercise.start.tagline" /></small>    
    </h3>

    <!--隱藏變數-->
    <g:hiddenField name="sourcePath" value="${content.sourcePath}" />
    <g:hiddenField name="sourceType" value="${content.sourceType}" />
    <g:hiddenField name="sourceCode" value="${content.sourceCode}" />
    <g:hiddenField name="partialCode" value="${content.partialCode}" />
    <g:hiddenField name="answer" value="${content.answer}" />

    <g:if test="${content.type==codecanaan.ContentType.CODE}">
        <!--實作練習-->
        <div class="navbar">
            <div class="navbar-inner">
                <ul class="nav">
                    <li><a href="#" id="cmdPlay"><i class="icon icon-play"></i> 執行測試</a></li>
                    <!--<li class="divider-vertical"></li>-->
                    <li><a href="#" id="cmdSave"><i class="icon icon-hdd"></i> 儲存</a></li>
                    <li><a href="#" id="cmdUndo"><i class="icon icon-undo"></i> 復原</a></li>
                    <li><a href="#" id="cmdRedo"><i class="icon icon-repeat"></i> 取消復原</a></li>
                    <li><a href="#" id="cmdReset"><i class="icon icon-magic"></i> 清除重做</a></li>
                    <li id="cmdProgress" style="display:none"><a href="#"><g:img dir="images" file="ajax-loader-small.gif" /> 處理中...</span></a></li>
                </ul>
            </div>
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-editor" data-toggle="tab">編輯程式碼（${content.sourcePath}）</a></li>
            <li><a href="#tab-output" data-toggle="tab">執行結果</a></li>
            <li><a href="#tab-answer" data-toggle="tab">標準輸出</a></li>
            <g:if test="${authoring}">
                <li><a href="#tab-source" data-toggle="tab">解答程式碼</a></li>
            </g:if>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-editor">
                <g:textArea name="sourceEdit" value="${(record?.sourceCode)?record.sourceCode:content.partialCode}" data-mode="text/x-csrc" data-height="500" cols="40" rows="20" class="codemirror-auto" />
            </div>
            <div class="tab-pane" id="tab-output"><pre id="program-output" style="height:500px;overflow:auto">${record?.answer}</pre></div>
            <div class="tab-pane" id="tab-answer"><pre style="height:500px;overflow:auto">${content.answer}</pre></div>
            <g:if test="${authoring}">
                <div class="tab-pane" id="tab-source"><pre style="height:500px;overflow:auto"><code class="code-font">${content.sourceCode?.encodeAsHTML()}</code></pre></div>
            </g:if>
        </div>
    </g:if>
    <g:elseif test="${content.type==codecanaan.ContentType.TUTORIAL||content.type==codecanaan.ContentType.SLIDE}">
        <!--講義或簡報-->
        <label class="checkbox"><g:checkBox name="cmdCheck" value="YES" checked="${record?.passed}" /> 打勾代表你已經閱讀完畢</label>
    </g:elseif>
    <g:elseif test="${content.type==codecanaan.ContentType.QUIZ}">
        <!--隨堂測驗-->
        <p>請在方框內填寫你的答案</p>
        <div style="padding:.5em">
            <g:textArea name="myanswer" value="${record?.answer}" class="input input-xlarge" rows="5" /><br/>
            <button id="cmdSubmit" class="btn btn-primary">回答</button>
        </div>
    </g:elseif>

    <!--伺服器回應訊息區-->
    <div id="ajaxmsg"></div>

</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <!--訪客無法練習-->
        <g:message code="message.signin.for.exercise" />
    </div>
</sec:ifNotLoggedIn>

<!--內容跳頁-->
<div class="pagination pagination-centered pagination-large">
    <ul>
        <g:set var="currentIndex" value="${lesson.contents.indexOf(content)}" />
        <g:set var="firstIndex" value="${0}" />
        <g:set var="lastIndex" value="${lesson.contents.size()-1}" />
        <g:set var="maxsteps" value="${10}" />
        <g:set var="beginIndex" value="${currentIndex - Math.round(maxsteps / 2) + (maxsteps % 2)}" />
        <g:set var="endIndex" value="${currentIndex + Math.round(maxsteps / 2) - 1}" />
        
        <g:if test="${beginIndex < firstIndex}">
            <g:set var="beginIndex" value="${firstIndex}" />
            <g:set var="endIndex" value="${maxsteps}" />
        </g:if>
        
        <g:if test="${endIndex > lastIndex}">
            <g:set var="beginIndex" value="${lastIndex - maxsteps + 1}" />
            <g:if test="${beginIndex < firstIndex}">
                <g:set var="beginIndex" value="${firstIndex}" />
            </g:if>
            <g:set var="endIndex" value="${lastIndex}" />
        </g:if>
        
        <!--上一頁-->
        <g:if test="${content&&currentIndex>firstIndex}">
            <li><g:link action="show" id="${lesson.contents[currentIndex-1]?.id}">«</g:link></li>
        </g:if>
        <g:else>
            <li class="disabled"><span>«</span></li>
        </g:else>
        <!--頁數-->

        <g:set var="skip" value="${false}" />
        
        <g:each in="${lesson?.contents}" var="row" status="i">
            <g:if test="${i>=beginIndex&&i<endIndex}">
                <g:set var="skip" value="${false}" />
                <li class="${row.id==content.id?'active':''}">
                    <g:link action="show" id="${row.id}">${i+1}</g:link>
                </li>
            </g:if>
            <g:elseif test="${!skip}">
                <g:set var="skip" value="${true}" />
                <li class="disabled">
                    <a href="#">...</a>
                </li>
            </g:elseif>
        </g:each>
        <!--下一頁-->
        <g:if test="${content&&currentIndex<lastIndex}">
            <li>
                <g:link action="show" id="${lesson.contents[currentIndex+1]?.id}">»</g:link>
            </li>
        </g:if>
        <g:else>
            <li class="disabled"><span>»</span></li>
        </g:else>
    </ul>
</div>
