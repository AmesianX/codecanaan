<ul class="nav nav-pills nav-stacked icons" style="font-size:11pt">
    <li class="disabled"><a href="#">${course?.title}</a></li>
    <li class="${!lesson?'active':''}">
        <g:link controller="course" action="show" id="${course?.id}">
            <!--課程首頁-->
            <g:message code="course.index.text" />
        </g:link>
    </li>
    <g:each in="${course?.lessons}" var="${row}" status="i">
        <li class="${row.id==lesson?.id?'active':''}">
            <i class="icon-book"></i>
            <g:link controller="lesson" action="show" id="${row?.id}">
                ${row.title}
            </g:link>
        </li>
    </g:each>
</ul>
