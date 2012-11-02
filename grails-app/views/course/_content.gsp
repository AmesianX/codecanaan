<g:if test="${authoring&&editor}">
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
                    <g:textArea name="description" cols="40" rows="20" maxlength="1048576" value="${content.description}" class="wmd-input input-xlarge" id="wmd-input" style="height:20em" />
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
</g:if>
<g:else>
    <!--檢查作者權限-->
    <g:if test="${authoring}">
        <div class="btn-group pull-right">
            <g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: content.id, editor: true]" class="btn">
                <i class="icon icon-edit"></i>
                <g:message code="default.edit.label" default="Edit {0}" args="[message(code: 'content.label', default: 'Content')]" />
            </g:link>
            <a class="btn dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><g:link controller="content" action="delete" id="${content.id}" onclick="confirm('Are you sure???');"><i class="icon icon-remove"></i> 刪除內容</g:link></li>
                <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'TUTORIAL']">
                    <i class="icon icon-pencil"></i>
                    <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.TUTORIAL', default: 'Tutorial')]" />
                </g:link></li>
                <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE']">
                    <i class="icon icon-pencil"></i>
                    <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.CODE', default: 'Code')]" />
                </g:link></li>
                <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'QUIZ']">
                    <i class="icon icon-pencil"></i>
                    <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.QUIZ', default: 'Quiz')]" />
                </g:link></li>
            </ul>
        </div>
    </g:if>

    <!--內容顯示-->
    <div class="justfont">
        <h1>
            ${content.title}
            <small><g:message code="content.contentType.${content.type}" default="Content" /></small>
        </h1>
       <div class="markdown-source">${content.description?.encodeAsHTML()}</div>
    </div>

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
            </g:if>
        </g:if>
        
        <hr class="soften" />
        <h4>開始練習</h4>

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
                        <li><a href="#" id="cmdUndo"><i class="icon icon-chevron-left"></i> 復原</a></li>
                        <li><a href="#" id="cmdRedo"><i class="icon icon-chevron-right"></i> 取消復原</a></li>
                        <li><a href="#" id="cmdReset"><i class="icon icon-repeat"></i> 清除重做</a></li>
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
                    <g:textArea name="sourceEdit" value="${(record?.sourceCode)?record.sourceCode:content.partialCode}" class="codemirror-textarea" />
                </div>
                <div class="tab-pane" id="tab-output"><pre id="program-output" style="height:500px;overflow:auto">${record?.answer}</pre></div>
                <div class="tab-pane" id="tab-answer"><pre style="height:500px;overflow:auto">${content.answer}</pre></div>
                <g:if test="${authoring}">
                    <div class="tab-pane" id="tab-source"><pre style="height:500px;overflow:auto"><code class="code-font">${content.sourceCode?.encodeAsHTML()}</code></pre></div>
                </g:if>
            </div>
        </g:if>
        <g:elseif test="${content.type==codecanaan.ContentType.TUTORIAL}">
            <!--講義-->
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

        <!--作答結果顯示區-->
        <!--<a data-toggle="modal" href="#myModal" class="btn btn-primary btn-large">Launch demo modal</a>-->
        <div class="modal hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">作答結果</h3>
            </div>
            <div class="modal-body" id="modalmsg"></div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">關閉</button>
            </div>
        </div>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <div class="alert">
            <button type="button" class="close" data-dismiss="alert">×</button>
            您目前正在以訪客身分瀏覽，請先登入取得練習權限！
        </div>
    </sec:ifNotLoggedIn>

    <!--內容跳頁-->
    <div class="pagination pagination-centered">
        <ul>
            <!--上一頁-->
            <g:if test="${content&&lesson.contents.indexOf(content)>0}">
                <li><g:link action="show" id="${course?.id}" params="[lessonId: lesson?.id, contentId: lesson.contents[lesson.contents.indexOf(content)-1].id]">«</g:link></li>
            </g:if>
            <g:else>
                <li class="disabled"><span>«</span></li>
            </g:else>
            <!--頁數-->
            <g:each in="${lesson?.contents}" var="row" status="i">
                <li class="${row.id==content?.id?'active':''}"><g:link action="show" id="${course?.id}" params="[lessonId: lesson?.id, contentId: row?.id]">${i+1}</g:link></li>
            </g:each>
            <!--下一頁-->
            <g:if test="${content&&lesson.contents.indexOf(content)+1<lesson.contents.size()}">
                <li><g:link action="show" id="${course?.id}" params="[lessonId: lesson?.id, contentId: lesson.contents[lesson.contents.indexOf(content)+1].id]">»</g:link></li>
            </g:if>
            <g:else>
                <li class="disabled"><span>»</span></li>
            </g:else>
        </ul>
    </div>
</g:else>
