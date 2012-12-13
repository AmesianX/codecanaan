<html>
<head>
<meta name="layout" content="bootstrap"/>
<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>
<facebookAuth:init>
FB.Event.subscribe('auth.login', function() {
    //if (typeof(console) === 'object' && typeof(console.log) === 'function') {
    //    console.log('Process auth.login...');
    //}
    //window.location.reload();
    window.location.href = "${createLink(controller: 'user', action: 'check')}";
});
</facebookAuth:init>
<div class="row">
	<div class="span4">
		<div class="alert alert-info">
			<button type="button" class="close" data-dismiss="alert">×</button>
			※ 目前僅開放使用 Facebook 帳號登入，請點選以下登入按鈕。
		</div>
		<!--登入按鈕-->
		<facebookAuth:connect permissions="email,user_about_me" />
	</div>
	<div class="span8">
		<form action="${postUrl}" method="POST" id="loginForm" class="cssform" autocomplete="off">
			<legend><g:message code="springSecurity.login.header"/></legend>
			<p>
				<label for="username"><g:message code="springSecurity.login.username.label"/>:</label>
				<input type="text" class="text_" name="j_username" id="username"/>
			</p>

			<p>
				<label for="password"><g:message code="springSecurity.login.password.label"/>:</label>
				<input type="password" class="text_" name="j_password" id="password"/>
			</p>

			<label class="control-label">
				<g:checkBox name="${rememberMeParameter}" checked="${hasCookie}" />
				<g:message code="springSecurity.login.remember.me.label"/>
			</label>

			<g:submitButton name="submit" value="${message(code: "springSecurity.login.button")}" class="btn btn-primary" />
		</form>
	</div>
</div>
<r:script>
<!--
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</r:script>
</body>
</html>
