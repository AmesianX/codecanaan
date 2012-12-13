<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><g:layoutTitle default="CodeCanaan"/> - CodeCanaan</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon" />
<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}" />
<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}" />
<style type="text/css">body {padding-top: 60px;/*padding-bottom: 40px;*/} section {padding-top: 30px;}</style>
<r:require modules="common, jquery-ui, bootswatch, bootstrap-ext, bootstrap-lightbox, font-awesome, pagedown, webfont, compass, codemirror, highlightjs"/>
<g:layoutHead/>
<r:layoutResources />
<!--justfont--><r:script>window.jfAsyncInit=function(){ctb.main({'appId':'04a33145MnLiu8AI4KNCkfQQX18d_e3RX0f8GVpfG1diW5LYhaoiIuChsq61MXXmmv1-DTv5O0x8Q-M6wDVACDJxtEeI-_zEH2erPVBnvn_O0rNYUxTAysJ7bMYsPVRNRtxxKcR7LU_kpdARwG4Q_xXHkyzrSTEhAPHewUyTug7fj48gBxY=','tag':{'ct1':'.justfont pre','ct2':{'0':'.justfont p','1':'.justfont li'},'ct3':{'0':'.justfont h2','1':'.justfont h3','2':'.justfont h4','3':'.justfont h5','4':'.justfont h6','5':'.justfont h1 small'},'ct4':'.justfont h1','ct5':'.justfont blockquote'}});};(function(){var jf=document.createElement('script');jf.type='text/javascript';jf.async=true;jf.src='http://ds.justfont.com/core/js/v1.0/04a33145MnLiu8AI4KNCkfQQX18d_e3RX0f8GVpfG1diW5LYhaoiIuChsq61MXXmmv1-DTv5O0x8Q-M6wDVACDJxtEeI-_zEH2erPVBnvn_O0rNYUxTAysJ7bMYsPVRNRtxxKcR7LU_kpdARwG4Q_xXHkyzrSTEhAPHewUyTug7fj48gBxY=.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(jf,s);})();</r:script>
<!--analytics--><r:script>
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-298440-14']);
  _gaq.push(['_setDomainName', 'codecanaan.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</r:script>
<!--page--><r:script>
(function() {
    $('a[rel=tooltip]').tooltip();
})();
</r:script>
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
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
                <g:applyLayout name="inc_sysmenu" />
                <!--使用者選單-->
                <g:applyLayout name="inc_usermenu" />
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

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="span9">
                <ul class="nav nav-pills">
                    <li><g:link url="/page/pricing">價格方案</g:link></li>
                    <li><g:link url="/page/partner">合作夥伴</g:link></li>
                    <li><g:link url="/page/about">關於我們</g:link></li>
                    <li><g:link url="/page/contact">聯絡我們</g:link></li>
                    <li><g:link url="/?lang=zh_TW">中文版</g:link></li>
                    <li><g:link url="/?lang=en">English</g:link></li>
                    <!--<li class="dropdown">
                        <g:link class="dropdown-toggle" data-toggle="dropdown" url="#">
                            Languages
                            <b class="caret"></b>
                        </g:link>
                        <ul class="dropdown-menu">

                        </ul>
                    </li>-->
                </ul>
            </div>
            <div class="span3 copyright">
                <p>Copyright &copy; CodeCanaan Inc.<br/>All rights reserved.</p>
                <p>程式設計數位學習方舟計畫<br/>思創軟體設計</p>
            </div>
        </div>
        <div role="contentinfo"></div>
        <div id="spinner" class="spinner" style="display:none;"><p class="text-info"><g:message code="spinner.alt" default="Loading&hellip;"/></p></div>
    </div>
</footer>

<g:javascript library="application"/>
<r:layoutResources />

</body>
</html>
