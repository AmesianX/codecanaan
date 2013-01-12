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

<section class="justfont">
    <div class="page-header">
        <h1>${lesson.title}</h1>
    </div>
    <div class="markdown-source">${lesson.description?.encodeAsHTML()}</div>
</section>

<!--目錄-->
<g:if test="${lesson.contents?.size() > 0}">

    <section>
        <h3>學習進度</h3>
        <!--圖表-->
        <g:render template="lesson_chart" />
    </section>

    <section>
    
        <h3><g:message code="default.list.label" args="[message(code:'content.label')]" /></h3>
        <table class="table">
            <thead>
                <tr>
                    <th width="30">#</th>
                    <th width="40"><!--燈號--><g:message code="default.light.text" /></th>
                    <th><!--標題--><g:message code="content.title.label" /></th>
                    <th width="50"><!--瀏覽數--><g:message code="default.hits.text" /></th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${lesson.contents}" var="row" status="i">
                    <tr>
                        <td>${i+1}</td>
                        <td>
                            <img src="${createLink(controller: 'content', action: 'light', id: row.id)}" alt="light" />
                        </td>
                        <td>
                            <g:link controller="content" action="show" id="${row.id}">${row.title}</g:link>
                        </td>
                        <td>${row.hits}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
    </div>
</g:if>
<g:else>
    <div class="alert alert-warning">
        <p>此教學單元未包含任何教材內容！</p>
    </div>
</g:else>
