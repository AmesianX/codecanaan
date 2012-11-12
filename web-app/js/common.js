//pre-defined functions
var trim = function(stringToTrim) {return stringToTrim.replace(/^\s+|\s+$/g,"");};
var ltrim = function(stringToTrim) {return stringToTrim.replace(/^\s+/,"");};
var rtrim = function(stringToTrim) {return stringToTrim.replace(/\s+$/,"");};

//CodeMirror editors
var editors = {};

(function () {
    var $window = $(window);

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
            top: function () { return $window.width() <= 980 ? 290 : 210 },
            bottom: 270
        }
    });

    //init codemirror
    $('.codemirror-auto').each(function() {
        var id = $(this).prop('id');
        var mode = $(this).data('mode');
        var height = $(this).data('height');
        editors[id] = CodeMirror.fromTextArea(this, {
            lineNumbers: true,
            matchBrackets: true,
            mode: mode,
            indentUnit: 4
        });
        editors[id].setSize(null, height);
    });

})();