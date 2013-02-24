<html>
<head>
<meta name="layout" content="bootstrap" />
<style>
</style>
</head>
<body>
<div class="container-fluid">
    <div id="pin-container">
        <g:each in="${books}" var="book" status="i">
            <div class="pin-block">
                <g:link action="show" params="[isbn: book.isbn]" class="image">
                    <img src="${resource(dir: 'images', file: 'book-blank.png')}" data-original="${book.coverUrl}" alt="${book.title}" class="lazy" />
                </g:link>
                <g:link action="show" params="[isbn: book.isbn]" class="title">${book.title}</g:link>
            </div>
        </g:each>
    </div>
    <%--
    <g:paginate next="Forward" prev="Back" maxsteps="0" max="25" controller="book" action="list" total="${bookCount}" class="pagination-centered" />
    --%>
</div>
<r:script>
$(function() {
    $("img.lazy").lazyload();
    $('#pin-container').masonry({
        itemSelector: '.pin-block',
        isFitWidth: true
    });
});
</r:script>
</body>
</html>
