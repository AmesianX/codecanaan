<ul class="breadcrumb hidden-sm">
    <g:if test="${course}">
        <li class="${controllerName=='course'?'active':''}">
            <g:link controller="course" action="show" id="${course.id}" class="${controllerName=='course'?'muted':''}">${course.title}</g:link>
        </li>
    </g:if>
    <g:if test="${lesson}">
        <li class="${controllerName=='lesson'?'active':''}">
            <g:link controller="lesson" action="show" id="${lesson.id}" class="${controllerName=='lesson'?'muted':''}">${lesson.title}</g:link>
        </li>
    </g:if>
    <g:if test="${content}">
        <li class="${controllerName=='content'?'active':''}">
            <g:link controller="content" action="show" id="${content.id}" class="${controllerName=='content'?'muted':''}">${content.title}</g:link>
        </li>
    </g:if>
</ul>
<g:if test="${content}">
    <div class="visible-sm">
        <g:link controller="lesson" action="show" id="${lesson.id}" class="${controllerName=='lesson'?'muted':''}">
            <i class="icon icon-double-angle-left"></i>
            ${lesson.title}
        </g:link>
    </div>
</g:if>
<g:elseif test="${lesson}">
    <div class="visible-sm">
        <g:link controller="course" action="show" id="${course.id}" class="${controllerName=='course'?'muted':''}">
            <i class="icon icon-double-angle-left"></i>
            ${course.title}
        </g:link>
    </div>
</g:elseif>
