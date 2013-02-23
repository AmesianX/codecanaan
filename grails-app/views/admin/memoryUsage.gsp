<html>
<head>
<meta name="layout" content="bootstrap" />
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid clearlook-wrapper">
        <div class="span12 padding-around">
            <g:link action="index" class="btn">返回</g:link>

            <table class="table">
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
</body>
</html>
