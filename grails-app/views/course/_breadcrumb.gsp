<%--字型調整按鈕--%>
<div class="btn-group hidden-phone pull-right" style="padding:10px">
    <a class="btn btn-mini" id="jfontsize-m" href="#"><i class="icon icon-minus"></i></a>
    <a class="btn btn-mini" id="jfontsize-d" href="#"><i class="icon icon-font"></i></a>
    <a class="btn btn-mini" id="jfontsize-p" href="#"><i class="icon icon-plus"></i></a>
</div>
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
