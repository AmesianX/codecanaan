<div class="btn-toolbar pull-right hidden-phone">
    <%--新增內容選單--%>
    <g:render template="/content/addmenu" />

    <div class="btn-group">
        <g:link action="show" id="${lesson.id}" params="[editor: true]" class="btn btn-default">
            <i class="icon icon-edit"></i>
            <%--修改單元--%>
            <g:message code="default.button.edit.label" />
        </g:link>
        <a class="btn btn-default dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu pull-right">
            <li>
                <g:link controller="lesson" action="delete" id="${lesson.id}" onclick="confirm('Are you sure???');">
                    <i class="icon icon-remove"></i>
                    <%--刪除單元--%>
                    <g:message code="default.delete.label" default="Delete {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                </g:link>
            </li>
            <li>
                <g:link controller="lesson" action="create" params="['course.id': course.id]">
                    <i class="icon icon-book"></i>
                    <%--新增單元--%>
                    <g:message code="default.add.label" default="Add {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                </g:link>
            </li>
            <li>
                <g:link controller="lesson" action="sort" id="${lesson.id}">
                    <i class="icon icon-sort"></i>
                    <%--內容排序--%>
                    <g:message code="default.ordering.label" default="{0} Ordering" args="[message(code: 'content.label', default: 'Content')]" />
                </g:link>
            </li>
        </ul>
    </div>
</div>
