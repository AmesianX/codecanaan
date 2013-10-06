// 常用字串處理函式
var trim  = function(s) { return typeof(s)=='string'?s.replace(/^\s+|\s+$/g,""):s; };
var ltrim = function(s) { return typeof(s)=='string'?s.replace(/^\s+/,""):s;       };
var rtrim = function(s) { return typeof(s)=='string'?s.replace(/\s+$/,""):s;       };

// 全螢幕模式切換 Request FullScreen Mode
var requestNativeFullScreen = function(element) {
	if (!element) {
		element = document.documentElement;
	}
    var result = null;
    if (element.requestFullscreen) {
        element.requestFullscreen();
        result = document.fullscreenElement;
    } else if (element.mozRequestFullScreen) {
        element.mozRequestFullScreen();
        result = document.mozFullScreenElement;
    } else if (element.webkitRequestFullscreen) {
        element.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
        result = document.webkitFullscreenElement;
    }
    return result;
};

// 全螢幕模式切換 Cancel FullScreen Mode
var cancelNativeFullScreen = function(element) {
	if (!element) {
		element = document.documentElement;
	}
    var result = null;
    if (document.cancelFullScreen) {
        result = document.fullscreenElement;
        document.cancelFullScreen();
    } else if (document.mozCancelFullScreen) {
        result = document.mozFullScreenElement;
        document.mozCancelFullScreen();
    } else if (document.webkitCancelFullScreen) {
        result = document.webkitFullscreenElement;
        document.webkitCancelFullScreen();
    }
    return result;
};

// CodeMirror 編輯器保存於全域變數
var editors = {};

// CodeMirror 編輯器的全螢幕模式
function setFullScreen(cm, full) {
    var wrap = cm.getWrapperElement();
    if (full) {
        wrap.className += " CodeMirror-fullscreen";
        wrap.style.height = winHeight() + "px";
        document.documentElement.style.overflow = "hidden";
        } else {
        wrap.className = wrap.className.replace(" CodeMirror-fullscreen", "");
        wrap.style.height = "";
        document.documentElement.style.overflow = "";
    }
    cm.refresh();
}

function isFullScreen(cm) {
    return /\bCodeMirror-fullscreen\b/.test(cm.getWrapperElement().className);
}

function winHeight() {
    return window.innerHeight || (document.documentElement || document.body).clientHeight;
}
    
