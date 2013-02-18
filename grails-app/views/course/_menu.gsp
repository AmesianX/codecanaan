<%--關閉側邊選單按鈕--%>
<button id="close-menu-button" type="button" class="close" title="不顯示選單">×</button>
<r:script>
$('#close-menu-button').click(function() {

    var _backup = $('#menu-container').clone(true);
    var _parent = $('#menu-container').parent();

    $('#menu-container').remove();
    $('#content-container').removeClass('span9 padding-rightside').addClass('span12 padding-around');

    if ($.cookie) {
        $.cookie('_clsm', '1', { path: '/' });
    }

    var a = $('<a href="#" class="hidden-phone" style="position:absolute;left:5px;top:100px;color:#888888;font-size:10pt;"><i class="icon icon-list"></i><br/>顯<br/>示<br/>選<br/>單</a>');
    a.appendTo('body');
    a.click(function() {
        _parent.prepend(_backup);
        $('#content-container').addClass('span9 padding-rightside').removeClass('span12 padding-around');
        a.remove();
        $.removeCookie('_clsm', { path: '/' });
    });
});

if ($.cookie && $.cookie('_clsm')) {
    $('#close-menu-button').click();
}
</r:script>
<ul class="nav nav-pills nav-stacked" style="font-size:10pt">
    <li class="${!lesson?'active':''}">
        <g:link controller="course" action="show" id="${course?.id}">
            <%--課程首頁--%>
            <i class="icon icon-book"></i> ${course?.title}</a>
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
