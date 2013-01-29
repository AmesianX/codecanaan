<html>
<head>
<meta name="layout" content="bootstrap"/>
<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>

<div class="row">
    <div class="span12">
        <p class="larger-font textalign-center padding-around margin-around">第一次使用嗎？請<g:link controller="home" action="step1">由此進入</g:link>啟用流程！</p>
    </div>
</div>

<div class="row-fluid clearlook-wrapper justfont">
    <div class="span4 padding-leftside">

        <div class="padding-around">
            <p>登入後享有會員權利...</p>
            
            <ul class="icons">
                <li>
                    <i class="icon-ok icon-green"></i>
                    更多的教材內容
                </li>
                <li>
                    <i class="icon-ok icon-green"></i>
                    完整的課程功能
                </li>
                <li>
                    <i class="icon-ok icon-green"></i>
                    個人學習記錄雲端儲存
                </li>
            </ul>
            
            <p>軟體壹學院目前開放會員使用 <a href="http://facebook.com/" target="_blank">Facebook</a> 帳號直接登入，免除麻煩的註冊手續！</p>
        </div>
    </div>
    <div class="span8 padding-rightside">

        <div class="btn-group pull-right">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
                登入方式
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <!-- dropdown menu links -->
                <li>
                    <g:link action="auth" params="[method:'facebook']">
                        <i class="icon icon-facebook-sign"></i>
                        Facebook
                    </g:link>
                </li>
                <li>
                    <g:link action="auth" params="[method:'builtin']">
                        <i class="icon icon-signin"></i>
                        一般會員
                    </g:link>
                </li>
            </ul>
        </div>

        <g:if test="${method=='builtin'}">
	        <g:render template="builtin" />
        </g:if>
        <g:else>
	        <g:render template="facebook" />
        </g:else>

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
