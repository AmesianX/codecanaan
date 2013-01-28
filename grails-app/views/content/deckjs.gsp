<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->  <html class="no-js" lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=1024, user-scalable=no">
<title>${content?.title}</title>
<!--require and layout resources-->
<r:require modules="jquery, webfont, highlightjs"/>
<r:layoutResources />
<!-- Core and extension CSS files -->
<link rel="stylesheet" href="${resource(dir: 'deckjs/core', file: 'deck.core.css')}">
<link rel="stylesheet" href="${resource(dir: 'deckjs/extensions/goto', file: 'deck.goto.css')}">
<!--<link rel="stylesheet" href="${resource(dir: 'deckjs/extensions/menu', file: 'deck.menu.css')}">-->
<link rel="stylesheet" href="${resource(dir: 'deckjs/extensions/navigation', file: 'deck.navigation.css')}">
<link rel="stylesheet" href="${resource(dir: 'deckjs/extensions/status', file: 'deck.status.css')}">
<link rel="stylesheet" href="${resource(dir: 'deckjs/extensions/hash', file: 'deck.hash.css')}">
<link rel="stylesheet" href="${resource(dir: 'deckjs/extensions/scale', file: 'deck.scale.css')}">
<!-- Theme CSS files (menu swaps these out) -->
<link rel="stylesheet" id="style-theme-link" href="${resource(dir: 'deckjs/themes/style', file: 'web-2.0.css')}">
<link rel="stylesheet" id="transition-theme-link" href="${resource(dir: 'deckjs/themes/transition', file: 'horizontal-slide.css')}">
<!-- Custom CSS just for this page -->
<link rel="stylesheet" id="transition-theme-link" href="${resource(dir: 'deckjs', file: 'customize.css')}">
<script src="${resource(dir: 'deckjs', file: 'modernizr.custom.js')}"></script>
<g:justfont force="true" />
<google:analytics />
</head>
<body class="deck-container justfont">

<section class="slide no-md" id="title-slide">
    <h1>
        ${content?.title}
        <small>${content?.subtitle}</small>
    </h1>
</section>

<g:each var="section" status="i" in="${content?.description?.split('----------')}">
	<section class="slide" id="slide-${i+1}">${section?.trim().encodeAsHTML()}</section>
</g:each>

<a href="#" class="deck-prev-link" title="Previous">&#8592;</a>
<a href="#" class="deck-next-link" title="Next">&#8594;</a>

<p class="deck-status">
	<span class="deck-status-current"></span>
	/
	<span class="deck-status-total"></span>
</p>

<form action="." method="get" class="goto-form">
	<label for="goto-slide">Go to slide:</label>
	<input type="number" name="slidenum" id="goto-slide">
	<input type="submit" value="Go">
</form>

<a href="." title="Permalink to this slide" class="deck-permalink">#</a>

<!--layout resources-->
<r:layoutResources />

<!--deckjs resources-->
<script src="${resource(dir: 'deckjs/core', file: 'deck.core.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/menu', file: 'deck.menu.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/goto', file: 'deck.goto.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/status', file: 'deck.status.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/navigation', file: 'deck.navigation.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/hash', file: 'deck.hash.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/scale', file: 'deck.scale.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/markdown', file: 'Markdown.Converter.js')}"></script>
<script src="${resource(dir: 'deckjs/extensions/markdown', file: 'deck.markdown.js')}"></script>

<!-- Initialize the deck. You can put this in an external file if desired. -->
<script javascript="text/javascript">
$(function() {
    // Hightlight.js only support MSIE 9+ and other modern browsers
	if (!$.browser.msie || ($.browser.msie && $.browser.version.slice(0,1)>8)) {
		//Pretty Code with Highlight.js
        if (hljs) {
            hljs.tabReplace = '    '; //4 spaces
            hljs.initHighlightingOnLoad();
        }
    }

	// Turn on slides
    $.deck('.slide');
    $.deck('enableScale');
});
</script>
</body>
</html>
