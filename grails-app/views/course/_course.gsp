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
