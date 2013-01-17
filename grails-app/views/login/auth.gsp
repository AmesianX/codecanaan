<html>
<head>
<meta name="layout" content="bootstrap"/>
<title><g:message code="springSecurity.login.title"/></title>
</head>
<body>

<div class="row margin-below">
    <div class="span12 progress-tracker">
        <div class="padding-around">
            <div>
                <p class="larger-font" style="text-align:center"><i class="icon  icon-thumbs-up icon-2x icon-blue"></i> 只要四個步驟就能獲得完整的學習功能</p>
            </div>
            <div class="progress progress-striped">
                <div class="bar" style="width: 25%;"></div>
            </div>
            <ul class="steps">
                <li class="step1 active">會員登入 »</li>
                <li class="step2">安裝 Java 軟體 »</li>
                <li class="step3">啟動客戶端工具 »</li>
                <li class="step4">完成</li>
            </ul>
        </div>
    </div>
</div>

<div class="row">
    <div class="span12 margin-below" style="text-align:center">
        <p class="larger-font">已經有 <strong>${codecanaan.User.count()+900}</strong> 位使用者註冊成為我們的會員，免費名額數量有限</p>
    </div>
</div>

<div class="row-fluid">
    <div class="span12 clearlook-wrapper justfont">
	    <div class="span4 padding-leftside" style="padding-top:60px">
	        
	        
	        
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
	        
	        <p>壹學院目前開放會員使用 <a href="http://facebook.com/" target="_blank">Facebook</a> 帳號直接登入，免除麻煩的註冊手續！</p>

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

            <g:if test="${params.method=='builtin'}">
    	        <g:render template="builtin" />
            </g:if>
            <g:else>
    	        <g:render template="facebook" />
            </g:else>

	    </div>
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
