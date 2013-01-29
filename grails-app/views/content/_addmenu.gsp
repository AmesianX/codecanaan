<div class="btn-group">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <!--新增內容-->
        <g:message code="default.add.label" args="[message(code:'content.label')]" />
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'TUTORIAL']" class="auto-loadmask">
            <i class="icon icon-book"></i>
            <g:message code="content.contentType.TUTORIAL" />
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'SLIDE']" class="auto-loadmask">
            <i class="icon icon-picture"></i>
            <g:message code="content.contentType.SLIDE" />
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE', sourceType: 'JAVA']" class="auto-loadmask">
            <i class="icon icon-beaker"></i>
            <g:message code="content.contentType.CODE" /> Java
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE', sourceType: 'C']" class="auto-loadmask">
            <i class="icon icon-beaker"></i>
            <g:message code="content.contentType.CODE" /> C
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE', sourceType: 'CPP']" class="auto-loadmask">
            <i class="icon icon-beaker"></i>
            <g:message code="content.contentType.CODE" /> C++
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE', sourceType: 'SCHEME']" class="auto-loadmask">
            <i class="icon icon-beaker"></i>
            <g:message code="content.contentType.CODE" /> Scheme
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'QUIZ']" class="auto-loadmask">
            <i class="icon icon-edit"></i>
            <g:message code="content.contentType.QUIZ" />
        </g:link></li>
    </ul>
</div>
