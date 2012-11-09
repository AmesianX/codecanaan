<!--檢查作者權限-->
<g:if test="${authoring}">
    <div class="btn-group pull-right">
        <g:link controller="course" action="show" id="${course.id}" params="['lessonId': lesson.id, editor: true]" class="btn">
            <i class="icon icon-edit"></i>
            修改單元
        </g:link>
        <a class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li>
                <g:link controller="lesson" action="delete" id="${lesson.id}" onclick="confirm('Are you sure???');">
                    <i class="icon icon-remove"></i>
                    刪除單元
                </g:link>
            </li>
            <li>
                <g:link controller="lesson" action="sort" id="${lesson.id}">
                    <i class="icon icon-sort"></i>
                    內容排序
                </g:link>
            </li>
            <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'TUTORIAL']">
                <i class="icon icon-pencil"></i>
                <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.TUTORIAL', default: 'Tutorial')]" />
            </g:link></li>
            <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'CODE']">
                <i class="icon icon-pencil"></i>
                <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.CODE', default: 'Code')]" />
            </g:link></li>
            <li><g:link controller="content" action="create" params="['lesson.id': lesson?.id, type: 'QUIZ']">
                <i class="icon icon-pencil"></i>
                <g:message code="default.add.label" default="Add {0}" args="[message(code: 'content.contentType.QUIZ', default: 'Quiz')]" />
            </g:link></li>
        </ul>
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
    <hr class="soften" />
    <h3>教材內容</h3>
    <table class="table">
        <thead>
            <tr>
                <th width="30">#</th>
                <th width="30">燈號</th>
                <th>標題</th>
                <th width="50">瀏覽數</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${lesson.contents}" var="row" status="i">
                <tr>
                    <td>${i+1}</td>
                    <td><img src="${createLink(controller: 'content', action: 'light', id: row.id)}" alt="light" /></td>
                    <td><g:link controller="course" action="show" id="${course.id}" params="[lessonId: lesson.id, contentId: row.id]">${row.title}</g:link></td>
                    <td>${row.hits}</td>
                </tr>
            </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <hr class="soften" />
    <p>此教學單元未包含任何教材內容！</p>
</g:else>
