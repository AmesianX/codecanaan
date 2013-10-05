<!DOCTYPE html>
<html>
<head>
    <title>${lesson.title}</title>

    <meta name="layout" content="baseadmin" />
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
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
                        <%--課程單元列表--%>
                        <g:render template="/course/menu" />
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">

                <g:if test="${authoring&&params.editor}">
                    <g:render template="lesson_editor"/>
                </g:if>
                <g:else>
                    <g:render template="lesson"/>
                </g:else>

            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
