<g:if test="${content.description}">
    <!-- 內容 -->
    <div class="tab-pane active" id="tab1">
        <!-- Justfont -->
        <div class="justfont">
            <div class="markdown-source">${content.description?.encodeAsHTML()}</div>
        </div>
    </div>
</g:if>

<g:if test="${content.hint}">
    <!-- 提示 -->
    <div class="tab-pane" id="tab2">
        <div class="markdown-source">${content.hint?.encodeAsHTML()}</div>
    </div>
</g:if>

<g:if test="${content.material}">
    <!-- 教案 -->
    <div class="tab-pane" id="tab3">
        <div class="markdown-source">${content.material?.encodeAsHTML()}</div>
    </div>
</g:if>