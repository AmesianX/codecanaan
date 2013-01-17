<html>
<head>
<meta name="layout" content="bootstrap"/>
<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>

<div class="row">
    <div class="span12 progress-tracker">
        <div class="progress progress-striped">
            <div class="bar" style="width: 25%;"></div>
        </div>
        <ul class="steps">
            <li class="step1">註冊</li>
            <li class="step1">安裝 Java 軟體</li>
            <li class="step1">啟動客戶端工具</li>
            <li class="step1">完成</li>
        </ul>
    </div>
</div>


<div class="row">
	<div class="span4">
	
	    <p style="text-align:left;font-size:16pt;margin-top:1em;">歡迎光臨！目前已有...</p>
	    <p style="text-align:center;padding-top:1em;font-size:1.4em"><span style="font-size:48pt;color:#333333;font-family:Georgia;font-style:italic;font-weight:bold" class="effect-text-shadow">${codecanaan.User.count()+900}</span> 位</p>
	    <p style="line-height:300%;color:#555555;text-align:right">學習夥伴等著您加入！</p>
	    
	    <p>登入後享有會員權利...</p>
	    <ul class="icons">
	        <li>
	            <i class="icon-ok"></i>
	            更多的教材內容
            </li>
            <li>
                <i class="icon-ok"></i>
	            完整的課程功能
            </li>
            <li>
                <i class="icon-ok"></i>
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
		    <div style="padding:30px">
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

			    <g:submitButton name="submit" value="${message(code: "springSecurity.login.button")}" class="btn btn-primary btn-large" />
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
