<html>
    <head>
        <title>Create an Account</title>

        <meta name="layout" content="baseadmin"/>
        <meta name="display.footer" content="disable" />

        <r:require modules="baseadmin-signin" />
    </head>
<body>

    <div class="account-container register stacked">
        
        <div class="content clearfix">
            
            <form action="./index.html" method="post">
            
                <h1>Create Your Account</h1>
                
                <div class="login-social">
                    <p>Sign in using social network:</p>
                    
                    <div class="fb">
                        <g:link url="/j_spring_security_facebook_redirect" class="btn_1">Login with Facebook</g:link>
                    </div>

                    <div class="twitter">
                        <a href="#" class="btn_2" onclick="alert('Twitter not supported.');">Login with Twitter</a>
                    </div>
                    
                </div>
                
                <div class="login-fields">
                    
                    <p>Create your free account:</p>
                    
                    <div class="field">
                        <label for="firstname">First Name:</label>
                        <input type="text" id="firstname" name="firstname" value="" placeholder="First Name" class="form-control" />
                    </div> <!-- /field -->
                    
                    <div class="field">
                        <label for="lastname">Last Name:</label>    
                        <input type="text" id="lastname" name="lastname" value="" placeholder="Last Name" class="form-control" />
                    </div> <!-- /field -->
                    
                    
                    <div class="field">
                        <label for="email">Email Address:</label>
                        <input type="text" id="email" name="email" value="" placeholder="Email" class="form-control"/>
                    </div> <!-- /field -->
                    
                    <div class="field">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" value="" placeholder="Password" class="form-control"/>
                    </div> <!-- /field -->
                    
                    <div class="field">
                        <label for="confirm_password">Confirm Password:</label>
                        <input type="password" id="confirm_password" name="confirm_password" value="" placeholder="Confirm Password" class="form-control"/>
                    </div> <!-- /field -->
                    
                </div> <!-- /login-fields -->
                
                <div class="login-actions">
                    
                    <span class="login-checkbox">
                        <input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
                        <label class="choice" for="Field">I have read and agree with the Terms of Use.</label>
                    </span>
                                        
                    <button class="login-action btn btn-primary">Register</button>
                    
                </div> <!-- .actions -->
                
            </form>
            
        </div> <!-- /content -->
        
    </div> <!-- /account-container -->


    <!-- Text Under Box -->
    <div class="login-extra">
        Already have an account? <g:link action="auth">Login</g:link>
    </div> <!-- /login-extra -->

</body>
</html>