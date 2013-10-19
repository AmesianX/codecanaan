<html>
<head>
    <title>調整內容排序</title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="well">
                    <h4>Extra Info</h4>
                    <g:message code="default.ordering.description" />
                </div>
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>${lesson.title}</h3>
                    </div>
                    <div class="widget-content">

                        <g:form controller="lesson" action="sortUpdate" id="${lesson.id}" method="post">

                            <g:if test="${lesson.contents}">
                                <ul id="sortable" class="nav nav-pills nav-stacked">
                                    <g:each in="${lesson.contents}" var="content" status="i">
                                        <li>
                                            <a href="#" style="cursor:move">
                                                <i class="icon icon-sort"></i>&nbsp;
                                                ${content.title}
                                                <g:hiddenField name="priority" value="${content.id}" />
                                            </a>
                                        </li>
                                    </g:each>
                                </ul>
                            </g:if>
                            <g:else>
                                <p class="text-muted"><g:message code="default.empty.label" /></p>
                            </g:else>

                            <hr />

                            <!-- Submit -->
                            <g:submitButton name="save" value="${message(code: 'default.button.update.label', default: 'Update')}" class="btn btn-primary" />

                            <!-- Cancel -->
                            <g:link action="show" id="${lesson.id}" class="btn btn-default">
                                <g:message code="default.button.cancel.label" />
                            </g:link>

                        </g:form>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->

<r:script>
$(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
});
</r:script>
</body>
</html>
