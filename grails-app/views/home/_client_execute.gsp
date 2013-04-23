<section id="client">
    <div class="page-header">
        <h1>執行客戶端工具</h1>
    </div>
    
    <g:img dir="images" file="cloud_computing.png" style="padding:10px;float:right" />

    <div>
        <span class="effect-round-corner margin-below" style="background:#dfdfdf;padding:10px;display:inline-block">
            <g:link controller="webstart" action="launcher" class="btn btn-success btn-large launcher-link">
                <i class="icon icon-play"></i>
                啟動客戶端工具
            </g:link>
        </span>

        <label>
            <input type="checkbox" id="exam-mode" /> 啟用測驗模式（beta）
        </label>
    </div>
</section>
<r:script>
$('a.launcher-link').click(function(){
    var href = $(this).attr('href');
    if ($('input#exam-mode').is(':checked')) {
        href += '?mode=exam';
        location.href = href;
        return false;
    }
});
</r:script>
