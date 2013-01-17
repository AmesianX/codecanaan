//pre-defined functions
var trim = function(stringToTrim) {return stringToTrim.replace(/^\s+|\s+$/g,"");};
var ltrim = function(stringToTrim) {return stringToTrim.replace(/^\s+/,"");};
var rtrim = function(stringToTrim) {return stringToTrim.replace(/\s+$/,"");};

//CodeMirror editors
var editors = {};

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
    if ($('.wmd-panel').size() > 0) {
        var converter1 = Markdown.getSanitizingConverter();
        var editor1 = new Markdown.Editor(converter1);
        editor1.run();
    }
    
    //Pretty Code with Highlight.js
    hljs.initHighlightingOnLoad();

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
