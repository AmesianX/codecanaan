<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails"/></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<style>
body {
padding-top: 60px;
padding-bottom: 40px;
}
</style>
<r:require modules="bootstrap, pagedown, webfont, compass, codemirror, highlightjs"/>
<g:layoutHead/>
<r:layoutResources />
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
          <sec:ifAllGranted roles="ROLE_FACEBOOK">
              <div class="pull-right">
                  <!--<sec:loggedInUserInfo field="fullName"/>-->
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
          </sec:ifAllGranted>
        </sec:ifLoggedIn>

      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>

<div class="container" role="main">

    <!--登入按鈕-->
    <sec:ifNotLoggedIn>
      <div style="height:30px;overflow:hidden" class="pull-right">
        請先登入
        <facebookAuth:connect permissions="email,user_about_me" />
      </div>
    </sec:ifNotLoggedIn>

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
        <hr class="soften" />
        <div class="copyright">Copyright &copy; CodeCanaan Consulting Group</div>
        <div class="links">
            <g:link url="/?lang=zh_TW">中文版</g:link> |
            <g:link url="/?lang=en">English</g:link>
        </div>
        <div class="footer" role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    </div>
</footer>

<g:javascript library="application"/>
<r:layoutResources />

</body>
</html>
