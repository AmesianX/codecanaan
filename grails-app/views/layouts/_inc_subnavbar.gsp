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
                            <span><g:message code="default.home.label" /></span>
                        </g:link>
                    </li>

                    <li class="${['course','lesson','content'].contains(controllerName)?'active':''}">
                        <g:link controller="course">
                            <i class="icon-book"></i>
                            <span><g:message code="course.label" /></span>
                        </g:link>
                    </li>
                    
                    <li class="${['schedule'].contains(controllerName)?'active':''}">
                        <g:link controller="schedule">
                            <i class="icon-tasks"></i>
                            <span><g:message code="schedule.label" /></span>
                        </g:link>
                    </li>

                </ul>
            </div> <!-- /.subnav-collapse -->

        </div> <!-- /container -->
    
    </div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->