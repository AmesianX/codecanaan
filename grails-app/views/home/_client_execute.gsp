<section id="client">

    <div class="page-header">
        <h3>啟動客戶端工具</h3>
    </div>
    
    <div class="col-md-4">
        <r:img dir="images" file="deco-001.png" />
    </div> <!-- /.col -->

    <div class="col-md-8">

        <p>CodeCanaan 需要在您的電腦上執行「客戶端工具」程式，此程式用於幫助您建立整合開發環境（IDE），以支援程式碼的自動化編譯與測試。當您不需要使用「客戶端工具」時，可以隨時將它關閉。</p>

        <p>請點選下方按鈕，立即為您啟動客戶端工具。</p>

        <span class="effect-round-corner" style="background:#dfdfdf;padding:10px;display:inline-block">
            <g:link controller="webstart" action="launcher" class="btn btn-success btn-lg launcher-link">
                <i class="icon icon-play"></i>&nbsp;
                客戶端工具
            </g:link>
        </span>

        <p class="text-muted">（Java Web Start 版本；相容 Windows、Mac OS X 及 Linux 作業系統）</p>

        <p>如果無法順利以 Java Web Start 方式啟動，您也可以嘗試下載應用程式壓縮檔。</p>

        <p>應用程式壓縮檔：<a href="http://assets.codecanaan.com/standalone/ClientTools.zip" target="_blank"><i class="icon-download-alt"></i>&nbsp;ClientTools.zip</a>
        <br/>
        <span class="text-muted">（壓縮檔版本；相容 Windows、Mac OS X 及 Linux 作業系統）</span>
        </p>

        <!--
        <label>
            <input type="checkbox" id="exam-mode" /> 啟用測驗模式（beta）
        </label>
        -->
    </div>
</section>
<r:script>
$(function() {
    $('a.launcher-link').click(function(){
        var href = $(this).attr('href');
        if ($('input#exam-mode').is(':checked')) {
            href += '?mode=exam';
            location.href = href;
            return false;
        }
    });
});
</r:script>
