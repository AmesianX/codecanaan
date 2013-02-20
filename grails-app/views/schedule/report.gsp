<html>
<head>
<title>學習進度報表</title>
<meta name="layout" content="bootstrap"/>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid clearlook-wrapper">
        <div class="span12 padding-around">
            <div class="pull-right">
                <g:link action="show" id="${schedule.id}" class="btn">
                    <!--返回-->
                    <i class="icon icon-chevron-left"></i>
                    返回
                </g:link>
            </div>
            
            <div class="page-header">
                <h1>${lesson.title}</h1>
            </div>
            <table class="table">
                <thead>
                    <tr>
                        <th width="150">學員</th>
                        <th width="*">進度</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${users}" var="user" status="i">
                        <tr>
                            <td>
                                ${user.fullName}
                            </td>
                            <td>
                                <g:each in="${lesson.contents}" var="content" status="j">
                                    <img src="${createLink(controller:'content', action:'light', id:content.id, params: [uid: user.id])}" alt="狀態" />
                                </g:each>
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
