<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><g:layoutTitle default="Grails"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon" />
<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}" />
<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}" />
<style type="text/css">
body {padding-top: 60px;padding-bottom: 40px;}
</style>
<r:require modules="bootstrap, pagedown, webfont, compass, codemirror, highlightjs"/>
<g:layoutHead/>
<r:layoutResources />
<r:script>window.jfAsyncInit=function(){ctb.main({'appId':'04a33145MnLiu8AI4KNCkfQQX18d_e3RX0f8GVpfG1diW5LYhaoiIuChsq61MXXmmv1-DTv5O0x8Q-M6wDVACDJxtEeI-_zEH2erPVBnvn_O0rNYUxTAysJ7bMYsPVRNRtxxKcR7LU_kpdARwG4Q_xXHkyzrSTEhAPHewUyTug7fj48gBxY=','tag':{'ct1':'.justfont pre','ct2':{'0':'.justfont p','1':'.justfont li'},'ct3':{'0':'.justfont h2','1':'.justfont h3','2':'.justfont h4','3':'.justfont h5','4':'.justfont h6','5':'.justfont h1 small'},'ct4':'.justfont h1','ct5':'.justfont blockquote'}});};(function(){var jf=document.createElement('script');jf.type='text/javascript';jf.async=true;jf.src='http://ds.justfont.com/core/js/v1.0/04a33145MnLiu8AI4KNCkfQQX18d_e3RX0f8GVpfG1diW5LYhaoiIuChsq61MXXmmv1-DTv5O0x8Q-M6wDVACDJxtEeI-_zEH2erPVBnvn_O0rNYUxTAysJ7bMYsPVRNRtxxKcR7LU_kpdARwG4Q_xXHkyzrSTEhAPHewUyTug7fj48gBxY=.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(jf,s);})();</r:script>
</head>
<body>
<!--facebook integration-->
<facebookAuth:init>
FB.Event.subscribe('auth.login', function() {
    //if (typeof(console) === 'object' && typeof(console.log) === 'function') {
    //    console.log('Process auth.login...');
    //}
    //window.location.reload();
    window.location.href = "${createLink(controller: 'user', action: 'check')}";
});
</facebookAuth:init>
<!--header-->
<div class="navbar navbar-inverse navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      <g:link controller="home" action="index" class="brand logo-font">CodeCanaan</g:link>
      <div class="nav-collapse collapse">
        <ul class="nav">
          <li class="${controllerName=='home'?'active':''}"><g:link controller="home"><g:message code="default.home.label" default="Home" /></g:link></li>
          <!--已登入才顯示功能表-->
          <sec:ifLoggedIn>
            <li class="${controllerName=='course'?'active':''}"><g:link controller="course"><g:message code="course.label" default="Course" /></g:link></li>
          </sec:ifLoggedIn>
        </ul>
        <!--<form class="navbar-form pull-right">
          <input class="span2" type="text" placeholder="Email">
          <input class="span2" type="password" placeholder="Password">
          <button type="submit" class="btn">Sign in</button>
        </form>-->

        <!--已登入-->
        <sec:ifLoggedIn>
          <div class="pull-right">
            <r:script>
            function doLogout() {
                if (typeof(FB) === 'object') {
                    FB.logout(function() {
                        window.location.href = "${createLink(uri: '/j_spring_security_logout')}";
                    });
                    return false;
                }
                return true;
            }
            </r:script>
            <!--使用者選單-->
            <div class="btn-group">
                <button class="btn"><i class="icon icon-user"></i> <sec:username /></button>
                <button class="btn dropdown-toggle" data-toggle="dropdown">
                <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><g:link uri="/j_spring_security_logout" onclick="return doLogout()"><i class="icon icon-off"></i> 登出</g:link></li>
                </ul>
            </div>
          </div>
        </sec:ifLoggedIn>
        <sec:ifNotLoggedIn>
          <g:link controller="login" class="btn pull-right">登入</g:link>
        </sec:ifNotLoggedIn>

      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>

<div class="container" role="main">
    <!--快閃訊息-->
    <g:if test="${flash.message}">
        <div class="alert" role="status">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>New Message!</strong> ${flash.message}
        </div>
    </g:if>
    <!--主畫面內容-->
    <g:layoutBody/>
</div>

<footer>
    <div class="container">
        <div class="copyright pull-right">Copyright &copy; CodeCanaan Inc.<br/>All rights reserved.</div>
        <ul class="nav nav-pills">
            <li><g:link url="#">部落格</g:link></li>
            <li><g:link url="#">服務支援</g:link></li>
            <li><g:link url="#">會員條款</g:link></li>
            <li><g:link url="#">合作夥伴</g:link></li>
            <li><g:link url="#">關於我們</g:link></li>
            <li><g:link url="#">聯絡我們</g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                Language
                <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><g:link url="/?lang=zh_TW">中文版</g:link></li>
                    <li><g:link url="/?lang=en">English</g:link></li>
                </ul>
            </li>
        </ul>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </div>
</footer>

<g:javascript library="application"/>
<r:layoutResources />

</body>
</html>
