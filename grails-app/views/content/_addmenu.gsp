<div class="btn-group">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <!--新增內容-->
        <g:message code="default.add.label" args="[message(code:'content.label')]" />
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'TUTORIAL']">
            <i class="icon icon-pencil"></i>
            <g:message code="content.contentType.TUTORIAL" />
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'SLIDE']">
            <i class="icon icon-pencil"></i>
            <g:message code="content.contentType.SLIDE" />
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE']">
            <i class="icon icon-pencil"></i>
            <g:message code="content.contentType.CODE" />
        </g:link></li>
        <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'QUIZ']">
            <i class="icon icon-pencil"></i>
            <g:message code="content.contentType.QUIZ" />
        </g:link></li>
    </ul>
</div>