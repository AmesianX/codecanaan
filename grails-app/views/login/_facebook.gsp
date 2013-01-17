<section>

    <legend><i class="icon icon-facebook-sign"></i> 使用 Facebook 帳號直接登入</legend>
    
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
    
    <hr />
    
    <p>如果您真的沒有 Facebook 帳號，也沒有意願申請一組，那麼您可以填寫傳統的註冊表單，並使用<g:link controller="login" action="auth" params="[method: 'builtin']">一般會員</g:link>帳號登入。</p>
    
</section>
