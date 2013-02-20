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

                <div class="control-group">
                    <label class="control-label">
                        名稱
                    </label>
                    <div class="controls">
                        <g:textField name="title" value="${schedule.title}" placeholder="填寫學習進度名稱" class="input input-xlarge" />
                        <span class="help-block">（例如：物件導向程式語言）</span>
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
