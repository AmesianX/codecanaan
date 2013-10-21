<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">

        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <i class="icon-cog"></i>
            </button>
            <g:link url="/" class="navbar-brand">CodeCanaan</g:link>
        </div>

        <!--User Menu-->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav navbar-right">
                <sec:ifNotLoggedIn>
                    <!-- Not Logged In -->
                    <g:if test="${controllerName!='login'}">
                        <li>
                            <g:link controller="login" action="auth">
                                <i class="icon icon-signin"></i>&nbsp;
                                <!--Button[Login]-->
                                <g:message code="default.login.text" />
                            </g:link>
                        </li>
                    </g:if>
                    <g:else>
                        <li>
                            <g:link controller="login" action="signup">
                                Create an Account
                            </g:link>
                        </li>
                        <li>
                            <g:link url="/">
                                <i class="icon-chevron-left"></i>&nbsp;
                                Back to Homepage
                            </g:link>
                        </li>
                    </g:else>

                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    <!-- Logged In -->

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-cog"></i>&nbsp;
                            Settings
                            <b class="caret"></b>
                        </a>
                        
                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="user" action="editProfile">
                                    <!-- Edit Profile -->
                                    <i class="icon icon-user-md"></i>&nbsp;
                                    <g:message code="user.action.editProfile.label" />
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="user" action="passwd">
                                    <!-- Change Password -->
                                    <i class="icon icon-key"></i>&nbsp;
                                    <g:message code="user.action.passwd.label" />
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="home" action="client" class="link-client-tools">
                                    <!-- 客戶端工具 -->
                                    <i class="icon icon-download"></i>&nbsp;
                                    <g:message code="default.client.tools.text" />
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="home" action="step1">
                                    <!-- Welcome Wizard -->
                                    <i class="icon icon-download"></i>&nbsp;
                                    Bootstrap
                                </g:link>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <g:link controller="post" action="show" params="[name: 'help']">
                                    <!-- Help -->
                                    <!--<i class="icon icon-h-sign"></i>&nbsp; -->
                                    Help
                                </g:link>
                            </li>
                        </ul>
                        
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>&nbsp;
                            <%--User Name--%><g:displayUserName />
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="user" action="profile">
                                    <!-- User Profile -->
                                    <i class="icon icon-user"></i>&nbsp;
                                    <g:message code="user.action.profile.label" />
                                </g:link>
                            </li>
                            <sec:ifAllGranted roles="ROLE_ADMIN">
                                <li>
                                    <g:link controller="admin">
                                        <!-- 系統管理 -->
                                        <i class="icon icon-wrench"></i>&nbsp;
                                        <g:message code="default.administration.text" />
                                    </g:link>
                                </li>
                            </sec:ifAllGranted>
                            
                            <%--
                            <sec:ifAnyGranted roles="ROLE_TEACHER,ROLE_AUTHOR,ROLE_ADMIN">
                                <li>
                                    <g:link controller="user" action="file">
                                        <!-- 檔案管理 -->
                                        <i class="icon icon-file"></i>&nbsp;
                                        <g:message code="default.file.management.text" />
                                    </g:link>
                                </li>
                            </sec:ifAnyGranted>
                            --%>


                            <li class="divider"></li>

                            <sec:ifNotSwitched>
                                <li>
                                    <g:link uri="/j_spring_security_logout">
                                        <!-- 登出 -->
                                        <i class="icon icon-off"></i>&nbsp;
                                        <g:message code="default.logout.text" />
                                    </g:link>
                                </li>
                            </sec:ifNotSwitched>
                            <sec:ifSwitched>
                                <li>
                                    <a href="${request.contextPath}/j_spring_security_exit_user">
                                        <!-- 回復身分 -->
                                        <i class="icon icon-off"></i>&nbsp;
                                        Resume as <sec:switchedUserOriginalUsername/>
                                    </a>
                                </li>
                            </sec:ifSwitched>

                        </ul>
                        
                    </li>
                </sec:ifLoggedIn>
            </ul>

            <!-- Search Form -->
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control input-sm search-query" placeholder="Search">
                </div>
            </form>

        </div><!-- /.navbar-collapse -->

    </div> <!-- /.container -->
</nav>