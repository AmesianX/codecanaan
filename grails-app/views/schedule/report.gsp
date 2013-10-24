<html>
<head>
    <meta name="layout" content="baseadmin"/>
    <title>學習進度報表</title>
</head>
<body>

<div class="main">

    <div class="container">

        <div class="row">

            <div class="col-md-12">

                <ol class="breadcrumb">
                    <li>
                        <g:link controller="schedule">
                            <g:message code="schedule.label" />
                        </g:link>
                    </li>
                    <li>
                        <g:link controller="schedule" action="show" id="${schedule.id}">
                            ${schedule.title}
                        </g:link>
                    </li>
                    <li class="active">Learning Progress Report</li>
                </ol>

                <div class="widget widget-table stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>${schedule.title}</h3>
                    </div>
                    <div class="widget-content">
                        <table class="table table-bordered table-strped table-hover">
                            <thead>
                                <tr>
                                    <th width="150">學員</th>
                                    <g:each in="${scheduleLessons*.lesson}" var="lesson" status="j">
                                        <td>
                                            ${lesson.title}
                                        </td>
                                    </g:each>
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${users}" var="user" status="i">
                                    <tr>
                                        <td>
                                            ${user.fullName}
                                        </td>
                                        <g:each in="${scheduleLessons*.lesson}" var="lesson" status="j">
                                            <td>
                                                ${recTable["${user.id}-${lesson.id}"]}
                                            </td>
                                        </g:each>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>

                    </div>
                </div> <!-- /.widget -->

            </div> <!-- /.col-md-12 -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

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
                <h1></h1>
            </div>
            
        </div>
    </div>
</div>
</body>
</html>
