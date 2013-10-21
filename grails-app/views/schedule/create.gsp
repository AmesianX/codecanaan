<html>
<head>
    <title>新增學習進度</title>
    <meta name="layout" content="baseadmin" />
</head>
<body>

<div class="main">
    <div class="container">
        <div class="row">

            <div class="col-md-3">
                <div class="well">
                    <h4>
                        <i class="icon-lightbulb"></i>&nbsp;
                        規劃學習進度
                    </h4>

                    <p>建立班級的目的是為管理學習進度，教師可以規劃一份學習清單，單元來自一個或多個教材內容，並訂定每週的學習計畫，提供學員更有目標的學習路徑。</p>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>
                            <g:message code="default.create.label" args="[message(code:'schedule.label')]" />
                        </h3>
                    </div>
                    <div class="widget-content">
                        
                        <!-- Display Error Messages -->
                        <g:hasErrors bean="${schedule}">
                            <div class="alert alert-dismissable alert-warning">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <g:renderErrors bean="${schedule}" />
                            </div>
                        </g:hasErrors>

                        <g:form action="create" method="post" class="form-horizontal col-md-9" role="form">

                            <div class="form-group">
                                <label class="col-md-3" for="title">
                                    <g:message code="schedule.title.label" />
                                </label>
                                <div class="col-md-9">
                                    <g:textField name="title" value="${schedule.title}" placeholder="填寫學習進度名稱" class="form-control" />
                                    <span class="help-block">（例如：物件導向程式語言）</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3">
                                    <g:message code="schedule.stage.label" />
                                </label>
                                <div class="col-md-9">
                                    <g:radioGroup name="stage" labels="${stageValues}" values="${stageValues}" value="${schedule.stage}">
                                        <div class="radio">
                                            <label>${it.radio} ${it.label}</label>
                                        </div>
                                    </g:radioGroup>
                                </div>
                            </div>
                            
                            <!-- 學校 -->
                            <div class="form-group">
                                <label class="col-md-3" for="school">
                                    <g:message code="schedule.school.label" />
                                </label>
                                <div class="col-md-9">
                                    <g:textField name="school" value="${schedule?.school}" class="form-control" />
                                    <span class="help-block">（例如：國立雲林科技大學）</span>
                                </div>
                            </div>

                            <!--系所-->
                            <div class="form-group">
                                <label class="col-md-3" for="department">
                                    <g:message code="schedule.department.label" />
                                </label>
                                <div class="col-md-9">
                                    <g:textField name="department" value="${schedule?.department}" class="form-control" />
                                    <span class="help-block">（例如：資訊管理系）</span>
                                </div>
                            </div>

                            <!-- Buttons -->
                            <div class="form-group">
                                <div class="col-md-3"></div>
                                <div class="col-md-9">
                                    <!-- Submit Button -->
                                    <g:submitButton name="save" value="${message(code: 'default.button.create.label')}" class="btn btn-primary" />

                                    &nbsp;&nbsp;

                                    <!-- Cancel Button -->
                                    <g:link action="index" class="btn btn-default">
                                        <g:message code="default.button.cancel.label" />
                                    </g:link>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->
