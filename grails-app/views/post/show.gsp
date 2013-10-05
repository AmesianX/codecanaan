<html>
<head>
    <title>${post?.title}</title>
    <meta name="layout" content="baseadmin" />
    <meta name="display.footer" content="enable" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-file"></i>
                        <h3>${post?.title?:params.name}</h3>
                    </div>
                    <div class="widget-content">

                        <g:link action="list" params="[type: post?.type]">
                            <i class="icon icon-chevron-left"></i>&nbsp;
                            <g:message code="default.button.goback.label" />
                        </g:link>

                        <g:if test="${post}">

                            <div class="page-header">
                                <h2>${post?.title}</h2>
                            </div>
                            
                            <div class="markdown-source">${post?.content?.encodeAsHTML()}</div>
                            
                            <hr />
                            
                            <p>
                                <g:message code="default.lastUpdated.label" />:
                                <g:formatDate date="${post?.lastUpdated}" type="date" style="SHORT" />
                            </p>

                            <p>
                                <g:message code="default.creator.label" />:
                                <strong>${post?.creator?.fullName}</strong> (${post?.creator?.username})
                            </p>

                        </g:if>
                        <g:else>
                            <div class="page-header">
                                <h2>${params.name} <small>(Untitled)</small></h2>
                            </div>
                            <p>您來到了一個未建立頁面的主題。如果權限允許，您可以用 「建立」按鈕建立頁面。</p>
                        </g:else>
                        
                        <sec:ifAllGranted roles="ROLE_ADMIN">
                            <div class="padding-around">
                                <g:if test="${!post}">
                                    <!-- Create Button -->
                                    <g:link controller="post" action="create" params="[name: params.name, type: 'STATIC']" class="btn btn-default">
                                        <i class="icon icon-pencil"></i>&nbsp;
                                        <g:message code="default.button.create.label" />
                                    </g:link>
                                </g:if>
                                <g:else>
                                    <!-- Edit Button -->
                                    <g:link controller="post" action="edit" id="${post?.id}" class="btn btn-default">
                                        <i class="icon icon-pencil"></i>&nbsp;
                                        <g:message code="default.button.edit.label" />
                                    </g:link>
                                </g:else>
                            </div>
                        </sec:ifAllGranted>
                    </div>
                </div>
            </div> <!-- /.col -->

            <div class="col-md-3">
                <div class="widget widget-plain">
                    <div class="widget-content">
                        <google:adsense width="160" height="600" />
                    </div>
                </div>
                

            </div> <!-- /.col -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

</body>
</html>
