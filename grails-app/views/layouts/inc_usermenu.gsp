<ul class="nav pull-right">
    <sec:ifNotLoggedIn>
        <!--未登入-->
        <li>
            <g:link controller="login">
                <i class="icon icon-user"></i>
                登入
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
                    <li>
                        <g:link controller="user" action="profile">
                            <i class="icon icon-user-md"></i>
                            個人資料
                        </g:link>
                    </li>
                </li>
                <li>
                    <li>
                        <g:link controller="home" action="client">
                            <i class="icon icon-download"></i>
                            客戶端工具
                        </g:link>
                    </li>
                </li>
                <sec:ifAllGranted roles="ROLE_FACEBOOK">
                    <li>
                        <g:link uri="/j_spring_security_logout" onclick="return doLogout()">
                            <i class="icon icon-off"></i>
                            登出
                        </g:link>
                    </li>
                </sec:ifAllGranted>
                <sec:ifNotGranted roles="ROLE_FACEBOOK">
                    <li>
                        <g:link uri="/j_spring_security_logout">
                            <i class="icon icon-off"></i>
                            登出
                        </g:link>
                    </li>
                </sec:ifNotGranted>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <!--管理者權限-->
                    <li>
                        <g:link controller="post" action="create">
                            <i class="icon icon-file"></i>
                            發佈新頁面
                        </g:link>
                    </li>
                </sec:ifAllGranted>
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
