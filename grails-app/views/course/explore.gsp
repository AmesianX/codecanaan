<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.explore.text" /></title>
</head>
<body>

    <g:each in="${courses}" var="course" status="i">
        <div class="sub-items">
            <section class="widget effect-round-corner effect-box-shadow">
                <header class="top">專業認證系列</header>
                <figure>
                    <img src="http://addons.books.com.tw/G/001/9/0010491649.jpg" alt="cover" border="0" />
                </figure>
                <article>
                    <header><g:link action="show" id="${course.id}">${course.title}</g:link></header>
                    <section class="content">${course.description?.split('\n')[0]}</section>
                </article>
            </section>
        </div>
    </g:each>

</body>
</html>
