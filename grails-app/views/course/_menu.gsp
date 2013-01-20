<button id="close-menu-button" type="button" class="close" title="不顯示選單">×</button>
<r:script>
$('#close-menu-button').click(function() {
    $('#menu-container').remove();
    $('#content-container').removeClass('span9 padding-rightside').addClass('span12 padding-around');
});
</r:script>
<ul class="nav nav-pills nav-stacked" style="font-size:10pt">
    <li class="disabled"><a href="#">${course?.title}</a></li>
    <li class="${!lesson?'active':''}">
        <g:link controller="course" action="show" id="${course?.id}">
            <!--課程首頁-->
            <g:message code="course.index.text" />
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
