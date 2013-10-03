<html>
<head>
    <title>${course.title}</title>

    <meta name="layout" content="baseadmin">
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="widget stacked">
                    <div class="widget-content">
                        <g:render template="/course/menu" />
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-content">
                        
                        <!-- Breadcrumb -->
                        <g:render template="/course/breadcrumb" />

                        <!-- Course Content -->
                        <g:if test="${authoring&&params.editor}">
                            <g:render template="course_editor"/>
                        </g:if>
                        <g:else>
                            <g:render template="course"/>
                        </g:else>

                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

</body>
</html>
