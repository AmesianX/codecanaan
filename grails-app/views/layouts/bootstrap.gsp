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
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<r:require modules="common, jquery-ui, bootswatch, bootstrap-ext, font-awesome, pagedown, webfont, compass, codemirror, highlightjs"/>
<g:layoutHead/>
<r:layoutResources />
<g:justfont />
<g:analytics />
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
<facebookAuth:init/>
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
    <!--GoogleChromeFrame-->
    <browser:isMsie versionLower="9">
        <div class="alert alert-info" role="status">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong><g:message code="message.chrome.frame.upgrade.tips" /></strong>
            <g:message code="message.chrome.frame.upgrade.descriptions" /><br/>
            <a href="http://www.google.com/chromeframe"><i class="icon icon-download"></i> <g:message code="message.chrome.frame.download.text" /></a>
        </div>
    </browser:isMsie>
    <!--快閃訊息-->
    <g:if test="${flash.message}">
        <div class="alert" role="status">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong><g:message code="default.new.message.text" />!</strong> ${flash.message}
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
                    <li><g:link url="/page/help">使用手冊</g:link></li>
                    <li><g:link url="/page/pricing">價格方案</g:link></li>
                    <li><g:link url="/page/partner">合作夥伴</g:link></li>
                    <li><g:link url="/page/about">關於我們</g:link></li>
                    <li><g:link url="/page/contact">聯絡我們</g:link></li>
                    <li><a href="#"><small class="muted">|</small></a></li>
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
                <p>Copyright &copy; CodeCanaan<br/>All rights reserved.</p>
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
