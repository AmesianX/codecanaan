<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="default.administration.text" /></title>
</head>
<body>
<g:form action="couponList" method="post">
    
    <div class="pull-right">
        <button type="submit" name="delete" class="btn btn-danger" />
            <i class="icon icon-remove"></i>
            刪除勾選項目
        </button>
    </div>
    
    <div class="btn-toolbar">
        <g:link action="couponCreate" class="btn">
            <i class="icon icon-barcode"></i>
            產生序號
        </g:link>

        <div class="btn-group">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
            每頁顯示
            <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <g:each in="${[10,25,50,100]}" var="max">
                    <g:link action="couponList" params="[max: max]">每頁顯示 ${max} 筆</g:link>
                </g:each>
            </ul>
        </div>
    </div>
    
    <div class="input-append">
        <input type="text" name="prefix" value="${params.prefix}" class="span2">
        <button type="submit" class="btn">Search</button>
    </div>

    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th width="25">#</th>
                <th width="100">Serial Code</th>
                <th>Organization</th>
                <th>Course</th>
                <th>Schedule</th>
                <th width="40"><small>Reg?</small></th>
                <th width="40"><small>Valid?</small></th>
                <th width="60"><small>Created</small></th>
                <th width="20"></th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${coupons}" var="coupon" status="i">
                <tr>
                    <td><small>${i+1}</small></td>
                    <td><g:link action="couponEdit" id="${coupon.id}"><small class="font-monospace">${coupon.serialCode}</small></g:link></td>
                    <td>
                        <small>${coupon.organization}</small>
                        <g:if test="${coupon.memo}">
                            <i class="icon icon-info-sign"></i>
                        </g:if>
                    </td>
                    <td><small>${coupon.course?.title}</small></td>
                    <td><small>${coupon.schedule?.title}</small></td>
                    <td><small>
                        <i class="icon${coupon.registered?' icon-check':' icon-check-empty'}"></i>
                        <g:if test="${coupon.user}">
                            ${coupon.user?.fullName}<!--(${coupon.user?.username})-->
                        </g:if>
                    </small></td>
                    <td><small><i class="icon${coupon.valid?' icon-check':' icon-check-empty'}"></i></small></td>
                    <td><small><g:formatDate type="date" date="${coupon.dateCreated}" /></small></td>
                    <td>
                        <g:if test="${!coupon.registered}">
                            <g:checkBox name="selected" value="${coupon.id}" checked="false" />
                        </g:if>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <g:paginate controller="admin" action="couponList" total="${couponCount}" class="pagination-centered" />
</g:form>
</body>
</html>
