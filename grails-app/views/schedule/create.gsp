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
                        什麼是學習進度？
                    </h4>

                    <p>學習進度讓教師可以規劃一份授課清單，讓班級學生參與此進度，並訂定每週的學習計畫。</p>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-pencil"></i>
                        <h3>建立新的學習進度</h3>
                    </div>
                    <div class="widget-content">
                        <g:form action="create" method="post" class="form-horizontal col-md-9" role="form">

                            <g:renderErrors bean="${schedule}" />

                            <div class="form-group">
                                <label class="col-md-3" for="title">
                                    名稱
                                </label>
                                <div class="col-md-9">
                                    <g:textField name="title" value="${schedule.title}" placeholder="填寫學習進度名稱" class="form-control" />
                                    <span class="help-block">（例如：物件導向程式語言）</span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3">
                                    期別
                                </label>
                                <div class="col-lg-9">
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
                                    <g:submitButton name="save" value="建立" class="btn btn-primary" />
                                    <g:link action="index" class="btn btn-default">取消</g:link>
                                </div>
                            </div>
                        </g:form>
                    </div>
                </div> <!-- /.widget -->
            </div> <!-- /.col -->

        </div> <!-- /.row -->
    </div> <!-- /.container -->
</div> <!-- /.main -->
