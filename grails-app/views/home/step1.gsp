<html>
<head>
<meta name="layout" content="bootstrap"/>
<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>

<g:render template="progress" model="[step: 1]" />

<div class="row">
    <div class="span12">
        <p class="larger-font textalign-center padding-around margin-around">已經有 <strong>${codecanaan.User.count()+900}</strong> 位使用者註冊成為我們的會員，免費名額數量有限</p>
    </div>
</div>

<div class="row-fluid clearlook-wrapper justfont">
    <div class="span4 padding-leftside" style="padding-top:60px;padding-left:40px">
        
        <p>登入後享有會員權利...</p>
        
        <ul class="icons">
            <li>
                <i class="icon-ok icon-2x icon-green"></i>
                更多的教材內容
            </li>
            <li>
                <i class="icon-ok icon-2x icon-green"></i>
                完整的課程功能
            </li>
            <li>
                <i class="icon-ok icon-2x icon-green"></i>
                個人學習記錄雲端儲存
            </li>
        </ul>
        
        <p>零壹學院目前開放會員使用 <a href="http://facebook.com/" target="_blank">Facebook</a> 帳號直接登入，免除麻煩的註冊手續！</p>

    </div>
    <div class="span8 padding-rightside">
	    <g:render template="/login/facebook" />
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
