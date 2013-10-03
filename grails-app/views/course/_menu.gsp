<ul class="nav nav-pills nav-stacked">
    <li class="${!lesson?'active':''}">
        <g:link controller="course" action="show" id="${course?.id}">
            <i class="icon icon-book"></i>
            &nbsp;
            ${course?.title}
        </g:link>
    </li>
    <g:each in="${course?.lessons}" var="${row}" status="i">
        <li class="${row.id==lesson?.id?'active':''}">
            <g:link controller="lesson" action="show" id="${row?.id}">
                ${row.title}
            </g:link>
        </li>
    </g:each>
</ul>
