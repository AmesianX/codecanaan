<div class="subnavbar">
    <div class="subnavbar-inner">
        <div class="container">
            <a href="#" class="subnav-toggle" data-toggle="collapse" data-target=".subnav-collapse">
              <span class="sr-only">Toggle navigation</span>
              <i class="icon-reorder"></i>
            </a>
            <div class="collapse subnav-collapse">
                <ul class="mainnav">
                
                    <li class="${controllerName=='home'?'active':''}">
                        <g:link url="/">
                            <i class="icon-home"></i>
                            <span>首頁</span>
                        </g:link>
                    </li>

                    <li class="${['course','lesson','content'].contains(controllerName)?'active':''}">
                        <g:link controller="course">
                            <i class="icon-book"></i>
                            <span>課程</span>
                        </g:link>
                    </li>
                    
                    <li class="dropdown">                   
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-copy"></i>
                            <span>Sample Pages</span>
                            <b class="caret"></b>
                        </a>        
                    
                        <ul class="dropdown-menu">
                            <li><a href="./pricing.html">Pricing Plans</a></li>
                            <li><a href="./faq.html">FAQ's</a></li>
                            <li><a href="./gallery.html">Gallery</a></li>
                            <li><a href="./reports.html">Reports</a></li>
                            <li><a href="./account.html">User Account</a></li>
                        </ul>               
                    </li>
                    
                    <li class="dropdown">                   
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-external-link"></i>
                            <span>Extra Pages</span>
                            <b class="caret"></b>
                        </a>    
                    
                        <ul class="dropdown-menu">
                            <li><a href="./login.html">Login</a></li>
                            <li><a href="./signup.html">Signup</a></li>
                            <li><a href="./error.html">Error</a></li>
                            <li class="dropdown-submenu">
                                <a tabindex="-1" href="#">More options</a>
                                <ul class="dropdown-menu">
                                  <li><a tabindex="-1" href="#">Second level</a></li>

                                  <li><a href="#">Second level</a></li>
                                  <li><a href="#">Second level</a></li>
                                </ul>
                              </li>
                        </ul>                   
                    </li>
                
                </ul>
            </div> <!-- /.subnav-collapse -->

        </div> <!-- /container -->
    
    </div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->