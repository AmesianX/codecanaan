<html>
<head>
<title>新增學習進度</title>
<meta name="layout" content="bootstrap" />
</head>
<body>
<div class="container-fluid justfont">
    <div class="row-fluid clearlook-wrapper">
        <div class="span3 padding-leftside">
            <p><strong style="color:blue">什麼是學習進度？</strong></p>
            <p>學習進度讓教師可以規劃一份授課清單，讓班級學生參與此進度，並訂定每週的學習計畫。</p>
        </div>
        <div class="span9 padding-rightside">
            
            <g:form action="create" method="post" class="form-horizontal">
                <legend>建立新的學習進度</legend>

                <g:renderErrors bean="${schedule}" />

                <div class="control-group">
                    <label class="control-label" for="title">
                        名稱
                    </label>
                    <div class="controls">
                        <g:textField name="title" value="${schedule.title}" placeholder="填寫學習進度名稱" class="input input-xlarge" />
                        <span class="help-block">（例如：物件導向程式語言）</span>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">
                        期別
                    </label>
                    <div class="controls">
                        <g:radioGroup name="stage" labels="${stageValues}" values="${stageValues}" value="${schedule.stage}">
                            <label>${it.radio} ${it.label}</label>
                        </g:radioGroup>
                    </div>
                </div>
                
                <%--學校--%>
                <div class="control-group ${hasErrors(bean: schedule, field: 'school', 'error')} ">
                    <label class="control-label" for="school">
                        <g:message code="schedule.school.label" />
                    </label>
                    <div class="controls">
                        <g:textField name="school" value="${schedule?.school}" class="input input-large" />
                    </div>
                </div>

                <%--系所--%>
                <div class="control-group ${hasErrors(bean: schedule, field: 'department', 'error')} ">
                    <label class="control-label" for="department">
                        <g:message code="schedule.department.label" />
                    </label>
                    <div class="controls">
                        <g:textField name="department" value="${schedule?.department}" class="input input-large" />
                    </div>
                </div>

                <div class="form-actions">
                    <g:submitButton name="save" value="建立" class="btn btn-primary" />
                    <g:link action="list" class="btn">取消</g:link>
                </div>
            </g:form>


        </div>
    </div>
</div>
</body>
</html>
