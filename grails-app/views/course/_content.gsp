<g:if test="${editor}">
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

       

        <!--按鈕-->
        <g:submitToRemote url="[controller: 'content', action: 'ajaxSave', id: content.id]" class="btn btn-primary" value="更新" onSuccess="if(data.url)location.href=data.url" />
        <g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: content.id]" class="btn cancel-button">取消修改</g:link>
    </g:form>
</g:if>
<g:else>
    <div class="btn-group pull-right">
        <g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: content.id, editor: true]" class="btn">
            <i class="icon icon-edit"></i>
            <g:message code="default.edit.label" default="Edit {0}" args="[message(code: 'content.label', default: 'Content')]" />
        </g:link>
        <a class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, contentType: 'TUTORIAL']">
                <i class="icon icon-pencil"></i>
                <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.TUTORIAL', default: 'Tutorial')]" />
            </g:link></li>
        </ul>
    </div>

    <!--內容顯示-->
    <h1>${content.title} <small><g:message code="content.contentType.${content.type}" default="Content" /></small></h1>
    <div class="markdown-source">${content.description}</div>

    <!--程式碼區塊-->
    <g:if test="${content.sourceCode}">
        <g:if test="${content.sourcePath}">
            <p><i class="icon icon-file"></i> <em>${content.sourcePath}</em></p>
        </g:if>
        <pre><code class="code-font">${content.sourceCode}</code></pre>
    </g:if>

    <!--實作區塊-->
    <h4>Code Editor</h4>
    <div class="navbar">
        <div class="navbar-inner">
            <ul class="nav">
                <li><a href="#" id="play"><i class="icon icon-play"></i> Run</a></li>
                <li class="divider-vertical"></li>
            </ul>
        </div>
    </div>
    <g:hiddenField name="sourcePath" value="${content.sourcePath}" />
    <g:hiddenField name="sourceType" value="${content.sourceType}" />

    <ul class="nav nav-tabs">
        <li class="active"><a href="#tab-editor" data-toggle="tab">程式碼</a></li>
        <li><a href="#tab-output" data-toggle="tab">執行結果</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-editor">
            <g:textArea name="sourceCode" value="${content.partialCode}" class="codemirror-textarea" />
        </div>
        <div class="tab-pane" id="tab-output"><pre id="program-output" style="height:300px;overflow:auto"></pre></div>
    </div>

    <!--回答區塊-->
    <g:if test="${content.type==codecanaan.ContentType.TUTORIAL}">
        <label class="checkbox"><g:checkBox name="answer" value="YES" checked="" /> 打勾代表你已經閱讀完畢</label>
    </g:if>

    <!--標準答案-->
    <h4>Answer</h4>
    <g:if test="${content.answer}">
        <pre>${content.answer}</pre>
    </g:if>

    <!--內容跳頁-->
    <div class="pagination">
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