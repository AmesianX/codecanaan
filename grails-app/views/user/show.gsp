<html>
    <head>
        <meta name="layout" content="bootstrap" />
    </head>
    <body>
        <div class="row-fluid">
            <div class="span3">
                <g:if test="${user?.email}">
                    <div class="textalign-center">
                        <avatar:gravatar email="${user.email}" size="128" title="大頭貼" />
                    </div>
                </g:if>
            </div>
            <div class="span9 clearlook-wrapper padding-around">
                <div class="page-header">
                    <h1>${user.fullName}</h1>
                    <p>經驗值：${user.experience}</p>
                    <p>完成題數：${codecanaan.Record.countByUser(user)}</p>
                </div>

                <section>
                    <div class="markdown-source">${user.description?.encodeAsHTML()}</div>
                </section>

                <g:if test="${editable}">
                    <g:link controller="user" action="profile" class="btn">
                        <g:message code="default.button.edit.label" />
                    </g:link>
                </g:if>
            </div>
        </div>
    </body>
</html>
