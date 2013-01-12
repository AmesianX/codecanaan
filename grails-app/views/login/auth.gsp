<html>
<head>
<meta name="layout" content="bootstrap"/>
<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>
<facebookAuth:init>
FB.Event.subscribe('auth.login', function() {
    window.location.href = "${createLink(controller: 'user', action: 'facebookSync')}";
});
</facebookAuth:init>
<div class="row">
	<div class="span4">
	
	
	    <p style="text-align:center;font-size:1.4em;margin-top:1em;">歡迎！已經有...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
	    <p style="text-align:center;padding-top:1em;font-size:1.4em"><span style="font-size:72pt;color:#62783f;font-family:Helvetica;font-weight:bold" class="effect-text-shadow">${codecanaan.User.count()}</span> 位</p>
	    <p style="color:gray;text-align:center">學習夥伴等著您加入！</p>
	    
	    <p>登入後享有會員權利...</p>
	    <ul class="icons">
	        <li class="icon-ok">
	            更多的教材內容
            </li>
            <li class="icon-ok">
	            完整的課程功能
            </li>
            <li class="icon-ok">
	            個人學習記錄雲端儲存
            </li>
	    </ul>
	    
	    <p>本站開放 <a href="http://facebook.com/" target="_blank">Facebook</a> 帳號直接登入，新會員免註冊手續哦！</p>

	</div>
	<div class="span8">
	
	    <section>
	
	        <legend>方法一、使用 Facebook 帳號直接登入</legend>
	        
	        <ol>
	            <li>請先<a href="http://www.facebook.com/r.php" target="_blank">註冊</a>個人 Facebook 帳號（免費）。</li>
	            <li>請點選下方「Connect with Facebook」藍色按鈕，開始進行登入驗證。</li>
	            <li>請使用 Facebook 的帳號密碼登入。</li>
	            <li>若第一次使用，請設定「允許」執行 CodeCanaan 應用程式。</li>
	            <li>登入完成後將回到本網站首頁。</li>
	        </ol>
	        
		    <!--登入按鈕-->
		    <div style="padding:1em">
    		    <facebookAuth:connect permissions="email,user_about_me" />
		    </div>
        </section>	
	    
	    
	    <section>
	        <legend>方法二、使用一般會員帳號登入</legend>
	        
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

			    <g:submitButton name="submit" value="${message(code: "springSecurity.login.button")}" class="btn btn-primary" />
		    </form>
	    </section>
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
