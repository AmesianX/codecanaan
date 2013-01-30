<g:if test="${authoring}">
<%--作者工具列--%>
<g:render template="lesson_toolbar" />    
</g:if>

<section>
    <div class="page-header">
        <h1>${lesson.title}</h1>
    </div>
    <div class="markdown-source">${lesson.description?.encodeAsHTML()}</div>
</section>

<%--目錄--%>
<g:if test="${lesson.contents}">

    <h2>學習進度</h2>

    <%--統計圖表--%>
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
                <g:each in="${1..content.level}">
                    <g:img dir="images" file="star-16.png" />
                </g:each>
            </li>
        </g:each>
    </ul>

    （狀態圖示：<i class="icon icon-check-empty"></i> 未作答、<i class="icon icon-edit"></i> 尚未完成、<i class="icon icon-check"></i> 已完成）

</g:if>
