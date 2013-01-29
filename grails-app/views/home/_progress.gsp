<div class="padding-around">
    <p class="textalign-center"><i class="icon  icon-thumbs-up icon-blue"></i> 完成四個步驟就能獲得完整的學習功能</p>
    <div class="progress progress-striped">
        <div class="bar" style="width:${step*25}%;"></div>
    </div>
    <div class="row-fluid">
        <div class="span3 textalign-center">
            <g:if test="${step>1}">
                <i class="icon icon-ok icon-green"></i>
            </g:if>
            <g:else>
                <i class="icon icon-double-angle-right icon-gray"></i>
            </g:else>
            會員登入
        </div>
        <div class="span3 textalign-center">
            <g:if test="${step>2}">
                <i class="icon icon-ok icon-green"></i>
            </g:if>
            <g:else>
                <i class="icon icon-double-angle-right icon-gray"></i>
            </g:else>
            安裝 Java 軟體
        </div>
        <div class="span3 textalign-center">
            <g:if test="${step>3}">
                <i class="icon icon-ok icon-green"></i>
            </g:if>
            <g:else>
                <i class="icon icon-double-angle-right icon-gray"></i>
            </g:else>
            啟動客戶端工具
        </div>
        <div class="span3 textalign-center">
            <g:if test="${step>=4}">
                <i class="icon icon-ok icon-green"></i>
            </g:if>
            <g:else>
                <i class="icon icon-double-angle-right icon-gray"></i>
            </g:else>
            獲取免費課程
        </div>
    </div>
</div>
