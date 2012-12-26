<ul class="nav pull-right">
    <sec:ifNotLoggedIn>
        <!--未登入-->
        <li>
            <g:link controller="login">
                <i class="icon icon-user"></i>
                <!--登入-->
                <g:message code="default.login.text" />
            </g:link>
        </li>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
        <!--已登入-->
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="icon icon-user"></i>
                <!--<sec:username />-->
                <g:displayUserName />
                <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
                <li>
                    <g:link controller="user" action="profile">
                        <i class="icon icon-user-md"></i>
                        <!--個人資料-->
                        <g:message code="default.user.preferences.text" />
                    </g:link>
                </li>
                <sec:ifAnyGranted roles="ROLE_TEACHER,ROLE_AUTHOR,ROLE_ADMIN">
                    <li>
                        <g:link controller="user" action="file">
                            <i class="icon icon-file"></i>
                            <!--檔案管理-->
                            <g:message code="default.file.management.text" />
                        </g:link>
                    </li>
                </sec:ifAnyGranted>
                <li>
                    <g:link controller="home" action="client">
                        <i class="icon icon-download"></i>
                        <!--客戶端工具-->
                        <g:message code="default.client.tools.text" />
                    </g:link>
                </li>
                <sec:ifAllGranted roles="ROLE_FACEBOOK">
                    <li>
                        <g:link uri="/j_spring_security_logout" onclick="return doLogout()">
                            <i class="icon icon-off"></i>
                            <!--登出-->
                            <g:message code="default.logout.text" />
                        </g:link>
                    </li>
                </sec:ifAllGranted>
                <sec:ifNotGranted roles="ROLE_FACEBOOK">
                    <li>
                        <g:link uri="/j_spring_security_logout">
                            <i class="icon icon-off"></i>
                            <!--登出-->
                            <g:message code="default.logout.text" />
                        </g:link>
                    </li>
                </sec:ifNotGranted>
                <sec:ifSwitched>
                    <li>
                        <a href='${request.contextPath}/j_spring_security_exit_user'>
                            <i class="icon icon-off"></i>
                            <!--回復身分-->
                            Resume as <sec:switchedUserOriginalUsername/>
                        </a>
                    </li>
                </sec:ifSwitched>
            </ul>
        </li>
    </sec:ifLoggedIn>
</ul>
<r:script>
function doLogout() {
    if (typeof(FB) === 'object') {
        FB.logout(function() {
            window.location.href = "${createLink(uri: '/j_spring_security_logout')}";
        });
        return false;
    }
    return true;
}
</r:script>
