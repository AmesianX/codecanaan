<g:if test="${authoring&&editor}">
    <!--編輯單元-->
    <g:form controller="lesson" action="ajaxSave" method="post">
        <div class="control-group">
            <label class="control-label" for="title">單元名稱</label>
            <div class="controls">
                <g:textField name="title" value="${lesson.title}" />
            </div>
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-editor" data-toggle="tab">單元說明</a></li>
            <li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-editor">
                <div class="wmd-panel">
                    <div id="wmd-button-bar"></div>
                    <g:textArea name="description" cols="40" rows="5" maxlength="1048576" value="${lesson.description}" class="wmd-input input-xlarge" id="wmd-input" />
                </div>
            </div>
            <div class="tab-pane" id="tab-preview">
                <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
            </div>
        </div>
        <!--按鈕區-->
        <g:submitToRemote url="[controller: 'lesson', action: 'ajaxSave', id: lesson.id]" class="btn btn-primary" value="更新" onSuccess="if(data.url)location.href=data.url" />
        <g:link action="show" id="${course.id}" params="[lessonId: lesson.id]" class="btn">取消修改</g:link>
    </g:form>
</g:if>
<g:else>
    <!--檢查作者權限-->
    <g:if test="${authoring}">
        <div class="btn-group pull-right">
            <g:link controller="course" action="show" id="${course.id}" params="['lessonId': lesson.id, editor: true]" class="btn">
                <i class="icon icon-edit"></i>
                修改單元
            </g:link>
            <a class="btn dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><g:link controller="lesson" action="delete" id="${lesson.id}" onclick="confirm('Are you sure???');"><i class="icon icon-remove"></i> 刪除單元</g:link></li>
                <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id]"><i class="icon icon-pencil"></i> 新增內容</g:link></li>
            </ul>
        </div>
    </g:if>
    <h1>${lesson.title}</h1>
    <div class="markdown-source">${lesson.description}</div>
    
    <!--目錄-->
    <g:if test="${lesson.contents?.size() > 0}">
        <hr class="soften" />
        <h4>教材內容</h4>
        <ul class="nav nav-tabs nav-stacked">
            <g:each in="${lesson.contents}" var="row" status="i">
                <li><g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: row.id]">${row.title}</g:link></li>
            </g:each>
        </ul>
    </g:if>
    <g:else>
        <hr class="soften" />
        <p>此教學單元未包含任何教材內容！</p>
    </g:else>
</g:else>