<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title><g:layoutTitle default="CodeCanaan"/> - CodeCanaan</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon" />
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}" />
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}" />

    <g:setProvider library="jquery"/>
    <g:javascript library="jquery" />
    <r:require modules="baseadmin, modernizr, common, compass"/>

    <!--<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet"/>-->

    <!--Required Resources-->
    <g:layoutHead/>
    <r:layoutResources />

    <!--Justfont Chinese WebFont-->
    <%--<g:justfont />--%>

    <!--Google Analytics-->
    <google:analytics />

</head>
<body>

<!-- Navigation Header -->
<g:applyLayout name="_inc_navbar" />

<g:if test="${pageProperty(name:'meta.display.subnavbar')!='disable'}">
    <sec:ifLoggedIn>
        <g:applyLayout name="_inc_subnavbar" />
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <br />
    </sec:ifNotLoggedIn>
</g:if>
<g:else>
    <br />
</g:else>

<!-- Show Flash Messages -->
<g:if test="${flash.message}">
    <div class="container">
        <div class="alert alert-${flash.messageType?:'info'}" role="status">
            <button type="button" class="close" data-dismiss="alert">×</button>
            ${flash.message}
        </div>
    </div>
</g:if>

<!-- Main Content -->
<g:layoutBody/>

<!-- Footer Content -->
<g:if test="${pageProperty(name:'meta.display.footer')=='enable'}">
    <g:applyLayout name="_inc_footer" />
</g:if>
<g:else>
    <div style="text-align:center">
        &copy; 2012-13 CodeCanaan Project.
    </div>
</g:else>

<!-- Deferred Resources(JavaScript) -->
<r:layoutResources />

</body>
</html>
