
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
                    <table class="table table-hover">
                        <tbody>
                            <g:each in="${lesson.contents}" var="content" status="i">
                                <tr>
                                    <td width="40">
                                        <g:if test="${records[content]==null}">
                                            <i class="icon-check-empty"></i>
                                        </g:if>
                                        <g:elseif test="${records[content]?.passed}">
                                            <i class="icon-check"></i>
                                        </g:elseif>
                                        <g:else>
                                            <i class="icon-edit"></i>
                                        </g:else>
                                    </td>
                                    <td>
                                        <g:link controller="content" action="show" id="${content.id}">
                                            <div>${content.title}</div>
                                        </g:link>
                                    </td>
                                    <td>
                                        <!-- Stars -->
                                        <g:each in="${1..content.level}"><i class="icon icon-star icon-gray"></i></g:each>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>

                    <p class="text-muted">（狀態圖示：<i class="icon icon-check-empty"></i> 未作答、<i class="icon icon-edit"></i> 尚未完成、<i class="icon icon-check"></i> 已完成）</p>
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
