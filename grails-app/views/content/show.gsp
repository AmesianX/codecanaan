<html>
<head>
    <title>${content.title}</title>
    <meta name="layout" content="baseadmin">
    <r:require modules="exercise" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon-list"></i>
                        <h3>Table of Contents</h3>
                    </div>
                    <div class="widget-content">
                        <!-- Course, Table of Contents -->
                        <g:render template="/course/menu" />
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-content">

                        <!-- Breadcrumbs -->
                        <g:render template="/course/breadcrumb" />

                        <g:if test="${authoring&&params.editor}">
                            <g:render template="content_editor"/>
                        </g:if>
                        <g:else>
                            <g:render template="content"/>
                        </g:else>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

<!-- JavaScript -->
<g:hiddenField name="__ajax_save_record_url" value="${createLink(controller: 'content', action: 'ajaxSaveRecord', id: content?.id)}" />
<g:hiddenField name="__ajax_biwascheme_url" value="${createLink(controller: 'content', action: 'biwascheme')}" />
<g:hiddenField name="__ajax_savetemp_url" value="${createLink(controller: 'content', action: 'ajaxSaveTemp')}" />
<g:hiddenField name="__ajax_loader_image_src" value="${resource(dir: '/images', file: 'ajax-loader.gif')}" />
<g:hiddenField name="__ajax_client_port" value="${clientPort}" />

</body>
</html>
