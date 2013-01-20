<!--內容跳頁-->
<div class="pagination pagination-centered pagination-large">
    <ul>
        <g:set var="currentIndex" value="${lesson.contents.indexOf(content)}" />
        <g:set var="firstIndex" value="${0}" />
        <g:set var="lastIndex" value="${lesson.contents.size()-1}" />
        <g:set var="maxsteps" value="${10}" />
        <g:set var="beginIndex" value="${currentIndex - Math.round(maxsteps / 2) + (maxsteps % 2)}" />
        <g:set var="endIndex" value="${currentIndex + Math.round(maxsteps / 2) - 1}" />
        
        <g:if test="${beginIndex < firstIndex}">
            <g:set var="beginIndex" value="${firstIndex}" />
            <g:set var="endIndex" value="${maxsteps}" />
        </g:if>
        
        <g:if test="${endIndex > lastIndex}">
            <g:set var="beginIndex" value="${lastIndex - maxsteps + 1}" />
            <g:if test="${beginIndex < firstIndex}">
                <g:set var="beginIndex" value="${firstIndex}" />
            </g:if>
            <g:set var="endIndex" value="${lastIndex}" />
        </g:if>
        
        <!--上一頁-->
        <g:if test="${content&&currentIndex>firstIndex}">
            <li><g:link action="show" id="${lesson.contents[currentIndex-1]?.id}">«</g:link></li>
        </g:if>
        <g:else>
            <li class="disabled"><span>«</span></li>
        </g:else>
        <!--頁數-->

        <g:set var="skip" value="${false}" />
        
        <g:each in="${lesson?.contents}" var="row" status="i">
            <g:if test="${i>=beginIndex&&i<endIndex}">
                <g:set var="skip" value="${false}" />
                <li class="${row.id==content.id?'active':''}">
                    <g:link action="show" id="${row.id}">${i+1}</g:link>
                </li>
            </g:if>
            <g:elseif test="${!skip}">
                <g:set var="skip" value="${true}" />
                <li class="disabled">
                    <a href="#">...</a>
                </li>
            </g:elseif>
        </g:each>
        <!--下一頁-->
        <g:if test="${content&&currentIndex<lastIndex}">
            <li>
                <g:link action="show" id="${lesson.contents[currentIndex+1]?.id}">»</g:link>
            </li>
        </g:if>
        <g:else>
            <li class="disabled"><span>»</span></li>
        </g:else>
    </ul>
</div>
