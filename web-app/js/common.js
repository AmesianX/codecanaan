//pre-defined functions
var trim = function(stringToTrim) {return stringToTrim.replace(/^\s+|\s+$/g,"");};
var ltrim = function(stringToTrim) {return stringToTrim.replace(/^\s+/,"");};
var rtrim = function(stringToTrim) {return stringToTrim.replace(/\s+$/,"");};

//CodeMirror editors
var editors = {};


// Request FullScreen Mode
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

// Cancel FullScreen Mode
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

//CodeMirror Fullscreen
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
    
(function () {
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
    $('.auto-loadmask').click(function() {
        $('body').append('<div class="modal-backdrop"></div>');
    });
    
    // Fix for textarea "TAB" keydown
    $('textarea.enable-tabkey').tabby({tabString:'    '});

    // Tooltips
    $('[rel=tooltip]').tooltip();

    //Markdown 顯示處理
    var converter = new Markdown.Converter();
    $('.markdown-source').each(function(index) {
        $(this).html(converter.makeHtml($(this).text()));
        $(this).show();
    });
    
    //Markdown 編輯處理
    $('.wmd-editor').each(function(index) {
        var converter = Markdown.getSanitizingConverter();
        var editor = new Markdown.Editor(converter, $(this).data('suffix'));
        editor.run();
    });
  
	// Hightlight.js only support MSIE 9+ and other modern browsers
	if (!$.browser.msie || ($.browser.msie && $.browser.version.slice(0,1)>8)) {
		//Pretty Code with Highlight.js
	    hljs.initHighlightingOnLoad();
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
    $('.codemirror-auto').each(function() {
    
        var id = $(this).prop('id');
        var mode = $(this).data('mode');
        var height = $(this).data('height');
        
        editors[id] = CodeMirror.fromTextArea(this, {
            lineNumbers: true,
            matchBrackets: true,
            mode: mode,
            indentUnit: 4,
            extraKeys: {
                "F11": function(cm) {
                    //setFullScreen(cm, !isFullScreen(cm));
                },
                "Esc": function(cm) {
                    //if (isFullScreen(cm)) setFullScreen(cm, false);
                }
            }
        });
        editors[id].setSize(null, height);
        
        $('.CodeMirror').resizable({
            handles: 's',
            grid: 50,
            maxHeight: 1000,
            minHeight: 300,
            stop: function() { editors[id].refresh(); },
            resize: function() {
                editors[id].setSize($(this).width(), $(this).height());
                editors[id].refresh();
            }
        });
    });

})();
