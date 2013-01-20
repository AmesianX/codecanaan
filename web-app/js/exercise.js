(function () {

    //切換頁籤重新整理 CodeMirror
    $('a[data-toggle="tab"]').on('shown', function (e) {
        $.each(editors, function(index, val) {
            editors[index].refresh();
        });
    });

    //generate params
    var __ajax_save_record_url = $('input[name="__ajax_save_record_url"]').val();
    var __ajax_client_port = $('input[name="__ajax_client_port"]').val();
    var __ajax_loader_image_src = $('input[name="__ajax_loader_image_src"]').val();
    var __ajax_biwascheme_url = $('input[name="__ajax_biwascheme_url"]').val();
    var __ajax_savetemp_url = $('input[name="__ajax_savetemp_url"]').val();
    
    //儲存記錄
    var fnSaveRecord = function(params, fncb) {
        $('#ajaxmsg').html('<img src="'+__ajax_loader_image_src+'" alt="ajaxloader" />');
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
    
    //暫存程式碼
    var fnSaveTemp = function(params, fncb) {
        $.ajax({
            type: 'post',
            url: __ajax_savetemp_url,
            data: params,
            success: function(data) {
                if ($.isFunction(fncb)) {
                    fncb();
                }
            }
        });
    };

    //互動按鈕
    var fnCheckAnswer = function(ans) {
        var std = $('#answer').val();
        return trim(std)==trim(ans);
    };

    //顯示結果報表
    var fnShowResult = function(msg) {
        var m = $('<div class="modal hide fade" tabindex="-1" role="dialog" />');
        
        m.append('<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h2>程式執行結果</h2></div>');
        m.append($('<div class="modal-body"></div>').append(msg));
        
        m.append('<div class="modal-footer"><small style="padding-right:20px">按「ESC」關閉視窗</small><button class="btn" data-dismiss="modal" aria-hidden="true">關閉</button></div>');
    
        m.modal();
    };
    
    //比較兩個輸出並傳回比較結果
    var fnDiffAndReport = function(ans, std) {
        //force trim
        std = rtrim(std);
    
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
                    //report.append('<pre class="test-hint"><i class="icon icon-ok"></i> '+lines[i]+'</pre>');
                }
            }
        }

        var passed = (linec == linec2);

        report.append('<hr/>');

        if (passed) {
            report.append('<font color="green"><i class="icon icon-ok"></i> 通過測試，請繼續做下一個題目。</font>');
        }
        else {
            report.append('<font color="red"><i class="icon icon-error"></i> 無法通過測試，請修正程式碼再重新執行一次。</font>');
        }

        //report.append('<pre>'+ans+'</pre>');
        //report.append('<h4>標準執行結果</h4>');
        //report.append('<pre>'+std+'</pre>');

        fnShowResult(report);
        
        return passed;
    }

    if (editors && editors['sourceEdit']) {
        //學生練習模式
    
        var editor = editors['sourceEdit'];

        $('#cmdPlay').click(function() {
        
            var sourceType = trim($('#sourceType').val());
            var sourcePath = trim($('#sourcePath').val());
            var sourceCode = editor.getValue();
            var correctOutput = $('#answer').val();

            if (sourceType=='SCHEME') {
            
                //先暫存程式碼再執行
                fnSaveTemp({
                    sourceType: sourceType,
                    sourcePath: sourcePath,
                    sourceCode: sourceCode
                }, function() {
                
                    //使用 IFRAME 載入 Scheme Console
                    var iframe = $('<iframe src="'+__ajax_biwascheme_url+'?_t='+new Date().getTime()+'" style="display:none"></iframe>');
                    
                    $('body').append(iframe);
                    
                    iframe.load(function() {
                        var output = $(iframe).contents().find('#bs-console-plain').text();
                        
                        $('#program-output').text(output);

                        //bootbox.alert('<pre><code>'+output+'</code></pre>');

                        var passed = fnDiffAndReport(output, correctOutput);

                        fnSaveRecord({
                            passed: passed,
                            answer: output,
                            sourceCode: sourceCode
                        });
                    }); 
                });
            }
            else {
                $.ajax({
                    type: 'post',
                    url: 'http://localhost:'+__ajax_client_port+'/',
                    data: {
                        action: 'play',
                        sourceType: sourceType,
                        sourcePath: sourcePath,
                        sourceCode: sourceCode
                    },
                    timeout: 180*1000,
                    success: function(data) {

                        if (data) {
                            var output = data.result.data.dump;
                            
                            $('#program-output').text(output);

                            var passed = fnDiffAndReport(output, correctOutput);

                            fnSaveRecord({
                                passed: passed,
                                answer: output,
                                sourceCode: sourceCode
                            });
                        }
                    },
                    error: function(data) {
                        fnSaveRecord({
                            passed: false,
                            sourceCode: sourceCode
                        });
                        bootbox.alert('錯誤！請先啟動客戶端工具。');
                    } 
                });
            }
            
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

    if (editors && editors['sourceCode']) {
        var editor = editors['sourceCode'];
        
        
        $('#sourceType').change(function() {
            var type = $('#sourceType').val();
            
            //Simple detect, only support scheme and c-like this time
            var cmmode = (type=='SCHEME'?'text/x-scheme':'text/x-csrc');
            
            editors['sourceCode'].setOption("mode", cmmode);
            editors['partialCode'].setOption("mode", cmmode);
            
        });

        //執行測試（教材編輯模式）
        $('#cmdDump').click(function() {
        
            var sourceType = trim($('#sourceType').val());
            var sourcePath = trim($('#sourcePath').val());
            var sourceCode = editor.getValue();
            
            if (sourcePath=='') {
                bootbox.alert('請設定「程式碼路徑」欄位');
                return false;
            }
            
            if (sourceType=='SCHEME') {
                //alert(sourceCode);
                //window.open('/content/biwascheme','biwascheme','width=640,height=480,location=no,menubar=no,resizable=no,scrollbars=no,titlebar=no,toolbar=no,status=no,top=0,left=0');
                
                //先暫存程式碼再執行
                fnSaveTemp({
                    sourceType: sourceType,
                    sourcePath: sourcePath,
                    sourceCode: sourceCode
                }, function() {
                
                    //使用 IFRAME 載入 Scheme Console
                    var iframe = $('<iframe src="'+__ajax_biwascheme_url+'?_t='+new Date().getTime()+'" style="display:none"></iframe>');
                    
                    $('body').append(iframe);
                    
                    iframe.load(function() {
                        var output = $(iframe).contents().find('#bs-console-plain').text();

                        bootbox.alert('<pre><code>'+output+'</code></pre>');
                        
                        editors['answer'].setValue(rtrim(output));
                    }); 
                });
            }
            else {
                $.ajax({
                    type: 'post',
                    url: 'http://localhost:'+__ajax_client_port+'/',
                    data: {
                        action: 'play',
                        sourceType: sourceType,
                        sourcePath: sourcePath,
                        sourceCode: sourceCode
                    },
                    timeout: 180*1000,
                    success: function(data) {
                        //alert("程式執行完畢");

                        if (data) {
                            editors['answer'].setValue(data.result.data.dump);
                        }
                    },
                    error: function(data) {
                        bootbox.alert("錯誤！請先啟動客戶端工具。");
                    }
                });
            }
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
            bootbox.alert('恭喜你答對了！');
        }
        else {
            bootbox.alert('答錯了，請再試一次！');
        }
    });

    $('#cmdResizeFont').toggle(function() {
        $('.justfont').addClass('larger-font');
    }, function() {
        $('.justfont').removeClass('larger-font');
    });
})();
