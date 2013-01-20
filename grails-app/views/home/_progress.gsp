<div class="row margin-below">
    <div class="span12 progress-tracker">
        <div class="padding-around">
            <div>
                <p style="text-align:center"><i class="icon  icon-thumbs-up icon-blue"></i> 完成四個步驟就能獲得完整的學習功能</p>
            </div>
            <div class="progress progress-striped">
                <div class="bar" style="width:${step*25}%;"></div>
            </div>
            <ul class="steps">
                <li class="step1${step==1?' active':''}">
                    <g:if test="${step>1}">
                        <i class="icon icon-ok icon-2x icon-green"></i>
                    </g:if>
                    會員登入 »
                </li>
                <li class="step2${step==2?' active':''}">
                    <g:if test="${step>2}">
                        <i class="icon icon-ok icon-2x icon-green"></i>
                    </g:if>
                    安裝 Java 軟體 »
                </li>
                <li class="step3${step==3?' active':''}">
                    <g:if test="${step>3}">
                        <i class="icon icon-ok icon-2x icon-green"></i>
                    </g:if>
                    啟動客戶端工具 »
                </li>
                <li class="step4${step==4?' active':''}">
                    <g:if test="${step>=4}">
                        <i class="icon icon-ok icon-2x icon-green"></i>
                    </g:if>
                    獲取免費課程 »
                </li>
            </ul>
        </div>
    </div>
</div>
