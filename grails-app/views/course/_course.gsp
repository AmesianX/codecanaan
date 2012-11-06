<!--顯示課程-->
<!--檢查作者權限-->
<g:if test="${authoring}">
    <div class="btn-group pull-right">
        <g:link action="show" id="${course.id}" params="[editor: true]" class="btn">
            <i class="icon-edit"></i>
            修改課程
        </g:link>
        <button class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li>
                <g:link controller="lesson" action="create" params="['course.id': course.id]">
                    <i class="icon icon-book"></i>
                    新增單元
                </g:link>
            </li>
            <li>
                <g:link controller="course" action="sort" id="${course.id}">
                    <i class="icon icon-sort"></i>
                    單元排序
                </g:link>
            </li>
        </ul>
    </div>
</g:if>
<div class="justfont">
    <h1>${course.title}</h1>
    <div class="markdown-source">${course.description?.encodeAsHTML()}</div>
</div>
