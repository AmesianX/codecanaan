<ul class="breadcrumb">
    <g:if test="${course}">
        <li class="${controllerName=='course'?'active':''}">
            <g:link controller="course" action="show" id="${course.id}" class="${controllerName=='course'?'muted':''}">${course.title}</g:link>
        </li>
    </g:if>
    <g:if test="${lesson}">
        <li class="${controllerName=='lesson'?'active':''}">
            <span class="divider">/</span>
            <g:link controller="lesson" action="show" id="${lesson.id}" class="${controllerName=='lesson'?'muted':''}">${lesson.title}</g:link>
        </li>
    </g:if>
    <g:if test="${content}">
        <li class="${controllerName=='content'?'active':''}">
            <span class="divider">/</span>
            <g:link controller="content" action="show" id="${content.id}" class="${controllerName=='content'?'muted':''}">${content.title}</g:link>
        </li>
    </g:if>
</ul>
