<g:if test="${editor}">
    <!--編輯課程-->
    <g:form controller="course" action="ajaxSave" method="post">
        <div class="control-group">
            <label class="control-label" for="title">課程名稱</label>
            <div class="controls">
                <g:textField name="title" value="${course.title}" />
            </div>
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-editor" data-toggle="tab">課程說明</a></li>
            <li><a href="#tab-preview" data-toggle="tab">預覽</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-editor">
                <div class="wmd-panel">
                    <div id="wmd-button-bar"></div>
                    <g:textArea name="description" cols="40" rows="5" maxlength="1048576" value="${course.description}" class="wmd-input input-xlarge" id="wmd-input" />
                </div>
            </div>
            <div class="tab-pane" id="tab-preview">
                <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
            </div>
        </div>
        <g:submitToRemote url="[controller: 'course', action: 'ajaxSave', id: course.id]" class="btn btn-primary" value="更新" onSuccess="if(data.url)location.href=data.url" />
        <g:link action="show" id="${course.id}" class="btn">取消修改</g:link>
    </g:form>
</g:if>
<g:else>
    <!--顯示課程-->
    <div class="btn-group pull-right">
        <g:link action="show" id="${course.id}" params="[editor: true]" class="btn">
            <i class="icon-edit"></i>
            修改課程
        </g:link>
        <button class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><g:link controller="lesson" action="create" params="['course.id': course.id]"><i class="icon icon-book"></i> 新增單元</g:link></li>
        </ul>
    </div>
    <h1>${course.title}</h1>
    <div class="markdown-source">${course.description}</div>
    <h1></h1>
</g:else>