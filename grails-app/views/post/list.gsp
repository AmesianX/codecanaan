<html>
<head>
    <title>List all posts</title>

    <meta name="layout" content="baseadmin">
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>Category</h3>
                    </div>
                    <div class="widget-content">
                        <ul class="nav nav-pills nav-stacked">
                            <li class="${type==codecanaan.PostType.ANNOUNCE?'active':''}">
                                <g:link action="list" params="[type: 'ANNOUNCE']">
                                    <span class="badge pull-right">${announceCount}</span>
                                    <i class="icon icon-chevron-right"></i>&nbsp;
                                    <g:message code="postType.ANNOUNCE.label" />
                                </g:link>
                            </li>
                            <li class="${type==codecanaan.PostType.STATIC?'active':''}">
                                <g:link action="list" params="[type: 'STATIC']">
                                    <i class="icon icon-chevron-right"></i>&nbsp;
                                    <g:message code="postType.STATIC.label" />
                                </g:link>
                            </li>
                        </ul>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked widget-table">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>Posts List</h3>
                    </div>
                    <div class="widget-content">
                        <table class="table table-bordered table-hover table-striped">
                            <thead>
                                <tr>
                                    <th width="40">#</th>
                                    <th><g:message code="post.title.label" /></th>
                                    <th width="100"><g:message code="post.dateCreated.label" /></th>
                                    <th width="60"><g:message code="post.hits.label" /></th>
                                </tr>
                            </thead>
                            <tbody>
                                <g:if test="${!posts}">
                                    <tr>
                                        <td colspan="4"><div style="text-align:center"><g:message code="default.empty.description" /></div></td>
                                    </tr>
                                </g:if>
                                <g:each in="${posts}" var="post" status="i">
                                    <tr>
                                        <td>${i+1}</td>
                                        <td><g:link controller="post" action="show" params="[name: post?.name]">${post.title}</g:link></td>
                                        <td>
                                            <g:formatDate date="${post.lastUpdated}" type="date" style="SHOROT" />
                                        </td>
                                        <td><span class="muted">${post.hits}</span></td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

<div class="row">
    <div class="span3 bs-docs-sidebar">
        

        <hr class="soften" />
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <g:link action="create" params="[type:type]" class="btn"><g:message code="default.create.label" args="[message(code:'post.label')]" /></g:link>
        </sec:ifAnyGranted>
    </div>
    <div class="span9">
        
    </div>
</div>
</body>
</html>
