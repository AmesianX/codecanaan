<section>
    <legend><i class="icon icon-signin"></i> 使用一般會員帳號登入</legend>
    
    <form action="${postUrl}" method="POST" id="loginForm" class="cssform" autocomplete="off">
		<!--<legend><g:message code="springSecurity.login.header"/></legend>-->
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
        
        <button class="btn btn-primary btn-large">
            <i class="icon icon-signin"></i>
            ${message(code: "springSecurity.login.button")}
        </button>
        
        <hr />

        <p><i class="icon icon-lightbulb"></i> 目前僅開放 Facebook 帳號登入。</p>
    </form>
</section>
<r:script>
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
})();
</r:script>
