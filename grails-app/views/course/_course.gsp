<!--顯示課程-->
<!--檢查作者權限-->
<g:if test="${authoring}">
    <div class="btn-group pull-right">
        <g:link action="show" id="${course.id}" params="[editor: true]" class="btn">
            <i class="icon-edit"></i>
            <!--修改課程-->
            <g:message code="default.modify.label" args="[message(code: 'course.label', default: 'Course')]" />
        </g:link>
        <button class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li>
                <g:link controller="lesson" action="create" params="['course.id': course.id]">
                    <i class="icon icon-book"></i>
                    <!--新增單元-->
                    <g:message code="default.add.label" default="Add {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                </g:link>
            </li>
            <li>
                <g:link action="user" id="${course.id}">
                    <i class="icon icon-user"></i>
                    <!--新增或移除使用者-->
                    <g:message code="default.add.remove.label" args="[message(code: 'user.label')]" />
                </g:link>
            </li>
            <li>
                <g:link controller="course" action="sort" id="${course.id}">
                    <i class="icon icon-sort"></i>
                    <!--調整單元排序-->
                    <g:message code="default.ordering.label" default="{0} Ordering" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                </g:link>
            </li>
            <li>
                <g:link controller="course" action="delete" id="${course.id}" onclick="return confirm('Are you sure???');">
                    <i class="icon icon-remove"></i>
                    <!--刪除課程-->
                    <g:message code="default.delete.label" default="Delete {0}" args="[message(code: 'course.label', default: 'Course')]" />
                </g:link>
            </li>
        </ul>
    </div>
</g:if>
<section class="justfont">
    <div class="page-header">
        <h1>${course.title}</h1>
    </div>
    <div class="markdown-source">${course.description?.encodeAsHTML()}</div>
</section>
