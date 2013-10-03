
<div class="widget stacked">
    <div class="widget-content">

            <!-- Breadcrumbs -->
            <g:render template="/course/breadcrumb" />

            <g:if test="${authoring}">
                <!-- Authoring Operations -->
                <g:render template="lesson_toolbar" />    
            </g:if>

            <div class="page-header">
                <h2>${lesson.title}</h2>
            </div>
            <div class="markdown-source">${lesson.description?.encodeAsHTML()}</div>

    </div>
</div> <!-- /.widget -->

<g:if test="${lesson.contents}">
    <div class="row">
        <div class="col-md-6">
            <div class="widget stacked">
                <div class="widget-header">
                    <h3>單元內容</h3>
                </div>
                <div class="widget-content">
                    <ol>
                        <g:each in="${lesson.contents}" var="content" status="i">
                            <li>
                                <g:if test="${records[content]==null}">
                                    <i class="icon-check-empty"></i>&nbsp;
                                </g:if>
                                <g:elseif test="${records[content]?.passed}">
                                    <i class="icon-check"></i>&nbsp;
                                </g:elseif>
                                <g:else>
                                    <i class="icon-edit"></i>&nbsp;
                                </g:else>
                                
                                <g:link controller="content" action="show" id="${content.id}">
                                    ${content.title}
                                </g:link>

                                <!-- Stars -->
                                <g:each in="${1..content.level}"><i class="icon icon-star icon-gray"></i></g:each>
                            </li>
                        </g:each>
                    </ol>

                    <hr/>

                    <p>（狀態圖示：<i class="icon icon-check-empty"></i> 未作答、<i class="icon icon-edit"></i> 尚未完成、<i class="icon icon-check"></i> 已完成）</p>
                </div>
            </div>
        </div>

        <div class="col-md-6">

            <div class="widget stacked">
                <div class="widget-header">
                    <h3>學習進度</h3>
                </div>
                <div class="widget-content">
                    <!-- Pie Chart -->
                    <g:render template="lesson_chart" />
                </div>
            </div>
        </div>
    </div>
</g:if>
