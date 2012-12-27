<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.administration.text" /></title>
</head>
<body>

<pre>${(coupons.collect{it.serialCode})?.join('\n')}</pre>

<g:link action="couponList" class="btn"><g:message code="default.button.goback.label" /></g:link>

</body>
</html>
