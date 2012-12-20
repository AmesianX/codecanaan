<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="admin.label" /></title>
</head>
<body>
<g:form action="couponList">
    
    <div class="pull-right">
        <g:submitButton name="delete" value="移除已選項目" class="btn" />
    </div>

    <div class="btn-toolbar">
        <g:link action="couponCreate" class="btn">
            <i class="icon icon-barcode"></i>
            產生序號
        </g:link>
    </div>
    
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th width="25">#</th>
                <th>Serial Code</th>
                <th>Organization</th>
                <th>Course</th>
                <th><small>Registered</small></th>
                <th><small>Valid</small></th>
                <th><small>Created</small></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${coupons}" var="coupon" status="i">
                <tr>
                    <td><small>${i+1}</small></td>
                    <td><g:link action="couponEdit" id="${coupon.id}">${coupon.serialCode}</g:link></td>
                    <td>
                        <small>${coupon.organization}</small>
                        <g:if test="${coupon.memo}">
                            <i class="icon icon-info-sign"></i>
                        </g:if>
                    </td>
                    <td><small>${coupon.course?.title}</small></td>
                    <td><small>
                        <i class="icon${coupon.registered?' icon-check':' icon-check-empty'}"></i>
                        <g:if test="${coupon.user}">
                            ${coupon.user?.fullName}(${coupon.user?.username})
                        </g:if>
                    </small></td>
                    <td><small><i class="icon${coupon.valid?' icon-check':' icon-check-empty'}"></i></small></td>
                    <td><small><g:formatDate format="yyyy/MM/dd" date="${coupon.dateCreated}" /></small></td>
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
