(function () {

    // 切換頁籤時重新整理所有 CodeMirror 編輯器
    // 很暴力！但可以確保編輯器功能正常
    $('a[data-toggle="tab"]').on('shown', function (e) {
        $.each(editors, function(index, val) {
            editors[index].refresh();
        });
    });

    // 從隱藏欄位讀取參數資料
    var __ajax_save_record_url  = $('input[name="__ajax_save_record_url"]').val();
    var __ajax_client_port      = $('input[name="__ajax_client_port"]').val();
    var __ajax_loader_image_src = $('input[name="__ajax_loader_image_src"]').val();
    var __ajax_biwascheme_url   = $('input[name="__ajax_biwascheme_url"]').val();
    var __ajax_savetemp_url     = $('input[name="__ajax_savetemp_url"]').val();
    
    /**
     * 將記錄上傳至伺服器儲存
     *
     * @param params POST FORM DATA
     * @param fncb Callback for SUCCESS
     * @param fncberr Callback for ERROR
     */
    var fnSaveRecord = function(params, fncb, fncberr) {
        $.ajax({
            type: 'post',
            url: __ajax_save_record_url,
            data: params,
            success: function(data) {
                if ($.isFunction(fncb)) {
                    fncb();
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if ($.isFunction(fncberr)) {
                    fncberr(jqXHR, textStatus, errorThrown);
                }
                else {
                    bootbox.alert(textStatu);
                }
            }
        });
    };
    
    /**
     * 暫存程式碼
     *
     * @param params POST DATA
     * @param fncb Callback for SUCCESS
     * @param fncberr Callback for ERROR
     */
    var fnSaveTemp = function(params, fncb, fncberr) {
        $.ajax({
            type: 'post',
            url: __ajax_savetemp_url,
            data: params,
            success: function(data, textStatus, jqXHR) {
                if ($.isFunction(fncb)) {
                    //callback
                    fncb(data);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if ($.isFunction(fncberr)) {
                    //callback
                    fncberr(jqXHR, textStatus, errorThrown);
                }
                else {
                    //show message
                    bootbox.alert(textStatus);
                }
            }
        });
    };

    /**
     * 顯示結果報表
     *
     * @param msg 報表內容
     */
    var fnShowResult = function(msg) {
        /*
        var m = $('<div class="modal fade" tabindex="-1" role="dialog" />');
        
        m.append('<div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h2>程式執行結果</h2></div>');
        m.append($('<div class="modal-body"></div>').append(msg));
        
        m.append('<div class="modal-footer"><small style="padding-right:20px">按「ESC」關閉視窗</small><button class="btn" data-dismiss="modal" aria-hidden="true">關閉</button></div>');
    
        // 產生 Model 物件
        $(m).modal({
            show: false
        });
	
	    // 顯示報表時將背景霧化
		$(m).on('show', function() {
			$('.blur-after-modal-shown').addClass('effect-blur');
		});
	    
	    // 關閉報表時清除背景霧化
		$(m).on('hide', function() {
			$('.blur-after-modal-shown').removeClass('effect-blur');
		});

        // 顯示報表
		$(m).modal('show');
        */

        //console.log(msg.html());
        bootbox.alert(msg.html());
    };
    
    /**
     * 比較兩個輸出並傳回比較結果
     *
     * @param ans 執行結果
     * @param std 標準輸出
     */
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

        // 以 Modal 方式顯示報表
        fnShowResult(report);
        
        return passed;
    }

    //console.log(editors);

    if (editors && editors['sourceEdit']) {
        //學生練習模式
    
        var editor = editors['sourceEdit'];

        $('#cmdPlay').click(function() {
            
            var sourceType = trim($('#sourceType').val());
            var sourcePath = trim($('#sourcePath').val());
            var sourceCode = editor.getValue();
            var correctOutput = $('#output').val();

            if (sourceType=='HTML') {

                var __href = $(this).attr('href') + '?_t=' + new Date().getTime();

                // 先上傳程式碼再執行
                fnSaveRecord({
                    sourceType: sourceType,
                    sourcePath: sourcePath,
                    sourceCode: sourceCode
                }, function() {
                    $('#output').attr('src', __href);
                    $('#editorTab a[href="#tab-output"]').tab('show');
                });
            }
            else if (sourceType=='SCHEME') {
                
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
                            output: output,
                            sourceCode: sourceCode
                        });
                    }); 
                });
            }
            else {
                // 將資料傳給 Client Tools 測試伺服器
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
                                output: output,
                                sourceCode: sourceCode
                            });
                        }
                    },
                    error: function(data) {
                        fnSaveRecord({
                            passed: false,
                            sourceCode: sourceCode
                        });
                        bootbox.alert('<h3>未執行客戶端工具</h3><p>請先啟動<a href="/client" target="_blank">客戶端工具</a>。</p>');
                    } 
                });
            }
            
            return false;
        });

        // 按下儲存按鈕
        $('#cmdSave').click(function() {

            // 顯示儲存中
            $('i.xx-show-spinner-save').removeClass('icon-save').addClass('icon-spin icon-spinner');
            $('i.xx-show-spinner-file').removeClass('icon-file').addClass('icon-spin icon-spinner');

            // 上傳記錄
            fnSaveRecord({
                sourceCode: editor.getValue()
            }, function() {

                // 上傳成功就解除狀態顯示
                $('i.xx-show-spinner-save').removeClass('icon-spin icon-spinner').addClass('icon-save');
                $('i.xx-show-spinner-file').removeClass('icon-spin icon-spinner').addClass('icon-file');
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
    
        // 作者寫作模式
        
        var editor = editors['sourceCode'];
        
        $('#sourceType').change(function() {
            var type = $('#sourceType').val();
            
            //Simple detect, only support scheme and c-like this time
            var cmmode = 'text/x-csrc';

            if (type=='SCHEME') {
                cmmode = 'text/x-scheme';
            }
            else if (type=='HTML') {
                cmmode = 'text/html';
            }
            
            editors['sourceCode'].setOption("mode", cmmode);
            editors['partialCode'].setOption("mode", cmmode);
        });

        // 執行測試（教材編輯模式）
        $('#cmdDump').click(function() {
        
            var sourceType = trim($('#sourceType').val());
            var sourcePath = trim($('#sourcePath').val());
            var sourceCode = editor.getValue();
           
            // 檢查欄位
            if (sourcePath == '') {
                bootbox.alert('請先設定「程式碼路徑」欄位');
                return false;
            }
            
            if (sourceType == 'HTML') {
                
                var __href = $(this).attr('href') + '?_t=' + new Date().getTime();
                
                //先暫存程式碼
                fnSaveTemp({
                    sourceType: sourceType,
                    sourcePath: sourcePath,
                    sourceCode: sourceCode
                }, function() {
                    $('#output').attr('src', __href);
                    $('#editorTab a[href="#tab-output"]').tab('show');
                });
            }
            else if (sourceType == 'SCHEME') {
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
                        
                        editors['output'].setValue(rtrim(output));
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
                            editors['output'].setValue(data.result.data.dump);
                        }
                    },
                    error: function(data) {
                        bootbox.alert('<h3>未執行客戶端工具</h3><p>請先啟動<a href="/client" target="_blank">客戶端工具</a>。</p>');
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
        var type = $(this).data('type');

        var ans = '';
        var passed = false;
        
        if (!type || type == 'SHORT_ANSWER') {
            //簡答題
            ans = $('#myanswer').val();
            passed = trim($('#answer').val())==trim(ans);
            bootbox.alert(passed?'恭喜你答對了！':'答錯了，請再試一次！');
        }
        else if (type == 'SINGLE_CHOICE') {
            //單選題
            ans = $("input[name='myanswer']:checked").val();
            passed = trim($('#answer').val())==trim(ans);
            bootbox.alert(passed?'恭喜你答對了！':'答錯了，請再試一次！');
        }
        else if (type == 'MULTIPLE_CHOICE') {
            //多選題
            var aans = new Array();
            var checkOptions = $("input[name='myanswer']:checked");
            var answerOptions = $("input[name='myanswer'][data-answer='true']");

            if (checkOptions.size() != answerOptions.size()) {
                bootbox.alert('請選擇 '+answerOptions.size()+' 個項目！');
            }

            //正確答案全部必選
            var check1 = $("input[name='myanswer'][data-answer='true']:not(:checked)").size();
            
            //錯誤答案全部不選
            var check2 = $("input[name='myanswer'][data-answer!='true']:checked").size();

            passed = (check1 == 0 && check2 == 0);
            bootbox.alert(passed?'恭喜你答對了！':'答錯了，請再試一次！');

            //重新組成作答結果
            checkOptions.each(function(index) {
                aans.push($(this).val());
            });
            ans = aans.join('\n');
        }
        else if (type == 'TRUE_FALSE') {
            //是非題
            
            //讀取使用者選擇的答案
            ans = $("input[name='myanswer']:checked").val();
            
            //判斷結果
            passed = ($("#answer").val().toUpperCase() == ans);
            bootbox.alert(passed?'恭喜你答對了！':'答錯了，請再試一次！');
        }

        fnSaveRecord({
            passed: passed,
            answer: ans
        });
    });
})();
