<section id="versions">
    <div class="page-header">
        <h3>
            <i class="icon-lightbulb"></i>&nbsp;
            常見問題
        </h3>
    </div>

    <div class="col-md-9">
        <g:render template="client_faq_list" />
    </div> <!-- /.col -->
</section>

<r:script>
$(function() {
    // Show FAQ
    $('.faq-list').goFaq();
});
</r:script>