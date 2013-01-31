<%--字型調整按鈕--%>
<div class="btn-group hidden-phone pull-right" style="padding:10px">
    <a class="btn btn-mini" id="jfontsize-m" href="#"><i class="icon icon-minus"></i></a>
    <a class="btn btn-mini" id="jfontsize-d" href="#"><i class="icon icon-font"></i></a>
    <a class="btn btn-mini" id="jfontsize-p" href="#"><i class="icon icon-plus"></i></a>
</div>
<ul class="breadcrumb hidden-phone">
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
<g:if test="${content}">
    <div class="visible-phone">
        <g:link controller="lesson" action="show" id="${lesson.id}" class="${controllerName=='lesson'?'muted':''}">
            <i class="icon icon-double-angle-left"></i>
            ${lesson.title}
        </g:link>
    </div>
</g:if>
<g:elseif test="${lesson}">
    <div class="visible-phone">
        <g:link controller="course" action="show" id="${course.id}" class="${controllerName=='course'?'muted':''}">
            <i class="icon icon-double-angle-left"></i>
            ${course.title}
        </g:link>
    </div>
</g:elseif>
