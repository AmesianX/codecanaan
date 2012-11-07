<%@ page import="codecanaan.Course" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
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
<r:script>
(function () {
    //generate params
    var __ajax_save_record_url = "${createLink(controller:'content', action:'ajaxSaveRecord',id:content?.id,absolute:true)}";


    //pre-defined functions
    var trim = function(stringToTrim) {
        return stringToTrim.replace(/^\s+|\s+$/g,"");
    };
    var ltrim = function(stringToTrim) {
        return stringToTrim.replace(/^\s+/,"");
    };
    var rtrim = function(stringToTrim) {
        return stringToTrim.replace(/\s+$/,"");
    };

    //init codemirror
    var editor = null;
    if ($('#sourceEdit').size()>0) {
        editor = CodeMirror.fromTextArea(document.getElementById("sourceEdit"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-csrc",
            indentUnit: 4
        });
        //resize editor
        editor.setSize(null, 500);
    }

    var fnSaveRecord = function(params, fncb) {
        $('#ajaxmsg').html('<img src="${resource(dir:'/images',file:'ajax-loader.gif')}" alt="ajaxloader" />');
        $.ajax({
            type: 'post',
            url: __ajax_save_record_url,
            data: params,
            success: function(data) {
                if ($.isFunction(fncb)) {
                    fncb();
                }
                $('#ajaxmsg').html(data);
            }
        });
    };

    //互動按鈕
    var fnCheckAnswer = function(ans) {
        var std = $('#answer').val();
        return trim(std)==trim(ans);
    };

    var fnShowResult = function(msg) {
        $('#modalmsg').html(msg);
        $('#myModal').modal();
    };

    if (editor) {
        $('#cmdPlay').click(function() {
            $.ajax({
                type: 'post',
                url: 'http://localhost:${clientPort}/',
                data: {
                    action: 'play',
                    sourceType: $('#sourceType').val(),
                    sourcePath: $('#sourcePath').val(),
                    sourceCode: editor.getValue()
                },
                timeout: 180*1000,
                success: function(data) {
                    //alert("程式執行完畢");

                    if (data) {
                        $('#program-output').text(data.result.data.dump);

                        var ans = data.result.data.dump;
                        var std = $('#answer').val();

                        var report = $('<div class="test-report" />');

                        var lines = std.split("\n");
                        var lines2 = ans.split("\n");
                        var linec = 0;
                        var linec2 = 0;
                        for (i=0; i<lines.length; i++) {
                            linec++;
                            if (i < lines2.length) {
                                if (rtrim(lines[i])==rtrim(lines2[i])) {
                                    linec2++;
                                    report.append('<pre class="test-ok"><i class="icon icon-ok"></i> '+lines[i]+'</pre>');
                                }
                                else {
                                    report.append('<pre class="test-error"><i class="icon icon-remove"></i> '+lines2[i]+'</pre>');
                                    report.append('<pre class="test-hint"><i class="icon icon-ok"></i> '+lines[i]+'</pre>');
                                }
                            }
                        }

                        var passed = (linec == linec2);

                        report.append('<h4>測試結果</h4>');

                        if (passed) {
                            report.append('<font color="green"><i class="icon icon-ok"></i> 通過測試，請繼續做下一個題目</font>');
                        }
                        else {
                            report.append('<font color="red"><i class="icon icon-error"></i> 無法通過測試，請修正程式碼再重新執行一次</font>');
                        }

                        //report.append('<pre>'+ans+'</pre>');
                        //report.append('<h4>標準執行結果</h4>');
                        //report.append('<pre>'+std+'</pre>');

                        fnShowResult(report);

                        fnSaveRecord({
                            passed: passed,
                            answer: ans,
                            sourceCode: editor.getValue()
                        });
                    }
                },
                error: function(data) {
                    fnSaveRecord({
                        passed: false,
                        sourceCode: editor.getValue()
                    });
                    fnShowResult('<font color="red">錯誤！請先啟動客戶端工具。</font>');
                } 
            });
            return false;
        });
        $('#cmdSave').click(function() {
            $('#cmdProgress').show();
            fnSaveRecord({
                sourceCode: editor.getValue()
            }, function() {
                $('#cmdProgress').hide();
            });
            return false;
        });

        $('#cmdReset').click(function() {
            editor.setValue($('#partialCode').val());
            return false;
        });
        $('#cmdUndo').click(function() {
            editor.undo();
            return false;
        });
        $('#cmdRedo').click(function() {
            editor.redo();
            return false;
        });
    }

    $('#cmdCheck').change(function() {
        fnSaveRecord({passed: $(this).prop('checked')});
    });

    $('#cmdSubmit').click(function() {
        var ans = $('#myanswer').val();
        var passed = fnCheckAnswer(ans);
        fnSaveRecord({
            passed: passed,
            answer: ans
        });
        if (passed) {
            fnShowResult('<font color="blue">恭喜你答對了！</font>');
        }
        else {
            fnShowResult('<font color="red">答錯了，請再試一次！</font>');
        }
    });

    $('#cmdResizeFont').toggle(function() {
        $('.justfont').addClass('larger-font');
    }, function() {
        $('.justfont').removeClass('larger-font');
    });
})();
</r:script>
</body>
</html>