$(function() {

    //Markdown 顯示處理
    if (Markdown) {
        var converter = new Markdown.Converter();
        $('.markdown-source').each(function(index) {
            var _this = $(this);
            _this.html(converter.makeHtml(_this.text()));
            _this.show();
        });
        
        //Markdown 編輯處理
        var converter = Markdown.getSanitizingConverter();
        $('.wmd-editor').each(function(index) {
            var editor = new Markdown.Editor(converter, $(this).data('suffix'));
            editor.run();
        });
    }

    var $window = $(window);
    
    var __codecanaan_fullscreen = null;
    
    //實作全螢幕機制
    var isDocumentFullScreen = function() {
        if ( document.fullscreenElement ||    // alternative standard method
             document.mozFullScreenElement ||
             document.webkitFullscreenElement ||
             __codecanaan_fullscreen) {  // current working methods
             return true;
         }
         return false;
    }

    if (!window.opener) {
        $('.document-request-fullscreen').click(function() {
        
            if (!isDocumentFullScreen()) {
                if (requestNativeFullScreen) {
                    if (!requestNativeFullScreen()) {
                        //open window
                        if ($(this).is('a')) {
                            __codecanaan_fullscreen = window.open($(this).attr('href'),'__codecanaan_fullscreen','fullscreen=yes,top=0,left=0,width='+screen.width+',height='+screen.height+',location=no,menubar=no,resizable=no,scrollbars=no,titlebar=no,toolbar=no,status=no',false);
                            __codecanaan_fullscreen.moveTo(0, 0);
                            __codecanaan_fullscreen.focus();
                        }

                    }
                }
            
            }
            else {
                if (cancelNativeFullScreen) {
                    if (!cancelNativeFullScreen()) {
                        if (__codecanaan_fullscreen) {
                            __codecanaan_fullscreen.close();
                            __codecanaan_fullscreen = null;
                        }
                    }
                }
            }
        });
    }
    else {
        $('.document-request-fullscreen').click(function() {
            window.opener.$('.document-request-fullscreen').trigger('click');
        });
    }

	//部份內容全螢幕
	$('.element-request-fullscreen').click(function() {
		if (requestNativeFullScreen) {
			var elementId = $(this).data('element');
			var element = document.getElementById(elementId);
			if (element) {
				if (requestNativeFullScreen(element)) {
					return false;
				}
			}
		}
	});

    // Enable loadmask
    $('a.auto-loadmask, .auto-loadmask a').click(function() {
        //$('body').append('<div class="modal-backdrop"></div>');
        $('<div class="modal"><div class="modal-body"><i class="icon-spinner icon-spin"></i> Loading...</p></div></div>').modal();
    });
    
    // Fix for textarea "TAB" keydown
    $('textarea.enable-tabkey').tabby({tabString:'    '});

    // Tooltips
    $('[rel=tooltip]').tooltip();
 
    // 字型調整按鈕，允許變更 justfont 區域的字型大小
    // Remove jFontSize
    /*
    $('#jfontsize-m').click(function() {
        $('.justfont').addClass('smaller-font').removeClass('larger-font');
    });
    $('#jfontsize-d').click(function() {
        $('.justfont').removeClass('smaller-font').removeClass('larger-font');
    });
    $('#jfontsize-p').click(function() {
        $('.justfont').removeClass('smaller-font').addClass('larger-font');
    });
    */

	// Hightlight.js only support MSIE 9+ and other modern browsers
	if (!$.browser.msie || ($.browser.msie && $.browser.version.slice(0,1)>8)) {
		//Pretty Code with Highlight.js
        if (typeof hljs != 'undefined') {
            hljs.tabReplace = '    '; //4 spaces
            hljs.initHighlightingOnLoad();
        }
	}

    //Affix Sidebar
    $('.bs-docs-sidenav').affix({
        offset: {
            top: function () { return $window.width() <= 980 ? 100 : 20 },
            bottom: 270
        }
    });

    /*
    CodeMirror.on(window, "resize", function() {
      var showing = document.body.getElementsByClassName("CodeMirror-fullscreen")[0];
      if (!showing) return;
      showing.CodeMirror.getWrapperElement().style.height = winHeight() + "px";
    });
    */

    //init codemirror
    if (CodeMirror) $('.codemirror-auto').each(function() {
   
        // retrieve editor config from html5 data attributes
        var id = $(this).prop('id');
        var mode = $(this).data('mode');
        var height = $(this).data('height');
        
        // folding support
        var foldFunc = CodeMirror.newFoldFunction(CodeMirror.braceRangeFinder);
        var foldFunc_html = CodeMirror.newFoldFunction(CodeMirror.tagRangeFinder);

        var tabWidth = 4;
        var tabString = "     ";

        var isHTML = false;

        if (mode == 'text/html') {
            isHTML = true;
            tabWidth = 2;
            tabString = "   ";
        }

        var editor = editors[id] = CodeMirror.fromTextArea(this, {
            lineNumbers: true,
            matchBrackets: true,
            mode: mode,
            indentUnit: tabWidth,
            smartIndent: true,
            tabSize: tabWidth,
            indentWithTabs: false,
            extraKeys: {
                "F11": function(cm) {
                    //setFullScreen(cm, !isFullScreen(cm));
                },
                "Esc": function(cm) {
                    //if (isFullScreen(cm)) setFullScreen(cm, false);
                },
                "Tab": function(cm) {
                    cm.replaceSelection(tabString, "end");
                },
                "Ctrl-Q": function(cm) {
                    foldFunc(cm, cm.getCursor().line);
                    if (isHTML) {
                        foldFunc_html(cm, cm.getCursor().line);
                    }
                }
            }
        });
        editor.on("gutterClick", function(cm, line) {
            foldFunc(cm, line);
            if (isHTML) {
                foldFunc_html(cm, line);
            }
        });
        editor.setSize(null, height);

        $('.CodeMirror').resizable({
            handles: 's',
            grid: 50,
            maxHeight: 1000,
            minHeight: 300,
            stop: function() {
                editor.refresh();
            },
            resize: function() {
                editor.setSize($(this).width(), $(this).height());
                editor.refresh();
            }
        });
    });
    
    if (CodeMirror) $('.codemirror-auto-runmode').each(function() {
        var _this = $(this);

        // retrieve editor config from html5 data attributes
        var mode = _this.data('mode');

        // 模擬成 document.getElementById 的物件（為了通過 runmode 檢查）
        var node = _this.get(0);
        node.nodeType = 1;

        CodeMirror.runMode(_this.text(), mode, node);
    });

    // CodeMirror auto refresh after tab index changed
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        for (var id in editors) {
            editors[id].refresh();
        }
    });

});


// Baseadmin defined
$(function () {    
    Application.init ();
});

var Application = function () {
    
    var validationRules = getValidationRules ();
    
    return { init: init, validationRules: validationRules };
    
    function init () {
        
        enableBackToTop ();
        enableLightbox ();
        enableCirque ();
        enableEnhancedAccordion ();


        $('.ui-tooltip').tooltip();
        $('.ui-popover').popover();
    

    }

    function enableCirque () {
        if ($.fn.lightbox) {
            $('.ui-lightbox').lightbox ();
        }
    }

    function enableLightbox () {
        if ($.fn.cirque) {
            $('.ui-cirque').cirque ({  });
        }
    }

    function enableBackToTop () {
        var backToTop = $('<a>', { id: 'back-to-top', href: '#top' });
        var icon = $('<i>', { class: 'icon-chevron-up' });

        backToTop.appendTo ('body');
        icon.appendTo (backToTop);
        
        backToTop.hide();

        $(window).scroll(function () {
            if ($(this).scrollTop() > 150) {
                backToTop.fadeIn ();
            } else {
                backToTop.fadeOut ();
            }
        });

        backToTop.click (function (e) {
            e.preventDefault ();

            $('body, html').animate({
                scrollTop: 0
            }, 600);
        });
    }
    
    function enableEnhancedAccordion () {
        $('.accordion-toggle').on('click', function (e) {           
             $(e.target).parent ().parent ().parent ().addClass('open');
        });
    
        $('.accordion-toggle').on('click', function (e) {
            $(this).parents ('.panel').siblings ().removeClass ('open');
        });
        
    }
    
    function getValidationRules () {
        var custom = {
            focusCleanup: false,
            
            wrapper: 'div',
            errorElement: 'span',
            
            highlight: function(element) {
                $(element).parents ('.form-group').removeClass ('success').addClass('error');
            },
            success: function(element) {
                $(element).parents ('.form-group').removeClass ('error').addClass('success');
                $(element).parents ('.form-group:not(:has(.clean))').find ('div:last').before ('<div class="clean"></div>');
            },
            errorPlacement: function(error, element) {
                error.prependTo(element.parents ('.form-group'));
            }
            
        };
        
        return custom;
    }
    
}();