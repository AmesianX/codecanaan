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
<r:require modules="jquery, jquery-ui, jquery-plugins, modernizr, common, bootswatch, bootstrap-ext, font-awesome, pagedown, webfont, compass, codemirror, highlightjs"/>
<g:layoutHead/>
<r:layoutResources />
<g:justfont />
<google:analytics />
</head>
<body data-spy="scroll" data-target=".bs-docs-sidebar">
<facebookAuth:init/>

<!--begin visible--><div class="blur-after-modal-shown">

<!--header-->
<header class="navbar navbar-inverse navbar-fixed-top">
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
</header>

<div class="container" role="main">
	
	<!--GoogleChromeFrame-->
	<g:render template="/layouts/alert_chromeframe" />

	<!--ClientTools-->
	<g:render template="/layouts/alert_clienttools" />
	
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

<!--footer begin-->
<footer class="footer">
	<g:applyLayout name="inc_footer" />
</footer>

<!--end visible--></div>

<!--defer resources-->
<r:layoutResources />

</body>
</html>
