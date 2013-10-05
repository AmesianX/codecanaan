<!-- Name -->
<div class="form-group">
    <label for="name">
        <g:message code="post.name.label" />
    </label>
    <g:textField name="name" value="${post?.name}" class="form-control" />
</div>

<!-- Title -->
<div class="form-group">
    <label for="title">
        <g:message code="post.title.label" />
    </label>
    <g:textField name="title" value="${post?.title}" class="form-control" />
</div>

<!-- Content -->
<div class="form-group">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#tab-editor" data-toggle="tab">
                <g:message code="post.content.label" />
            </a>
        </li>
        <li>
            <a href="#tab-preview" data-toggle="tab">
                <g:message code="default.preview.label" args="[message(code:'post.content.label')]" />
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="tab-editor">
            <div class="wmd-panel wmd-editor">
                <div id="wmd-button-bar"></div>
                <g:textArea name="content" cols="40" rows="20" value="${post?.content}" class="wmd-input enable-tabkey form-control" id="wmd-input" />
            </div>
        </div>
        <div class="tab-pane" id="tab-preview">
            <div id="wmd-preview" class="wmd-panel wmd-preview"></div>
        </div>
    </div>
</div>

<!-- Tags -->
<div class="form-group">
    <label for="tag">
        <g:message code="post.tag.label" />
    </label>
    <g:textField name="tag" value="${post?.tag}" class="form-control" />
</div>

<!-- Post Type -->
<div class="form-group">
    <label for="type">
        <g:message code="post.type.label" />
    </label>
    <g:select name="type" from="${codecanaan.PostType?.values()}" keys="${codecanaan.PostType.values()*.name()}" required="" value="${post?.type?.name()}" class="form-control"/>
</div>