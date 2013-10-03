<%@ page import="codecanaan.*" %>

<!--檢查作者權限-->
<g:if test="${authoring}">
    <g:render template="content_toolbar" />
</g:if>

<!--內容顯示-->
<g:if test="${content.type==ContentType.SLIDE}">
    <!--簡報-->
    <g:render template="content_slide" />
</g:if>
<g:elseif test="${content.type==ContentType.TUTORIAL}">
    <!--講義-->
    <g:render template="content_tutorial" />
</g:elseif>
<g:elseif test="${content.type==ContentType.QUIZ}">
    <!--測驗題-->
    <g:render template="content_quiz" />
</g:elseif>
<g:elseif test="${content.type==ContentType.CODE}">
    <!--實作題-->
    <g:render template="content_code" />
</g:elseif>

<!--會員必須先登入-->
<sec:ifNotLoggedIn>
    <div class="alert">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <!--訪客無法練習-->
        請先以會員帳號登入，才能取得完整的學習內容。
    </div>
</sec:ifNotLoggedIn>

<!--內容換頁機制-->
<div class="textalign-center">
    <ul class="pagination pagination-md">
        <g:set var="currentIndex" value="${lesson.contents.indexOf(content)}" />
        <g:set var="firstIndex" value="${0}" />
        <g:set var="lastIndex" value="${lesson.contents.size()-1}" />
        
        <!--上一題-->
        <g:if test="${content&&currentIndex>firstIndex}">
            <li><g:link action="show" id="${lesson.contents[currentIndex-1]?.id}">« 上一題</g:link></li>
        </g:if>
        <g:else>
            <li class="disabled"><span>« 上一題</span></li>
        </g:else>

        <li class="disabled"><span>第 ${currentIndex + 1} 題 / 共 ${lastIndex + 1} 題</span></li>

        <!--下一題-->
        <g:if test="${content&&currentIndex<lastIndex}">
            <li>
                <g:link action="show" id="${lesson.contents[currentIndex+1]?.id}">下一題 »</g:link>
            </li>
        </g:if>
        <g:else>
            <li class="disabled"><span>下一題 »</span></li>
        </g:else>
    </ul>
</div>

<!--隱藏變數-->
<g:hiddenField name="sourcePath" value="${content.sourcePath}" />
<g:hiddenField name="sourceType" value="${content.sourceType}" />
<g:hiddenField name="sourceCode" value="${content.sourceCode}" />
<g:hiddenField name="partialCode" value="${content.partialCode}" />
<g:hiddenField name="output" value="${content.output}" />
<g:hiddenField name="answer" value="${content.answer}" />
