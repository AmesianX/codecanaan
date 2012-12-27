<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.administration.text" /></title>
</head>
<body>
<g:form action="couponCreateAction" class="form-horizontal">

    課程<br/>
    <g:select name="course.id" from="${codecanaan.Course.list()}" optionKey="id" optionValue="title" noSelection="['':'']" /><br/>
    <br/>
    學習進度<br/>
    <g:select name="schedule.id" from="${codecanaan.Schedule.list()}" optionKey="id" optionValue="title" noSelection="['':'']" /><br/>
    <br/>
    筆數<br/>
    <g:textField name="size" class="input input-small" value="1" /><br/>
    <br/>
    前置代碼<br/>
    <g:textField name="prefix" class="input input-small" value="CODE-" /><br/>
    <br/>
    發給單位或組織<br/>
    <g:textField name="organization" class="input input-xlarge" value="" /><br/>
    有效天數<br/>
    <g:textField name="validDays" class="input input-small" value="30" /><br/>
    <br/>
    備忘資料<br/>
    <g:textArea name="memo" class="input input-xlarge" rows="3" value=""/></br>

    <hr/>

    <g:submitButton name="generate" value="產生" class="btn btn-primary" />

    <g:link action="couponList" class="btn">取消</g:link>

</g:form>

</body>
</html>
