<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.administration.text" /></title>
</head>
<body>
<g:form action="couponUpdate" id="${coupon.id}" class="form-horizontal">

    序號<br/>
    ${coupon.serialCode}<br/>
    <br/>
    課程<br/>
    ${coupon.course?.title}<br/>
    <br/>
    發給單位或組織<br/>
    <g:textField name="organization" class="input input-xlarge" value="${coupon.organization}" /><br/>
    <br/>
    有效天數<br/>
    <g:textField name="validDays" class="input input-small" value="30" /><br/>
    <br/>
    備忘資料<br/>
    <g:textArea name="memo" class="input input-xlarge" rows="3" value="${coupon.memo}"/></br>

    <hr/>

    <g:submitButton name="update" value="${message(code:'default.button.update.label')}" class="btn btn-primary" />

    <g:link action="couponList" class="btn"><g:message code="default.button.cancel.label" /></g:link>

</g:form>

</body>
</html>
