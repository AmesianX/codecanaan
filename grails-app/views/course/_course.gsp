<%--
顯示課程主畫面
@param course 用於顯示的課程物件
--%>

<%--作者工具列--%>
<g:if test="${authoring}">
    <g:render template="course_toolbar" />
</g:if>

<%--主要內容--%>
<section>
    <div class="page-header">
        <h1>${course.title}</h1>
    </div>
    <div class="markdown-source">${course.description?.encodeAsHTML()}</div>
</section>

<%--學習單元--%>
<g:if test="${course.lessons}">
    <section>
        <h2><g:message code="views.course._course.lesson.heading" /></h2>
        <ul class="icons">
            <g:each in="${course.lessons}" var="lesson" status="i">
                <li>
                    <i class="icon-ok" style="color:#70995C"></i>
                    <g:link controller="lesson" action="show" id="${lesson.id}">${lesson.title}</g:link>
                </li>
            </g:each>
        </ul>
    </section>
</g:if>
