<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<r:require modules="exercise" />
</head>
<body>
<g:hiddenField name="__ajax_save_record_url" value="${createLink(controller:'content', action:'ajaxSaveRecord',id:content?.id,absolute:true)}" />
<g:hiddenField name="__ajax_loader_image_src" value="${resource(dir: '/images', file: 'ajax-loader.gif')}" />
<g:hiddenField name="__ajax_client_port" value="${clientPort}" />
<div class="row">
    <div class="span3" style="font-size:10pt">
        <!--顯示課程列表-->
        <ul class="nav nav-pills nav-stacked">
            <li class="disabled"><a href="#">${course?.title}</a></li>
            <li class="${!lesson?'active':''}"><g:link controller="course" action="show" id="${course?.id}">課程首頁</g:link></li>
            <g:each in="${course?.lessons}" var="${row}" status="i">
                <li class="${row.id==lesson?.id?'active':''}">
                    <g:link controller="course" action="show" id="${course?.id}" params="[lessonId: row.id]"><i class="icon icon-book"></i> ${row.title}</g:link>
                </li>
            </g:each>
        </ul>

        <div class="pull-right">
            <a href="#" class="btn btn-small" id="cmdResizeFont"><i class="icon icon-font"></i> 縮放字體</a>
        </div>
    </div>
    <div class="span9">
        <g:if test="${authoring&&editor}">
            <!--切換編輯介面-->
            <g:if test="${content}">
                <g:render template="content_editor"/>
            </g:if>
            <g:elseif test="${lesson}">
                <g:render template="lesson_editor"/>
            </g:elseif>
            <g:else>
                <g:render template="course_editor"/>
            </g:else>
        </g:if>
        <g:else>
            <g:if test="${content}">
                <g:render template="content"/>
            </g:if>
            <g:elseif test="${lesson}">
                <g:render template="lesson"/>
            </g:elseif>
            <g:else>
                <g:render template="course"/>
            </g:else>
        </g:else>
    </div>
</div>
</body>
</html>
