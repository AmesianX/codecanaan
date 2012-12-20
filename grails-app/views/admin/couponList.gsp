<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<title><g:message code="admin.label" /></title>
</head>
<body>
<div class="row">
    <div class="span12">
        
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
                </tr>
            </thead>
            <tbody>
                <g:each in="${coupons}" var="coupon" status="i">
                    <tr>
                        <td><small>${i+1}</small></td>
                        <td><g:link action="couponEdit" id="${coupon.id}">${coupon.serialCode}</g:link></td>
                        <td><small>${coupon.organization}</small></td>
                        <td><small>${coupon.course?.title}</small></td>
                        <td><small>
                            <i class="icon${coupon.registered?' icon-check':' icon-check-empty'}"></i>
                            <g:if test="${coupon.user}">
                                ${coupon.user?.fullName}(${coupon.user?.username})
                            </g:if>
                        </small></td>
                        <td><small><i class="icon${coupon.valid?' icon-check':' icon-check-empty'}"></i></small></td>
                        <td><small><g:formatDate format="yyyy/MM/dd" date="${coupon.dateCreated}" /></small></td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <g:paginate controller="admin" action="couponList" total="${couponCount}" class="pagination-centered" />
    </div>
</div>
</body>
</html>
