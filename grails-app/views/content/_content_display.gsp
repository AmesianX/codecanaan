<div class="tabbable tabs-below">
    <div class="tab-content">
        <g:if test="${content.description}">
            <%--內容--%>
            <div class="tab-pane active" id="tab1">
                <div class="markdown-source font-resizable">${content.description?.encodeAsHTML()}</div>
            </div>
        </g:if>
        <g:if test="${content.hint}">
            <%--提示--%>
            <div class="tab-pane" id="tab2">
                <div class="markdown-source">${content.hint?.encodeAsHTML()}</div>
            </div>
        </g:if>
        <g:if test="${content.material}">
            <%--教案--%>
            <div class="tab-pane" id="tab3">
                <div class="markdown-source">${content.material?.encodeAsHTML()}</div>
            </div>
        </g:if>
    </div>
    <ul class="nav nav-tabs">
        <g:if test="${content.description}">
            <li class="active">
                <a href="#tab1" data-toggle="tab">
                    題目描述
                </a>
            </li>
        </g:if>
        <g:if test="${content.hint}">
            <li>
                <a href="#tab2" data-toggle="tab">
                    提示說明
                </a>
            </li>
        </g:if>
        <g:if test="${content.hint}">
            <li>
                <a href="#tab3" data-toggle="tab">
                    教師手冊
                </a>
            </li>
        </g:if>
    </ul>
</div>
