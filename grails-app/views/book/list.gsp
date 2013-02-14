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
                <g:link action="show" class="image" id="${book.id}">
                    <img src="${book.coverUrl}" alt="${book.title}" />
                </g:link>
                <g:link action="show" class="title" id="${book.id}">${book.title}</g:link>
            </div>
        </g:each>
    </div>
    <g:paginate next="Forward" prev="Back" maxsteps="0" max="25" controller="book" action="list" total="${bookCount}" class="pagination-centered" />
</div>
<r:script>
$(function() {
    $('#pin-container').masonry({
        itemSelector: '.pin-block',
        isFitWidth: true
    });
});
</r:script>
</body>
</html>
