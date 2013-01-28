<%@ page import="codecanaan.*" %>

<div class="btn-toolbar pull-right">
    <g:if test="${content.type==ContentType.SLIDE}">
        <!--簡報全螢幕按鈕-->
        <g:link controller="content" action="deckjs" id="${content.id}" params="[fullscreen: true]" class="btn element-request-fullscreen" data-element="deckjs-iframe" target="_blank">
            <i class="icon icon-fullscreen"></i>
        </g:link>
    </g:if>
    <g:else>
        <!--字型調整按鈕-->
        <div class="btn-group hidden-phone">
            <a class="btn" id="jfontsize-m" href="#"><i class="icon icon-minus"></i></a>
            <a class="btn" id="jfontsize-d" href="#"><i class="icon icon-font"></i></a>
            <a class="btn" id="jfontsize-p" href="#"><i class="icon icon-plus"></i></a>
        </div>
    </g:else>

    <!--新增內容選單-->
    <g:render template="/content/addmenu" />

    <div class="btn-group">
        <g:link action="show" id="${content.id}" params="[editor: true]" class="btn">
            <i class="icon icon-edit"></i>
            <g:message code="default.edit.label" default="Edit {0}" args="[message(code: 'content.label', default: 'Content')]" />
        </g:link>
        <a class="btn dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li>
                <g:link controller="content" action="delete" id="${content.id}" onclick="confirm('Are you sure???');">
                    <i class="icon icon-remove"></i>
                    <!--刪除內容-->
                    <g:message code="default.delete.label" args="[message(code: 'content.label')]" />
                </g:link>
            </li>
        </ul>
    </div>
</div>
