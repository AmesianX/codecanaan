<html>
<head>
<meta name="layout" content="bootstrap" />
<style>
</style>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid clearlook-wrapper justfont">
        <div class="span3 padding-leftside">
            <img src="${book.coverUrl}" alt="${book.title}" />
        </div>
        <div class="span9 padding-rightside">
            <div class="page-header">
                <h1>${book.title}</h1>
            </div>
            <p>作者：${book.author}</p>
            <p>定價：<g:formatNumber number="${book.listPrice}" type="currency" /></p>

            <p>${book.description}</p>
            <a href="${book.linkUrl}" target="_blank">購買本書</a>
        </div>
    </div>
</div>
</body>
</html>
