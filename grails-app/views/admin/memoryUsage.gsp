<html>
<head>
    <title>Memory Usages</title>
    <meta name="layout" content="baseadmin" />
    <r:require modules="baseadmin-reports" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                ...
            </div>
            <div class="col-md-9">

                <g:link action="index" class="btn btn-default">返回</g:link>

                <hr />

                <div class="widget big-stats-container stacked">
                    <div class="widget-content">
                        <div id="big_stats" class="cf">
                            <g:each in="${beans}" var="bean" status="i">
                                <g:if test="${bean.name!='Code Cache'}">
                                    <div class="stat">
                                        <h4>${bean.name}</h4>
                                        <span class="value">${Math.round(bean.usage.used / bean.usage.max * 100)}</span>
                                        %
                                    </div>
                                </g:if>
                            </g:each>
                        </div>
                    </div>
                </div>

                <div class="widget stacked widget-table">
                    <div class="widget-content">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Type</th>
                                    <th>Usage</th>
                                    <th>Peak Usage</th>
                                    <th>Collection Usage</th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${beans}" var="bean" status="i">
                                    <tr>
                                        <td>${bean.name}</td>
                                        <td>${bean.type}</td>
                                        <td>${Math.round(bean.usage.used / bean.usage.max * 100)}% of ${Math.round(bean.usage.max / 1024 / 1024)} MB</td>
                                        <td>${Math.round(bean.peakUsage.used / bean.peakUsage.max * 100)}% of ${Math.round(bean.peakUsage.max / 1024 / 1024)} MB</td>
                                        <td>
                                            <g:if test="${bean.collectionUsage}">
                                                ${Math.round(bean.collectionUsage.used / bean.collectionUsage.max * 100)}% of ${Math.round(bean.collectionUsage.max / 1024 / 1024)} MB
                                            </g:if>
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
