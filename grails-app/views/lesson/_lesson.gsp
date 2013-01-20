<!--檢查作者權限-->
<g:if test="${authoring}">
    <div class="btn-toolbar pull-right">
        <!--新增內容選單-->
        <g:render template="/content/addmenu" />

        <div class="btn-group">
            <g:link action="show" id="${lesson.id}" params="[editor: true]" class="btn">
                <i class="icon icon-edit"></i>
                <!--修改單元-->
                <g:message code="default.modify.label" args="[message(code: 'lesson.label')]" />
            </g:link>
            <a class="btn dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li>
                    <g:link controller="lesson" action="delete" id="${lesson.id}" onclick="confirm('Are you sure???');">
                        <i class="icon icon-remove"></i>
                        <!--刪除單元-->
                        <g:message code="default.delete.label" default="Delete {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                    </g:link>
                </li>
                <li>
                    <g:link controller="lesson" action="create" params="['course.id': course.id]">
                        <i class="icon icon-book"></i>
                        <!--新增單元-->
                        <g:message code="default.add.label" default="Add {0}" args="[message(code: 'lesson.label', default: 'Lesson')]" />
                    </g:link>
                </li>
                <li>
                    <g:link controller="lesson" action="sort" id="${lesson.id}">
                        <i class="icon icon-sort"></i>
                        <!--內容排序-->
                        <g:message code="default.ordering.label" default="{0} Ordering" args="[message(code: 'content.label', default: 'Content')]" />
                    </g:link>
                </li>
            </ul>
        </div>
    </div>
</g:if>

<section>
    <div class="page-header">
        <h1>${lesson.title}</h1>
    </div>
    <div class="markdown-source">${lesson.description?.encodeAsHTML()}</div>
</section>

<!--目錄-->
<g:if test="${lesson.contents?.size() > 0}">

    <h2>學習進度</h2>

    <!--統計圖表-->
    <g:render template="lesson_chart" />

    <h2>單元內容</h2>
    
    <ul class="icons">
        <g:each in="${lesson.contents}" var="content" status="i">
            <li>
                <g:if test="${records[content]==null}">
                    <i class="icon-check-empty"></i>
                </g:if>
                <g:elseif test="${records[content]?.passed}">
                    <i class="icon-check"></i>
                </g:elseif>
                <g:else>
                    <i class="icon-edit"></i>
                </g:else>
                <g:link controller="content" action="show" id="${content.id}">${content.title}</g:link>
            </li>
        </g:each>
    </ul>

    （狀態圖示：<i class="icon icon-check-empty"></i> 未作答、<i class="icon icon-edit"></i> 尚未完成、<i class="icon icon-check"></i> 已完成）

</g:if>
<g:else>
    <div class="alert alert-warning">
        <p>此教學單元未包含任何教材內容！</p>
    </div>
</g:else>
