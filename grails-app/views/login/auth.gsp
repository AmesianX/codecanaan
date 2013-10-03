<html>
<head>
    <title><g:message code="springSecurity.login.title"/></title>

    <meta name="layout" content="baseadmin"/>
    <meta name="display.footer" content="disable" />

    <r:require modules="baseadmin-signin" />
</head>
<body>

<div class="account-container stacked">
    <div class="content clearfix">
        <form action="${postUrl}" method="post">
            <h1>Sign In</h1>
            
            <div class="login-fields">
                
                <p>Sign in using your registered account:</p>

                <div class="field">
                    <label for="username">
                        <g:message code="springSecurity.login.username.label"/>:
                    </label>
                    <input type="text" id="username" name="j_username" value="" placeholder="Username" class="form-control input-lg username-field" />
                </div> <!-- /username -->
                
                <div class="field">
                    <label for="password">
                        <g:message code="springSecurity.login.password.label"/>:
                    </label>
                    <input type="password" id="password" name="j_password" value="" placeholder="Password" class="form-control input-lg password-field"/>
                </div> <!-- /password -->
                
            </div> <!-- /login-fields -->
            
            <div class="login-actions">

                <span class="login-checkbox">
                    <g:checkBox id="RememberMe" name="${rememberMeParameter}" checked="${hasCookie}" />
                    <label class="choice" for="RememberMe">
                        Keep me signed in
                    </label>
                </span>

                <button class="login-action btn btn-primary">Sign In</button>
                
            </div> <!-- .actions -->
            
            <div class="login-social">
                <p>Sign in using social network:</p>
                
                <div class="fb">
                    <g:link url="/j_spring_security_facebook_redirect" class="btn_1">Login with Facebook</g:link>
                </div>

                <div class="twitter">
                    <a href="#" class="btn_2" onclick="alert('Twitter not supported.');">Login with Twitter</a>
                </div>

            </div>
        </form>
    </div> <!-- /content -->
</div> <!-- /account-container -->

<!-- Text Under Box -->
<div class="login-extra">
    Don't have an account? <g:link action="signup">Sign Up</g:link><br/>
    Remind <a href="#">Password</a>
</div> <!-- /login-extra -->

<r:script>
(function() {
    document.forms['loginForm'].elements['j_username'].focus();
})();
</r:script>

</body>
</html>
