<div class="btn-group pull-right hidden-phone">
    <g:link action="show" id="${course.id}" params="[editor: true]" class="btn btn-default">
        <i class="icon-edit"></i>
        <%--修改課程--%>
        <g:message code="default.button.edit.label" />
    </g:link>
    <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu pull-right">
        <li>
            <g:link controller="lesson" action="create" params="['course.id': course.id]" class="auto-loadmask">
                <i class="icon icon-book"></i>
                <%--新增單元--%>
                <g:message code="views.course._course_toolbar.create.lesson" />
            </g:link>
        </li>
        <li>
            <g:link action="user" id="${course.id}">
                <i class="icon icon-user"></i>
                <%--使用者管理--%>
                <g:message code="views.course._course_toolbar.update.user" />
            </g:link>
        </li>
        <li>
            <g:link controller="course" action="sort" id="${course.id}">
                <i class="icon icon-sort"></i>
                <%--排序學習單元--%>
                <g:message code="views.course._course_toolbar.sort.lesson" />
            </g:link>
        </li>
        <li>
            <g:link controller="course" action="delete" id="${course.id}" onclick="return confirm('Are you sure???');">
                <i class="icon icon-remove"></i>
                <%--刪除課程--%>
                <g:message code="views.course._course_toolbar.remove.course" />
            </g:link>
        </li>
    </ul>
</div>
