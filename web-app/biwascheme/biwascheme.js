/*
 * BiwaScheme 0.6.2.dev - R6RS Scheme in JavaScript
 *
 * Copyright (c) 2007-2012 Yutaka HARA (http://www.biwascheme.org/)
 * Licensed under the MIT license.
 */

var BiwaScheme = BiwaScheme || {};

BiwaScheme.Version = "0.6.2.dev";
BiwaScheme.GitCommit = "ac12f088ee21a08f1da94a1257f9d345b6f8b5c8";
/*! jQuery v1.7.1 jquery.com | jquery.org/license */
(function(a,b){function cy(a){return f.isWindow(a)?a:a.nodeType===9?a.defaultView||a.parentWindow:!1}function cv(a){if(!ck[a]){var b=c.body,d=f("<"+a+">").appendTo(b),e=d.css("display");d.remove();if(e==="none"||e===""){cl||(cl=c.createElement("iframe"),cl.frameBorder=cl.width=cl.height=0),b.appendChild(cl);if(!cm||!cl.createElement)cm=(cl.contentWindow||cl.contentDocument).document,cm.write((c.compatMode==="CSS1Compat"?"<!doctype html>":"")+"<html><body>"),cm.close();d=cm.createElement(a),cm.body.appendChild(d),e=f.css(d,"display"),b.removeChild(cl)}ck[a]=e}return ck[a]}function cu(a,b){var c={};f.each(cq.concat.apply([],cq.slice(0,b)),function(){c[this]=a});return c}function ct(){cr=b}function cs(){setTimeout(ct,0);return cr=f.now()}function cj(){try{return new a.ActiveXObject("Microsoft.XMLHTTP")}catch(b){}}function ci(){try{return new a.XMLHttpRequest}catch(b){}}function cc(a,c){a.dataFilter&&(c=a.dataFilter(c,a.dataType));var d=a.dataTypes,e={},g,h,i=d.length,j,k=d[0],l,m,n,o,p;for(g=1;g<i;g++){if(g===1)for(h in a.converters)typeof h=="string"&&(e[h.toLowerCase()]=a.converters[h]);l=k,k=d[g];if(k==="*")k=l;else if(l!=="*"&&l!==k){m=l+" "+k,n=e[m]||e["* "+k];if(!n){p=b;for(o in e){j=o.split(" ");if(j[0]===l||j[0]==="*"){p=e[j[1]+" "+k];if(p){o=e[o],o===!0?n=p:p===!0&&(n=o);break}}}}!n&&!p&&f.error("No conversion from "+m.replace(" "," to ")),n!==!0&&(c=n?n(c):p(o(c)))}}return c}function cb(a,c,d){var e=a.contents,f=a.dataTypes,g=a.responseFields,h,i,j,k;for(i in g)i in d&&(c[g[i]]=d[i]);while(f[0]==="*")f.shift(),h===b&&(h=a.mimeType||c.getResponseHeader("content-type"));if(h)for(i in e)if(e[i]&&e[i].test(h)){f.unshift(i);break}if(f[0]in d)j=f[0];else{for(i in d){if(!f[0]||a.converters[i+" "+f[0]]){j=i;break}k||(k=i)}j=j||k}if(j){j!==f[0]&&f.unshift(j);return d[j]}}function ca(a,b,c,d){if(f.isArray(b))f.each(b,function(b,e){c||bE.test(a)?d(a,e):ca(a+"["+(typeof e=="object"||f.isArray(e)?b:"")+"]",e,c,d)});else if(!c&&b!=null&&typeof b=="object")for(var e in b)ca(a+"["+e+"]",b[e],c,d);else d(a,b)}function b_(a,c){var d,e,g=f.ajaxSettings.flatOptions||{};for(d in c)c[d]!==b&&((g[d]?a:e||(e={}))[d]=c[d]);e&&f.extend(!0,a,e)}function b$(a,c,d,e,f,g){f=f||c.dataTypes[0],g=g||{},g[f]=!0;var h=a[f],i=0,j=h?h.length:0,k=a===bT,l;for(;i<j&&(k||!l);i++)l=h[i](c,d,e),typeof l=="string"&&(!k||g[l]?l=b:(c.dataTypes.unshift(l),l=b$(a,c,d,e,l,g)));(k||!l)&&!g["*"]&&(l=b$(a,c,d,e,"*",g));return l}function bZ(a){return function(b,c){typeof b!="string"&&(c=b,b="*");if(f.isFunction(c)){var d=b.toLowerCase().split(bP),e=0,g=d.length,h,i,j;for(;e<g;e++)h=d[e],j=/^\+/.test(h),j&&(h=h.substr(1)||"*"),i=a[h]=a[h]||[],i[j?"unshift":"push"](c)}}}function bC(a,b,c){var d=b==="width"?a.offsetWidth:a.offsetHeight,e=b==="width"?bx:by,g=0,h=e.length;if(d>0){if(c!=="border")for(;g<h;g++)c||(d-=parseFloat(f.css(a,"padding"+e[g]))||0),c==="margin"?d+=parseFloat(f.css(a,c+e[g]))||0:d-=parseFloat(f.css(a,"border"+e[g]+"Width"))||0;return d+"px"}d=bz(a,b,b);if(d<0||d==null)d=a.style[b]||0;d=parseFloat(d)||0;if(c)for(;g<h;g++)d+=parseFloat(f.css(a,"padding"+e[g]))||0,c!=="padding"&&(d+=parseFloat(f.css(a,"border"+e[g]+"Width"))||0),c==="margin"&&(d+=parseFloat(f.css(a,c+e[g]))||0);return d+"px"}function bp(a,b){b.src?f.ajax({url:b.src,async:!1,dataType:"script"}):f.globalEval((b.text||b.textContent||b.innerHTML||"").replace(bf,"/*$0*/")),b.parentNode&&b.parentNode.removeChild(b)}function bo(a){var b=c.createElement("div");bh.appendChild(b),b.innerHTML=a.outerHTML;return b.firstChild}function bn(a){var b=(a.nodeName||"").toLowerCase();b==="input"?bm(a):b!=="script"&&typeof a.getElementsByTagName!="undefined"&&f.grep(a.getElementsByTagName("input"),bm)}function bm(a){if(a.type==="checkbox"||a.type==="radio")a.defaultChecked=a.checked}function bl(a){return typeof a.getElementsByTagName!="undefined"?a.getElementsByTagName("*"):typeof a.querySelectorAll!="undefined"?a.querySelectorAll("*"):[]}function bk(a,b){var c;if(b.nodeType===1){b.clearAttributes&&b.clearAttributes(),b.mergeAttributes&&b.mergeAttributes(a),c=b.nodeName.toLowerCase();if(c==="object")b.outerHTML=a.outerHTML;else if(c!=="input"||a.type!=="checkbox"&&a.type!=="radio"){if(c==="option")b.selected=a.defaultSelected;else if(c==="input"||c==="textarea")b.defaultValue=a.defaultValue}else a.checked&&(b.defaultChecked=b.checked=a.checked),b.value!==a.value&&(b.value=a.value);b.removeAttribute(f.expando)}}function bj(a,b){if(b.nodeType===1&&!!f.hasData(a)){var c,d,e,g=f._data(a),h=f._data(b,g),i=g.events;if(i){delete h.handle,h.events={};for(c in i)for(d=0,e=i[c].length;d<e;d++)f.event.add(b,c+(i[c][d].namespace?".":"")+i[c][d].namespace,i[c][d],i[c][d].data)}h.data&&(h.data=f.extend({},h.data))}}function bi(a,b){return f.nodeName(a,"table")?a.getElementsByTagName("tbody")[0]||a.appendChild(a.ownerDocument.createElement("tbody")):a}function U(a){var b=V.split("|"),c=a.createDocumentFragment();if(c.createElement)while(b.length)c.createElement(b.pop());return c}function T(a,b,c){b=b||0;if(f.isFunction(b))return f.grep(a,function(a,d){var e=!!b.call(a,d,a);return e===c});if(b.nodeType)return f.grep(a,function(a,d){return a===b===c});if(typeof b=="string"){var d=f.grep(a,function(a){return a.nodeType===1});if(O.test(b))return f.filter(b,d,!c);b=f.filter(b,d)}return f.grep(a,function(a,d){return f.inArray(a,b)>=0===c})}function S(a){return!a||!a.parentNode||a.parentNode.nodeType===11}function K(){return!0}function J(){return!1}function n(a,b,c){var d=b+"defer",e=b+"queue",g=b+"mark",h=f._data(a,d);h&&(c==="queue"||!f._data(a,e))&&(c==="mark"||!f._data(a,g))&&setTimeout(function(){!f._data(a,e)&&!f._data(a,g)&&(f.removeData(a,d,!0),h.fire())},0)}function m(a){for(var b in a){if(b==="data"&&f.isEmptyObject(a[b]))continue;if(b!=="toJSON")return!1}return!0}function l(a,c,d){if(d===b&&a.nodeType===1){var e="data-"+c.replace(k,"-$1").toLowerCase();d=a.getAttribute(e);if(typeof d=="string"){try{d=d==="true"?!0:d==="false"?!1:d==="null"?null:f.isNumeric(d)?parseFloat(d):j.test(d)?f.parseJSON(d):d}catch(g){}f.data(a,c,d)}else d=b}return d}function h(a){var b=g[a]={},c,d;a=a.split(/\s+/);for(c=0,d=a.length;c<d;c++)b[a[c]]=!0;return b}var c=a.document,d=a.navigator,e=a.location,f=function(){function J(){if(!e.isReady){try{c.documentElement.doScroll("left")}catch(a){setTimeout(J,1);return}e.ready()}}var e=function(a,b){return new e.fn.init(a,b,h)},f=a.jQuery,g=a.$,h,i=/^(?:[^#<]*(<[\w\W]+>)[^>]*$|#([\w\-]*)$)/,j=/\S/,k=/^\s+/,l=/\s+$/,m=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,n=/^[\],:{}\s]*$/,o=/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,p=/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,q=/(?:^|:|,)(?:\s*\[)+/g,r=/(webkit)[ \/]([\w.]+)/,s=/(opera)(?:.*version)?[ \/]([\w.]+)/,t=/(msie) ([\w.]+)/,u=/(mozilla)(?:.*? rv:([\w.]+))?/,v=/-([a-z]|[0-9])/ig,w=/^-ms-/,x=function(a,b){return(b+"").toUpperCase()},y=d.userAgent,z,A,B,C=Object.prototype.toString,D=Object.prototype.hasOwnProperty,E=Array.prototype.push,F=Array.prototype.slice,G=String.prototype.trim,H=Array.prototype.indexOf,I={};e.fn=e.prototype={constructor:e,init:function(a,d,f){var g,h,j,k;if(!a)return this;if(a.nodeType){this.context=this[0]=a,this.length=1;return this}if(a==="body"&&!d&&c.body){this.context=c,this[0]=c.body,this.selector=a,this.length=1;return this}if(typeof a=="string"){a.charAt(0)!=="<"||a.charAt(a.length-1)!==">"||a.length<3?g=i.exec(a):g=[null,a,null];if(g&&(g[1]||!d)){if(g[1]){d=d instanceof e?d[0]:d,k=d?d.ownerDocument||d:c,j=m.exec(a),j?e.isPlainObject(d)?(a=[c.createElement(j[1])],e.fn.attr.call(a,d,!0)):a=[k.createElement(j[1])]:(j=e.buildFragment([g[1]],[k]),a=(j.cacheable?e.clone(j.fragment):j.fragment).childNodes);return e.merge(this,a)}h=c.getElementById(g[2]);if(h&&h.parentNode){if(h.id!==g[2])return f.find(a);this.length=1,this[0]=h}this.context=c,this.selector=a;return this}return!d||d.jquery?(d||f).find(a):this.constructor(d).find(a)}if(e.isFunction(a))return f.ready(a);a.selector!==b&&(this.selector=a.selector,this.context=a.context);return e.makeArray(a,this)},selector:"",jquery:"1.7.1",length:0,size:function(){return this.length},toArray:function(){return F.call(this,0)},get:function(a){return a==null?this.toArray():a<0?this[this.length+a]:this[a]},pushStack:function(a,b,c){var d=this.constructor();e.isArray(a)?E.apply(d,a):e.merge(d,a),d.prevObject=this,d.context=this.context,b==="find"?d.selector=this.selector+(this.selector?" ":"")+c:b&&(d.selector=this.selector+"."+b+"("+c+")");return d},each:function(a,b){return e.each(this,a,b)},ready:function(a){e.bindReady(),A.add(a);return this},eq:function(a){a=+a;return a===-1?this.slice(a):this.slice(a,a+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(F.apply(this,arguments),"slice",F.call(arguments).join(","))},map:function(a){return this.pushStack(e.map(this,function(b,c){return a.call(b,c,b)}))},end:function(){return this.prevObject||this.constructor(null)},push:E,sort:[].sort,splice:[].splice},e.fn.init.prototype=e.fn,e.extend=e.fn.extend=function(){var a,c,d,f,g,h,i=arguments[0]||{},j=1,k=arguments.length,l=!1;typeof i=="boolean"&&(l=i,i=arguments[1]||{},j=2),typeof i!="object"&&!e.isFunction(i)&&(i={}),k===j&&(i=this,--j);for(;j<k;j++)if((a=arguments[j])!=null)for(c in a){d=i[c],f=a[c];if(i===f)continue;l&&f&&(e.isPlainObject(f)||(g=e.isArray(f)))?(g?(g=!1,h=d&&e.isArray(d)?d:[]):h=d&&e.isPlainObject(d)?d:{},i[c]=e.extend(l,h,f)):f!==b&&(i[c]=f)}return i},e.extend({noConflict:function(b){a.$===e&&(a.$=g),b&&a.jQuery===e&&(a.jQuery=f);return e},isReady:!1,readyWait:1,holdReady:function(a){a?e.readyWait++:e.ready(!0)},ready:function(a){if(a===!0&&!--e.readyWait||a!==!0&&!e.isReady){if(!c.body)return setTimeout(e.ready,1);e.isReady=!0;if(a!==!0&&--e.readyWait>0)return;A.fireWith(c,[e]),e.fn.trigger&&e(c).trigger("ready").off("ready")}},bindReady:function(){if(!A){A=e.Callbacks("once memory");if(c.readyState==="complete")return setTimeout(e.ready,1);if(c.addEventListener)c.addEventListener("DOMContentLoaded",B,!1),a.addEventListener("load",e.ready,!1);else if(c.attachEvent){c.attachEvent("onreadystatechange",B),a.attachEvent("onload",e.ready);var b=!1;try{b=a.frameElement==null}catch(d){}c.documentElement.doScroll&&b&&J()}}},isFunction:function(a){return e.type(a)==="function"},isArray:Array.isArray||function(a){return e.type(a)==="array"},isWindow:function(a){return a&&typeof a=="object"&&"setInterval"in a},isNumeric:function(a){return!isNaN(parseFloat(a))&&isFinite(a)},type:function(a){return a==null?String(a):I[C.call(a)]||"object"},isPlainObject:function(a){if(!a||e.type(a)!=="object"||a.nodeType||e.isWindow(a))return!1;try{if(a.constructor&&!D.call(a,"constructor")&&!D.call(a.constructor.prototype,"isPrototypeOf"))return!1}catch(c){return!1}var d;for(d in a);return d===b||D.call(a,d)},isEmptyObject:function(a){for(var b in a)return!1;return!0},error:function(a){throw new Error(a)},parseJSON:function(b){if(typeof b!="string"||!b)return null;b=e.trim(b);if(a.JSON&&a.JSON.parse)return a.JSON.parse(b);if(n.test(b.replace(o,"@").replace(p,"]").replace(q,"")))return(new Function("return "+b))();e.error("Invalid JSON: "+b)},parseXML:function(c){var d,f;try{a.DOMParser?(f=new DOMParser,d=f.parseFromString(c,"text/xml")):(d=new ActiveXObject("Microsoft.XMLDOM"),d.async="false",d.loadXML(c))}catch(g){d=b}(!d||!d.documentElement||d.getElementsByTagName("parsererror").length)&&e.error("Invalid XML: "+c);return d},noop:function(){},globalEval:function(b){b&&j.test(b)&&(a.execScript||function(b){a.eval.call(a,b)})(b)},camelCase:function(a){return a.replace(w,"ms-").replace(v,x)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toUpperCase()===b.toUpperCase()},each:function(a,c,d){var f,g=0,h=a.length,i=h===b||e.isFunction(a);if(d){if(i){for(f in a)if(c.apply(a[f],d)===!1)break}else for(;g<h;)if(c.apply(a[g++],d)===!1)break}else if(i){for(f in a)if(c.call(a[f],f,a[f])===!1)break}else for(;g<h;)if(c.call(a[g],g,a[g++])===!1)break;return a},trim:G?function(a){return a==null?"":G.call(a)}:function(a){return a==null?"":(a+"").replace(k,"").replace(l,"")},makeArray:function(a,b){var c=b||[];if(a!=null){var d=e.type(a);a.length==null||d==="string"||d==="function"||d==="regexp"||e.isWindow(a)?E.call(c,a):e.merge(c,a)}return c},inArray:function(a,b,c){var d;if(b){if(H)return H.call(b,a,c);d=b.length,c=c?c<0?Math.max(0,d+c):c:0;for(;c<d;c++)if(c in b&&b[c]===a)return c}return-1},merge:function(a,c){var d=a.length,e=0;if(typeof c.length=="number")for(var f=c.length;e<f;e++)a[d++]=c[e];else while(c[e]!==b)a[d++]=c[e++];a.length=d;return a},grep:function(a,b,c){var d=[],e;c=!!c;for(var f=0,g=a.length;f<g;f++)e=!!b(a[f],f),c!==e&&d.push(a[f]);return d},map:function(a,c,d){var f,g,h=[],i=0,j=a.length,k=a instanceof e||j!==b&&typeof j=="number"&&(j>0&&a[0]&&a[j-1]||j===0||e.isArray(a));if(k)for(;i<j;i++)f=c(a[i],i,d),f!=null&&(h[h.length]=f);else for(g in a)f=c(a[g],g,d),f!=null&&(h[h.length]=f);return h.concat.apply([],h)},guid:1,proxy:function(a,c){if(typeof c=="string"){var d=a[c];c=a,a=d}if(!e.isFunction(a))return b;var f=F.call(arguments,2),g=function(){return a.apply(c,f.concat(F.call(arguments)))};g.guid=a.guid=a.guid||g.guid||e.guid++;return g},access:function(a,c,d,f,g,h){var i=a.length;if(typeof c=="object"){for(var j in c)e.access(a,j,c[j],f,g,d);return a}if(d!==b){f=!h&&f&&e.isFunction(d);for(var k=0;k<i;k++)g(a[k],c,f?d.call(a[k],k,g(a[k],c)):d,h);return a}return i?g(a[0],c):b},now:function(){return(new Date).getTime()},uaMatch:function(a){a=a.toLowerCase();var b=r.exec(a)||s.exec(a)||t.exec(a)||a.indexOf("compatible")<0&&u.exec(a)||[];return{browser:b[1]||"",version:b[2]||"0"}},sub:function(){function a(b,c){return new a.fn.init(b,c)}e.extend(!0,a,this),a.superclass=this,a.fn=a.prototype=this(),a.fn.constructor=a,a.sub=this.sub,a.fn.init=function(d,f){f&&f instanceof e&&!(f instanceof a)&&(f=a(f));return e.fn.init.call(this,d,f,b)},a.fn.init.prototype=a.fn;var b=a(c);return a},browser:{}}),e.each("Boolean Number String Function Array Date RegExp Object".split(" "),function(a,b){I["[object "+b+"]"]=b.toLowerCase()}),z=e.uaMatch(y),z.browser&&(e.browser[z.browser]=!0,e.browser.version=z.version),e.browser.webkit&&(e.browser.safari=!0),j.test(" ")&&(k=/^[\s\xA0]+/,l=/[\s\xA0]+$/),h=e(c),c.addEventListener?B=function(){c.removeEventListener("DOMContentLoaded",B,!1),e.ready()}:c.attachEvent&&(B=function(){c.readyState==="complete"&&(c.detachEvent("onreadystatechange",B),e.ready())});return e}(),g={};f.Callbacks=function(a){a=a?g[a]||h(a):{};var c=[],d=[],e,i,j,k,l,m=function(b){var d,e,g,h,i;for(d=0,e=b.length;d<e;d++)g=b[d],h=f.type(g),h==="array"?m(g):h==="function"&&(!a.unique||!o.has(g))&&c.push(g)},n=function(b,f){f=f||[],e=!a.memory||[b,f],i=!0,l=j||0,j=0,k=c.length;for(;c&&l<k;l++)if(c[l].apply(b,f)===!1&&a.stopOnFalse){e=!0;break}i=!1,c&&(a.once?e===!0?o.disable():c=[]:d&&d.length&&(e=d.shift(),o.fireWith(e[0],e[1])))},o={add:function(){if(c){var a=c.length;m(arguments),i?k=c.length:e&&e!==!0&&(j=a,n(e[0],e[1]))}return this},remove:function(){if(c){var b=arguments,d=0,e=b.length;for(;d<e;d++)for(var f=0;f<c.length;f++)if(b[d]===c[f]){i&&f<=k&&(k--,f<=l&&l--),c.splice(f--,1);if(a.unique)break}}return this},has:function(a){if(c){var b=0,d=c.length;for(;b<d;b++)if(a===c[b])return!0}return!1},empty:function(){c=[];return this},disable:function(){c=d=e=b;return this},disabled:function(){return!c},lock:function(){d=b,(!e||e===!0)&&o.disable();return this},locked:function(){return!d},fireWith:function(b,c){d&&(i?a.once||d.push([b,c]):(!a.once||!e)&&n(b,c));return this},fire:function(){o.fireWith(this,arguments);return this},fired:function(){return!!e}};return o};var i=[].slice;f.extend({Deferred:function(a){var b=f.Callbacks("once memory"),c=f.Callbacks("once memory"),d=f.Callbacks("memory"),e="pending",g={resolve:b,reject:c,notify:d},h={done:b.add,fail:c.add,progress:d.add,state:function(){return e},isResolved:b.fired,isRejected:c.fired,then:function(a,b,c){i.done(a).fail(b).progress(c);return this},always:function(){i.done.apply(i,arguments).fail.apply(i,arguments);return this},pipe:function(a,b,c){return f.Deferred(function(d){f.each({done:[a,"resolve"],fail:[b,"reject"],progress:[c,"notify"]},function(a,b){var c=b[0],e=b[1],g;f.isFunction(c)?i[a](function(){g=c.apply(this,arguments),g&&f.isFunction(g.promise)?g.promise().then(d.resolve,d.reject,d.notify):d[e+"With"](this===i?d:this,[g])}):i[a](d[e])})}).promise()},promise:function(a){if(a==null)a=h;else for(var b in h)a[b]=h[b];return a}},i=h.promise({}),j;for(j in g)i[j]=g[j].fire,i[j+"With"]=g[j].fireWith;i.done(function(){e="resolved"},c.disable,d.lock).fail(function(){e="rejected"},b.disable,d.lock),a&&a.call(i,i);return i},when:function(a){function m(a){return function(b){e[a]=arguments.length>1?i.call(arguments,0):b,j.notifyWith(k,e)}}function l(a){return function(c){b[a]=arguments.length>1?i.call(arguments,0):c,--g||j.resolveWith(j,b)}}var b=i.call(arguments,0),c=0,d=b.length,e=Array(d),g=d,h=d,j=d<=1&&a&&f.isFunction(a.promise)?a:f.Deferred(),k=j.promise();if(d>1){for(;c<d;c++)b[c]&&b[c].promise&&f.isFunction(b[c].promise)?b[c].promise().then(l(c),j.reject,m(c)):--g;g||j.resolveWith(j,b)}else j!==a&&j.resolveWith(j,d?[a]:[]);return k}}),f.support=function(){var b,d,e,g,h,i,j,k,l,m,n,o,p,q=c.createElement("div"),r=c.documentElement;q.setAttribute("className","t"),q.innerHTML="   <link/><table></table><a href='/a' style='top:1px;float:left;opacity:.55;'>a</a><input type='checkbox'/>",d=q.getElementsByTagName("*"),e=q.getElementsByTagName("a")[0];if(!d||!d.length||!e)return{};g=c.createElement("select"),h=g.appendChild(c.createElement("option")),i=q.getElementsByTagName("input")[0],b={leadingWhitespace:q.firstChild.nodeType===3,tbody:!q.getElementsByTagName("tbody").length,htmlSerialize:!!q.getElementsByTagName("link").length,style:/top/.test(e.getAttribute("style")),hrefNormalized:e.getAttribute("href")==="/a",opacity:/^0.55/.test(e.style.opacity),cssFloat:!!e.style.cssFloat,checkOn:i.value==="on",optSelected:h.selected,getSetAttribute:q.className!=="t",enctype:!!c.createElement("form").enctype,html5Clone:c.createElement("nav").cloneNode(!0).outerHTML!=="<:nav></:nav>",submitBubbles:!0,changeBubbles:!0,focusinBubbles:!1,deleteExpando:!0,noCloneEvent:!0,inlineBlockNeedsLayout:!1,shrinkWrapBlocks:!1,reliableMarginRight:!0},i.checked=!0,b.noCloneChecked=i.cloneNode(!0).checked,g.disabled=!0,b.optDisabled=!h.disabled;try{delete q.test}catch(s){b.deleteExpando=!1}!q.addEventListener&&q.attachEvent&&q.fireEvent&&(q.attachEvent("onclick",function(){b.noCloneEvent=!1}),q.cloneNode(!0).fireEvent("onclick")),i=c.createElement("input"),i.value="t",i.setAttribute("type","radio"),b.radioValue=i.value==="t",i.setAttribute("checked","checked"),q.appendChild(i),k=c.createDocumentFragment(),k.appendChild(q.lastChild),b.checkClone=k.cloneNode(!0).cloneNode(!0).lastChild.checked,b.appendChecked=i.checked,k.removeChild(i),k.appendChild(q),q.innerHTML="",a.getComputedStyle&&(j=c.createElement("div"),j.style.width="0",j.style.marginRight="0",q.style.width="2px",q.appendChild(j),b.reliableMarginRight=(parseInt((a.getComputedStyle(j,null)||{marginRight:0}).marginRight,10)||0)===0);if(q.attachEvent)for(o in{submit:1,change:1,focusin:1})n="on"+o,p=n in q,p||(q.setAttribute(n,"return;"),p=typeof q[n]=="function"),b[o+"Bubbles"]=p;k.removeChild(q),k=g=h=j=q=i=null,f(function(){var a,d,e,g,h,i,j,k,m,n,o,r=c.getElementsByTagName("body")[0];!r||(j=1,k="position:absolute;top:0;left:0;width:1px;height:1px;margin:0;",m="visibility:hidden;border:0;",n="style='"+k+"border:5px solid #000;padding:0;'",o="<div "+n+"><div></div></div>"+"<table "+n+" cellpadding='0' cellspacing='0'>"+"<tr><td></td></tr></table>",a=c.createElement("div"),a.style.cssText=m+"width:0;height:0;position:static;top:0;margin-top:"+j+"px",r.insertBefore(a,r.firstChild),q=c.createElement("div"),a.appendChild(q),q.innerHTML="<table><tr><td style='padding:0;border:0;display:none'></td><td>t</td></tr></table>",l=q.getElementsByTagName("td"),p=l[0].offsetHeight===0,l[0].style.display="",l[1].style.display="none",b.reliableHiddenOffsets=p&&l[0].offsetHeight===0,q.innerHTML="",q.style.width=q.style.paddingLeft="1px",f.boxModel=b.boxModel=q.offsetWidth===2,typeof q.style.zoom!="undefined"&&(q.style.display="inline",q.style.zoom=1,b.inlineBlockNeedsLayout=q.offsetWidth===2,q.style.display="",q.innerHTML="<div style='width:4px;'></div>",b.shrinkWrapBlocks=q.offsetWidth!==2),q.style.cssText=k+m,q.innerHTML=o,d=q.firstChild,e=d.firstChild,h=d.nextSibling.firstChild.firstChild,i={doesNotAddBorder:e.offsetTop!==5,doesAddBorderForTableAndCells:h.offsetTop===5},e.style.position="fixed",e.style.top="20px",i.fixedPosition=e.offsetTop===20||e.offsetTop===15,e.style.position=e.style.top="",d.style.overflow="hidden",d.style.position="relative",i.subtractsBorderForOverflowNotVisible=e.offsetTop===-5,i.doesNotIncludeMarginInBodyOffset=r.offsetTop!==j,r.removeChild(a),q=a=null,f.extend(b,i))});return b}();var j=/^(?:\{.*\}|\[.*\])$/,k=/([A-Z])/g;f.extend({cache:{},uuid:0,expando:"jQuery"+(f.fn.jquery+Math.random()).replace(/\D/g,""),noData:{embed:!0,object:"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000",applet:!0},hasData:function(a){a=a.nodeType?f.cache[a[f.expando]]:a[f.expando];return!!a&&!m(a)},data:function(a,c,d,e){if(!!f.acceptData(a)){var g,h,i,j=f.expando,k=typeof c=="string",l=a.nodeType,m=l?f.cache:a,n=l?a[j]:a[j]&&j,o=c==="events";if((!n||!m[n]||!o&&!e&&!m[n].data)&&k&&d===b)return;n||(l?a[j]=n=++f.uuid:n=j),m[n]||(m[n]={},l||(m[n].toJSON=f.noop));if(typeof c=="object"||typeof c=="function")e?m[n]=f.extend(m[n],c):m[n].data=f.extend(m[n].data,c);g=h=m[n],e||(h.data||(h.data={}),h=h.data),d!==b&&(h[f.camelCase(c)]=d);if(o&&!h[c])return g.events;k?(i=h[c],i==null&&(i=h[f.camelCase(c)])):i=h;return i}},removeData:function(a,b,c){if(!!f.acceptData(a)){var d,e,g,h=f.expando,i=a.nodeType,j=i?f.cache:a,k=i?a[h]:h;if(!j[k])return;if(b){d=c?j[k]:j[k].data;if(d){f.isArray(b)||(b in d?b=[b]:(b=f.camelCase(b),b in d?b=[b]:b=b.split(" ")));for(e=0,g=b.length;e<g;e++)delete d[b[e]];if(!(c?m:f.isEmptyObject)(d))return}}if(!c){delete j[k].data;if(!m(j[k]))return}f.support.deleteExpando||!j.setInterval?delete j[k]:j[k]=null,i&&(f.support.deleteExpando?delete a[h]:a.removeAttribute?a.removeAttribute(h):a[h]=null)}},_data:function(a,b,c){return f.data(a,b,c,!0)},acceptData:function(a){if(a.nodeName){var b=f.noData[a.nodeName.toLowerCase()];if(b)return b!==!0&&a.getAttribute("classid")===b}return!0}}),f.fn.extend({data:function(a,c){var d,e,g,h=null;if(typeof a=="undefined"){if(this.length){h=f.data(this[0]);if(this[0].nodeType===1&&!f._data(this[0],"parsedAttrs")){e=this[0].attributes;for(var i=0,j=e.length;i<j;i++)g=e[i].name,g.indexOf("data-")===0&&(g=f.camelCase(g.substring(5)),l(this[0],g,h[g]));f._data(this[0],"parsedAttrs",!0)}}return h}if(typeof a=="object")return this.each(function(){f.data(this,a)});d=a.split("."),d[1]=d[1]?"."+d[1]:"";if(c===b){h=this.triggerHandler("getData"+d[1]+"!",[d[0]]),h===b&&this.length&&(h=f.data(this[0],a),h=l(this[0],a,h));return h===b&&d[1]?this.data(d[0]):h}return this.each(function(){var b=f(this),e=[d[0],c];b.triggerHandler("setData"+d[1]+"!",e),f.data(this,a,c),b.triggerHandler("changeData"+d[1]+"!",e)})},removeData:function(a){return this.each(function(){f.removeData(this,a)})}}),f.extend({_mark:function(a,b){a&&(b=(b||"fx")+"mark",f._data(a,b,(f._data(a,b)||0)+1))},_unmark:function(a,b,c){a!==!0&&(c=b,b=a,a=!1);if(b){c=c||"fx";var d=c+"mark",e=a?0:(f._data(b,d)||1)-1;e?f._data(b,d,e):(f.removeData(b,d,!0),n(b,c,"mark"))}},queue:function(a,b,c){var d;if(a){b=(b||"fx")+"queue",d=f._data(a,b),c&&(!d||f.isArray(c)?d=f._data(a,b,f.makeArray(c)):d.push(c));return d||[]}},dequeue:function(a,b){b=b||"fx";var c=f.queue(a,b),d=c.shift(),e={};d==="inprogress"&&(d=c.shift()),d&&(b==="fx"&&c.unshift("inprogress"),f._data(a,b+".run",e),d.call(a,function(){f.dequeue(a,b)},e)),c.length||(f.removeData(a,b+"queue "+b+".run",!0),n(a,b,"queue"))}}),f.fn.extend({queue:function(a,c){typeof a!="string"&&(c=a,a="fx");if(c===b)return f.queue(this[0],a);return this.each(function(){var b=f.queue(this,a,c);a==="fx"&&b[0]!=="inprogress"&&f.dequeue(this,a)})},dequeue:function(a){return this.each(function(){f.dequeue(this,a)})},delay:function(a,b){a=f.fx?f.fx.speeds[a]||a:a,b=b||"fx";return this.queue(b,function(b,c){var d=setTimeout(b,a);c.stop=function(){clearTimeout(d)}})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,c){function m(){--h||d.resolveWith(e,[e])}typeof a!="string"&&(c=a,a=b),a=a||"fx";var d=f.Deferred(),e=this,g=e.length,h=1,i=a+"defer",j=a+"queue",k=a+"mark",l;while(g--)if(l=f.data(e[g],i,b,!0)||(f.data(e[g],j,b,!0)||f.data(e[g],k,b,!0))&&f.data(e[g],i,f.Callbacks("once memory"),!0))h++,l.add(m);m();return d.promise()}});var o=/[\n\t\r]/g,p=/\s+/,q=/\r/g,r=/^(?:button|input)$/i,s=/^(?:button|input|object|select|textarea)$/i,t=/^a(?:rea)?$/i,u=/^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,v=f.support.getSetAttribute,w,x,y;f.fn.extend({attr:function(a,b){return f.access(this,a,b,!0,f.attr)},removeAttr:function(a){return this.each(function(){f.removeAttr(this,a)})},prop:function(a,b){return f.access(this,a,b,!0,f.prop)},removeProp:function(a){a=f.propFix[a]||a;return this.each(function(){try{this[a]=b,delete this[a]}catch(c){}})},addClass:function(a){var b,c,d,e,g,h,i;if(f.isFunction(a))return this.each(function(b){f(this).addClass(a.call(this,b,this.className))});if(a&&typeof a=="string"){b=a.split(p);for(c=0,d=this.length;c<d;c++){e=this[c];if(e.nodeType===1)if(!e.className&&b.length===1)e.className=a;else{g=" "+e.className+" ";for(h=0,i=b.length;h<i;h++)~g.indexOf(" "+b[h]+" ")||(g+=b[h]+" ");e.className=f.trim(g)}}}return this},removeClass:function(a){var c,d,e,g,h,i,j;if(f.isFunction(a))return this.each(function(b){f(this).removeClass(a.call(this,b,this.className))});if(a&&typeof a=="string"||a===b){c=(a||"").split(p);for(d=0,e=this.length;d<e;d++){g=this[d];if(g.nodeType===1&&g.className)if(a){h=(" "+g.className+" ").replace(o," ");for(i=0,j=c.length;i<j;i++)h=h.replace(" "+c[i]+" "," ");g.className=f.trim(h)}else g.className=""}}return this},toggleClass:function(a,b){var c=typeof a,d=typeof b=="boolean";if(f.isFunction(a))return this.each(function(c){f(this).toggleClass(a.call(this,c,this.className,b),b)});return this.each(function(){if(c==="string"){var e,g=0,h=f(this),i=b,j=a.split(p);while(e=j[g++])i=d?i:!h.hasClass(e),h[i?"addClass":"removeClass"](e)}else if(c==="undefined"||c==="boolean")this.className&&f._data(this,"__className__",this.className),this.className=this.className||a===!1?"":f._data(this,"__className__")||""})},hasClass:function(a){var b=" "+a+" ",c=0,d=this.length;for(;c<d;c++)if(this[c].nodeType===1&&(" "+this[c].className+" ").replace(o," ").indexOf(b)>-1)return!0;return!1},val:function(a){var c,d,e,g=this[0];{if(!!arguments.length){e=f.isFunction(a);return this.each(function(d){var g=f(this),h;if(this.nodeType===1){e?h=a.call(this,d,g.val()):h=a,h==null?h="":typeof h=="number"?h+="":f.isArray(h)&&(h=f.map(h,function(a){return a==null?"":a+""})),c=f.valHooks[this.nodeName.toLowerCase()]||f.valHooks[this.type];if(!c||!("set"in c)||c.set(this,h,"value")===b)this.value=h}})}if(g){c=f.valHooks[g.nodeName.toLowerCase()]||f.valHooks[g.type];if(c&&"get"in c&&(d=c.get(g,"value"))!==b)return d;d=g.value;return typeof d=="string"?d.replace(q,""):d==null?"":d}}}}),f.extend({valHooks:{option:{get:function(a){var b=a.attributes.value;return!b||b.specified?a.value:a.text}},select:{get:function(a){var b,c,d,e,g=a.selectedIndex,h=[],i=a.options,j=a.type==="select-one";if(g<0)return null;c=j?g:0,d=j?g+1:i.length;for(;c<d;c++){e=i[c];if(e.selected&&(f.support.optDisabled?!e.disabled:e.getAttribute("disabled")===null)&&(!e.parentNode.disabled||!f.nodeName(e.parentNode,"optgroup"))){b=f(e).val();if(j)return b;h.push(b)}}if(j&&!h.length&&i.length)return f(i[g]).val();return h},set:function(a,b){var c=f.makeArray(b);f(a).find("option").each(function(){this.selected=f.inArray(f(this).val(),c)>=0}),c.length||(a.selectedIndex=-1);return c}}},attrFn:{val:!0,css:!0,html:!0,text:!0,data:!0,width:!0,height:!0,offset:!0},attr:function(a,c,d,e){var g,h,i,j=a.nodeType;if(!!a&&j!==3&&j!==8&&j!==2){if(e&&c in f.attrFn)return f(a)[c](d);if(typeof a.getAttribute=="undefined")return f.prop(a,c,d);i=j!==1||!f.isXMLDoc(a),i&&(c=c.toLowerCase(),h=f.attrHooks[c]||(u.test(c)?x:w));if(d!==b){if(d===null){f.removeAttr(a,c);return}if(h&&"set"in h&&i&&(g=h.set(a,d,c))!==b)return g;a.setAttribute(c,""+d);return d}if(h&&"get"in h&&i&&(g=h.get(a,c))!==null)return g;g=a.getAttribute(c);return g===null?b:g}},removeAttr:function(a,b){var c,d,e,g,h=0;if(b&&a.nodeType===1){d=b.toLowerCase().split(p),g=d.length;for(;h<g;h++)e=d[h],e&&(c=f.propFix[e]||e,f.attr(a,e,""),a.removeAttribute(v?e:c),u.test(e)&&c in a&&(a[c]=!1))}},attrHooks:{type:{set:function(a,b){if(r.test(a.nodeName)&&a.parentNode)f.error("type property can't be changed");else if(!f.support.radioValue&&b==="radio"&&f.nodeName(a,"input")){var c=a.value;a.setAttribute("type",b),c&&(a.value=c);return b}}},value:{get:function(a,b){if(w&&f.nodeName(a,"button"))return w.get(a,b);return b in a?a.value:null},set:function(a,b,c){if(w&&f.nodeName(a,"button"))return w.set(a,b,c);a.value=b}}},propFix:{tabindex:"tabIndex",readonly:"readOnly","for":"htmlFor","class":"className",maxlength:"maxLength",cellspacing:"cellSpacing",cellpadding:"cellPadding",rowspan:"rowSpan",colspan:"colSpan",usemap:"useMap",frameborder:"frameBorder",contenteditable:"contentEditable"},prop:function(a,c,d){var e,g,h,i=a.nodeType;if(!!a&&i!==3&&i!==8&&i!==2){h=i!==1||!f.isXMLDoc(a),h&&(c=f.propFix[c]||c,g=f.propHooks[c]);return d!==b?g&&"set"in g&&(e=g.set(a,d,c))!==b?e:a[c]=d:g&&"get"in g&&(e=g.get(a,c))!==null?e:a[c]}},propHooks:{tabIndex:{get:function(a){var c=a.getAttributeNode("tabindex");return c&&c.specified?parseInt(c.value,10):s.test(a.nodeName)||t.test(a.nodeName)&&a.href?0:b}}}}),f.attrHooks.tabindex=f.propHooks.tabIndex,x={get:function(a,c){var d,e=f.prop(a,c);return e===!0||typeof e!="boolean"&&(d=a.getAttributeNode(c))&&d.nodeValue!==!1?c.toLowerCase():b},set:function(a,b,c){var d;b===!1?f.removeAttr(a,c):(d=f.propFix[c]||c,d in a&&(a[d]=!0),a.setAttribute(c,c.toLowerCase()));return c}},v||(y={name:!0,id:!0},w=f.valHooks.button={get:function(a,c){var d;d=a.getAttributeNode(c);return d&&(y[c]?d.nodeValue!=="":d.specified)?d.nodeValue:b},set:function(a,b,d){var e=a.getAttributeNode(d);e||(e=c.createAttribute(d),a.setAttributeNode(e));return e.nodeValue=b+""}},f.attrHooks.tabindex.set=w.set,f.each(["width","height"],function(a,b){f.attrHooks[b]=f.extend(f.attrHooks[b],{set:function(a,c){if(c===""){a.setAttribute(b,"auto");return c}}})}),f.attrHooks.contenteditable={get:w.get,set:function(a,b,c){b===""&&(b="false"),w.set(a,b,c)}}),f.support.hrefNormalized||f.each(["href","src","width","height"],function(a,c){f.attrHooks[c]=f.extend(f.attrHooks[c],{get:function(a){var d=a.getAttribute(c,2);return d===null?b:d}})}),f.support.style||(f.attrHooks.style={get:function(a){return a.style.cssText.toLowerCase()||b},set:function(a,b){return a.style.cssText=""+b}}),f.support.optSelected||(f.propHooks.selected=f.extend(f.propHooks.selected,{get:function(a){var b=a.parentNode;b&&(b.selectedIndex,b.parentNode&&b.parentNode.selectedIndex);return null}})),f.support.enctype||(f.propFix.enctype="encoding"),f.support.checkOn||f.each(["radio","checkbox"],function(){f.valHooks[this]={get:function(a){return a.getAttribute("value")===null?"on":a.value}}}),f.each(["radio","checkbox"],function(){f.valHooks[this]=f.extend(f.valHooks[this],{set:function(a,b){if(f.isArray(b))return a.checked=f.inArray(f(a).val(),b)>=0}})});var z=/^(?:textarea|input|select)$/i,A=/^([^\.]*)?(?:\.(.+))?$/,B=/\bhover(\.\S+)?\b/,C=/^key/,D=/^(?:mouse|contextmenu)|click/,E=/^(?:focusinfocus|focusoutblur)$/,F=/^(\w*)(?:#([\w\-]+))?(?:\.([\w\-]+))?$/,G=function(a){var b=F.exec(a);b&&(b[1]=(b[1]||"").toLowerCase(),b[3]=b[3]&&new RegExp("(?:^|\\s)"+b[3]+"(?:\\s|$)"));return b},H=function(a,b){var c=a.attributes||{};return(!b[1]||a.nodeName.toLowerCase()===b[1])&&(!b[2]||(c.id||{}).value===b[2])&&(!b[3]||b[3].test((c["class"]||{}).value))},I=function(a){return f.event.special.hover?a:a.replace(B,"mouseenter$1 mouseleave$1")};
f.event={add:function(a,c,d,e,g){var h,i,j,k,l,m,n,o,p,q,r,s;if(!(a.nodeType===3||a.nodeType===8||!c||!d||!(h=f._data(a)))){d.handler&&(p=d,d=p.handler),d.guid||(d.guid=f.guid++),j=h.events,j||(h.events=j={}),i=h.handle,i||(h.handle=i=function(a){return typeof f!="undefined"&&(!a||f.event.triggered!==a.type)?f.event.dispatch.apply(i.elem,arguments):b},i.elem=a),c=f.trim(I(c)).split(" ");for(k=0;k<c.length;k++){l=A.exec(c[k])||[],m=l[1],n=(l[2]||"").split(".").sort(),s=f.event.special[m]||{},m=(g?s.delegateType:s.bindType)||m,s=f.event.special[m]||{},o=f.extend({type:m,origType:l[1],data:e,handler:d,guid:d.guid,selector:g,quick:G(g),namespace:n.join(".")},p),r=j[m];if(!r){r=j[m]=[],r.delegateCount=0;if(!s.setup||s.setup.call(a,e,n,i)===!1)a.addEventListener?a.addEventListener(m,i,!1):a.attachEvent&&a.attachEvent("on"+m,i)}s.add&&(s.add.call(a,o),o.handler.guid||(o.handler.guid=d.guid)),g?r.splice(r.delegateCount++,0,o):r.push(o),f.event.global[m]=!0}a=null}},global:{},remove:function(a,b,c,d,e){var g=f.hasData(a)&&f._data(a),h,i,j,k,l,m,n,o,p,q,r,s;if(!!g&&!!(o=g.events)){b=f.trim(I(b||"")).split(" ");for(h=0;h<b.length;h++){i=A.exec(b[h])||[],j=k=i[1],l=i[2];if(!j){for(j in o)f.event.remove(a,j+b[h],c,d,!0);continue}p=f.event.special[j]||{},j=(d?p.delegateType:p.bindType)||j,r=o[j]||[],m=r.length,l=l?new RegExp("(^|\\.)"+l.split(".").sort().join("\\.(?:.*\\.)?")+"(\\.|$)"):null;for(n=0;n<r.length;n++)s=r[n],(e||k===s.origType)&&(!c||c.guid===s.guid)&&(!l||l.test(s.namespace))&&(!d||d===s.selector||d==="**"&&s.selector)&&(r.splice(n--,1),s.selector&&r.delegateCount--,p.remove&&p.remove.call(a,s));r.length===0&&m!==r.length&&((!p.teardown||p.teardown.call(a,l)===!1)&&f.removeEvent(a,j,g.handle),delete o[j])}f.isEmptyObject(o)&&(q=g.handle,q&&(q.elem=null),f.removeData(a,["events","handle"],!0))}},customEvent:{getData:!0,setData:!0,changeData:!0},trigger:function(c,d,e,g){if(!e||e.nodeType!==3&&e.nodeType!==8){var h=c.type||c,i=[],j,k,l,m,n,o,p,q,r,s;if(E.test(h+f.event.triggered))return;h.indexOf("!")>=0&&(h=h.slice(0,-1),k=!0),h.indexOf(".")>=0&&(i=h.split("."),h=i.shift(),i.sort());if((!e||f.event.customEvent[h])&&!f.event.global[h])return;c=typeof c=="object"?c[f.expando]?c:new f.Event(h,c):new f.Event(h),c.type=h,c.isTrigger=!0,c.exclusive=k,c.namespace=i.join("."),c.namespace_re=c.namespace?new RegExp("(^|\\.)"+i.join("\\.(?:.*\\.)?")+"(\\.|$)"):null,o=h.indexOf(":")<0?"on"+h:"";if(!e){j=f.cache;for(l in j)j[l].events&&j[l].events[h]&&f.event.trigger(c,d,j[l].handle.elem,!0);return}c.result=b,c.target||(c.target=e),d=d!=null?f.makeArray(d):[],d.unshift(c),p=f.event.special[h]||{};if(p.trigger&&p.trigger.apply(e,d)===!1)return;r=[[e,p.bindType||h]];if(!g&&!p.noBubble&&!f.isWindow(e)){s=p.delegateType||h,m=E.test(s+h)?e:e.parentNode,n=null;for(;m;m=m.parentNode)r.push([m,s]),n=m;n&&n===e.ownerDocument&&r.push([n.defaultView||n.parentWindow||a,s])}for(l=0;l<r.length&&!c.isPropagationStopped();l++)m=r[l][0],c.type=r[l][1],q=(f._data(m,"events")||{})[c.type]&&f._data(m,"handle"),q&&q.apply(m,d),q=o&&m[o],q&&f.acceptData(m)&&q.apply(m,d)===!1&&c.preventDefault();c.type=h,!g&&!c.isDefaultPrevented()&&(!p._default||p._default.apply(e.ownerDocument,d)===!1)&&(h!=="click"||!f.nodeName(e,"a"))&&f.acceptData(e)&&o&&e[h]&&(h!=="focus"&&h!=="blur"||c.target.offsetWidth!==0)&&!f.isWindow(e)&&(n=e[o],n&&(e[o]=null),f.event.triggered=h,e[h](),f.event.triggered=b,n&&(e[o]=n));return c.result}},dispatch:function(c){c=f.event.fix(c||a.event);var d=(f._data(this,"events")||{})[c.type]||[],e=d.delegateCount,g=[].slice.call(arguments,0),h=!c.exclusive&&!c.namespace,i=[],j,k,l,m,n,o,p,q,r,s,t;g[0]=c,c.delegateTarget=this;if(e&&!c.target.disabled&&(!c.button||c.type!=="click")){m=f(this),m.context=this.ownerDocument||this;for(l=c.target;l!=this;l=l.parentNode||this){o={},q=[],m[0]=l;for(j=0;j<e;j++)r=d[j],s=r.selector,o[s]===b&&(o[s]=r.quick?H(l,r.quick):m.is(s)),o[s]&&q.push(r);q.length&&i.push({elem:l,matches:q})}}d.length>e&&i.push({elem:this,matches:d.slice(e)});for(j=0;j<i.length&&!c.isPropagationStopped();j++){p=i[j],c.currentTarget=p.elem;for(k=0;k<p.matches.length&&!c.isImmediatePropagationStopped();k++){r=p.matches[k];if(h||!c.namespace&&!r.namespace||c.namespace_re&&c.namespace_re.test(r.namespace))c.data=r.data,c.handleObj=r,n=((f.event.special[r.origType]||{}).handle||r.handler).apply(p.elem,g),n!==b&&(c.result=n,n===!1&&(c.preventDefault(),c.stopPropagation()))}}return c.result},props:"attrChange attrName relatedNode srcElement altKey bubbles cancelable ctrlKey currentTarget eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){a.which==null&&(a.which=b.charCode!=null?b.charCode:b.keyCode);return a}},mouseHooks:{props:"button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(a,d){var e,f,g,h=d.button,i=d.fromElement;a.pageX==null&&d.clientX!=null&&(e=a.target.ownerDocument||c,f=e.documentElement,g=e.body,a.pageX=d.clientX+(f&&f.scrollLeft||g&&g.scrollLeft||0)-(f&&f.clientLeft||g&&g.clientLeft||0),a.pageY=d.clientY+(f&&f.scrollTop||g&&g.scrollTop||0)-(f&&f.clientTop||g&&g.clientTop||0)),!a.relatedTarget&&i&&(a.relatedTarget=i===a.target?d.toElement:i),!a.which&&h!==b&&(a.which=h&1?1:h&2?3:h&4?2:0);return a}},fix:function(a){if(a[f.expando])return a;var d,e,g=a,h=f.event.fixHooks[a.type]||{},i=h.props?this.props.concat(h.props):this.props;a=f.Event(g);for(d=i.length;d;)e=i[--d],a[e]=g[e];a.target||(a.target=g.srcElement||c),a.target.nodeType===3&&(a.target=a.target.parentNode),a.metaKey===b&&(a.metaKey=a.ctrlKey);return h.filter?h.filter(a,g):a},special:{ready:{setup:f.bindReady},load:{noBubble:!0},focus:{delegateType:"focusin"},blur:{delegateType:"focusout"},beforeunload:{setup:function(a,b,c){f.isWindow(this)&&(this.onbeforeunload=c)},teardown:function(a,b){this.onbeforeunload===b&&(this.onbeforeunload=null)}}},simulate:function(a,b,c,d){var e=f.extend(new f.Event,c,{type:a,isSimulated:!0,originalEvent:{}});d?f.event.trigger(e,null,b):f.event.dispatch.call(b,e),e.isDefaultPrevented()&&c.preventDefault()}},f.event.handle=f.event.dispatch,f.removeEvent=c.removeEventListener?function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c,!1)}:function(a,b,c){a.detachEvent&&a.detachEvent("on"+b,c)},f.Event=function(a,b){if(!(this instanceof f.Event))return new f.Event(a,b);a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||a.returnValue===!1||a.getPreventDefault&&a.getPreventDefault()?K:J):this.type=a,b&&f.extend(this,b),this.timeStamp=a&&a.timeStamp||f.now(),this[f.expando]=!0},f.Event.prototype={preventDefault:function(){this.isDefaultPrevented=K;var a=this.originalEvent;!a||(a.preventDefault?a.preventDefault():a.returnValue=!1)},stopPropagation:function(){this.isPropagationStopped=K;var a=this.originalEvent;!a||(a.stopPropagation&&a.stopPropagation(),a.cancelBubble=!0)},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=K,this.stopPropagation()},isDefaultPrevented:J,isPropagationStopped:J,isImmediatePropagationStopped:J},f.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(a,b){f.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c=this,d=a.relatedTarget,e=a.handleObj,g=e.selector,h;if(!d||d!==c&&!f.contains(c,d))a.type=e.origType,h=e.handler.apply(this,arguments),a.type=b;return h}}}),f.support.submitBubbles||(f.event.special.submit={setup:function(){if(f.nodeName(this,"form"))return!1;f.event.add(this,"click._submit keypress._submit",function(a){var c=a.target,d=f.nodeName(c,"input")||f.nodeName(c,"button")?c.form:b;d&&!d._submit_attached&&(f.event.add(d,"submit._submit",function(a){this.parentNode&&!a.isTrigger&&f.event.simulate("submit",this.parentNode,a,!0)}),d._submit_attached=!0)})},teardown:function(){if(f.nodeName(this,"form"))return!1;f.event.remove(this,"._submit")}}),f.support.changeBubbles||(f.event.special.change={setup:function(){if(z.test(this.nodeName)){if(this.type==="checkbox"||this.type==="radio")f.event.add(this,"propertychange._change",function(a){a.originalEvent.propertyName==="checked"&&(this._just_changed=!0)}),f.event.add(this,"click._change",function(a){this._just_changed&&!a.isTrigger&&(this._just_changed=!1,f.event.simulate("change",this,a,!0))});return!1}f.event.add(this,"beforeactivate._change",function(a){var b=a.target;z.test(b.nodeName)&&!b._change_attached&&(f.event.add(b,"change._change",function(a){this.parentNode&&!a.isSimulated&&!a.isTrigger&&f.event.simulate("change",this.parentNode,a,!0)}),b._change_attached=!0)})},handle:function(a){var b=a.target;if(this!==b||a.isSimulated||a.isTrigger||b.type!=="radio"&&b.type!=="checkbox")return a.handleObj.handler.apply(this,arguments)},teardown:function(){f.event.remove(this,"._change");return z.test(this.nodeName)}}),f.support.focusinBubbles||f.each({focus:"focusin",blur:"focusout"},function(a,b){var d=0,e=function(a){f.event.simulate(b,a.target,f.event.fix(a),!0)};f.event.special[b]={setup:function(){d++===0&&c.addEventListener(a,e,!0)},teardown:function(){--d===0&&c.removeEventListener(a,e,!0)}}}),f.fn.extend({on:function(a,c,d,e,g){var h,i;if(typeof a=="object"){typeof c!="string"&&(d=c,c=b);for(i in a)this.on(i,c,d,a[i],g);return this}d==null&&e==null?(e=c,d=c=b):e==null&&(typeof c=="string"?(e=d,d=b):(e=d,d=c,c=b));if(e===!1)e=J;else if(!e)return this;g===1&&(h=e,e=function(a){f().off(a);return h.apply(this,arguments)},e.guid=h.guid||(h.guid=f.guid++));return this.each(function(){f.event.add(this,a,e,d,c)})},one:function(a,b,c,d){return this.on.call(this,a,b,c,d,1)},off:function(a,c,d){if(a&&a.preventDefault&&a.handleObj){var e=a.handleObj;f(a.delegateTarget).off(e.namespace?e.type+"."+e.namespace:e.type,e.selector,e.handler);return this}if(typeof a=="object"){for(var g in a)this.off(g,c,a[g]);return this}if(c===!1||typeof c=="function")d=c,c=b;d===!1&&(d=J);return this.each(function(){f.event.remove(this,a,d,c)})},bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},live:function(a,b,c){f(this.context).on(a,this.selector,b,c);return this},die:function(a,b){f(this.context).off(a,this.selector||"**",b);return this},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return arguments.length==1?this.off(a,"**"):this.off(b,a,c)},trigger:function(a,b){return this.each(function(){f.event.trigger(a,b,this)})},triggerHandler:function(a,b){if(this[0])return f.event.trigger(a,b,this[0],!0)},toggle:function(a){var b=arguments,c=a.guid||f.guid++,d=0,e=function(c){var e=(f._data(this,"lastToggle"+a.guid)||0)%d;f._data(this,"lastToggle"+a.guid,e+1),c.preventDefault();return b[e].apply(this,arguments)||!1};e.guid=c;while(d<b.length)b[d++].guid=c;return this.click(e)},hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}}),f.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "),function(a,b){f.fn[b]=function(a,c){c==null&&(c=a,a=null);return arguments.length>0?this.on(b,null,a,c):this.trigger(b)},f.attrFn&&(f.attrFn[b]=!0),C.test(b)&&(f.event.fixHooks[b]=f.event.keyHooks),D.test(b)&&(f.event.fixHooks[b]=f.event.mouseHooks)}),function(){function x(a,b,c,e,f,g){for(var h=0,i=e.length;h<i;h++){var j=e[h];if(j){var k=!1;j=j[a];while(j){if(j[d]===c){k=e[j.sizset];break}if(j.nodeType===1){g||(j[d]=c,j.sizset=h);if(typeof b!="string"){if(j===b){k=!0;break}}else if(m.filter(b,[j]).length>0){k=j;break}}j=j[a]}e[h]=k}}}function w(a,b,c,e,f,g){for(var h=0,i=e.length;h<i;h++){var j=e[h];if(j){var k=!1;j=j[a];while(j){if(j[d]===c){k=e[j.sizset];break}j.nodeType===1&&!g&&(j[d]=c,j.sizset=h);if(j.nodeName.toLowerCase()===b){k=j;break}j=j[a]}e[h]=k}}}var a=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,d="sizcache"+(Math.random()+"").replace(".",""),e=0,g=Object.prototype.toString,h=!1,i=!0,j=/\\/g,k=/\r\n/g,l=/\W/;[0,0].sort(function(){i=!1;return 0});var m=function(b,d,e,f){e=e||[],d=d||c;var h=d;if(d.nodeType!==1&&d.nodeType!==9)return[];if(!b||typeof b!="string")return e;var i,j,k,l,n,q,r,t,u=!0,v=m.isXML(d),w=[],x=b;do{a.exec(""),i=a.exec(x);if(i){x=i[3],w.push(i[1]);if(i[2]){l=i[3];break}}}while(i);if(w.length>1&&p.exec(b))if(w.length===2&&o.relative[w[0]])j=y(w[0]+w[1],d,f);else{j=o.relative[w[0]]?[d]:m(w.shift(),d);while(w.length)b=w.shift(),o.relative[b]&&(b+=w.shift()),j=y(b,j,f)}else{!f&&w.length>1&&d.nodeType===9&&!v&&o.match.ID.test(w[0])&&!o.match.ID.test(w[w.length-1])&&(n=m.find(w.shift(),d,v),d=n.expr?m.filter(n.expr,n.set)[0]:n.set[0]);if(d){n=f?{expr:w.pop(),set:s(f)}:m.find(w.pop(),w.length===1&&(w[0]==="~"||w[0]==="+")&&d.parentNode?d.parentNode:d,v),j=n.expr?m.filter(n.expr,n.set):n.set,w.length>0?k=s(j):u=!1;while(w.length)q=w.pop(),r=q,o.relative[q]?r=w.pop():q="",r==null&&(r=d),o.relative[q](k,r,v)}else k=w=[]}k||(k=j),k||m.error(q||b);if(g.call(k)==="[object Array]")if(!u)e.push.apply(e,k);else if(d&&d.nodeType===1)for(t=0;k[t]!=null;t++)k[t]&&(k[t]===!0||k[t].nodeType===1&&m.contains(d,k[t]))&&e.push(j[t]);else for(t=0;k[t]!=null;t++)k[t]&&k[t].nodeType===1&&e.push(j[t]);else s(k,e);l&&(m(l,h,e,f),m.uniqueSort(e));return e};m.uniqueSort=function(a){if(u){h=i,a.sort(u);if(h)for(var b=1;b<a.length;b++)a[b]===a[b-1]&&a.splice(b--,1)}return a},m.matches=function(a,b){return m(a,null,null,b)},m.matchesSelector=function(a,b){return m(b,null,null,[a]).length>0},m.find=function(a,b,c){var d,e,f,g,h,i;if(!a)return[];for(e=0,f=o.order.length;e<f;e++){h=o.order[e];if(g=o.leftMatch[h].exec(a)){i=g[1],g.splice(1,1);if(i.substr(i.length-1)!=="\\"){g[1]=(g[1]||"").replace(j,""),d=o.find[h](g,b,c);if(d!=null){a=a.replace(o.match[h],"");break}}}}d||(d=typeof b.getElementsByTagName!="undefined"?b.getElementsByTagName("*"):[]);return{set:d,expr:a}},m.filter=function(a,c,d,e){var f,g,h,i,j,k,l,n,p,q=a,r=[],s=c,t=c&&c[0]&&m.isXML(c[0]);while(a&&c.length){for(h in o.filter)if((f=o.leftMatch[h].exec(a))!=null&&f[2]){k=o.filter[h],l=f[1],g=!1,f.splice(1,1);if(l.substr(l.length-1)==="\\")continue;s===r&&(r=[]);if(o.preFilter[h]){f=o.preFilter[h](f,s,d,r,e,t);if(!f)g=i=!0;else if(f===!0)continue}if(f)for(n=0;(j=s[n])!=null;n++)j&&(i=k(j,f,n,s),p=e^i,d&&i!=null?p?g=!0:s[n]=!1:p&&(r.push(j),g=!0));if(i!==b){d||(s=r),a=a.replace(o.match[h],"");if(!g)return[];break}}if(a===q)if(g==null)m.error(a);else break;q=a}return s},m.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)};var n=m.getText=function(a){var b,c,d=a.nodeType,e="";if(d){if(d===1||d===9){if(typeof a.textContent=="string")return a.textContent;if(typeof a.innerText=="string")return a.innerText.replace(k,"");for(a=a.firstChild;a;a=a.nextSibling)e+=n(a)}else if(d===3||d===4)return a.nodeValue}else for(b=0;c=a[b];b++)c.nodeType!==8&&(e+=n(c));return e},o=m.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,CLASS:/\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(?:(['"])(.*?)\3|(#?(?:[\w\u00c0-\uFFFF\-]|\\.)*)|)|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\(\s*(even|odd|(?:[+\-]?\d+|(?:[+\-]?\d*)?n\s*(?:[+\-]\s*\d+)?))\s*\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(a){return a.getAttribute("href")},type:function(a){return a.getAttribute("type")}},relative:{"+":function(a,b){var c=typeof b=="string",d=c&&!l.test(b),e=c&&!d;d&&(b=b.toLowerCase());for(var f=0,g=a.length,h;f<g;f++)if(h=a[f]){while((h=h.previousSibling)&&h.nodeType!==1);a[f]=e||h&&h.nodeName.toLowerCase()===b?h||!1:h===b}e&&m.filter(b,a,!0)},">":function(a,b){var c,d=typeof b=="string",e=0,f=a.length;if(d&&!l.test(b)){b=b.toLowerCase();for(;e<f;e++){c=a[e];if(c){var g=c.parentNode;a[e]=g.nodeName.toLowerCase()===b?g:!1}}}else{for(;e<f;e++)c=a[e],c&&(a[e]=d?c.parentNode:c.parentNode===b);d&&m.filter(b,a,!0)}},"":function(a,b,c){var d,f=e++,g=x;typeof b=="string"&&!l.test(b)&&(b=b.toLowerCase(),d=b,g=w),g("parentNode",b,f,a,d,c)},"~":function(a,b,c){var d,f=e++,g=x;typeof b=="string"&&!l.test(b)&&(b=b.toLowerCase(),d=b,g=w),g("previousSibling",b,f,a,d,c)}},find:{ID:function(a,b,c){if(typeof b.getElementById!="undefined"&&!c){var d=b.getElementById(a[1]);return d&&d.parentNode?[d]:[]}},NAME:function(a,b){if(typeof b.getElementsByName!="undefined"){var c=[],d=b.getElementsByName(a[1]);for(var e=0,f=d.length;e<f;e++)d[e].getAttribute("name")===a[1]&&c.push(d[e]);return c.length===0?null:c}},TAG:function(a,b){if(typeof b.getElementsByTagName!="undefined")return b.getElementsByTagName(a[1])}},preFilter:{CLASS:function(a,b,c,d,e,f){a=" "+a[1].replace(j,"")+" ";if(f)return a;for(var g=0,h;(h=b[g])!=null;g++)h&&(e^(h.className&&(" "+h.className+" ").replace(/[\t\n\r]/g," ").indexOf(a)>=0)?c||d.push(h):c&&(b[g]=!1));return!1},ID:function(a){return a[1].replace(j,"")},TAG:function(a,b){return a[1].replace(j,"").toLowerCase()},CHILD:function(a){if(a[1]==="nth"){a[2]||m.error(a[0]),a[2]=a[2].replace(/^\+|\s*/g,"");var b=/(-?)(\d*)(?:n([+\-]?\d*))?/.exec(a[2]==="even"&&"2n"||a[2]==="odd"&&"2n+1"||!/\D/.test(a[2])&&"0n+"+a[2]||a[2]);a[2]=b[1]+(b[2]||1)-0,a[3]=b[3]-0}else a[2]&&m.error(a[0]);a[0]=e++;return a},ATTR:function(a,b,c,d,e,f){var g=a[1]=a[1].replace(j,"");!f&&o.attrMap[g]&&(a[1]=o.attrMap[g]),a[4]=(a[4]||a[5]||"").replace(j,""),a[2]==="~="&&(a[4]=" "+a[4]+" ");return a},PSEUDO:function(b,c,d,e,f){if(b[1]==="not")if((a.exec(b[3])||"").length>1||/^\w/.test(b[3]))b[3]=m(b[3],null,null,c);else{var g=m.filter(b[3],c,d,!0^f);d||e.push.apply(e,g);return!1}else if(o.match.POS.test(b[0])||o.match.CHILD.test(b[0]))return!0;return b},POS:function(a){a.unshift(!0);return a}},filters:{enabled:function(a){return a.disabled===!1&&a.type!=="hidden"},disabled:function(a){return a.disabled===!0},checked:function(a){return a.checked===!0},selected:function(a){a.parentNode&&a.parentNode.selectedIndex;return a.selected===!0},parent:function(a){return!!a.firstChild},empty:function(a){return!a.firstChild},has:function(a,b,c){return!!m(c[3],a).length},header:function(a){return/h\d/i.test(a.nodeName)},text:function(a){var b=a.getAttribute("type"),c=a.type;return a.nodeName.toLowerCase()==="input"&&"text"===c&&(b===c||b===null)},radio:function(a){return a.nodeName.toLowerCase()==="input"&&"radio"===a.type},checkbox:function(a){return a.nodeName.toLowerCase()==="input"&&"checkbox"===a.type},file:function(a){return a.nodeName.toLowerCase()==="input"&&"file"===a.type},password:function(a){return a.nodeName.toLowerCase()==="input"&&"password"===a.type},submit:function(a){var b=a.nodeName.toLowerCase();return(b==="input"||b==="button")&&"submit"===a.type},image:function(a){return a.nodeName.toLowerCase()==="input"&&"image"===a.type},reset:function(a){var b=a.nodeName.toLowerCase();return(b==="input"||b==="button")&&"reset"===a.type},button:function(a){var b=a.nodeName.toLowerCase();return b==="input"&&"button"===a.type||b==="button"},input:function(a){return/input|select|textarea|button/i.test(a.nodeName)},focus:function(a){return a===a.ownerDocument.activeElement}},setFilters:{first:function(a,b){return b===0},last:function(a,b,c,d){return b===d.length-1},even:function(a,b){return b%2===0},odd:function(a,b){return b%2===1},lt:function(a,b,c){return b<c[3]-0},gt:function(a,b,c){return b>c[3]-0},nth:function(a,b,c){return c[3]-0===b},eq:function(a,b,c){return c[3]-0===b}},filter:{PSEUDO:function(a,b,c,d){var e=b[1],f=o.filters[e];if(f)return f(a,c,b,d);if(e==="contains")return(a.textContent||a.innerText||n([a])||"").indexOf(b[3])>=0;if(e==="not"){var g=b[3];for(var h=0,i=g.length;h<i;h++)if(g[h]===a)return!1;return!0}m.error(e)},CHILD:function(a,b){var c,e,f,g,h,i,j,k=b[1],l=a;switch(k){case"only":case"first":while(l=l.previousSibling)if(l.nodeType===1)return!1;if(k==="first")return!0;l=a;case"last":while(l=l.nextSibling)if(l.nodeType===1)return!1;return!0;case"nth":c=b[2],e=b[3];if(c===1&&e===0)return!0;f=b[0],g=a.parentNode;if(g&&(g[d]!==f||!a.nodeIndex)){i=0;for(l=g.firstChild;l;l=l.nextSibling)l.nodeType===1&&(l.nodeIndex=++i);g[d]=f}j=a.nodeIndex-e;return c===0?j===0:j%c===0&&j/c>=0}},ID:function(a,b){return a.nodeType===1&&a.getAttribute("id")===b},TAG:function(a,b){return b==="*"&&a.nodeType===1||!!a.nodeName&&a.nodeName.toLowerCase()===b},CLASS:function(a,b){return(" "+(a.className||a.getAttribute("class"))+" ").indexOf(b)>-1},ATTR:function(a,b){var c=b[1],d=m.attr?m.attr(a,c):o.attrHandle[c]?o.attrHandle[c](a):a[c]!=null?a[c]:a.getAttribute(c),e=d+"",f=b[2],g=b[4];return d==null?f==="!=":!f&&m.attr?d!=null:f==="="?e===g:f==="*="?e.indexOf(g)>=0:f==="~="?(" "+e+" ").indexOf(g)>=0:g?f==="!="?e!==g:f==="^="?e.indexOf(g)===0:f==="$="?e.substr(e.length-g.length)===g:f==="|="?e===g||e.substr(0,g.length+1)===g+"-":!1:e&&d!==!1},POS:function(a,b,c,d){var e=b[2],f=o.setFilters[e];if(f)return f(a,c,b,d)}}},p=o.match.POS,q=function(a,b){return"\\"+(b-0+1)};for(var r in o.match)o.match[r]=new RegExp(o.match[r].source+/(?![^\[]*\])(?![^\(]*\))/.source),o.leftMatch[r]=new RegExp(/(^(?:.|\r|\n)*?)/.source+o.match[r].source.replace(/\\(\d+)/g,q));var s=function(a,b){a=Array.prototype.slice.call(a,0);if(b){b.push.apply(b,a);return b}return a};try{Array.prototype.slice.call(c.documentElement.childNodes,0)[0].nodeType}catch(t){s=function(a,b){var c=0,d=b||[];if(g.call(a)==="[object Array]")Array.prototype.push.apply(d,a);else if(typeof a.length=="number")for(var e=a.length;c<e;c++)d.push(a[c]);else for(;a[c];c++)d.push(a[c]);return d}}var u,v;c.documentElement.compareDocumentPosition?u=function(a,b){if(a===b){h=!0;return 0}if(!a.compareDocumentPosition||!b.compareDocumentPosition)return a.compareDocumentPosition?-1:1;return a.compareDocumentPosition(b)&4?-1:1}:(u=function(a,b){if(a===b){h=!0;return 0}if(a.sourceIndex&&b.sourceIndex)return a.sourceIndex-b.sourceIndex;var c,d,e=[],f=[],g=a.parentNode,i=b.parentNode,j=g;if(g===i)return v(a,b);if(!g)return-1;if(!i)return 1;while(j)e.unshift(j),j=j.parentNode;j=i;while(j)f.unshift(j),j=j.parentNode;c=e.length,d=f.length;for(var k=0;k<c&&k<d;k++)if(e[k]!==f[k])return v(e[k],f[k]);return k===c?v(a,f[k],-1):v(e[k],b,1)},v=function(a,b,c){if(a===b)return c;var d=a.nextSibling;while(d){if(d===b)return-1;d=d.nextSibling}return 1}),function(){var a=c.createElement("div"),d="script"+(new Date).getTime(),e=c.documentElement;a.innerHTML="<a name='"+d+"'/>",e.insertBefore(a,e.firstChild),c.getElementById(d)&&(o.find.ID=function(a,c,d){if(typeof c.getElementById!="undefined"&&!d){var e=c.getElementById(a[1]);return e?e.id===a[1]||typeof e.getAttributeNode!="undefined"&&e.getAttributeNode("id").nodeValue===a[1]?[e]:b:[]}},o.filter.ID=function(a,b){var c=typeof a.getAttributeNode!="undefined"&&a.getAttributeNode("id");return a.nodeType===1&&c&&c.nodeValue===b}),e.removeChild(a),e=a=null}(),function(){var a=c.createElement("div");a.appendChild(c.createComment("")),a.getElementsByTagName("*").length>0&&(o.find.TAG=function(a,b){var c=b.getElementsByTagName(a[1]);if(a[1]==="*"){var d=[];for(var e=0;c[e];e++)c[e].nodeType===1&&d.push(c[e]);c=d}return c}),a.innerHTML="<a href='#'></a>",a.firstChild&&typeof a.firstChild.getAttribute!="undefined"&&a.firstChild.getAttribute("href")!=="#"&&(o.attrHandle.href=function(a){return a.getAttribute("href",2)}),a=null}(),c.querySelectorAll&&function(){var a=m,b=c.createElement("div"),d="__sizzle__";b.innerHTML="<p class='TEST'></p>";if(!b.querySelectorAll||b.querySelectorAll(".TEST").length!==0){m=function(b,e,f,g){e=e||c;if(!g&&!m.isXML(e)){var h=/^(\w+$)|^\.([\w\-]+$)|^#([\w\-]+$)/.exec(b);if(h&&(e.nodeType===1||e.nodeType===9)){if(h[1])return s(e.getElementsByTagName(b),f);if(h[2]&&o.find.CLASS&&e.getElementsByClassName)return s(e.getElementsByClassName(h[2]),f)}if(e.nodeType===9){if(b==="body"&&e.body)return s([e.body],f);if(h&&h[3]){var i=e.getElementById(h[3]);if(!i||!i.parentNode)return s([],f);if(i.id===h[3])return s([i],f)}try{return s(e.querySelectorAll(b),f)}catch(j){}}else if(e.nodeType===1&&e.nodeName.toLowerCase()!=="object"){var k=e,l=e.getAttribute("id"),n=l||d,p=e.parentNode,q=/^\s*[+~]/.test(b);l?n=n.replace(/'/g,"\\$&"):e.setAttribute("id",n),q&&p&&(e=e.parentNode);try{if(!q||p)return s(e.querySelectorAll("[id='"+n+"'] "+b),f)}catch(r){}finally{l||k.removeAttribute("id")}}}return a(b,e,f,g)};for(var e in a)m[e]=a[e];b=null}}(),function(){var a=c.documentElement,b=a.matchesSelector||a.mozMatchesSelector||a.webkitMatchesSelector||a.msMatchesSelector;if(b){var d=!b.call(c.createElement("div"),"div"),e=!1;try{b.call(c.documentElement,"[test!='']:sizzle")}catch(f){e=!0}m.matchesSelector=function(a,c){c=c.replace(/\=\s*([^'"\]]*)\s*\]/g,"='$1']");if(!m.isXML(a))try{if(e||!o.match.PSEUDO.test(c)&&!/!=/.test(c)){var f=b.call(a,c);if(f||!d||a.document&&a.document.nodeType!==11)return f}}catch(g){}return m(c,null,null,[a]).length>0}}}(),function(){var a=c.createElement("div");a.innerHTML="<div class='test e'></div><div class='test'></div>";if(!!a.getElementsByClassName&&a.getElementsByClassName("e").length!==0){a.lastChild.className="e";if(a.getElementsByClassName("e").length===1)return;o.order.splice(1,0,"CLASS"),o.find.CLASS=function(a,b,c){if(typeof b.getElementsByClassName!="undefined"&&!c)return b.getElementsByClassName(a[1])},a=null}}(),c.documentElement.contains?m.contains=function(a,b){return a!==b&&(a.contains?a.contains(b):!0)}:c.documentElement.compareDocumentPosition?m.contains=function(a,b){return!!(a.compareDocumentPosition(b)&16)}:m.contains=function(){return!1},m.isXML=function(a){var b=(a?a.ownerDocument||a:0).documentElement;return b?b.nodeName!=="HTML":!1};var y=function(a,b,c){var d,e=[],f="",g=b.nodeType?[b]:b;while(d=o.match.PSEUDO.exec(a))f+=d[0],a=a.replace(o.match.PSEUDO,"");a=o.relative[a]?a+"*":a;for(var h=0,i=g.length;h<i;h++)m(a,g[h],e,c);return m.filter(f,e)};m.attr=f.attr,m.selectors.attrMap={},f.find=m,f.expr=m.selectors,f.expr[":"]=f.expr.filters,f.unique=m.uniqueSort,f.text=m.getText,f.isXMLDoc=m.isXML,f.contains=m.contains}();var L=/Until$/,M=/^(?:parents|prevUntil|prevAll)/,N=/,/,O=/^.[^:#\[\.,]*$/,P=Array.prototype.slice,Q=f.expr.match.POS,R={children:!0,contents:!0,next:!0,prev:!0};f.fn.extend({find:function(a){var b=this,c,d;if(typeof a!="string")return f(a).filter(function(){for(c=0,d=b.length;c<d;c++)if(f.contains(b[c],this))return!0});var e=this.pushStack("","find",a),g,h,i;for(c=0,d=this.length;c<d;c++){g=e.length,f.find(a,this[c],e);if(c>0)for(h=g;h<e.length;h++)for(i=0;i<g;i++)if(e[i]===e[h]){e.splice(h--,1);break}}return e},has:function(a){var b=f(a);return this.filter(function(){for(var a=0,c=b.length;a<c;a++)if(f.contains(this,b[a]))return!0})},not:function(a){return this.pushStack(T(this,a,!1),"not",a)},filter:function(a){return this.pushStack(T(this,a,!0),"filter",a)},is:function(a){return!!a&&(typeof a=="string"?Q.test(a)?f(a,this.context).index(this[0])>=0:f.filter(a,this).length>0:this.filter(a).length>0)},closest:function(a,b){var c=[],d,e,g=this[0];if(f.isArray(a)){var h=1;while(g&&g.ownerDocument&&g!==b){for(d=0;d<a.length;d++)f(g).is(a[d])&&c.push({selector:a[d],elem:g,level:h});g=g.parentNode,h++}return c}var i=Q.test(a)||typeof a!="string"?f(a,b||this.context):0;for(d=0,e=this.length;d<e;d++){g=this[d];while(g){if(i?i.index(g)>-1:f.find.matchesSelector(g,a)){c.push(g);break}g=g.parentNode;if(!g||!g.ownerDocument||g===b||g.nodeType===11)break}}c=c.length>1?f.unique(c):c;return this.pushStack(c,"closest",a)},index:function(a){if(!a)return this[0]&&this[0].parentNode?this.prevAll().length:-1;if(typeof a=="string")return f.inArray(this[0],f(a));return f.inArray(a.jquery?a[0]:a,this)},add:function(a,b){var c=typeof a=="string"?f(a,b):f.makeArray(a&&a.nodeType?[a]:a),d=f.merge(this.get(),c);return this.pushStack(S(c[0])||S(d[0])?d:f.unique(d))},andSelf:function(){return this.add(this.prevObject)}}),f.each({parent:function(a){var b=a.parentNode;return b&&b.nodeType!==11?b:null},parents:function(a){return f.dir(a,"parentNode")},parentsUntil:function(a,b,c){return f.dir(a,"parentNode",c)},next:function(a){return f.nth(a,2,"nextSibling")},prev:function(a){return f.nth(a,2,"previousSibling")},nextAll:function(a){return f.dir(a,"nextSibling")},prevAll:function(a){return f.dir(a,"previousSibling")},nextUntil:function(a,b,c){return f.dir(a,"nextSibling",c)},prevUntil:function(a,b,c){return f.dir(a,"previousSibling",c)},siblings:function(a){return f.sibling(a.parentNode.firstChild,a)},children:function(a){return f.sibling(a.firstChild)},contents:function(a){return f.nodeName(a,"iframe")?a.contentDocument||a.contentWindow.document:f.makeArray(a.childNodes)}},function(a,b){f.fn[a]=function(c,d){var e=f.map(this,b,c);L.test(a)||(d=c),d&&typeof d=="string"&&(e=f.filter(d,e)),e=this.length>1&&!R[a]?f.unique(e):e,(this.length>1||N.test(d))&&M.test(a)&&(e=e.reverse());return this.pushStack(e,a,P.call(arguments).join(","))}}),f.extend({filter:function(a,b,c){c&&(a=":not("+a+")");return b.length===1?f.find.matchesSelector(b[0],a)?[b[0]]:[]:f.find.matches(a,b)},dir:function(a,c,d){var e=[],g=a[c];while(g&&g.nodeType!==9&&(d===b||g.nodeType!==1||!f(g).is(d)))g.nodeType===1&&e.push(g),g=g[c];return e},nth:function(a,b,c,d){b=b||1;var e=0;for(;a;a=a[c])if(a.nodeType===1&&++e===b)break;return a},sibling:function(a,b){var c=[];for(;a;a=a.nextSibling)a.nodeType===1&&a!==b&&c.push(a);return c}});var V="abbr|article|aside|audio|canvas|datalist|details|figcaption|figure|footer|header|hgroup|mark|meter|nav|output|progress|section|summary|time|video",W=/ jQuery\d+="(?:\d+|null)"/g,X=/^\s+/,Y=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:]+)[^>]*)\/>/ig,Z=/<([\w:]+)/,$=/<tbody/i,_=/<|&#?\w+;/,ba=/<(?:script|style)/i,bb=/<(?:script|object|embed|option|style)/i,bc=new RegExp("<(?:"+V+")","i"),bd=/checked\s*(?:[^=]|=\s*.checked.)/i,be=/\/(java|ecma)script/i,bf=/^\s*<!(?:\[CDATA\[|\-\-)/,bg={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]},bh=U(c);bg.optgroup=bg.option,bg.tbody=bg.tfoot=bg.colgroup=bg.caption=bg.thead,bg.th=bg.td,f.support.htmlSerialize||(bg._default=[1,"div<div>","</div>"]),f.fn.extend({text:function(a){if(f.isFunction(a))return this.each(function(b){var c=f(this);c.text(a.call(this,b,c.text()))});if(typeof a!="object"&&a!==b)return this.empty().append((this[0]&&this[0].ownerDocument||c).createTextNode(a));return f.text(this)},wrapAll:function(a){if(f.isFunction(a))return this.each(function(b){f(this).wrapAll(a.call(this,b))});if(this[0]){var b=f(a,this[0].ownerDocument).eq(0).clone(!0);this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstChild&&a.firstChild.nodeType===1)a=a.firstChild;return a}).append(this)}return this},wrapInner:function(a){if(f.isFunction(a))return this.each(function(b){f(this).wrapInner(a.call(this,b))});return this.each(function(){var b=f(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=f.isFunction(a);return this.each(function(c){f(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(){return this.parent().each(function(){f.nodeName(this,"body")||f(this).replaceWith(this.childNodes)}).end()},append:function(){return this.domManip(arguments,!0,function(a){this.nodeType===1&&this.appendChild(a)})},prepend:function(){return this.domManip(arguments,!0,function(a){this.nodeType===1&&this.insertBefore(a,this.firstChild)})},before:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this)});if(arguments.length){var a=f.clean(arguments);a.push.apply(a,this.toArray());return this.pushStack(a,"before",arguments)}},after:function(){if(this[0]&&this[0].parentNode)return this.domManip(arguments,!1,function(a){this.parentNode.insertBefore(a,this.nextSibling)});if(arguments.length){var a=this.pushStack(this,"after",arguments);a.push.apply(a,f.clean(arguments));return a}},remove:function(a,b){for(var c=0,d;(d=this[c])!=null;c++)if(!a||f.filter(a,[d]).length)!b&&d.nodeType===1&&(f.cleanData(d.getElementsByTagName("*")),f.cleanData([d])),d.parentNode&&d.parentNode.removeChild(d);return this},empty:function()
{for(var a=0,b;(b=this[a])!=null;a++){b.nodeType===1&&f.cleanData(b.getElementsByTagName("*"));while(b.firstChild)b.removeChild(b.firstChild)}return this},clone:function(a,b){a=a==null?!1:a,b=b==null?a:b;return this.map(function(){return f.clone(this,a,b)})},html:function(a){if(a===b)return this[0]&&this[0].nodeType===1?this[0].innerHTML.replace(W,""):null;if(typeof a=="string"&&!ba.test(a)&&(f.support.leadingWhitespace||!X.test(a))&&!bg[(Z.exec(a)||["",""])[1].toLowerCase()]){a=a.replace(Y,"<$1></$2>");try{for(var c=0,d=this.length;c<d;c++)this[c].nodeType===1&&(f.cleanData(this[c].getElementsByTagName("*")),this[c].innerHTML=a)}catch(e){this.empty().append(a)}}else f.isFunction(a)?this.each(function(b){var c=f(this);c.html(a.call(this,b,c.html()))}):this.empty().append(a);return this},replaceWith:function(a){if(this[0]&&this[0].parentNode){if(f.isFunction(a))return this.each(function(b){var c=f(this),d=c.html();c.replaceWith(a.call(this,b,d))});typeof a!="string"&&(a=f(a).detach());return this.each(function(){var b=this.nextSibling,c=this.parentNode;f(this).remove(),b?f(b).before(a):f(c).append(a)})}return this.length?this.pushStack(f(f.isFunction(a)?a():a),"replaceWith",a):this},detach:function(a){return this.remove(a,!0)},domManip:function(a,c,d){var e,g,h,i,j=a[0],k=[];if(!f.support.checkClone&&arguments.length===3&&typeof j=="string"&&bd.test(j))return this.each(function(){f(this).domManip(a,c,d,!0)});if(f.isFunction(j))return this.each(function(e){var g=f(this);a[0]=j.call(this,e,c?g.html():b),g.domManip(a,c,d)});if(this[0]){i=j&&j.parentNode,f.support.parentNode&&i&&i.nodeType===11&&i.childNodes.length===this.length?e={fragment:i}:e=f.buildFragment(a,this,k),h=e.fragment,h.childNodes.length===1?g=h=h.firstChild:g=h.firstChild;if(g){c=c&&f.nodeName(g,"tr");for(var l=0,m=this.length,n=m-1;l<m;l++)d.call(c?bi(this[l],g):this[l],e.cacheable||m>1&&l<n?f.clone(h,!0,!0):h)}k.length&&f.each(k,bp)}return this}}),f.buildFragment=function(a,b,d){var e,g,h,i,j=a[0];b&&b[0]&&(i=b[0].ownerDocument||b[0]),i.createDocumentFragment||(i=c),a.length===1&&typeof j=="string"&&j.length<512&&i===c&&j.charAt(0)==="<"&&!bb.test(j)&&(f.support.checkClone||!bd.test(j))&&(f.support.html5Clone||!bc.test(j))&&(g=!0,h=f.fragments[j],h&&h!==1&&(e=h)),e||(e=i.createDocumentFragment(),f.clean(a,i,e,d)),g&&(f.fragments[j]=h?e:1);return{fragment:e,cacheable:g}},f.fragments={},f.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){f.fn[a]=function(c){var d=[],e=f(c),g=this.length===1&&this[0].parentNode;if(g&&g.nodeType===11&&g.childNodes.length===1&&e.length===1){e[b](this[0]);return this}for(var h=0,i=e.length;h<i;h++){var j=(h>0?this.clone(!0):this).get();f(e[h])[b](j),d=d.concat(j)}return this.pushStack(d,a,e.selector)}}),f.extend({clone:function(a,b,c){var d,e,g,h=f.support.html5Clone||!bc.test("<"+a.nodeName)?a.cloneNode(!0):bo(a);if((!f.support.noCloneEvent||!f.support.noCloneChecked)&&(a.nodeType===1||a.nodeType===11)&&!f.isXMLDoc(a)){bk(a,h),d=bl(a),e=bl(h);for(g=0;d[g];++g)e[g]&&bk(d[g],e[g])}if(b){bj(a,h);if(c){d=bl(a),e=bl(h);for(g=0;d[g];++g)bj(d[g],e[g])}}d=e=null;return h},clean:function(a,b,d,e){var g;b=b||c,typeof b.createElement=="undefined"&&(b=b.ownerDocument||b[0]&&b[0].ownerDocument||c);var h=[],i;for(var j=0,k;(k=a[j])!=null;j++){typeof k=="number"&&(k+="");if(!k)continue;if(typeof k=="string")if(!_.test(k))k=b.createTextNode(k);else{k=k.replace(Y,"<$1></$2>");var l=(Z.exec(k)||["",""])[1].toLowerCase(),m=bg[l]||bg._default,n=m[0],o=b.createElement("div");b===c?bh.appendChild(o):U(b).appendChild(o),o.innerHTML=m[1]+k+m[2];while(n--)o=o.lastChild;if(!f.support.tbody){var p=$.test(k),q=l==="table"&&!p?o.firstChild&&o.firstChild.childNodes:m[1]==="<table>"&&!p?o.childNodes:[];for(i=q.length-1;i>=0;--i)f.nodeName(q[i],"tbody")&&!q[i].childNodes.length&&q[i].parentNode.removeChild(q[i])}!f.support.leadingWhitespace&&X.test(k)&&o.insertBefore(b.createTextNode(X.exec(k)[0]),o.firstChild),k=o.childNodes}var r;if(!f.support.appendChecked)if(k[0]&&typeof (r=k.length)=="number")for(i=0;i<r;i++)bn(k[i]);else bn(k);k.nodeType?h.push(k):h=f.merge(h,k)}if(d){g=function(a){return!a.type||be.test(a.type)};for(j=0;h[j];j++)if(e&&f.nodeName(h[j],"script")&&(!h[j].type||h[j].type.toLowerCase()==="text/javascript"))e.push(h[j].parentNode?h[j].parentNode.removeChild(h[j]):h[j]);else{if(h[j].nodeType===1){var s=f.grep(h[j].getElementsByTagName("script"),g);h.splice.apply(h,[j+1,0].concat(s))}d.appendChild(h[j])}}return h},cleanData:function(a){var b,c,d=f.cache,e=f.event.special,g=f.support.deleteExpando;for(var h=0,i;(i=a[h])!=null;h++){if(i.nodeName&&f.noData[i.nodeName.toLowerCase()])continue;c=i[f.expando];if(c){b=d[c];if(b&&b.events){for(var j in b.events)e[j]?f.event.remove(i,j):f.removeEvent(i,j,b.handle);b.handle&&(b.handle.elem=null)}g?delete i[f.expando]:i.removeAttribute&&i.removeAttribute(f.expando),delete d[c]}}}});var bq=/alpha\([^)]*\)/i,br=/opacity=([^)]*)/,bs=/([A-Z]|^ms)/g,bt=/^-?\d+(?:px)?$/i,bu=/^-?\d/,bv=/^([\-+])=([\-+.\de]+)/,bw={position:"absolute",visibility:"hidden",display:"block"},bx=["Left","Right"],by=["Top","Bottom"],bz,bA,bB;f.fn.css=function(a,c){if(arguments.length===2&&c===b)return this;return f.access(this,a,c,!0,function(a,c,d){return d!==b?f.style(a,c,d):f.css(a,c)})},f.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=bz(a,"opacity","opacity");return c===""?"1":c}return a.style.opacity}}},cssNumber:{fillOpacity:!0,fontWeight:!0,lineHeight:!0,opacity:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":f.support.cssFloat?"cssFloat":"styleFloat"},style:function(a,c,d,e){if(!!a&&a.nodeType!==3&&a.nodeType!==8&&!!a.style){var g,h,i=f.camelCase(c),j=a.style,k=f.cssHooks[i];c=f.cssProps[i]||i;if(d===b){if(k&&"get"in k&&(g=k.get(a,!1,e))!==b)return g;return j[c]}h=typeof d,h==="string"&&(g=bv.exec(d))&&(d=+(g[1]+1)*+g[2]+parseFloat(f.css(a,c)),h="number");if(d==null||h==="number"&&isNaN(d))return;h==="number"&&!f.cssNumber[i]&&(d+="px");if(!k||!("set"in k)||(d=k.set(a,d))!==b)try{j[c]=d}catch(l){}}},css:function(a,c,d){var e,g;c=f.camelCase(c),g=f.cssHooks[c],c=f.cssProps[c]||c,c==="cssFloat"&&(c="float");if(g&&"get"in g&&(e=g.get(a,!0,d))!==b)return e;if(bz)return bz(a,c)},swap:function(a,b,c){var d={};for(var e in b)d[e]=a.style[e],a.style[e]=b[e];c.call(a);for(e in b)a.style[e]=d[e]}}),f.curCSS=f.css,f.each(["height","width"],function(a,b){f.cssHooks[b]={get:function(a,c,d){var e;if(c){if(a.offsetWidth!==0)return bC(a,b,d);f.swap(a,bw,function(){e=bC(a,b,d)});return e}},set:function(a,b){if(!bt.test(b))return b;b=parseFloat(b);if(b>=0)return b+"px"}}}),f.support.opacity||(f.cssHooks.opacity={get:function(a,b){return br.test((b&&a.currentStyle?a.currentStyle.filter:a.style.filter)||"")?parseFloat(RegExp.$1)/100+"":b?"1":""},set:function(a,b){var c=a.style,d=a.currentStyle,e=f.isNumeric(b)?"alpha(opacity="+b*100+")":"",g=d&&d.filter||c.filter||"";c.zoom=1;if(b>=1&&f.trim(g.replace(bq,""))===""){c.removeAttribute("filter");if(d&&!d.filter)return}c.filter=bq.test(g)?g.replace(bq,e):g+" "+e}}),f(function(){f.support.reliableMarginRight||(f.cssHooks.marginRight={get:function(a,b){var c;f.swap(a,{display:"inline-block"},function(){b?c=bz(a,"margin-right","marginRight"):c=a.style.marginRight});return c}})}),c.defaultView&&c.defaultView.getComputedStyle&&(bA=function(a,b){var c,d,e;b=b.replace(bs,"-$1").toLowerCase(),(d=a.ownerDocument.defaultView)&&(e=d.getComputedStyle(a,null))&&(c=e.getPropertyValue(b),c===""&&!f.contains(a.ownerDocument.documentElement,a)&&(c=f.style(a,b)));return c}),c.documentElement.currentStyle&&(bB=function(a,b){var c,d,e,f=a.currentStyle&&a.currentStyle[b],g=a.style;f===null&&g&&(e=g[b])&&(f=e),!bt.test(f)&&bu.test(f)&&(c=g.left,d=a.runtimeStyle&&a.runtimeStyle.left,d&&(a.runtimeStyle.left=a.currentStyle.left),g.left=b==="fontSize"?"1em":f||0,f=g.pixelLeft+"px",g.left=c,d&&(a.runtimeStyle.left=d));return f===""?"auto":f}),bz=bA||bB,f.expr&&f.expr.filters&&(f.expr.filters.hidden=function(a){var b=a.offsetWidth,c=a.offsetHeight;return b===0&&c===0||!f.support.reliableHiddenOffsets&&(a.style&&a.style.display||f.css(a,"display"))==="none"},f.expr.filters.visible=function(a){return!f.expr.filters.hidden(a)});var bD=/%20/g,bE=/\[\]$/,bF=/\r?\n/g,bG=/#.*$/,bH=/^(.*?):[ \t]*([^\r\n]*)\r?$/mg,bI=/^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i,bJ=/^(?:about|app|app\-storage|.+\-extension|file|res|widget):$/,bK=/^(?:GET|HEAD)$/,bL=/^\/\//,bM=/\?/,bN=/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,bO=/^(?:select|textarea)/i,bP=/\s+/,bQ=/([?&])_=[^&]*/,bR=/^([\w\+\.\-]+:)(?:\/\/([^\/?#:]*)(?::(\d+))?)?/,bS=f.fn.load,bT={},bU={},bV,bW,bX=["*/"]+["*"];try{bV=e.href}catch(bY){bV=c.createElement("a"),bV.href="",bV=bV.href}bW=bR.exec(bV.toLowerCase())||[],f.fn.extend({load:function(a,c,d){if(typeof a!="string"&&bS)return bS.apply(this,arguments);if(!this.length)return this;var e=a.indexOf(" ");if(e>=0){var g=a.slice(e,a.length);a=a.slice(0,e)}var h="GET";c&&(f.isFunction(c)?(d=c,c=b):typeof c=="object"&&(c=f.param(c,f.ajaxSettings.traditional),h="POST"));var i=this;f.ajax({url:a,type:h,dataType:"html",data:c,complete:function(a,b,c){c=a.responseText,a.isResolved()&&(a.done(function(a){c=a}),i.html(g?f("<div>").append(c.replace(bN,"")).find(g):c)),d&&i.each(d,[c,b,a])}});return this},serialize:function(){return f.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?f.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||bO.test(this.nodeName)||bI.test(this.type))}).map(function(a,b){var c=f(this).val();return c==null?null:f.isArray(c)?f.map(c,function(a,c){return{name:b.name,value:a.replace(bF,"\r\n")}}):{name:b.name,value:c.replace(bF,"\r\n")}}).get()}}),f.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(a,b){f.fn[b]=function(a){return this.on(b,a)}}),f.each(["get","post"],function(a,c){f[c]=function(a,d,e,g){f.isFunction(d)&&(g=g||e,e=d,d=b);return f.ajax({type:c,url:a,data:d,success:e,dataType:g})}}),f.extend({getScript:function(a,c){return f.get(a,b,c,"script")},getJSON:function(a,b,c){return f.get(a,b,c,"json")},ajaxSetup:function(a,b){b?b_(a,f.ajaxSettings):(b=a,a=f.ajaxSettings),b_(a,b);return a},ajaxSettings:{url:bV,isLocal:bJ.test(bW[1]),global:!0,type:"GET",contentType:"application/x-www-form-urlencoded",processData:!0,async:!0,accepts:{xml:"application/xml, text/xml",html:"text/html",text:"text/plain",json:"application/json, text/javascript","*":bX},contents:{xml:/xml/,html:/html/,json:/json/},responseFields:{xml:"responseXML",text:"responseText"},converters:{"* text":a.String,"text html":!0,"text json":f.parseJSON,"text xml":f.parseXML},flatOptions:{context:!0,url:!0}},ajaxPrefilter:bZ(bT),ajaxTransport:bZ(bU),ajax:function(a,c){function w(a,c,l,m){if(s!==2){s=2,q&&clearTimeout(q),p=b,n=m||"",v.readyState=a>0?4:0;var o,r,u,w=c,x=l?cb(d,v,l):b,y,z;if(a>=200&&a<300||a===304){if(d.ifModified){if(y=v.getResponseHeader("Last-Modified"))f.lastModified[k]=y;if(z=v.getResponseHeader("Etag"))f.etag[k]=z}if(a===304)w="notmodified",o=!0;else try{r=cc(d,x),w="success",o=!0}catch(A){w="parsererror",u=A}}else{u=w;if(!w||a)w="error",a<0&&(a=0)}v.status=a,v.statusText=""+(c||w),o?h.resolveWith(e,[r,w,v]):h.rejectWith(e,[v,w,u]),v.statusCode(j),j=b,t&&g.trigger("ajax"+(o?"Success":"Error"),[v,d,o?r:u]),i.fireWith(e,[v,w]),t&&(g.trigger("ajaxComplete",[v,d]),--f.active||f.event.trigger("ajaxStop"))}}typeof a=="object"&&(c=a,a=b),c=c||{};var d=f.ajaxSetup({},c),e=d.context||d,g=e!==d&&(e.nodeType||e instanceof f)?f(e):f.event,h=f.Deferred(),i=f.Callbacks("once memory"),j=d.statusCode||{},k,l={},m={},n,o,p,q,r,s=0,t,u,v={readyState:0,setRequestHeader:function(a,b){if(!s){var c=a.toLowerCase();a=m[c]=m[c]||a,l[a]=b}return this},getAllResponseHeaders:function(){return s===2?n:null},getResponseHeader:function(a){var c;if(s===2){if(!o){o={};while(c=bH.exec(n))o[c[1].toLowerCase()]=c[2]}c=o[a.toLowerCase()]}return c===b?null:c},overrideMimeType:function(a){s||(d.mimeType=a);return this},abort:function(a){a=a||"abort",p&&p.abort(a),w(0,a);return this}};h.promise(v),v.success=v.done,v.error=v.fail,v.complete=i.add,v.statusCode=function(a){if(a){var b;if(s<2)for(b in a)j[b]=[j[b],a[b]];else b=a[v.status],v.then(b,b)}return this},d.url=((a||d.url)+"").replace(bG,"").replace(bL,bW[1]+"//"),d.dataTypes=f.trim(d.dataType||"*").toLowerCase().split(bP),d.crossDomain==null&&(r=bR.exec(d.url.toLowerCase()),d.crossDomain=!(!r||r[1]==bW[1]&&r[2]==bW[2]&&(r[3]||(r[1]==="http:"?80:443))==(bW[3]||(bW[1]==="http:"?80:443)))),d.data&&d.processData&&typeof d.data!="string"&&(d.data=f.param(d.data,d.traditional)),b$(bT,d,c,v);if(s===2)return!1;t=d.global,d.type=d.type.toUpperCase(),d.hasContent=!bK.test(d.type),t&&f.active++===0&&f.event.trigger("ajaxStart");if(!d.hasContent){d.data&&(d.url+=(bM.test(d.url)?"&":"?")+d.data,delete d.data),k=d.url;if(d.cache===!1){var x=f.now(),y=d.url.replace(bQ,"$1_="+x);d.url=y+(y===d.url?(bM.test(d.url)?"&":"?")+"_="+x:"")}}(d.data&&d.hasContent&&d.contentType!==!1||c.contentType)&&v.setRequestHeader("Content-Type",d.contentType),d.ifModified&&(k=k||d.url,f.lastModified[k]&&v.setRequestHeader("If-Modified-Since",f.lastModified[k]),f.etag[k]&&v.setRequestHeader("If-None-Match",f.etag[k])),v.setRequestHeader("Accept",d.dataTypes[0]&&d.accepts[d.dataTypes[0]]?d.accepts[d.dataTypes[0]]+(d.dataTypes[0]!=="*"?", "+bX+"; q=0.01":""):d.accepts["*"]);for(u in d.headers)v.setRequestHeader(u,d.headers[u]);if(d.beforeSend&&(d.beforeSend.call(e,v,d)===!1||s===2)){v.abort();return!1}for(u in{success:1,error:1,complete:1})v[u](d[u]);p=b$(bU,d,c,v);if(!p)w(-1,"No Transport");else{v.readyState=1,t&&g.trigger("ajaxSend",[v,d]),d.async&&d.timeout>0&&(q=setTimeout(function(){v.abort("timeout")},d.timeout));try{s=1,p.send(l,w)}catch(z){if(s<2)w(-1,z);else throw z}}return v},param:function(a,c){var d=[],e=function(a,b){b=f.isFunction(b)?b():b,d[d.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};c===b&&(c=f.ajaxSettings.traditional);if(f.isArray(a)||a.jquery&&!f.isPlainObject(a))f.each(a,function(){e(this.name,this.value)});else for(var g in a)ca(g,a[g],c,e);return d.join("&").replace(bD,"+")}}),f.extend({active:0,lastModified:{},etag:{}});var cd=f.now(),ce=/(\=)\?(&|$)|\?\?/i;f.ajaxSetup({jsonp:"callback",jsonpCallback:function(){return f.expando+"_"+cd++}}),f.ajaxPrefilter("json jsonp",function(b,c,d){var e=b.contentType==="application/x-www-form-urlencoded"&&typeof b.data=="string";if(b.dataTypes[0]==="jsonp"||b.jsonp!==!1&&(ce.test(b.url)||e&&ce.test(b.data))){var g,h=b.jsonpCallback=f.isFunction(b.jsonpCallback)?b.jsonpCallback():b.jsonpCallback,i=a[h],j=b.url,k=b.data,l="$1"+h+"$2";b.jsonp!==!1&&(j=j.replace(ce,l),b.url===j&&(e&&(k=k.replace(ce,l)),b.data===k&&(j+=(/\?/.test(j)?"&":"?")+b.jsonp+"="+h))),b.url=j,b.data=k,a[h]=function(a){g=[a]},d.always(function(){a[h]=i,g&&f.isFunction(i)&&a[h](g[0])}),b.converters["script json"]=function(){g||f.error(h+" was not called");return g[0]},b.dataTypes[0]="json";return"script"}}),f.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/javascript|ecmascript/},converters:{"text script":function(a){f.globalEval(a);return a}}}),f.ajaxPrefilter("script",function(a){a.cache===b&&(a.cache=!1),a.crossDomain&&(a.type="GET",a.global=!1)}),f.ajaxTransport("script",function(a){if(a.crossDomain){var d,e=c.head||c.getElementsByTagName("head")[0]||c.documentElement;return{send:function(f,g){d=c.createElement("script"),d.async="async",a.scriptCharset&&(d.charset=a.scriptCharset),d.src=a.url,d.onload=d.onreadystatechange=function(a,c){if(c||!d.readyState||/loaded|complete/.test(d.readyState))d.onload=d.onreadystatechange=null,e&&d.parentNode&&e.removeChild(d),d=b,c||g(200,"success")},e.insertBefore(d,e.firstChild)},abort:function(){d&&d.onload(0,1)}}}});var cf=a.ActiveXObject?function(){for(var a in ch)ch[a](0,1)}:!1,cg=0,ch;f.ajaxSettings.xhr=a.ActiveXObject?function(){return!this.isLocal&&ci()||cj()}:ci,function(a){f.extend(f.support,{ajax:!!a,cors:!!a&&"withCredentials"in a})}(f.ajaxSettings.xhr()),f.support.ajax&&f.ajaxTransport(function(c){if(!c.crossDomain||f.support.cors){var d;return{send:function(e,g){var h=c.xhr(),i,j;c.username?h.open(c.type,c.url,c.async,c.username,c.password):h.open(c.type,c.url,c.async);if(c.xhrFields)for(j in c.xhrFields)h[j]=c.xhrFields[j];c.mimeType&&h.overrideMimeType&&h.overrideMimeType(c.mimeType),!c.crossDomain&&!e["X-Requested-With"]&&(e["X-Requested-With"]="XMLHttpRequest");try{for(j in e)h.setRequestHeader(j,e[j])}catch(k){}h.send(c.hasContent&&c.data||null),d=function(a,e){var j,k,l,m,n;try{if(d&&(e||h.readyState===4)){d=b,i&&(h.onreadystatechange=f.noop,cf&&delete ch[i]);if(e)h.readyState!==4&&h.abort();else{j=h.status,l=h.getAllResponseHeaders(),m={},n=h.responseXML,n&&n.documentElement&&(m.xml=n),m.text=h.responseText;try{k=h.statusText}catch(o){k=""}!j&&c.isLocal&&!c.crossDomain?j=m.text?200:404:j===1223&&(j=204)}}}catch(p){e||g(-1,p)}m&&g(j,k,m,l)},!c.async||h.readyState===4?d():(i=++cg,cf&&(ch||(ch={},f(a).unload(cf)),ch[i]=d),h.onreadystatechange=d)},abort:function(){d&&d(0,1)}}}});var ck={},cl,cm,cn=/^(?:toggle|show|hide)$/,co=/^([+\-]=)?([\d+.\-]+)([a-z%]*)$/i,cp,cq=[["height","marginTop","marginBottom","paddingTop","paddingBottom"],["width","marginLeft","marginRight","paddingLeft","paddingRight"],["opacity"]],cr;f.fn.extend({show:function(a,b,c){var d,e;if(a||a===0)return this.animate(cu("show",3),a,b,c);for(var g=0,h=this.length;g<h;g++)d=this[g],d.style&&(e=d.style.display,!f._data(d,"olddisplay")&&e==="none"&&(e=d.style.display=""),e===""&&f.css(d,"display")==="none"&&f._data(d,"olddisplay",cv(d.nodeName)));for(g=0;g<h;g++){d=this[g];if(d.style){e=d.style.display;if(e===""||e==="none")d.style.display=f._data(d,"olddisplay")||""}}return this},hide:function(a,b,c){if(a||a===0)return this.animate(cu("hide",3),a,b,c);var d,e,g=0,h=this.length;for(;g<h;g++)d=this[g],d.style&&(e=f.css(d,"display"),e!=="none"&&!f._data(d,"olddisplay")&&f._data(d,"olddisplay",e));for(g=0;g<h;g++)this[g].style&&(this[g].style.display="none");return this},_toggle:f.fn.toggle,toggle:function(a,b,c){var d=typeof a=="boolean";f.isFunction(a)&&f.isFunction(b)?this._toggle.apply(this,arguments):a==null||d?this.each(function(){var b=d?a:f(this).is(":hidden");f(this)[b?"show":"hide"]()}):this.animate(cu("toggle",3),a,b,c);return this},fadeTo:function(a,b,c,d){return this.filter(":hidden").css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){function g(){e.queue===!1&&f._mark(this);var b=f.extend({},e),c=this.nodeType===1,d=c&&f(this).is(":hidden"),g,h,i,j,k,l,m,n,o;b.animatedProperties={};for(i in a){g=f.camelCase(i),i!==g&&(a[g]=a[i],delete a[i]),h=a[g],f.isArray(h)?(b.animatedProperties[g]=h[1],h=a[g]=h[0]):b.animatedProperties[g]=b.specialEasing&&b.specialEasing[g]||b.easing||"swing";if(h==="hide"&&d||h==="show"&&!d)return b.complete.call(this);c&&(g==="height"||g==="width")&&(b.overflow=[this.style.overflow,this.style.overflowX,this.style.overflowY],f.css(this,"display")==="inline"&&f.css(this,"float")==="none"&&(!f.support.inlineBlockNeedsLayout||cv(this.nodeName)==="inline"?this.style.display="inline-block":this.style.zoom=1))}b.overflow!=null&&(this.style.overflow="hidden");for(i in a)j=new f.fx(this,b,i),h=a[i],cn.test(h)?(o=f._data(this,"toggle"+i)||(h==="toggle"?d?"show":"hide":0),o?(f._data(this,"toggle"+i,o==="show"?"hide":"show"),j[o]()):j[h]()):(k=co.exec(h),l=j.cur(),k?(m=parseFloat(k[2]),n=k[3]||(f.cssNumber[i]?"":"px"),n!=="px"&&(f.style(this,i,(m||1)+n),l=(m||1)/j.cur()*l,f.style(this,i,l+n)),k[1]&&(m=(k[1]==="-="?-1:1)*m+l),j.custom(l,m,n)):j.custom(l,h,""));return!0}var e=f.speed(b,c,d);if(f.isEmptyObject(a))return this.each(e.complete,[!1]);a=f.extend({},a);return e.queue===!1?this.each(g):this.queue(e.queue,g)},stop:function(a,c,d){typeof a!="string"&&(d=c,c=a,a=b),c&&a!==!1&&this.queue(a||"fx",[]);return this.each(function(){function h(a,b,c){var e=b[c];f.removeData(a,c,!0),e.stop(d)}var b,c=!1,e=f.timers,g=f._data(this);d||f._unmark(!0,this);if(a==null)for(b in g)g[b]&&g[b].stop&&b.indexOf(".run")===b.length-4&&h(this,g,b);else g[b=a+".run"]&&g[b].stop&&h(this,g,b);for(b=e.length;b--;)e[b].elem===this&&(a==null||e[b].queue===a)&&(d?e[b](!0):e[b].saveState(),c=!0,e.splice(b,1));(!d||!c)&&f.dequeue(this,a)})}}),f.each({slideDown:cu("show",1),slideUp:cu("hide",1),slideToggle:cu("toggle",1),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){f.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),f.extend({speed:function(a,b,c){var d=a&&typeof a=="object"?f.extend({},a):{complete:c||!c&&b||f.isFunction(a)&&a,duration:a,easing:c&&b||b&&!f.isFunction(b)&&b};d.duration=f.fx.off?0:typeof d.duration=="number"?d.duration:d.duration in f.fx.speeds?f.fx.speeds[d.duration]:f.fx.speeds._default;if(d.queue==null||d.queue===!0)d.queue="fx";d.old=d.complete,d.complete=function(a){f.isFunction(d.old)&&d.old.call(this),d.queue?f.dequeue(this,d.queue):a!==!1&&f._unmark(this)};return d},easing:{linear:function(a,b,c,d){return c+d*a},swing:function(a,b,c,d){return(-Math.cos(a*Math.PI)/2+.5)*d+c}},timers:[],fx:function(a,b,c){this.options=b,this.elem=a,this.prop=c,b.orig=b.orig||{}}}),f.fx.prototype={update:function(){this.options.step&&this.options.step.call(this.elem,this.now,this),(f.fx.step[this.prop]||f.fx.step._default)(this)},cur:function(){if(this.elem[this.prop]!=null&&(!this.elem.style||this.elem.style[this.prop]==null))return this.elem[this.prop];var a,b=f.css(this.elem,this.prop);return isNaN(a=parseFloat(b))?!b||b==="auto"?0:b:a},custom:function(a,c,d){function h(a){return e.step(a)}var e=this,g=f.fx;this.startTime=cr||cs(),this.end=c,this.now=this.start=a,this.pos=this.state=0,this.unit=d||this.unit||(f.cssNumber[this.prop]?"":"px"),h.queue=this.options.queue,h.elem=this.elem,h.saveState=function(){e.options.hide&&f._data(e.elem,"fxshow"+e.prop)===b&&f._data(e.elem,"fxshow"+e.prop,e.start)},h()&&f.timers.push(h)&&!cp&&(cp=setInterval(g.tick,g.interval))},show:function(){var a=f._data(this.elem,"fxshow"+this.prop);this.options.orig[this.prop]=a||f.style(this.elem,this.prop),this.options.show=!0,a!==b?this.custom(this.cur(),a):this.custom(this.prop==="width"||this.prop==="height"?1:0,this.cur()),f(this.elem).show()},hide:function(){this.options.orig[this.prop]=f._data(this.elem,"fxshow"+this.prop)||f.style(this.elem,this.prop),this.options.hide=!0,this.custom(this.cur(),0)},step:function(a){var b,c,d,e=cr||cs(),g=!0,h=this.elem,i=this.options;if(a||e>=i.duration+this.startTime){this.now=this.end,this.pos=this.state=1,this.update(),i.animatedProperties[this.prop]=!0;for(b in i.animatedProperties)i.animatedProperties[b]!==!0&&(g=!1);if(g){i.overflow!=null&&!f.support.shrinkWrapBlocks&&f.each(["","X","Y"],function(a,b){h.style["overflow"+b]=i.overflow[a]}),i.hide&&f(h).hide();if(i.hide||i.show)for(b in i.animatedProperties)f.style(h,b,i.orig[b]),f.removeData(h,"fxshow"+b,!0),f.removeData(h,"toggle"+b,!0);d=i.complete,d&&(i.complete=!1,d.call(h))}return!1}i.duration==Infinity?this.now=e:(c=e-this.startTime,this.state=c/i.duration,this.pos=f.easing[i.animatedProperties[this.prop]](this.state,c,0,1,i.duration),this.now=this.start+(this.end-this.start)*this.pos),this.update();return!0}},f.extend(f.fx,{tick:function(){var a,b=f.timers,c=0;for(;c<b.length;c++)a=b[c],!a()&&b[c]===a&&b.splice(c--,1);b.length||f.fx.stop()},interval:13,stop:function(){clearInterval(cp),cp=null},speeds:{slow:600,fast:200,_default:400},step:{opacity:function(a){f.style(a.elem,"opacity",a.now)},_default:function(a){a.elem.style&&a.elem.style[a.prop]!=null?a.elem.style[a.prop]=a.now+a.unit:a.elem[a.prop]=a.now}}}),f.each(["width","height"],function(a,b){f.fx.step[b]=function(a){f.style(a.elem,b,Math.max(0,a.now)+a.unit)}}),f.expr&&f.expr.filters&&(f.expr.filters.animated=function(a){return f.grep(f.timers,function(b){return a===b.elem}).length});var cw=/^t(?:able|d|h)$/i,cx=/^(?:body|html)$/i;"getBoundingClientRect"in c.documentElement?f.fn.offset=function(a){var b=this[0],c;if(a)return this.each(function(b){f.offset.setOffset(this,a,b)});if(!b||!b.ownerDocument)return null;if(b===b.ownerDocument.body)return f.offset.bodyOffset(b);try{c=b.getBoundingClientRect()}catch(d){}var e=b.ownerDocument,g=e.documentElement;if(!c||!f.contains(g,b))return c?{top:c.top,left:c.left}:{top:0,left:0};var h=e.body,i=cy(e),j=g.clientTop||h.clientTop||0,k=g.clientLeft||h.clientLeft||0,l=i.pageYOffset||f.support.boxModel&&g.scrollTop||h.scrollTop,m=i.pageXOffset||f.support.boxModel&&g.scrollLeft||h.scrollLeft,n=c.top+l-j,o=c.left+m-k;return{top:n,left:o}}:f.fn.offset=function(a){var b=this[0];if(a)return this.each(function(b){f.offset.setOffset(this,a,b)});if(!b||!b.ownerDocument)return null;if(b===b.ownerDocument.body)return f.offset.bodyOffset(b);var c,d=b.offsetParent,e=b,g=b.ownerDocument,h=g.documentElement,i=g.body,j=g.defaultView,k=j?j.getComputedStyle(b,null):b.currentStyle,l=b.offsetTop,m=b.offsetLeft;while((b=b.parentNode)&&b!==i&&b!==h){if(f.support.fixedPosition&&k.position==="fixed")break;c=j?j.getComputedStyle(b,null):b.currentStyle,l-=b.scrollTop,m-=b.scrollLeft,b===d&&(l+=b.offsetTop,m+=b.offsetLeft,f.support.doesNotAddBorder&&(!f.support.doesAddBorderForTableAndCells||!cw.test(b.nodeName))&&(l+=parseFloat(c.borderTopWidth)||0,m+=parseFloat(c.borderLeftWidth)||0),e=d,d=b.offsetParent),f.support.subtractsBorderForOverflowNotVisible&&c.overflow!=="visible"&&(l+=parseFloat(c.borderTopWidth)||0,m+=parseFloat(c.borderLeftWidth)||0),k=c}if(k.position==="relative"||k.position==="static")l+=i.offsetTop,m+=i.offsetLeft;f.support.fixedPosition&&k.position==="fixed"&&(l+=Math.max(h.scrollTop,i.scrollTop),m+=Math.max(h.scrollLeft,i.scrollLeft));return{top:l,left:m}},f.offset={bodyOffset:function(a){var b=a.offsetTop,c=a.offsetLeft;f.support.doesNotIncludeMarginInBodyOffset&&(b+=parseFloat(f.css(a,"marginTop"))||0,c+=parseFloat(f.css(a,"marginLeft"))||0);return{top:b,left:c}},setOffset:function(a,b,c){var d=f.css(a,"position");d==="static"&&(a.style.position="relative");var e=f(a),g=e.offset(),h=f.css(a,"top"),i=f.css(a,"left"),j=(d==="absolute"||d==="fixed")&&f.inArray("auto",[h,i])>-1,k={},l={},m,n;j?(l=e.position(),m=l.top,n=l.left):(m=parseFloat(h)||0,n=parseFloat(i)||0),f.isFunction(b)&&(b=b.call(a,c,g)),b.top!=null&&(k.top=b.top-g.top+m),b.left!=null&&(k.left=b.left-g.left+n),"using"in b?b.using.call(a,k):e.css(k)}},f.fn.extend({position:function(){if(!this[0])return null;var a=this[0],b=this.offsetParent(),c=this.offset(),d=cx.test(b[0].nodeName)?{top:0,left:0}:b.offset();c.top-=parseFloat(f.css(a,"marginTop"))||0,c.left-=parseFloat(f.css(a,"marginLeft"))||0,d.top+=parseFloat(f.css(b[0],"borderTopWidth"))||0,d.left+=parseFloat(f.css(b[0],"borderLeftWidth"))||0;return{top:c.top-d.top,left:c.left-d.left}},offsetParent:function(){return this.map(function(){var a=this.offsetParent||c.body;while(a&&!cx.test(a.nodeName)&&f.css(a,"position")==="static")a=a.offsetParent;return a})}}),f.each(["Left","Top"],function(a,c){var d="scroll"+c;f.fn[d]=function(c){var e,g;if(c===b){e=this[0];if(!e)return null;g=cy(e);return g?"pageXOffset"in g?g[a?"pageYOffset":"pageXOffset"]:f.support.boxModel&&g.document.documentElement[d]||g.document.body[d]:e[d]}return this.each(function(){g=cy(this),g?g.scrollTo(a?f(g).scrollLeft():c,a?c:f(g).scrollTop()):this[d]=c})}}),f.each(["Height","Width"],function(a,c){var d=c.toLowerCase();f.fn["inner"+c]=function(){var a=this[0];return a?a.style?parseFloat(f.css(a,d,"padding")):this[d]():null},f.fn["outer"+c]=function(a){var b=this[0];return b?b.style?parseFloat(f.css(b,d,a?"margin":"border")):this[d]():null},f.fn[d]=function(a){var e=this[0];if(!e)return a==null?null:this;if(f.isFunction(a))return this.each(function(b){var c=f(this);c[d](a.call(this,b,c[d]()))});if(f.isWindow(e)){var g=e.document.documentElement["client"+c],h=e.document.body;return e.document.compatMode==="CSS1Compat"&&g||h&&h["client"+c]||g}if(e.nodeType===9)return Math.max(e.documentElement["client"+c],e.body["scroll"+c],e.documentElement["scroll"+c],e.body["offset"+c],e.documentElement["offset"+c]);if(a===b){var i=f.css(e,d),j=parseFloat(i);return f.isNumeric(j)?j:i}return this.css(d,typeof a=="string"?a:a+"px")}}),a.jQuery=a.$=f,typeof define=="function"&&define.amd&&define.amd.jQuery&&define("jquery",[],function(){return f})})(window);// Underscore.js 1.2.2
// (c) 2011 Jeremy Ashkenas, DocumentCloud Inc.
// Underscore is freely distributable under the MIT license.
// Portions of Underscore are inspired or borrowed from Prototype,
// Oliver Steele's Functional, and John Resig's Micro-Templating.
// For all details and documentation:
// http://documentcloud.github.com/underscore
(function(){function r(a,c,d){if(a===c)return a!==0||1/a==1/c;if(a==null||c==null)return a===c;if(a._chain)a=a._wrapped;if(c._chain)c=c._wrapped;if(b.isFunction(a.isEqual))return a.isEqual(c);if(b.isFunction(c.isEqual))return c.isEqual(a);var e=l.call(a);if(e!=l.call(c))return false;switch(e){case "[object String]":return String(a)==String(c);case "[object Number]":return a=+a,c=+c,a!=a?c!=c:a==0?1/a==1/c:a==c;case "[object Date]":case "[object Boolean]":return+a==+c;case "[object RegExp]":return a.source==
c.source&&a.global==c.global&&a.multiline==c.multiline&&a.ignoreCase==c.ignoreCase}if(typeof a!="object"||typeof c!="object")return false;for(var f=d.length;f--;)if(d[f]==a)return true;d.push(a);var f=0,g=true;if(e=="[object Array]"){if(f=a.length,g=f==c.length)for(;f--;)if(!(g=f in a==f in c&&r(a[f],c[f],d)))break}else{if("constructor"in a!="constructor"in c||a.constructor!=c.constructor)return false;for(var h in a)if(m.call(a,h)&&(f++,!(g=m.call(c,h)&&r(a[h],c[h],d))))break;if(g){for(h in c)if(m.call(c,
h)&&!f--)break;g=!f}}d.pop();return g}var s=this,F=s._,o={},k=Array.prototype,p=Object.prototype,i=k.slice,G=k.unshift,l=p.toString,m=p.hasOwnProperty,v=k.forEach,w=k.map,x=k.reduce,y=k.reduceRight,z=k.filter,A=k.every,B=k.some,q=k.indexOf,C=k.lastIndexOf,p=Array.isArray,H=Object.keys,t=Function.prototype.bind,b=function(a){return new n(a)};if(typeof exports!=="undefined"){if(typeof module!=="undefined"&&module.exports)exports=module.exports=b;exports._=b}else typeof define==="function"&&define.amd?
define("underscore",function(){return b}):s._=b;b.VERSION="1.2.2";var j=b.each=b.forEach=function(a,c,b){if(a!=null)if(v&&a.forEach===v)a.forEach(c,b);else if(a.length===+a.length)for(var e=0,f=a.length;e<f;e++){if(e in a&&c.call(b,a[e],e,a)===o)break}else for(e in a)if(m.call(a,e)&&c.call(b,a[e],e,a)===o)break};b.map=function(a,c,b){var e=[];if(a==null)return e;if(w&&a.map===w)return a.map(c,b);j(a,function(a,g,h){e[e.length]=c.call(b,a,g,h)});return e};b.reduce=b.foldl=b.inject=function(a,c,d,e){var f=
d!==void 0;a==null&&(a=[]);if(x&&a.reduce===x)return e&&(c=b.bind(c,e)),f?a.reduce(c,d):a.reduce(c);j(a,function(a,b,i){f?d=c.call(e,d,a,b,i):(d=a,f=true)});if(!f)throw new TypeError("Reduce of empty array with no initial value");return d};b.reduceRight=b.foldr=function(a,c,d,e){a==null&&(a=[]);if(y&&a.reduceRight===y)return e&&(c=b.bind(c,e)),d!==void 0?a.reduceRight(c,d):a.reduceRight(c);a=(b.isArray(a)?a.slice():b.toArray(a)).reverse();return b.reduce(a,c,d,e)};b.find=b.detect=function(a,c,b){var e;
D(a,function(a,g,h){if(c.call(b,a,g,h))return e=a,true});return e};b.filter=b.select=function(a,c,b){var e=[];if(a==null)return e;if(z&&a.filter===z)return a.filter(c,b);j(a,function(a,g,h){c.call(b,a,g,h)&&(e[e.length]=a)});return e};b.reject=function(a,c,b){var e=[];if(a==null)return e;j(a,function(a,g,h){c.call(b,a,g,h)||(e[e.length]=a)});return e};b.every=b.all=function(a,c,b){var e=true;if(a==null)return e;if(A&&a.every===A)return a.every(c,b);j(a,function(a,g,h){if(!(e=e&&c.call(b,a,g,h)))return o});
return e};var D=b.some=b.any=function(a,c,d){var c=c||b.identity,e=false;if(a==null)return e;if(B&&a.some===B)return a.some(c,d);j(a,function(a,b,h){if(e||(e=c.call(d,a,b,h)))return o});return!!e};b.include=b.contains=function(a,c){var b=false;if(a==null)return b;return q&&a.indexOf===q?a.indexOf(c)!=-1:b=D(a,function(a){return a===c})};b.invoke=function(a,c){var d=i.call(arguments,2);return b.map(a,function(a){return(c.call?c||a:a[c]).apply(a,d)})};b.pluck=function(a,c){return b.map(a,function(a){return a[c]})};
b.max=function(a,c,d){if(!c&&b.isArray(a))return Math.max.apply(Math,a);if(!c&&b.isEmpty(a))return-Infinity;var e={computed:-Infinity};j(a,function(a,b,h){b=c?c.call(d,a,b,h):a;b>=e.computed&&(e={value:a,computed:b})});return e.value};b.min=function(a,c,d){if(!c&&b.isArray(a))return Math.min.apply(Math,a);if(!c&&b.isEmpty(a))return Infinity;var e={computed:Infinity};j(a,function(a,b,h){b=c?c.call(d,a,b,h):a;b<e.computed&&(e={value:a,computed:b})});return e.value};b.shuffle=function(a){var c=[],b;
j(a,function(a,f){f==0?c[0]=a:(b=Math.floor(Math.random()*(f+1)),c[f]=c[b],c[b]=a)});return c};b.sortBy=function(a,c,d){return b.pluck(b.map(a,function(a,b,g){return{value:a,criteria:c.call(d,a,b,g)}}).sort(function(a,c){var b=a.criteria,d=c.criteria;return b<d?-1:b>d?1:0}),"value")};b.groupBy=function(a,c){var d={},e=b.isFunction(c)?c:function(a){return a[c]};j(a,function(a,c){var b=e(a,c);(d[b]||(d[b]=[])).push(a)});return d};b.sortedIndex=function(a,c,d){d||(d=b.identity);for(var e=0,f=a.length;e<
f;){var g=e+f>>1;d(a[g])<d(c)?e=g+1:f=g}return e};b.toArray=function(a){return!a?[]:a.toArray?a.toArray():b.isArray(a)?i.call(a):b.isArguments(a)?i.call(a):b.values(a)};b.size=function(a){return b.toArray(a).length};b.first=b.head=function(a,b,d){return b!=null&&!d?i.call(a,0,b):a[0]};b.initial=function(a,b,d){return i.call(a,0,a.length-(b==null||d?1:b))};b.last=function(a,b,d){return b!=null&&!d?i.call(a,Math.max(a.length-b,0)):a[a.length-1]};b.rest=b.tail=function(a,b,d){return i.call(a,b==null||
d?1:b)};b.compact=function(a){return b.filter(a,function(a){return!!a})};b.flatten=function(a,c){return b.reduce(a,function(a,e){if(b.isArray(e))return a.concat(c?e:b.flatten(e));a[a.length]=e;return a},[])};b.without=function(a){return b.difference(a,i.call(arguments,1))};b.uniq=b.unique=function(a,c,d){var d=d?b.map(a,d):a,e=[];b.reduce(d,function(d,g,h){if(0==h||(c===true?b.last(d)!=g:!b.include(d,g)))d[d.length]=g,e[e.length]=a[h];return d},[]);return e};b.union=function(){return b.uniq(b.flatten(arguments,
true))};b.intersection=b.intersect=function(a){var c=i.call(arguments,1);return b.filter(b.uniq(a),function(a){return b.every(c,function(c){return b.indexOf(c,a)>=0})})};b.difference=function(a,c){return b.filter(a,function(a){return!b.include(c,a)})};b.zip=function(){for(var a=i.call(arguments),c=b.max(b.pluck(a,"length")),d=Array(c),e=0;e<c;e++)d[e]=b.pluck(a,""+e);return d};b.indexOf=function(a,c,d){if(a==null)return-1;var e;if(d)return d=b.sortedIndex(a,c),a[d]===c?d:-1;if(q&&a.indexOf===q)return a.indexOf(c);
for(d=0,e=a.length;d<e;d++)if(a[d]===c)return d;return-1};b.lastIndexOf=function(a,b){if(a==null)return-1;if(C&&a.lastIndexOf===C)return a.lastIndexOf(b);for(var d=a.length;d--;)if(a[d]===b)return d;return-1};b.range=function(a,b,d){arguments.length<=1&&(b=a||0,a=0);for(var d=arguments[2]||1,e=Math.max(Math.ceil((b-a)/d),0),f=0,g=Array(e);f<e;)g[f++]=a,a+=d;return g};var E=function(){};b.bind=function(a,c){var d,e;if(a.bind===t&&t)return t.apply(a,i.call(arguments,1));if(!b.isFunction(a))throw new TypeError;
e=i.call(arguments,2);return d=function(){if(!(this instanceof d))return a.apply(c,e.concat(i.call(arguments)));E.prototype=a.prototype;var b=new E,g=a.apply(b,e.concat(i.call(arguments)));return Object(g)===g?g:b}};b.bindAll=function(a){var c=i.call(arguments,1);c.length==0&&(c=b.functions(a));j(c,function(c){a[c]=b.bind(a[c],a)});return a};b.memoize=function(a,c){var d={};c||(c=b.identity);return function(){var b=c.apply(this,arguments);return m.call(d,b)?d[b]:d[b]=a.apply(this,arguments)}};b.delay=
function(a,b){var d=i.call(arguments,2);return setTimeout(function(){return a.apply(a,d)},b)};b.defer=function(a){return b.delay.apply(b,[a,1].concat(i.call(arguments,1)))};b.throttle=function(a,c){var d,e,f,g,h,i=b.debounce(function(){h=g=false},c);return function(){d=this;e=arguments;var b;f||(f=setTimeout(function(){f=null;h&&a.apply(d,e);i()},c));g?h=true:a.apply(d,e);i();g=true}};b.debounce=function(a,b){var d;return function(){var e=this,f=arguments;clearTimeout(d);d=setTimeout(function(){d=
null;a.apply(e,f)},b)}};b.once=function(a){var b=false,d;return function(){if(b)return d;b=true;return d=a.apply(this,arguments)}};b.wrap=function(a,b){return function(){var d=[a].concat(i.call(arguments));return b.apply(this,d)}};b.compose=function(){var a=i.call(arguments);return function(){for(var b=i.call(arguments),d=a.length-1;d>=0;d--)b=[a[d].apply(this,b)];return b[0]}};b.after=function(a,b){return a<=0?b():function(){if(--a<1)return b.apply(this,arguments)}};b.keys=H||function(a){if(a!==
Object(a))throw new TypeError("Invalid object");var b=[],d;for(d in a)m.call(a,d)&&(b[b.length]=d);return b};b.values=function(a){return b.map(a,b.identity)};b.functions=b.methods=function(a){var c=[],d;for(d in a)b.isFunction(a[d])&&c.push(d);return c.sort()};b.extend=function(a){j(i.call(arguments,1),function(b){for(var d in b)b[d]!==void 0&&(a[d]=b[d])});return a};b.defaults=function(a){j(i.call(arguments,1),function(b){for(var d in b)a[d]==null&&(a[d]=b[d])});return a};b.clone=function(a){return!b.isObject(a)?
a:b.isArray(a)?a.slice():b.extend({},a)};b.tap=function(a,b){b(a);return a};b.isEqual=function(a,b){return r(a,b,[])};b.isEmpty=function(a){if(b.isArray(a)||b.isString(a))return a.length===0;for(var c in a)if(m.call(a,c))return false;return true};b.isElement=function(a){return!!(a&&a.nodeType==1)};b.isArray=p||function(a){return l.call(a)=="[object Array]"};b.isObject=function(a){return a===Object(a)};b.isArguments=l.call(arguments)=="[object Arguments]"?function(a){return l.call(a)=="[object Arguments]"}:
function(a){return!(!a||!m.call(a,"callee"))};b.isFunction=function(a){return l.call(a)=="[object Function]"};b.isString=function(a){return l.call(a)=="[object String]"};b.isNumber=function(a){return l.call(a)=="[object Number]"};b.isNaN=function(a){return a!==a};b.isBoolean=function(a){return a===true||a===false||l.call(a)=="[object Boolean]"};b.isDate=function(a){return l.call(a)=="[object Date]"};b.isRegExp=function(a){return l.call(a)=="[object RegExp]"};b.isNull=function(a){return a===null};
b.isUndefined=function(a){return a===void 0};b.noConflict=function(){s._=F;return this};b.identity=function(a){return a};b.times=function(a,b,d){for(var e=0;e<a;e++)b.call(d,e)};b.escape=function(a){return(""+a).replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#x27;").replace(/\//g,"&#x2F;")};b.mixin=function(a){j(b.functions(a),function(c){I(c,b[c]=a[c])})};var J=0;b.uniqueId=function(a){var b=J++;return a?a+b:b};b.templateSettings={evaluate:/<%([\s\S]+?)%>/g,
interpolate:/<%=([\s\S]+?)%>/g,escape:/<%-([\s\S]+?)%>/g};b.template=function(a,c){var d=b.templateSettings,d="var __p=[],print=function(){__p.push.apply(__p,arguments);};with(obj||{}){__p.push('"+a.replace(/\\/g,"\\\\").replace(/'/g,"\\'").replace(d.escape,function(a,b){return"',_.escape("+b.replace(/\\'/g,"'")+"),'"}).replace(d.interpolate,function(a,b){return"',"+b.replace(/\\'/g,"'")+",'"}).replace(d.evaluate||null,function(a,b){return"');"+b.replace(/\\'/g,"'").replace(/[\r\n\t]/g," ")+";__p.push('"}).replace(/\r/g,
"\\r").replace(/\n/g,"\\n").replace(/\t/g,"\\t")+"');}return __p.join('');",e=new Function("obj","_",d);return c?e(c,b):function(a){return e(a,b)}};var n=function(a){this._wrapped=a};b.prototype=n.prototype;var u=function(a,c){return c?b(a).chain():a},I=function(a,c){n.prototype[a]=function(){var a=i.call(arguments);G.call(a,this._wrapped);return u(c.apply(b,a),this._chain)}};b.mixin(b);j("pop,push,reverse,shift,sort,splice,unshift".split(","),function(a){var b=k[a];n.prototype[a]=function(){b.apply(this._wrapped,
arguments);return u(this._wrapped,this._chain)}});j(["concat","join","slice"],function(a){var b=k[a];n.prototype[a]=function(){return u(b.apply(this._wrapped,arguments),this._chain)}});n.prototype.chain=function(){this._chain=true;return this};n.prototype.value=function(){return this._wrapped}}).call(this);
(function(k){var o=String.prototype.trim,l=function(a,b){for(var c=[];b>0;c[--b]=a);return c.join("")},d=function(a){return function(){for(var b=Array.prototype.slice.call(arguments),c=0;c<b.length;c++)b[c]=b[c]==null?"":""+b[c];return a.apply(null,b)}},m=function(){function a(a){return Object.prototype.toString.call(a).slice(8,-1).toLowerCase()}var b=function(){b.cache.hasOwnProperty(arguments[0])||(b.cache[arguments[0]]=b.parse(arguments[0]));return b.format.call(null,b.cache[arguments[0]],arguments)};
b.format=function(b,n){var e=1,d=b.length,f="",j=[],h,i,g,k;for(h=0;h<d;h++)if(f=a(b[h]),f==="string")j.push(b[h]);else if(f==="array"){g=b[h];if(g[2]){f=n[e];for(i=0;i<g[2].length;i++){if(!f.hasOwnProperty(g[2][i]))throw m('[_.sprintf] property "%s" does not exist',g[2][i]);f=f[g[2][i]]}}else f=g[1]?n[g[1]]:n[e++];if(/[^s]/.test(g[8])&&a(f)!="number")throw m("[_.sprintf] expecting number but found %s",a(f));switch(g[8]){case "b":f=f.toString(2);break;case "c":f=String.fromCharCode(f);break;case "d":f=
parseInt(f,10);break;case "e":f=g[7]?f.toExponential(g[7]):f.toExponential();break;case "f":f=g[7]?parseFloat(f).toFixed(g[7]):parseFloat(f);break;case "o":f=f.toString(8);break;case "s":f=(f=String(f))&&g[7]?f.substring(0,g[7]):f;break;case "u":f=Math.abs(f);break;case "x":f=f.toString(16);break;case "X":f=f.toString(16).toUpperCase()}f=/[def]/.test(g[8])&&g[3]&&f>=0?"+"+f:f;i=g[4]?g[4]=="0"?"0":g[4].charAt(1):" ";k=g[6]-String(f).length;i=g[6]?l(i,k):"";j.push(g[5]?f+i:i+f)}return j.join("")};b.cache=
{};b.parse=function(a){for(var b=[],e=[],d=0;a;){if((b=/^[^\x25]+/.exec(a))!==null)e.push(b[0]);else if((b=/^\x25{2}/.exec(a))!==null)e.push("%");else if((b=/^\x25(?:([1-9]\d*)\$|\(([^\)]+)\))?(\+)?(0|'[^$])?(-)?(\d+)?(?:\.(\d+))?([b-fosuxX])/.exec(a))!==null){if(b[2]){d|=1;var f=[],j=b[2],h=[];if((h=/^([a-z_][a-z_\d]*)/i.exec(j))!==null)for(f.push(h[1]);(j=j.substring(h[0].length))!=="";)if((h=/^\.([a-z_][a-z_\d]*)/i.exec(j))!==null)f.push(h[1]);else if((h=/^\[(\d+)\]/.exec(j))!==null)f.push(h[1]);
else throw"[_.sprintf] huh?";else throw"[_.sprintf] huh?";b[2]=f}else d|=2;if(d===3)throw"[_.sprintf] mixing positional and named placeholders is not (yet) supported";e.push(b)}else throw"[_.sprintf] huh?";a=a.substring(b[0].length)}return e};return b}(),e={VERSION:"1.2.0",isBlank:d(function(a){return/^\s*$/.test(a)}),stripTags:d(function(a){return a.replace(/<\/?[^>]+>/ig,"")}),capitalize:d(function(a){return a.charAt(0).toUpperCase()+a.substring(1).toLowerCase()}),chop:d(function(a,b){for(var b=
b*1||0||a.length,c=[],e=0;e<a.length;)c.push(a.slice(e,e+b)),e+=b;return c}),clean:d(function(a){return e.strip(a.replace(/\s+/g," "))}),count:d(function(a,b){for(var c=0,e,d=0;d<a.length;)e=a.indexOf(b,d),e>=0&&c++,d=d+(e>=0?e:0)+b.length;return c}),chars:d(function(a){return a.split("")}),escapeHTML:d(function(a){return a.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&apos;")}),unescapeHTML:d(function(a){return a.replace(/&lt;/g,"<").replace(/&gt;/g,
">").replace(/&quot;/g,'"').replace(/&apos;/g,"'").replace(/&amp;/g,"&")}),escapeRegExp:d(function(a){return a.replace(/([-.*+?^${}()|[\]\/\\])/g,"\\$1")}),insert:d(function(a,b,c){a=a.split("");a.splice(b*1||0,0,c);return a.join("")}),include:d(function(a,b){return a.indexOf(b)!==-1}),join:d(function(a){var b=Array.prototype.slice.call(arguments);return b.join(b.shift())}),lines:d(function(a){return a.split("\n")}),reverse:d(function(a){return Array.prototype.reverse.apply(String(a).split("")).join("")}),
splice:d(function(a,b,c,e){a=a.split("");a.splice(b*1||0,c*1||0,e);return a.join("")}),startsWith:d(function(a,b){return a.length>=b.length&&a.substring(0,b.length)===b}),endsWith:d(function(a,b){return a.length>=b.length&&a.substring(a.length-b.length)===b}),succ:d(function(a){var b=a.split("");b.splice(a.length-1,1,String.fromCharCode(a.charCodeAt(a.length-1)+1));return b.join("")}),titleize:d(function(a){for(var a=a.split(" "),b,c=0;c<a.length;c++)b=a[c].split(""),typeof b[0]!=="undefined"&&(b[0]=
b[0].toUpperCase()),c+1===a.length?a[c]=b.join(""):a[c]=b.join("")+" ";return a.join("")}),camelize:d(function(a){return e.trim(a).replace(/(\-|_|\s)+(.)?/g,function(a,c,e){return e?e.toUpperCase():""})}),underscored:function(a){return e.trim(a).replace(/([a-z\d])([A-Z]+)/g,"$1_$2").replace(/\-|\s+/g,"_").toLowerCase()},dasherize:function(a){return e.trim(a).replace(/([a-z\d])([A-Z]+)/g,"$1-$2").replace(/^([A-Z]+)/,"-$1").replace(/\_|\s+/g,"-").toLowerCase()},humanize:function(a){return e.capitalize(this.underscored(a).replace(/_id$/,
"").replace(/_/g," "))},trim:d(function(a,b){if(!b&&o)return o.call(a);b=b?e.escapeRegExp(b):"\\s";return a.replace(RegExp("^["+b+"]+|["+b+"]+$","g"),"")}),ltrim:d(function(a,b){b=b?e.escapeRegExp(b):"\\s";return a.replace(RegExp("^["+b+"]+","g"),"")}),rtrim:d(function(a,b){b=b?e.escapeRegExp(b):"\\s";return a.replace(RegExp("["+b+"]+$","g"),"")}),truncate:d(function(a,b,c){b=b*1||0;return a.length>b?a.slice(0,b)+(c||"..."):a}),prune:d(function(a,b,c){var c=c||"...",b=b*1||0,d="",d=a.substring(b-
1,b+1).search(/^\w\w$/)===0?e.rtrim(a.slice(0,b).replace(/([\W][\w]*)$/,"")):e.rtrim(a.slice(0,b)),d=d.replace(/\W+$/,"");return d.length+c.length>a.length?a:d+c}),words:function(a,b){return String(a).split(b||" ")},pad:d(function(a,b,c,e){var d="",d=0,b=b*1||0;c?c.length>1&&(c=c.charAt(0)):c=" ";switch(e){case "right":d=b-a.length;d=l(c,d);a+=d;break;case "both":d=b-a.length;d={left:l(c,Math.ceil(d/2)),right:l(c,Math.floor(d/2))};a=d.left+a+d.right;break;default:d=b-a.length,d=l(c,d),a=d+a}return a}),
lpad:function(a,b,c){return e.pad(a,b,c)},rpad:function(a,b,c){return e.pad(a,b,c,"right")},lrpad:function(a,b,c){return e.pad(a,b,c,"both")},sprintf:m,vsprintf:function(a,b){b.unshift(a);return m.apply(null,b)},toNumber:function(a,b){var c;c=(a*1||0).toFixed(b*1||0)*1||0;return!(c===0&&a!=="0"&&a!==0)?c:Number.NaN},strRight:d(function(a,b){var c=!b?-1:a.indexOf(b);return c!=-1?a.slice(c+b.length,a.length):a}),strRightBack:d(function(a,b){var c=!b?-1:a.lastIndexOf(b);return c!=-1?a.slice(c+b.length,
a.length):a}),strLeft:d(function(a,b){var c=!b?-1:a.indexOf(b);return c!=-1?a.slice(0,c):a}),strLeftBack:d(function(a,b){var c=a.lastIndexOf(b);return c!=-1?a.slice(0,c):a}),exports:function(){var a={},b;for(b in this)if(this.hasOwnProperty(b)&&!(b=="include"||b=="contains"||b=="reverse"))a[b]=this[b];return a}};e.strip=e.trim;e.lstrip=e.ltrim;e.rstrip=e.rtrim;e.center=e.lrpad;e.ljust=e.lpad;e.rjust=e.rpad;e.contains=e.include;if(typeof exports!=="undefined"){if(typeof module!=="undefined"&&module.exports)module.exports=
e;exports._s=e}else typeof k._!=="undefined"?(k._.string=e,k._.str=k._.string):k._={string:e,str:e}})(this||window);
// 
// Heap based scheme from 3imp.pdf
//

// default definition of puts: should be overriden for console interpreters

function puts(str, no_newline){
    Console.puts(str, no_newline)
}
function p(/*args*/){
    Console.p.apply(this, arguments)
}

//
// variables
//
BiwaScheme.TopEnv = {};
BiwaScheme.CoreEnv = {};

//
// Nil
// javascript representation of empty list( '() )
//
BiwaScheme.nil = {
  toString: function() { return "nil"; },
  to_write: function() { return "()"; },
  to_array: function() { return []; },
  length: function() { return 0; }
};

//
// #<undef> (The undefined value)
// also used as #<unspecified> values
//
BiwaScheme.undef = new Object();
BiwaScheme.undef.toString = function(){ return "#<undef>"; }

// Prints the arguments to console.debug.
BiwaScheme.debug = function(/*arguments*/){
  var args = _.toArray(arguments);
  console.debug.apply(console, _.map(args, BiwaScheme.inspect));
}
//
// Super-simple class implementation
//
// Example usage:
//
// BiwaScheme.Foo = BiwaScheme.Class.create({
//   initialize: function(a){
//     this.a = a;
//   },
//
//   toString: function(){
//     return "foo[" + this.a + "]";
//   }
// });
//
// BiwaScheme.Bar = BiwaScheme.Class.extend(new BiwaScheme.Foo("hello1"), {
//   initialize: function(b){
//     this.b = b;
//   },
//
//   printEverything: function(){
//     console.log("a = ", this.a, "b = ", this.b);
//   },
//
//   toString: function(){
//     return "bar[" + this.b + "]";
//   }
// });

BiwaScheme.Class = {
  create: function(methods) {
    var klass = function(){ this.initialize.apply(this, arguments); };
    _.extend(klass.prototype, methods);
    return klass;
  },

  extend: function(parent, methods) {
    var klass = function(){ this.initialize.apply(this, arguments); };
    klass.prototype = parent;
    _.extend(klass.prototype, methods);
    return klass;
  }
};

// Update the given method to memoized version.
//
// - klass : a class defined by BiwaScheme.Class.create
// - name_or_names : method name (a string or an array of strings)
//
// Example
//
//   // Given this method
//   BiwaScheme.Enumeration.EnumType = ...
//     universe: function(){
//       return ...
//     }
//   ...
//   // Memoize
//   BiwaScheme.Class.memoize(BiwaScheme.Enumeration.EnumType,
//                            "_universe"); 
//
//   // Equal to:
//   BiwaScheme.Enumeration.EnumType = ...
//     universe: function(){
//       if(!this.hasOwnProperty("cached_universe")){
//         this.cached_universe = this.compute_universe();
//       }
//       return this.cached_universe;
//     },
//     compute_universe: function(){ 
//       // Original function, renamed to compute_*
//       return ...
//     }
//   ...
BiwaScheme.Class.memoize = function(klass, name_or_names){
  var proto = klass.prototype;
  var names = _.isArray(name_or_names) ? name_or_names : [name_or_names];

  _.each(names, function(name){
    // Copy original function foo as 'compute_foo'
    proto["compute_"+name] = proto[name];

    // Define memoizing version
    proto[name] = function(/*arguments*/){
      if(!this.hasOwnProperty("cached_"+name)){
        this["cached_"+name] = this["compute_"+name].apply(this, _.toArray(arguments));
      }
      return this["cached_"+name];
    }
  });
}
//
// write.js: Functions to convert objects to strings
//

//
// write
//

BiwaScheme.to_write = function(obj){
  if(obj === undefined)
    return "undefined";
  else if(obj === null)
    return "null";
  else if(_.isFunction(obj))
    return "#<Function "+(obj.fname ? obj.fname :
                          obj.toSource ? _.str.truncate(obj.toSource(), 40) :
                          "")+">";
  else if(_.isString(obj))
    return '"' +
           obj.replace(/\\|\"/g,function($0){return'\\'+$0;})
              .replace(/\x07/g, "\\a")
              .replace(/\x08/g, "\\b")
              .replace(/\t/g, "\\t")
              .replace(/\n/g, "\\n")
              .replace(/\v/g, "\\v")
              .replace(/\f/g, "\\f")
              .replace(/\r/g, "\\r") +
           '"';
  else if(_.isArray(obj) && obj.closure_p)
    return "#<Closure>";
  else if(_.isArray(obj))
    return "#(" + _.map(obj, function(e) { return BiwaScheme.to_write(e); }).join(" ") + ")";
  else if(typeof(obj.to_write) == 'function')
    return obj.to_write();
  else if(isNaN(obj) && typeof(obj) == 'number')
    return "+nan.0";
  else{
    switch(obj){
      case true: return "#t";
      case false: return "#f";
      case Infinity: return "+inf.0";
      case -Infinity: return "-inf.0";
    }
  }
  return BiwaScheme.inspect(obj);
}

//
// display
//

BiwaScheme.to_display = function(obj){
  if(typeof(obj.valueOf()) == "string")
    return obj;
  else if(obj instanceof BiwaScheme.Symbol)
    return obj.name;
  else if(obj instanceof Array)
    return '#(' + _.map(obj, BiwaScheme.to_display).join(' ') + ')';
  else if(obj instanceof BiwaScheme.Pair)
    return obj.inspect(BiwaScheme.to_display);
  else if(obj instanceof BiwaScheme.Char)
    return obj.value;
  else
    return BiwaScheme.to_write(obj);
}

//
// write/ss (write with substructure)
//

// example:  > (let ((x (list 'a))) (list x x))                   //           (#0=(a) #0#)
// 2-pass algorithm.
// (1) detect all the objects which appears more than once
//     (find_cyclic, reduce_cyclic_info)
// (2) write object using this information
//   * add prefix '#n=' for first appearance
//   * just write '#n#' for other appearance

//TODO: support Values
BiwaScheme.write_ss = function(obj, array_mode){
  var known = [obj], used = [false];
  BiwaScheme.find_cyclic(obj, known, used);
  var cyclic   = BiwaScheme.reduce_cyclic_info(known, used);
  var appeared = new Array(cyclic.length);
  for(var i=cyclic.length-1; i>=0; i--) appeared[i] = false;

  return BiwaScheme.to_write_ss(obj, cyclic, appeared, array_mode);
}
BiwaScheme.to_write_ss = function(obj, cyclic, appeared, array_mode){
  var ret = "";
  var i = cyclic.indexOf(obj);
  if(i >= 0){
    if(appeared[i]){
      return "#"+i+"#";
    }
    else{
      appeared[i] = true;
      ret = "#"+i+"=";
    }
  }

  if(obj instanceof BiwaScheme.Pair){
    var a = [];
    a.push(BiwaScheme.to_write_ss(obj.car, cyclic, appeared, array_mode));
    for(var o=obj.cdr; o != BiwaScheme.nil; o=o.cdr){
      if(!(o instanceof BiwaScheme.Pair) || cyclic.indexOf(o) >= 0){
        a.push(".");
        a.push(BiwaScheme.to_write_ss(o, cyclic, appeared, array_mode));
        break;
      }
      a.push(BiwaScheme.to_write_ss(o.car, cyclic, appeared, array_mode));
    }
    ret += "(" + a.join(" ") + ")";
  }
  else if(obj instanceof Array){
    var a = _.map(obj, function(item){
      return BiwaScheme.to_write_ss(item, cyclic, appeared, array_mode);
    })
    if(array_mode)
      ret += "[" + a.join(", ") + "]";
    else
      ret += "#(" + a.join(" ") + ")";
  }
  else{
    ret += BiwaScheme.to_write(obj);
  }
  return ret;
}
BiwaScheme.reduce_cyclic_info = function(known, used){
  var n_used = 0;
  for(var i=0; i<used.length; i++){
    if(used[i]){
      known[n_used] = known[i];
      n_used++;
    }
  }
  return known.slice(0, n_used);
}
BiwaScheme.find_cyclic = function(obj, known, used){
  var items = (obj instanceof BiwaScheme.Pair)  ? [obj.car, obj.cdr] :
              (obj instanceof Array) ? obj :
              null;
  if(!items) return;

  _.each(items, function(item){
    if(typeof(item)=='number' || typeof(item)=='string' ||
      item === BiwaScheme.undef || item === true || item === false ||
      item === BiwaScheme.nil || item instanceof BiwaScheme.Symbol) return;

    var i = known.indexOf(item);
    if(i >= 0)
      used[i] = true;
    else{
      known.push(item);
      used.push(false);
      BiwaScheme.find_cyclic(item, known, used);
    }
  });
};

//
// inspect
//
BiwaScheme.inspect = function(object, opts) {
  try {
    if (_.isUndefined(object)) return 'undefined';
    if (object === null) return 'null';
    if (object === true) return '#t';
    if (object === false) return '#f';
    if (object.inspect) return object.inspect();
    if (_.isString(object)) {
      return '"' + object.replace(/"/g, '\\"') + '"';
    }
    if (_.isArray(object)) {
      return '[' + _.map(object, BiwaScheme.inspect).join(', ') + ']';
    }

    if (opts && opts["fallback"]){
      return opts["fallback"];
    }
    else {
      return object.toString();
    }
  } catch (e) {
    if (e instanceof RangeError) return '...';
    throw e;
  }
};
//
// types.js - type predicators
//

BiwaScheme.isNil = function(obj){
  return (obj === BiwaScheme.nil);
};

BiwaScheme.isUndef = function(obj){
  return (obj === BiwaScheme.undef);
};

BiwaScheme.isChar = function(obj){
  return (obj instanceof BiwaScheme.Char);
};

BiwaScheme.isSymbol = function(obj){
  return (obj instanceof BiwaScheme.Symbol);
};

BiwaScheme.isTheSymbol = function(name, obj){
  return (obj instanceof BiwaScheme.Symbol) &&
         (obj.name == name);
};

BiwaScheme.isPort = function(obj){
  return (obj instanceof BiwaScheme.Port);
};

// Note: '() is not a pair in scheme
BiwaScheme.isPair = function(obj){
  return (obj instanceof BiwaScheme.Pair);
};

// Returns true if obj is '() or all the cdr's are list.
// Note: isList returns true for '()
BiwaScheme.isList = function(obj){
    if(obj === BiwaScheme.nil) return true; // null base case
    if(!(obj instanceof BiwaScheme.Pair)) return false;
    return BiwaScheme.isList(obj.cdr);
  //TODO: should check if it is not cyclic..
};

BiwaScheme.isVector = function(obj){
  return (obj instanceof Array) && (obj.closure_p !== true);
};

BiwaScheme.isHashtable = function(obj){
  return (obj instanceof BiwaScheme.Hashtable);
};

BiwaScheme.isMutableHashtable = function(obj){
  return (obj instanceof BiwaScheme.Hashtable) && obj.mutable;
};

BiwaScheme.isClosure = function(obj){
  return (obj instanceof Array) && (obj.closure_p === true);
};

// procedure: Scheme closure or JavaScript function
// valid argument for anywhere function is expected
BiwaScheme.isProcedure = function(obj){
  return BiwaScheme.isClosure(obj) || _.isFunction(obj);
};
//
// Errors
//

BiwaScheme.Error = BiwaScheme.Class.create({
  initialize: function(msg){
    this.message = "Error: "+msg;
  },
  toString: function(){
    return this.message;
  }
});

BiwaScheme.Bug = BiwaScheme.Class.extend(new BiwaScheme.Error(), {
  initialize: function(msg){
    this.message = "[BUG] "+msg;
  }
});

// currently used by "raise"
BiwaScheme.UserError = BiwaScheme.Class.extend(new BiwaScheme.Error(), {
  initialize: function(msg){
    this.message = msg;
  }
});

//
// Set - set of string
// contents must be string (or at least sortable)
//
BiwaScheme.Set = BiwaScheme.Class.create({
  initialize : function(/*args*/){
    this.arr = [];
    var i;
    for(i=0; i<arguments.length; i++)
      this.arr[i] = arguments[i];
  },

  equals : function(other){
    if(this.arr.length != other.arr.length)
      return false;

    var a1 = _.clone(this.arr);
    var a2 = _.clone(other.arr);
    a1.sort();
    a2.sort();
    for(var i=0; i<this.arr.length; i++){
      if(a1[i] != a2[i]) return false;
    }
    return true;
  },
  set_cons : function(item){
    var o = new BiwaScheme.Set(item);
    o.arr = _.clone(this.arr);
    o.arr.push(item);
    return o;
  },
  set_union : function(/*args*/){
    var o = new BiwaScheme.Set();
    o.arr = _.clone(this.arr);

    for(var k=0; k<arguments.length; k++){
      var s2 = arguments[k];
      if(!(s2 instanceof BiwaScheme.Set))
        throw new BiwaScheme.Error("set_union: arguments must be a set");

      for(var i=0; i<s2.arr.length; i++)
        o.add(s2.arr[i]);
    }
    return o;
  },
  set_intersect : function(s2){
    if(!(s2 instanceof BiwaScheme.Set))
      throw new BiwaScheme.Error("set_intersect: arguments must be a set");

    var o = new BiwaScheme.Set();
    for(var i=0; i<this.arr.length; i++)
      if(s2.member(this.arr[i]))
        o.add(this.arr[i]);
    return o;
  },
  set_minus : function(s2){
    if(!(s2 instanceof BiwaScheme.Set))
      throw new BiwaScheme.Error("set_minus: arguments must be a set");

    var o = new BiwaScheme.Set();
    for(var i=0; i<this.arr.length; i++)
      if(!s2.member(this.arr[i]))
        o.add(this.arr[i]);
    return o;
  },
  add : function(item){
    if(!this.member(item)){
      this.arr.push(item);
    }
  },
  member : function(item){
    for(var i=0; i<this.arr.length; i++)
      if(this.arr[i] == item) return true;

    return false;
  },
  rindex : function(item){
    for(var i=this.arr.length-1; i>=0 ; i--)
      if(this.arr[i] == item) return (this.arr.length-1-i);

    return null;
  },
  index : function(item){
    for(var i=0; i<this.arr.length; i++)
      if(this.arr[i] == item) return i;

    return null;
  },
  inspect : function(){
    return "Set(" + this.arr.join(", ") + ")";
  },
  toString : function(){
    return this.inspect();
  },
  size : function(){
    return this.arr.length;
  }
});
//
// Values
//
BiwaScheme.Values = BiwaScheme.Class.create({
  initialize: function(values){
    this.content = values;
  },
  to_write: function(){
    return "#<Values " +
             _.map(this.content, BiwaScheme.to_write).join(" ") +
           ">";
  }
});

//
// Pair 
// cons cell
//

BiwaScheme.Pair = BiwaScheme.Class.create({
  initialize: function(car, cdr){
    this.car = car;
    this.cdr = cdr;
  },

  caar: function(){ return this.car.car; },
  cadr: function(){ return this.cdr.car; },
  cdar: function(){ return this.cdr.car; },
  cddr: function(){ return this.cdr.cdr; },

  first:  function(){ return this.car; },
  second: function(){ return this.cdr.car; },
  third:  function(){ return this.cdr.cdr.car; },
  fourth: function(){ return this.cdr.cdr.cdr.car; },
  fifth:  function(){ return this.cdr.cdr.cdr.cdr.car; },

  // returns array containing all the car's of list
  // '(1 2 3) => [1,2,3]
  // '(1 2 . 3) => [1,2]
  to_array: function(){
    var ary = [];
    for(var o = this; o instanceof BiwaScheme.Pair; o=o.cdr){
      ary.push(o.car);
    }
    return ary;
  },

  to_set: function(){
    var set = new BiwaScheme.Set();
    for(var o = this; o instanceof BiwaScheme.Pair; o=o.cdr){
      set.add(o.car);
    }
    return set;
  },

  length: function(){
    var n = 0;
    for(var o = this; o instanceof BiwaScheme.Pair; o=o.cdr){
      n++;
    }
    return n;
  },

  // calls the given func passing each car of list
  // returns cdr of last Pair
  foreach: function(func){
    for(var o = this; o instanceof BiwaScheme.Pair; o=o.cdr){
      func(o.car);
    }
    return o;
  },

  // Returns an array which contains the resuls of calling func
  // with the car's as an argument.
  // If the receiver is not a proper list, the last cdr is ignored.
  // The receiver must not be a cyclic list.
  map: function(func){
    var ary = [];
    for(var o = this; BiwaScheme.isPair(o); o = o.cdr){
      ary.push(func(o.car));
    }
    return ary;
  },

  // Destructively concat the given list to the receiver.
  // The receiver must be a proper list.
  // Returns the receiver.
  concat: function(list){
    var o = this;
    while(o instanceof BiwaScheme.Pair && o.cdr != BiwaScheme.nil){
      o = o.cdr;
    }
    o.cdr = list;
    return this;
  },

  // returns human-redable string of pair
  inspect: function(conv){
    conv || (conv = BiwaScheme.inspect);
    var a = [];
    var last = this.foreach(function(o){
      a.push(conv(o));
    });
    if(last != BiwaScheme.nil){
      a.push(".");
      a.push(conv(last));
    }
    return "(" + a.join(" ") + ")";
  },
  toString : function(){
    return this.inspect();
  },

  to_write: function(){
    return this.inspect(BiwaScheme.to_write);
  }
});

// Creates a list out of the arguments, optionally converting any nested arrays into nested lists if the deep argument is true.
// Example:
//   BiwaScheme.List(1, 2, [3, 4]) ;=> (list 1 2 (vector 3 4))
//   BiwaScheme.deep_array_to_list(1, 2, [3, 4]) ;=> (list 1 2 (list 3 4))
var array_to_list = function(ary, deep) {
  var list = BiwaScheme.nil;
  for(var i=ary.length-1; i>=0; i--){
    var obj = ary[i];
    if(deep && _.isArray(obj) && !obj.is_vector){
      obj = array_to_list(obj, deep);
    }
    list = new BiwaScheme.Pair(obj, list);
  }
  return list;
}

// Shallow: List(1, 2, [3]) == (list 1 2 (vector 3 4))
BiwaScheme.List = function() {
  var ary = _.toArray(arguments);
  return array_to_list(ary, false);
};

// Shallow: array_to_list(1, 2, [3]) == (list 1 2 (vector 3 4))
BiwaScheme.array_to_list = function(ary) {
  return array_to_list(ary, false);
};

// Deep: deep_array_to_list(1, 2, [3, 4]) == (list 1 2 (list 3 4))
// deep_array_to_list([1, 2, 3]) - deep
BiwaScheme.deep_array_to_list = function(ary) {
  return array_to_list(ary, true);
};
//
// Symbol
//

BiwaScheme.Symbol = BiwaScheme.Class.create({
  initialize: function(str){
    this.name = str;
    BiwaScheme.Symbols[ str ] = this;
  },

  inspect: function(){
    return "'"+this.name;
    //return "#<Symbol '"+this.name+"'>";
  },

  toString: function(){
    return "'"+this.name;
  },

  to_write: function(){
    return this.name;
  }
});
BiwaScheme.Symbols = {};
BiwaScheme.Sym = function(name,leaveCase){
  if( BiwaScheme.Symbols[name] === undefined ){
    return new BiwaScheme.Symbol(name);
  }
  else if( ! (BiwaScheme.Symbols[name] instanceof BiwaScheme.Symbol) ){ //pre-defined member (like 'eval' in Firefox)
    return new BiwaScheme.Symbol(name);
  }
  else{
    return BiwaScheme.Symbols[name];
  }
}

BiwaScheme.gensym = function(){
  return BiwaScheme.Sym(_.uniqueId("__gensym"));
};
//
// Char
//

BiwaScheme.Char = BiwaScheme.Class.create({
  initialize: function(c){
    BiwaScheme.Chars[ this.value = c ] = this;
  },
  to_write: function(){
    switch(this.value){
      case '\n': return "#\\newline";
      case ' ':  return "#\\space";
      case '\t': return "#\\tab";
      default:   return "#\\"+this.value;
    }
  },
  inspect: function(){
    return this.to_write();
  }
});
BiwaScheme.Chars = {};
BiwaScheme.Char.get = function(c) {
  if(typeof(c) != "string") {
    throw new BiwaScheme.Bug("Char.get: " +
                             BiwaScheme.inspect(c) + " is not a string");
  }
  if( BiwaScheme.Chars[c] === undefined )
    return new BiwaScheme.Char(c);
  else
    return BiwaScheme.Chars[c];
};

//
// number.js - Complex and Rational
//

BiwaScheme.Complex = BiwaScheme.Class.create({
  initialize: function(real, imag){
    this.real = real;
    this.imag = imag;
  },
  magnitude: function(){
    return Math.sqrt(this.real * this.real + this.imag * this.imag);
  },
  angle: function(){
    return Math.acos(this.real / this.magnitude());
  }
})
BiwaScheme.Complex.from_polar = function(r, theta){
  var real = r * Math.cos(theta);
  var imag = r * Math.sin(theta);
  return new BiwaScheme.Complex(real, imag);
}
BiwaScheme.Complex.assure = function(num){
  if(num instanceof BiwaScheme.Complex)
    return num
  else
    return new BiwaScheme.Complex(num, 0);
}

BiwaScheme.Rational = BiwaScheme.Class.create({
  initialize: function(numerator, denominator){
    this.numerator = numerator;
    this.denominator = denominator;
  }
})


//
// Port
//

// (eof-object)
BiwaScheme.eof = new Object;

BiwaScheme.Port = BiwaScheme.Class.create({
  initialize: function(is_in, is_out){
    this.is_open = true;
    this.is_binary = false; //??
    this.is_input = is_in;
    this.is_output = is_out;
  },
  close: function(){
    // close port
    this.is_open = false;
  },
  inspect: function(){
    return "#<Port>";
  },
  to_write: function(){
    return "#<Port>";
  }
});
BiwaScheme.Port.BrowserInput = BiwaScheme.Class.extend(new BiwaScheme.Port(true, false), {
  initialize: function(){
  },
  get_string: function(after){
    var form = $("<form/>");
    form.html("<input id='webscheme-read-line' type='text'><input type='submit' value='ok'>");
    $("#bs-console").append(form);

    return new BiwaScheme.Pause(function(pause){
      form.submit(function(){
        var input = $("#webscheme-read-line").val();
        form.remove();
        puts(input);
        pause.resume(after(input));
        return false;
      });
    });
  }
})
BiwaScheme.Port.DefaultOutput = BiwaScheme.Class.extend(new BiwaScheme.Port(false, true), {
  initialize: function(){
  },
  put_string: function(str){
    puts(str, true);
  }
})

//
// string ports (srfi-6)
//
BiwaScheme.Port.StringOutput = BiwaScheme.Class.extend(new BiwaScheme.Port(false, true), {
  initialize: function(){
    this.buffer = [];
  },
  put_string: function(str){
    this.buffer.push(str);
  },
  output_string: function(str){
    return this.buffer.join("");
  }
});
BiwaScheme.Port.StringInput = BiwaScheme.Class.extend(new BiwaScheme.Port(true, false), {
  initialize: function(str){
    this.str = str;
  },
  get_string: function(after){
    return after(this.str);
  }
});
BiwaScheme.Port.current_input  = new BiwaScheme.Port.BrowserInput();
BiwaScheme.Port.current_output = new BiwaScheme.Port.DefaultOutput();
BiwaScheme.Port.current_error  = new BiwaScheme.Port.DefaultOutput();
//
// R6RS Records
// http://www.r6rs.org/final/html/r6rs-lib/r6rs-lib-Z-H-7.html#node_chap_6
//
// Record is like struct in C, but supports more feature like inheritance.
// see also: src/library/r6rs_lib.js

//
// Record 
// represents each instance of record type
//
BiwaScheme.Record = BiwaScheme.Class.create({
  initialize: function(rtd, values){
    BiwaScheme.assert_record_td(rtd, "new Record");

    this.rtd = rtd;
    this.fields = values;
  },

  get: function(k){
    return this.fields[k]
  },

  set: function(k, v){
    this.fields[k] = v;
  },

  toString: function(){
    var contents = BiwaScheme.to_write(this.fields);
    return "#<Record "+this.rtd.name+" "+contents+">";
  }
});

BiwaScheme.isRecord = function(o){
  return (o instanceof BiwaScheme.Record);
};

// Defined record types
BiwaScheme.Record._DefinedTypes = {};

BiwaScheme.Record.define_type = function(name_str, rtd, cd){
  return BiwaScheme.Record._DefinedTypes[name_str] = {rtd: rtd, cd: cd};
};
BiwaScheme.Record.get_type = function(name_str){
  return BiwaScheme.Record._DefinedTypes[name_str];
};

//
// RTD (Record type descriptor)
//
BiwaScheme.Record.RTD = BiwaScheme.Class.create({
  //                   Symbol RTD        Symbol Bool  Bool    Array
  initialize: function(name, parent_rtd, uid, sealed, opaque, fields){
    this.name = name;
    this.parent_rtd = parent_rtd;
    this.is_base_type = !parent_rtd;

    if(uid){
      this.uid = uid;
      this.generative = false;
    }
    else{
      this.uid = this._generate_new_uid();;
      this.generative = true;
    }

    this.sealed = !!sealed;
    this.opaque = parent_rtd.opaque || (!!opaque);

    this.fields = _.map(fields, function(field){
      return {name: field[0], mutable: !!field[1]};
    });
  },

  // Returns the name of the k-th field.
  // Only used for error messages.
  field_name: function(k){
    var names = this._field_names();

    for(par = this.parent_rtd; par; par = par.parent_rtd){
      names = par._field_names() + names;
    }

    return names[k];
  },
  _field_names: function(){
    return _.map(this.fields, function(spec){
        return spec.name;
      });
  },

  _generate_new_uid: function(){
    return BiwaScheme.Sym(_.uniqueId("__record_td_uid"));
  },

  toString: function(){
    return "#<RecordTD "+name+">";
  }
});

BiwaScheme.Record.RTD.NongenerativeRecords = {};
BiwaScheme.isRecordTD = function(o){
  return (o instanceof BiwaScheme.Record.RTD);
};

//
// CD (Record constructor descriptor)
//
BiwaScheme.Record.CD = BiwaScheme.Class.create({
  initialize: function(rtd, parent_cd, protocol){
    this._check(rtd, parent_cd, protocol);
    this.rtd = rtd;
    this.parent_cd = parent_cd;
    if(protocol){
      this.has_custom_protocol = true;
      this.protocol = protocol;
    }
    else{
      this.has_custom_protocol = false;
      if(rtd.parent_rtd)
        this.protocol = this._default_protocol_for_derived_types();
      else
        this.protocol = this._default_protocol_for_base_types();
    }
  },

  _check: function(rtd, parent_cd, protocol){
    if(rtd.is_base_type && parent_cd)
      throw new Error("Record.CD.new: cannot specify parent cd of a base type");

    if(parent_cd && rtd.parent_rtd && (parent_cd.rtd != rtd.parent_rtd))
      throw new Error("Record.CD.new: mismatched parents between rtd and parent_cd");

    if(rtd.parent_rtd && !parent_cd && protocol)
      throw new Error("Record.CD.new: protocol must be #f when parent_cd is not given");

    if(parent_cd && parent_cd.has_custom_protocol && !protocol)
      throw new Error("Record.CD.new: protocol must be specified when parent_cd has a custom protocol");
  },
  
  _default_protocol_for_base_types: function(){
    // (lambda (p) p)
    // called with `p' as an argument
    return function(ar){
      var p = ar[0];
      BiwaScheme.assert_procedure(p, "_default_protocol/base");
      return p;
    };
  },

  _default_protocol_for_derived_types: function(){
    // (lambda (n) 
    //   (lambda (a b x y s t)
    //     (let1 p (n a b x y) (p s t))))
    // called with `n' as an argument
    var rtd = this.rtd;
    return function(ar){
      var n = ar[0];
      BiwaScheme.assert_procedure(n, "_default_protocol/n");

      var ctor = function(args){
        var my_argc = rtd.fields.length;
        var ancestor_argc = args.length - my_argc;

        var ancestor_values = args.slice(0, ancestor_argc);
        var my_values       = args.slice(ancestor_argc);

        // (n a b x y) => p
        return new BiwaScheme.Call(n, ancestor_values, function(ar){
          var p = ar[0];
          BiwaScheme.assert_procedure(p, "_default_protocol/p");

          // (p s t) => record
          return new BiwaScheme.Call(p, my_values, function(ar){
            var record = ar[0];
            BiwaScheme.assert_record(record, "_default_protocol/result");

            return record;
          });
        });
      };
      return ctor;
    };
  },

  toString: function(){
    return "#<RecordCD "+this.rtd.name+">";
  },

  record_constructor: function(){
    var arg_for_protocol = (this.parent_cd ? this._make_n([], this.rtd)
                                           : this._make_p());
    arg_for_protocol = _.bind(arg_for_protocol, this);

    return new BiwaScheme.Call(this.protocol, [arg_for_protocol], function(ar){
      var ctor = ar[0];
      BiwaScheme.assert_procedure(ctor, "record_constructor");
      return ctor;
    });
  },

  // Create the function `p' which is given to the protocol.
  _make_p: function(){
    return function(values){
      return new BiwaScheme.Record(this.rtd, values);
      // TODO: check argc 
    };
  },

  // Create the function `n' which is given to the protocol.
  // When creating an instance of a derived type,
  // _make_n is called for each ancestor rtd's.
  _make_n: function(children_values, rtd){
    var parent_cd = this.parent_cd;

    if(parent_cd){
      // called from protocol (n)
      var n = function(args_for_n){

        // called from protocol (p)
        var p = function(args_for_p){
          var values = [].concat(args_for_p[0]).concat(children_values)
          var parent_n = parent_cd._make_n(values, rtd);

          return new BiwaScheme.Call(parent_cd.protocol, [parent_n], function(ar){
            var ctor = ar[0];
            BiwaScheme.assert_procedure(ctor, "_make_n");

            return new BiwaScheme.Call(ctor, args_for_n, function(ar){
              var record = ar[0];
              BiwaScheme.assert_record(record);
              return record;
            });
          });
        };
        return p;
      };
      return n;
    }
    else{
      var n = function(my_values){
        var values = my_values.concat(children_values);
        return new BiwaScheme.Record(rtd, values);
        // TODO: check argc 
      };
      return n;
    }
  }
});

BiwaScheme.isRecordCD = function(o){
  return (o instanceof BiwaScheme.Record.CD);
};
// 
// R6RS Enumerations
// http://www.r6rs.org/final/html/r6rs-lib/r6rs-lib-Z-H-15.html#node_chap_14
//
// Example
//
//   (define-enumeration color
//     (black white purple maroon)
//     color-set)
//   
//   (color black)                  ;=> 'black
//   (color purpel)                 ;=> &syntax exception
//   (enum-set->list
//     (color-set maroon white))    ;=> #<enum-set (white maroon)>

BiwaScheme.Enumeration = {};

// Represents an enum_type.
//
// Becuase there is no way to access an EnumType directly from Scheme,
// EnumType#to_write is not defined.
//
// Properties
//
// members - Array of symbols (no duplicate)
//
BiwaScheme.Enumeration.EnumType = BiwaScheme.Class.create({
  // Creates a new enum_type.
  //
  // members - Array of symbols.
  //           Symbols may be duplicate (I think you shouldn't, though :-p).
  initialize: function(members){
    this.members = _.uniq(members);
  },

  // Returns an EnumSet.
  universe: function(){
    return new BiwaScheme.Enumeration.EnumSet(this, this.members);
  }, 

  // Returns a function which map a symbol to an integer (or #f, if 
  // the symbol is out of the universe).
  // 
  // Implementation note: don't forget this.members may have duplicates.
  indexer: function(){
    // ar[0] - a symbol
    // Returns an integer or #f.
    return _.bind(function(ar){
      BiwaScheme.assert_symbol(ar[0], "(enum-set indexer)");
      var idx = _.indexOf(this.members, ar[0]);
      return (idx === -1) ? false : idx;
    }, this);
  },

  // Retuns a function which creates an enum_set from a list of
  // symbols (Symbols may be duplicate.)
  constructor: function(){
    // ar[0] - a list of symbol
    // Returns a enum_set.
    return _.bind(function(ar){
      BiwaScheme.assert_list(ar[0], "(enum-set constructor)");
      var symbols = ar[0].to_array();
      _.each(symbols, function(arg){
        BiwaScheme.assert_symbol(arg, "(enum-set constructor)");
      });

      return new BiwaScheme.Enumeration.EnumSet(this, symbols);
    }, this);
  }
});
BiwaScheme.Class.memoize(BiwaScheme.Enumeration.EnumType,
  ["universe", "indexer", "constructor"]); 

// Represents an enum_set of an enum_type.
//
// Properties
//
// enum_type - The enum_type.
// symbols   - Array of symbols (no duplicate, properly ordered)
//
BiwaScheme.Enumeration.EnumSet = BiwaScheme.Class.create({
  // Creates a new enum_set.
  //
  // enum_type - An EnumType
  // symbols   - Array of symbols.
  //
  // initialize normalizes symbols.
  //   - remove duplicates
  //   - order by universe
  initialize: function(enum_type, symbols){
    this.enum_type = enum_type;
    this.symbols = _.filter(enum_type.members, function(sym){
      return _.include(symbols, sym);
    });
  },

  // Returns a list of symbols.
  symbol_list: function(){
    return BiwaScheme.array_to_list(this.symbols); 
  },
  
  // Returns true if the enum_set includes the symbol.
  // 'symbol' is allowed to be a symbol which is not included in the universe.
  is_member: function(symbol){
    return _.include(this.symbols, symbol);
  },
  
  // Returns true if:
  // - the enum_set is a subset of the enum_set 'other', and
  // - the universe of the enum_set is a subset of 
  //   the universe of 'other'.
  // The enum_set and 'other' may belong to different enum_type.
  is_subset: function(other){
    // Check elements
    if(_.any(this.symbols, function(sym){
         return !_.include(other.symbols, sym);
       })){
      return false;
    }

    // Check universe
    if(this.enum_type === other.enum_type){
      return true;
    }
    else{
      return _.all(this.enum_type.members, function(sym){
               return _.include(other.enum_type.members, sym);
             });
    }
  },

  // Returns true if:
  //   - the enum_set contains the same set of symbols as 'other', and
  //   - universe of the enum_set contains the same set of symbols
  //     as the universe of 'other'.
  //
  // The enum_set and 'other' may belong to different enum_type.
  equal_to: function(other){
    return this.is_subset(other) && other.is_subset(this);
  },

  // Returns a enum_set which has:
  // - all the symbols included in the enum_set or the enum_set 'other'.
  // The enum_set and 'other' *must* belong to the same enum_type.
  union: function(other){
    var syms = _.filter(this.enum_type.members, _.bind(function(sym){
                 return _.include(this.symbols, sym) ||
                        _.include(other.symbols, sym);
               }, this));
    return new BiwaScheme.Enumeration.EnumSet(this.enum_type, syms);
  },

  // Returns a enum_set which has:
  // - the symbols included both in the enum_set or the enum_set 'other'.
  // The enum_set and 'other' *must* belong to the same enum_type.
  intersection: function(other){
    var syms = _.filter(this.symbols, function(sym){
                 return _.include(other.symbols, sym);
               });
    return new BiwaScheme.Enumeration.EnumSet(this.enum_type, syms);
  },

  // Returns a enum_set which has:
  // - the symbols included in the enum_set and not in the enum_set 'other'.
  // The enum_set and 'other' *must* belong to the same enum_type.
  difference: function(other){
    var syms = _.filter(this.symbols, function(sym){
                 return !_.include(other.symbols, sym);
               });
    return new BiwaScheme.Enumeration.EnumSet(this.enum_type, syms);
  },

  // Returns a enum_set which has:
  // - the symbols included in the universe but not in the enum_set.
  complement: function(){
    var syms = _.filter(this.enum_type.members, _.bind(function(sym){
                 return !_.include(this.symbols, sym);
               }, this));
    return new BiwaScheme.Enumeration.EnumSet(this.enum_type, syms);
  },

  // Returns a enum_set which has:
  // - the symbols included in the enum_set and the universe of the enum_set 'other'.
  // The enum_set and 'other' may belong to different enum_type.
  projection: function(other){
    var syms = _.filter(this.symbols, function(sym){
                 return _.include(other.enum_type.members, sym);
               });
    return new BiwaScheme.Enumeration.EnumSet(other.enum_type, syms);
  },

  // Returns a string which represents the enum_set.
  toString: function(){
    return "#<EnumSet "+BiwaScheme.inspect(this.symbols)+">";
  }
});
BiwaScheme.Class.memoize(BiwaScheme.Enumeration.EnumSet, "symbol_list");

BiwaScheme.isEnumSet = function(obj){
  return (obj instanceof BiwaScheme.Enumeration.EnumSet);
};
//
// Hashtable
//
// Based on the base JavaScript Object class, but
//  * Object takes only strings as keys
//  * R6RS hashtable needs its own hash function
// so some hacks are needed.

BiwaScheme.Hashtable = BiwaScheme.Class.create({
  initialize: function(_hash_proc, _equiv_proc, mutable){
    this.mutable = (mutable === undefined) ? true :
                   mutable ? true : false;

    this.hash_proc = _hash_proc;
    this.equiv_proc = _equiv_proc;

    // Hash (hashed) => (array of (key and value))
    this.pairs_of = {};
  },

  clear: function(){
    this.pairs_of = {};
  },

  candidate_pairs: function(hashed){
    return this.pairs_of[hashed];
  },

  add_pair: function(hashed, key, value){
    var pairs = this.pairs_of[hashed];

    if (pairs) {
      pairs.push([key, value]);
    }
    else {
      this.pairs_of[hashed] = [[key, value]];
    }
  },

  remove_pair: function(hashed, pair){
    var pairs = this.pairs_of[hashed];
    var i = pairs.indexOf(pair);
    if (i == -1){
      throw new BiwaScheme.Bug("Hashtable#remove_pair: pair not found!");
    }
    else {
      pairs.splice(i, 1); //remove 1 element from i-th index
    }
  },

  create_copy: function(mutable){
    var copy = new BiwaScheme.Hashtable(this.hash_proc, this.equiv_proc,
                                        mutable);
    // clone the pairs to copy
    _.each(_.keys(this.pairs_of), _.bind(function(hashed){
      var pairs = this.pairs_of[hashed];
      var cloned = _.map(pairs, function(pair){
        return _.clone(pair);
      });
      copy.pairs_of[hashed] = cloned;
    }, this));

    return copy;
  },

  size: function(){
    var n = 0;
    this._apply_pair(function(pair){
      n++;
    });
    return n;
  },

  keys: function(){
    return this._apply_pair(function(pair){
      return pair[0];
    });
  },

  values: function(){
    return this._apply_pair(function(pair){
      return pair[1];
    });
  },

  _apply_pair: function(func){
    var a = [];
    _.each(_.values(this.pairs_of), function(pairs){
      _.each(pairs, function(pair){
        a.push(func(pair));
      });
    });
    return a;
  },

  to_write: function(){
    return "#<Hashtable size=" + this.size() + ">";
  }
});

//
// Hash functions
//

BiwaScheme.Hashtable.equal_hash = function(ar){
  return BiwaScheme.to_write(ar[0]);
};
BiwaScheme.Hashtable.eq_hash = BiwaScheme.Hashtable.equal_hash;
BiwaScheme.Hashtable.eqv_hash = BiwaScheme.Hashtable.equal_hash;

BiwaScheme.Hashtable.string_hash = function(ar){
  return ar[0];
};

BiwaScheme.Hashtable.string_ci_hash = function(ar){
  return _.isString(ar[0]) ? ar[0].toLowerCase() : ar[0];
};

BiwaScheme.Hashtable.symbol_hash = function(ar){
  return (ar[0] instanceof BiwaScheme.Symbol) ? ar[0].name : ar[0];
};

//
// Equivalence functions
//

BiwaScheme.Hashtable.eq_equiv = function(ar){
  return BiwaScheme.eq(ar[0], ar[1]);
};

BiwaScheme.Hashtable.eqv_equiv = function(ar){
  return BiwaScheme.eqv(ar[0], ar[1]);
};
//
// Syntax
//
BiwaScheme.Syntax = BiwaScheme.Class.create({
  initialize: function(sname, func){
    this.sname = sname;
    this.func = func;
  },
  transform: function(x){
    if (!this.func){
      throw new BiwaScheme.Bug("sorry, syntax "+this.sname+
                               " is a pseudo syntax now");
    }
    return this.func(x);
  },
  inspect: function(){
    return "#<Syntax " + this.sname +">";
  }
})

// A built-in syntax did not have associated Syntax object.
// Following code installed dummy Syntax objects to built-in syntax.
BiwaScheme.TopEnv["define"] = new BiwaScheme.Syntax("define");
BiwaScheme.TopEnv["begin"]  = new BiwaScheme.Syntax("begin");
BiwaScheme.TopEnv["quote"]  = new BiwaScheme.Syntax("quote");
BiwaScheme.TopEnv["lambda"] = new BiwaScheme.Syntax("lambda");
BiwaScheme.TopEnv["if"]     = new BiwaScheme.Syntax("if");
BiwaScheme.TopEnv["set!"]   = new BiwaScheme.Syntax("set!");
  //
  // Parser 
  // copied from jsScheme - should be rewrriten (support #0=, etc)
  //
  BiwaScheme.Parser = BiwaScheme.Class.create({
    initialize: function(txt){
      this.tokens = this.tokenize(txt);
      this.i = 0;
    },

    inspect: function(){
      return [
        "#<Parser:",
        this.i, "/", this.tokens.length, " ",
        BiwaScheme.inspect(this.tokens),
        ">"
      ].join("");
    },

    tokenize: function(txt) {
      var tokens = new Array(), oldTxt=null;
      var in_srfi_30_comment = 0;

      while( txt != "" && oldTxt != txt ) {
        oldTxt = txt;
        txt = txt.replace( /^\s*(;[^\r\n]*(\r|\n|$)|#;|#\||#\\[^\w]|#?(\(|\[|{)|\)|\]|}|\'|`|,@|,|\+inf\.0|-inf\.0|\+nan\.0|\"(\\(.|$)|[^\"\\])*(\"|$)|[^\s()\[\]{}]+)/,
        function($0,$1) {
          var t = $1;

          if (t == "#|") {
            in_srfi_30_comment++;
            return "";
          }
          else if (in_srfi_30_comment > 0) {
            if ( /(.*\|#)/.test(t) ) {
              in_srfi_30_comment--;
              if (in_srfi_30_comment < 0) {
                throw new BiwaScheme.Error("Found an extra comment terminator: `|#'")
              }
              // Push back the rest substring to input stream.
              return t.substring(RegExp.$1.length, t.length);
            }
            else {
              return "";
            }
          }
          else {
            if( t.charAt(0) != ';' ) tokens[tokens.length]=t;
            return "";
          }
        } );
      }
      return tokens;
    },

    sexpCommentMarker: new Object,
    getObject: function() {
      var r = this.getObject0();

      if (r != this.sexpCommentMarker)
        return r;

      r = this.getObject();
      if (r == BiwaScheme.Parser.EOS)
        throw new BiwaScheme.Error("Readable object not found after S exression comment");

      r = this.getObject();
      return r;
    },
    
    getList: function( close ) {
      var list = BiwaScheme.nil, prev = list;
      while( this.i < this.tokens.length ) {

        this.eatObjectsInSexpComment("Input stream terminated unexpectedly(in list)");

        if( this.tokens[ this.i ] == ')' || this.tokens[ this.i ] == ']' || this.tokens[ this.i ] == '}' ) {
          this.i++; break;
        }

        if( this.tokens[ this.i ] == '.' ) {
          this.i++;
          var o = this.getObject();
          if( o != BiwaScheme.Parser.EOS && list != BiwaScheme.nil ) {
            prev.cdr = o;
          }
        } else {
            var cur = new BiwaScheme.Pair( this.getObject(), BiwaScheme.nil);
            if( list == BiwaScheme.nil ) list = cur;
            else prev.cdr = cur;
            prev = cur;
        }
      }
      return list;
    },

    getVector: function( close ) {
      var arr = new Array();
      while( this.i < this.tokens.length ) {
        
        this.eatObjectsInSexpComment("Input stream terminated unexpectedly(in vector)");
        
        if( this.tokens[ this.i ] == ')' ||
        this.tokens[ this.i ] == ']' ||
        this.tokens[ this.i ] == '}' ) { this.i++; break; }
        arr[ arr.length ] = this.getObject();
      }
      return arr;
    },

    eatObjectsInSexpComment: function(err_msg) {
      while( this.tokens[ this.i ] == '#;' ) {
        this.i++;
        if ((this.getObject() == BiwaScheme.Parser.EOS) || (this.i >= this.tokens.length))
          throw new BiwaScheme.Error(err_msg);  
      }
    }, 

    getObject0: function() {
      if( this.i >= this.tokens.length )
        return BiwaScheme.Parser.EOS;

      var t = this.tokens[ this.i++ ];
      // if( t == ')' ) return null;

      if (t == '#;')
        return this.sexpCommentMarker;

      var s = t == "'"  ? 'quote' :
              t == "`"  ? 'quasiquote' :
              t == ","  ? 'unquote' :
              t == ",@" ? 'unquote-splicing' : false;

      if( s || t == '(' || t == '#(' || t == '[' || t == '#[' || t == '{' || t == '#{' ) {
        return s ? new BiwaScheme.Pair( BiwaScheme.Sym(s), new BiwaScheme.Pair( this.getObject(), BiwaScheme.nil ))
        : (t=='(' || t=='[' || t=='{') ? this.getList(t) : this.getVector(t);
      } 
      else {
        switch(t){
          case "+inf.0" : return Infinity;
          case "-inf.0" : return -Infinity;
          case "+nan.0" : return NaN;
        }

        var n;
        if( /^#x[0-9a-z]+$/i.test(t) ) {  // #x... Hex
          n = new Number('0x'+t.substring(2,t.length) );
        } 
        else if( /^#d[0-9\.]+$/i.test(t) ) {  // #d... Decimal
          n = new Number( t.substring(2,t.length) );
        } 
        else{
          n = new Number(t);  // use constrictor as parser
        }

        if( ! isNaN(n) ) {
          return n.valueOf();
        } else if( t == '#f' || t == '#F' ) {
          return false;
        } else if( t == '#t' || t == '#T' ) {
          return true;
        } else if( t.toLowerCase() == '#\\newline' ) {
          return BiwaScheme.Char.get('\n');
        } else if( t.toLowerCase() == '#\\space' ) {
          return BiwaScheme.Char.get(' ');
        } else if( t.toLowerCase() == '#\\tab' ) {
          return BiwaScheme.Char.get('\t');
        } else if( /^#\\.$/.test(t) ) {
          return BiwaScheme.Char.get( t.charAt(2) );
        } else if( /^\"(\\(.|$)|[^\"\\])*\"?$/.test(t) ) {
          return t.replace(/(\r?\n|\\n)/g, "\n").replace( /^\"|\\(.|$)|\"$/g, function($0,$1) {
            return $1 ? $1 : '';
          } );
        } else return BiwaScheme.Sym(t);  // 2Do: validate !!
      }
    }
  });
  // indicates end of source file
  BiwaScheme.Parser.EOS = new Object();
  

///
/// Compiler
///
/// Note: macro expansion is done by Intepreter#expand

BiwaScheme.Compiler = BiwaScheme.Class.create({
  initialize: function(){
  },

  is_tail: function(x){
    return (x[0] == "return");
  },

  //free: set
  //e: env(= [locals, frees])
  //next: opc
  //ret: opc["refer_*", n, ["argument", 
  //          ["refer_*", n, ... ["argument", next]
  collect_free: function(free, e, next){
    var vars = free;
    var opc = next;
    var arr = vars.arr;
    for(var i=0; i<arr.length; i++){
      opc = this.compile_refer(arr[i], e, ["argument", opc]);
    }
    //puts("collect_free "+free.inspect()+" / "+e.inspect()+" => "+opc.inspect());
    return opc;
  },

  //x: Symbol
  //e: env [set of locals, set of frees]
  //ret: opc
  compile_refer: function(x, e, next){
    return this.compile_lookup(x, e,
             function(n){ return ["refer-local", n, next] },
             function(n){ return ["refer-free",  n, next] },
             function(sym){ return ["refer-global", sym, next] });
  },

  compile_lookup: function(x, e, return_local, return_free, return_global){
    var locals = e[0], free = e[1];
    if((n = locals.index(x)) != null){
      //puts("compile_refer:"+x.inspect()+" in "+e.inspect()+" results refer-local "+n);
      return return_local(n);
    }
    else if((n = free.index(x)) != null){
      //puts("compile_refer:"+x.inspect()+" in "+e.inspect()+" results refer-free "+n);
      return return_free(n);
    }
    else{
      var sym = x.name;
      return return_global(sym);
    }
    //throw new BiwaScheme.Error("undefined symbol `" + sym + "'");
  },

  //generate boxing code (intersection of sets & vars)
  //if no need of boxing, just returns next
  //  sets(Set): assigned variables 
  //  vars(List): used variables
  //  next(opc):
  //  ret(opc):
  make_boxes: function(sets, vars, next){
    var vars = vars;
    var n = 0;
    var a = [];
    while(vars instanceof BiwaScheme.Pair){
      if(sets.member(vars.car))
        a.push(n);
      n++;
      vars = vars.cdr;
    }
    var opc = next;
    for(var i=a.length-1; i>=0; i--)
      opc = ["box", a[i], opc];
    return opc;
  },

  // Enumerate variables which (could be assigned && included in v)
  // x: exp
  // v: set(vars)
  // ret: set
  find_sets: function(x, v){
    //puts("find_sets: " + to_write(x) + " " + to_write(v))
    var ret=null;
    if(x instanceof BiwaScheme.Symbol){
      ret = new BiwaScheme.Set();
    }
    else if(x instanceof BiwaScheme.Pair){
      switch(x.first()){
      case BiwaScheme.Sym("define"):
        var exp=x.third();
        ret = this.find_sets(exp, v);
      case BiwaScheme.Sym("begin"):
        ret = this.find_sets(x.cdr, v); //(ignores improper list)
        break;
      case BiwaScheme.Sym("quote"):
        ret = new BiwaScheme.Set();
        break;
      case BiwaScheme.Sym("lambda"):
        var vars=x.second(), body=x.cdr.cdr;
        if (vars instanceof BiwaScheme.Pair){ // (lambda (...) ...)
          ret = this.find_sets(body, v.set_minus(vars.to_set()));
        }
        else { // (lambda args ...)
          ret = this.find_sets(body, v.set_minus(new BiwaScheme.Set(vars)));
        }
        break;
      case BiwaScheme.Sym("if"):
        var testc=x.second(), thenc=x.third(), elsec=x.fourth();
        ret = this.find_sets(testc, v).set_union(
                        this.find_sets(thenc, v),
                        this.find_sets(elsec, v));
        break;
      case BiwaScheme.Sym("set!"):
        var vari=x.second(), xx=x.third();
        if(v.member(vari))
          ret = this.find_sets(xx, v).set_cons(vari);
        else
          ret = this.find_sets(xx, v);
        break;
      case BiwaScheme.Sym("call/cc"):
        var exp=x.second();
        ret = this.find_sets(exp, v);
        break;
      default:
        var set = new BiwaScheme.Set();
        for(var p=x; p instanceof BiwaScheme.Pair; p=p.cdr){
          set = set.set_union(this.find_sets(p.car, v));
        }
        ret = set;
        break;
      }
    }
    else{
      ret = new BiwaScheme.Set();
    }

    if(ret == null)
      throw new BiwaScheme.Bug("find_sets() exited in unusual way");
    else
      return ret;
  },

  // find_free(): find free variables in x
  //              these variables are collected by collect_free().
  // x: expression 
  // b: set of local vars (= variables which are not free)
  // f: set of free var candidates 
  //    (local vars of outer lambdas)
  // ret: set of free vars
  find_free: function(x, b, f){
    var ret=null;
    if(x instanceof BiwaScheme.Symbol){
      if(f.member(x))
        ret = new BiwaScheme.Set(x);
      else
        ret = new BiwaScheme.Set();
    }
    else if(x instanceof BiwaScheme.Pair){
      switch(x.first()){
      case BiwaScheme.Sym("define"):
        var exp=x.third();
        ret = this.find_free(exp, b, f);
        break;
      case BiwaScheme.Sym("begin"):
        ret = this.find_free(x.cdr, b, f); //(ignores improper list)
        break;
      case BiwaScheme.Sym("quote"):
        ret = new BiwaScheme.Set();
        break;
      case BiwaScheme.Sym("lambda"):
        var vars=x.second(), body=x.cdr.cdr;
        if (vars instanceof BiwaScheme.Pair){ // (lambda (...) ...)
          ret = this.find_free(body, b.set_union(vars.to_set()), f);
        }
        else { // (lambda args ...)
          ret = this.find_free(body, b.set_cons(vars), f);
        }
        break;
      case BiwaScheme.Sym("if"):
        var testc=x.second(), thenc=x.third(), elsec=x.fourth();
        ret = this.find_free(testc, b, f).set_union(
                        this.find_free(thenc, b, f),
                        this.find_free(elsec, b, f));
        break;
      case BiwaScheme.Sym("set!"):
        var vari=x.second(), exp=x.third();
        if(f.member(vari))
          ret = this.find_free(exp, b, f).set_cons(vari);
        else
          ret = this.find_free(exp, b, f)
        break;
      case BiwaScheme.Sym("call/cc"):
        var exp=x.second();
        ret = this.find_free(exp, b, f);
        break;
      default:
        var set = new BiwaScheme.Set();
        for(var p=x; p instanceof BiwaScheme.Pair; p=p.cdr){
          set = set.set_union(this.find_free(p.car, b, f));
        }
        ret = set;
        break;
      }
    }
    else{
      ret = new BiwaScheme.Set();
    }
    //p("find_free "+x.inspect()+" / "+b.inspect()+" => "+ret.inspect());

    if(ret == null)
      throw new BiwaScheme.Bug("find_free() exited in unusual way");
    else
      return ret;
  },

  // Returns the position of the dot pair.
  // Returns -1 if x is a proper list.
  //
  // eg. (a b . c) -> 2
  find_dot_pos: function(x){
    var idx = 0;
    for (; x instanceof BiwaScheme.Pair; x = x.cdr, ++idx)
      ;
    if (x != BiwaScheme.nil) {
      return idx;
    } else {
      return -1;
    }
  },

  last_pair: function(x){
    if (x instanceof BiwaScheme.Pair){
      for (; x.cdr instanceof BiwaScheme.Pair; x = x.cdr)
        ;
    }
    return x;
  },

  // Takes an dotted list and returns proper list.
  //
  // eg. (x y . z) -> (x y z)
  dotted2proper: function(ls){
    var nreverse = function(ls){
      var res = BiwaScheme.nil;
      for (; ls instanceof BiwaScheme.Pair; ){
        var d = ls.cdr;
        ls.cdr = res;
        res = ls;
        ls = d;
      }
      return res;
    }
    var copy_list = function(ls){
      var res = BiwaScheme.nil;
      for (; ls instanceof BiwaScheme.Pair; ls = ls.cdr){
        res = new BiwaScheme.Pair(ls.car, res);
      }
      return nreverse(res);
    }

    if (ls instanceof BiwaScheme.Pair) {
      var last = this.last_pair(ls);
      if (last instanceof BiwaScheme.Pair && last.cdr === BiwaScheme.nil){
        return ls;
      } else {
        var copied = copy_list(ls);
        this.last_pair(copied).cdr = new BiwaScheme.Pair(last.cdr, BiwaScheme.nil);
        return copied;
      }
    } else {
      return new BiwaScheme.Pair(ls, BiwaScheme.nil);
    }
  },

  // x: exp(list of symbol or integer or..)
  // e: env (= [locals, frees])
  // s: vars might be set!
  // next: opc
  // ret: opc
  compile: function(x, e, s, f, next){
    //p(x);
    var ret = null;

    while(1){
      if(x instanceof BiwaScheme.Symbol){
        // Variable reference
        // compiled into refer-(local|free|global)
        return this.compile_refer(x, e, (s.member(x) ? ["indirect", next] : next));
      }
      else if(x instanceof BiwaScheme.Pair){
        switch(x.first()){
        case BiwaScheme.Sym("define"):
          ret = this._compile_define(x, next);

          x = ret[0];
          next = ret[1];
          break;

        case BiwaScheme.Sym("begin"):
          var a = [];
          for(var p=x.cdr; p instanceof BiwaScheme.Pair; p=p.cdr)
            a.push(p.car);

          //compile each expression (in reverse order)
          var c = next;
          for(var i=a.length-1; i>=0; i--){
            c = this.compile(a[i], e, s, f, c);
          }
          return c;

        case BiwaScheme.Sym("quote"):
          if(x.length() < 2)
              throw new BiwaScheme.Error("Invalid quote: "+x.to_write());

          var obj=x.second();
          return ["constant", obj, next];

        case BiwaScheme.Sym("lambda"):
          return this._compile_lambda(x, e, s, f, next);

        case BiwaScheme.Sym("if"):
          if(x.length() < 3 || x.length() > 4)
              throw new BiwaScheme.Error("Invalid if: "+x.to_write());

          var testc=x.second(), thenc=x.third(), elsec=x.fourth();
          var thenc = this.compile(thenc, e, s, f, next);
          var elsec = this.compile(elsec, e, s, f, next);
          x    = testc;
          next = ["test", thenc, elsec];
          break;

        case BiwaScheme.Sym("set!"):
          // error-checking: should have only 3 things
          if(x.length() != 3)
              throw new BiwaScheme.Error("Invalid set!: "+x.to_write());

          var v=x.second(), x=x.third();
          var do_assign = this.compile_lookup(v, e,
            function(n){ return ["assign-local", n, next]; },
            function(n){ return ["assign-free",  n, next]; },
            function(sym){ return ["assign-global",sym, next]; }
          );
          next = do_assign;
          break;

        case BiwaScheme.Sym("call/cc"): 
          var x=x.second();
          var c = ["conti", 
                    (this.is_tail(next) ? (e[0].size() + 1) : 0), //number of args for outer lambda
                    ["argument",
                    ["constant", 1,
                    ["argument",
                      this.compile(x, e, s,f,  
                        (this.is_tail(next) ? ["shift", 1, ["tco_hinted_apply"]]
                                            : ["apply"]))]]]];
                  //note: proc for call/cc takes 1 argument (= ["apply", 1])
          return this.is_tail(next) ? c : ["frame", c, next];

        default: 
          //apply 
          //x = (func 1 2) 
          //x.car = func = '(lambda (x) ..) or Symbol
          //x.cdr = args = '(1 2)
          var func = x.car;
          var args = x.cdr;
          var c = this.compile(func, e, s,f,  
                    this.is_tail(next) ? ["shift", args.length(), ["tco_hinted_apply"]]
                                       : ["apply"]);

          // VM will push the number of arguments to the stack.
          c = this.compile(args.length(), e, s, f, ["argument", c]);
          for(var p=args; p instanceof BiwaScheme.Pair; p=p.cdr){
            c = this.compile(p.car, e, s, f, ["argument", c]);
          }
          return this.is_tail(next) ? c : ["frame", c, next];
        }
      }
      else{
        return ["constant", x, next];
      }
    }
    //p("result of " + x.inspect() + ":");
    //p(ret);
    //dump({"ret":ret, "x":x, "e":e, "s":s, "next":next, "stack":[]});
//      if(ret == null)
//        throw new BiwaScheme.Bug("compile() exited in unusual way");
//      else
//        return ret;
  },

  // Compile define.
  //
  // 0. (define) ; => error
  // 1. (define a)
  // 2. (define a 1)
  // 3. (define a 1 2) ; => error
  // 4. (define (f x) x), (define (f . a) a)
  // 5. (define 1 2) 
  //
  // Note: define may appear in lambda, let, let*, let-values,
  // let*-values, letrec, letrec*. These definitions are local to the
  // <body> of these forms.
  _compile_define: function(x, next){
    if(x.length() == 1) { // 0. (define)
      throw new BiwaScheme.Error("Invalid `define': "+x.to_write());
    }

    var first = x.cdr.car;
    var rest = x.cdr.cdr;
    
    if(first instanceof BiwaScheme.Symbol){    
      if (rest === BiwaScheme.nil) { // 1. (define a)
        x = BiwaScheme.undef;
      }
      else {
        if (rest.cdr === BiwaScheme.nil) // 2. (define a 1)
          x = rest.car;
        else // 3. (define a 1 2)
          throw new BiwaScheme.Error("Invalid `define': "+x.to_write());
      }

      BiwaScheme.TopEnv[first.name] = BiwaScheme.undef;
      next = ["assign-global", first.name, next];
    }
    else if(first instanceof BiwaScheme.Pair){ // 4. (define (f x) ...)
      // Note: define of this form may contain internal define.
      // They are handled in compilation of "lambda".

      var fname=first.car, args=first.cdr;
      var lambda = new BiwaScheme.Pair(BiwaScheme.Sym("lambda"), new BiwaScheme.Pair(args, rest));
      x = lambda;
      BiwaScheme.TopEnv[fname.name] = BiwaScheme.undef;
      next = ["assign-global", fname.name, next];
    }
    else{ // 5. (define 1 2)
      throw new BiwaScheme.Error("define: symbol or pair expected but got "+first);
    }

    return [x, next];
  },

  // Compiles various forms of "lambda".
  //
  // * (lambda (x y) ...)
  // * (lambda (x y . rest) ...)
  // * (lambda args ...)
  _compile_lambda: function(x, e, s, f, next){
    if(x.length() < 3)
      throw new BiwaScheme.Error("Invalid lambda: "+x.to_write());

    var vars = x.cdr.car;
    var body = x.cdr.cdr;

    // Handle internal defines
    var tbody = BiwaScheme.Compiler.transform_internal_define(body);
    if(BiwaScheme.isPair(tbody) &&
       BiwaScheme.isSymbol(tbody.car) &&
       tbody.car.name == "letrec*"){
      // The body has internal defines.
      // Expand letrec* macro
      var cbody = BiwaScheme.Interpreter.expand(tbody);
    }
    else{
      // The body has no internal defines.
      // Just wrap the list with begin 
      var cbody = new BiwaScheme.Pair(BiwaScheme.Sym("begin"), x.cdr.cdr);
    }

    var dotpos = this.find_dot_pos(vars);
    var proper = this.dotted2proper(vars);
    var free = this.find_free(cbody, proper.to_set(), f); //free variables
    var sets = this.find_sets(cbody, proper.to_set());    //local variables

    var do_body = this.compile(cbody,
                    [proper.to_set(), free],
                    sets.set_union(s.set_intersect(free)),
                    f.set_union(proper.to_set()),
                    ["return"]);
    var do_close = ["close", 
                     free.size(),
                     this.make_boxes(sets, proper, do_body),
                     next,
                     dotpos];
    return this.collect_free(free, e, do_close);
  },

  run: function(expr){
    return this.compile(expr, [new BiwaScheme.Set(), new BiwaScheme.Set()], new BiwaScheme.Set(), new BiwaScheme.Set(), ["halt"]);
  }
});

// Compile an expression with new compiler
BiwaScheme.Compiler.compile = function(expr, next){
  expr = BiwaScheme.Interpreter.expand(expr);
  return (new BiwaScheme.Compiler).run(expr, next);
};

// Transform internal defines to letrec*.
//
// Example
//   (let ((a 1))
//     (define (b) a)
//     (b))
//
//   (let ((a 1))
//     (letrec* ((b (lambda () a)))
//       (b)))
//
// x - expression starts with (define ...)
// 
// Returns a letrec* expression, or
// just returns x, when x does not contain definitions.
(function(){
// Returns true if x is a definition
var is_definition = function(x){
  return BiwaScheme.isPair(x) &&
         BiwaScheme.isTheSymbol("define", x.car);
  // TODO: support "begin", nested "begin", "let(rec)-syntax"
};

// Convert function definition to lambda binding
//   (define a ..)         -> (a ..)
//   (define (f) ..)       -> (f (lambda () ..))
//   (define (f x . y) ..) -> (f (lambda (x . y) ..))
//   (define (f . a) ..)   -> (f (lambda a ..))
var define_to_lambda_bind = function(def){
  var sig  = def.cdr.car;
  var body = def.cdr.cdr;

  if (BiwaScheme.isSymbol(sig)) {
    var variable = sig;

    return new BiwaScheme.Pair(variable, body);
  }
  else {
    var variable = sig.car;
    var value = new BiwaScheme.Pair(BiwaScheme.Sym("lambda"),
                  new BiwaScheme.Pair(sig.cdr, body));

    return BiwaScheme.List(variable, value);
  }
};

BiwaScheme.Compiler.transform_internal_define = function(x){
  // 1. Split x into definitions and expressions
  var defs = [], item = x;
  while (is_definition(item.car)){
    defs.push(item.car);
    item = item.cdr;
  }
  var exprs = item;

  // 2. Return x if there is no definitions
  if (defs.length == 0)
    return x;
  
  // 3. Return (letrec* <bindings> <expressions>)
  var bindings = BiwaScheme.List.apply(null, _.map(defs, define_to_lambda_bind));
  return new BiwaScheme.Pair(BiwaScheme.Sym("letrec*"),
           new BiwaScheme.Pair(bindings, exprs));
};
})();
//
// pause object (facility to stop/resume interpreting)
//
BiwaScheme.Pause = BiwaScheme.Class.create({
  //new (on_pause: javascript function calling setTimeout, Ajax.Request, ..)
  initialize: function(on_pause){
    this.on_pause = on_pause;
  },

  //save state of interpreter
  set_state: function(intp, x, f, c, s){
    this.interpreter = intp;
    this.x = x;
    this.f = f;
    this.c = c;
    this.s = s;
  },

  //call this when ready (to fire setTimeout, Ajax.Request..)
  ready: function(){
    this.on_pause(this);
  },

  //restart calculation
  resume: function(value){
    return this.interpreter.resume(true, value, this.x, this.f, this.c, this.s)
  }
});

///
/// Call
///

// The class Call is used to invoke scheme closure from 
// library functions.
//
// Call#initialize takes three arguments: proc, args and after.
//   * proc is the scheme closure to invoke.
//   * args is an Array (not list!) of arguments for the invocation.
//   * after is a javascript function which is invoked when 
//     returned from the proc.
//
//     after takes two arguments: ar and intp.
//       * ar is an Array which contains the result of the invocation.
//       * intp is an Interpreter which is running.
//
//     If after returns another Call object, another invocation
//     happens. If after returns a normal value, it is the value
//     of the library function.
//
// example:
//   return new Call(proc, [x, y], function(ar){ ar[0] });
//
BiwaScheme.Call = BiwaScheme.Class.create({
  initialize: function(proc, args, after){
    this.proc = proc;
    this.args = args;
    this.after = after || function(ar){
      // just return result which closure returned
      return ar[0];
    };
  },

  inspect: function(){
    return "#<Call args=" + this.args.inspect() + ">";
  },

  toString: function(){
    return "#<Call>";
  },

  to_write: function(){
    return "#<Call>";
  }
})

//
// Iterator - external iterator for Call.foreach
//
BiwaScheme.Iterator = {
  ForArray: BiwaScheme.Class.create({
    initialize: function(arr){
      this.arr = arr;
      this.i = 0;
    },
    has_next: function(){
      return this.i < this.arr.length;
    },
    next: function(){
      return this.arr[this.i++];
    }
  }),
  ForString: BiwaScheme.Class.create({
    initialize: function(str){
      this.str = str;
      this.i = 0;
    },
    has_next: function(){
      return this.i < this.str.length;
    },
    next: function(){
      return BiwaScheme.Char.get(this.str.charAt(this.i++));
    }
  }),
  ForList: BiwaScheme.Class.create({
    initialize: function(ls){
      this.ls = ls;
    },
    has_next: function(){
      return (this.ls instanceof BiwaScheme.Pair) &&
             this.ls != BiwaScheme.nil;
    },
    next: function(){
      var pair = this.ls;
      this.ls = this.ls.cdr;
      return pair;
    }
  }),
  ForMulti: BiwaScheme.Class.create({
    initialize: function(objs){
      this.objs = objs;
      this.size = objs.length;
      this.iterators = _.map(objs, function(x){
        return BiwaScheme.Iterator.of(x);
      })
    },
    has_next: function(){
      for(var i=0; i<this.size; i++)
        if(!this.iterators[i].has_next())
          return false;
      
      return true;
    },
    next: function(){
      return _.map(this.iterators, function(ite){
        return ite.next();
      })
    }
  }),
  of: function(obj){
    switch(true){
      case (obj instanceof Array):
        return new this.ForArray(obj);
      case (typeof(obj) == "string"):
        return new this.ForString(obj);
      case (obj instanceof BiwaScheme.Pair):
      case (obj === BiwaScheme.nil):
        return new this.ForList(obj);
      default:
        throw new BiwaScheme.Bug("Iterator.of: unknown class: "+BiwaScheme.inspect(obj));
    }
  }
}

//
// Call.foreach - shortcut for successive Calls
//
// Some library functions, such as for-each or map,
// call a closure for each element. Call.foreach is 
// a utility to help defining such methods.
//
// Call.foreach takes a sequence and some callbacks.
// Sequence is an Array, String, or list.
//
// Example:
//   return Call.foreach(sequence, {
//     // before each call
//     call: function(elem){
//       return new Call(proc, [elem]);
//     },
//     // after each call
//     result: function(value, elem){
//       ary.push(value);
//       // you can return a value to terminate the loop
//     },
//     // after all the calls
//     finish: function(){
//       return ary;
//     }
//   });

BiwaScheme.Call.default_callbacks = {
  call: function(x){ return new BiwaScheme.Call(this.proc, [x]) },
  result: function(){},
  finish: function(){}
}
BiwaScheme.Call.foreach = function(obj, callbacks, is_multi){
  is_multi || (is_multi = false);
  _.each(["call", "result", "finish"], function(key){
    if(!callbacks[key])
      callbacks[key] = BiwaScheme.Call.default_callbacks[key];
  })
  
  var iterator = null;
  var x = null;

  var loop = function(ar){
    if(iterator){
      var ret = callbacks["result"](ar[0], x);
      if(ret !== undefined) return ret;
    }
    else{ // first lap
      if(is_multi)
        iterator = new BiwaScheme.Iterator.ForMulti(obj);
      else
        iterator = BiwaScheme.Iterator.of(obj);
    }

    if(!iterator.has_next()){
      return callbacks["finish"]();
    }
    else{
      x = iterator.next();
      var result = callbacks["call"](x);
      result.after = loop;
      return result;
    }
  }
  return loop(null);
}
BiwaScheme.Call.multi_foreach = function(obj, callbacks){
  return BiwaScheme.Call.foreach(obj, callbacks, true);
}

///
/// Interpreter
///

BiwaScheme.Interpreter = BiwaScheme.Class.create({
  // new BiwaScheme.Interpreter()
  // new BiwaScheme.Interpreter(lastInterpreter)
  // new BiwaScheme.Interpreter(errorHandler)
  // new BiwaScheme.Interpreter(lastInterpreter, errorHandler)
  initialize: function(){
    var last_interpreter = null;
    var on_error = null;
    if (arguments.length == 2) {
      last_interpreter = arguments[0];
      on_error = arguments[1];
    } else if (arguments.length == 1 && arguments[0] instanceof BiwaScheme.Interpreter) {
      last_interpreter = arguments[0];
    } else if (arguments.length == 1 && typeof(arguments[0]) == "function") {
      on_error = arguments[0];
    }

    this.stack = [] //(make-vector 1000)
    this.on_error = on_error || (last_interpreter ? last_interpreter.on_error : function(e){});
    this.after_evaluate = function(){};
    this.last_refer = last_interpreter ? last_interpreter.last_refer : null;
    this.call_stack = last_interpreter ? _.clone(last_interpreter.call_stack) : [];
    this.tco_counter = [];
  },

  inspect: function(){
    return [
      "#<Interpreter: stack size=>",
      this.stack.length, " ",
      "after_evaluate=",
      BiwaScheme.inspect(this.after_evaluate),
      ">"
    ].join("");
  },

  push: function(x, s){
    this.stack[s] = x;
    return s+1;
  },

  //s: depth of stack to save
  //ret: saved(copied) stack 
  save_stack: function(s){
    var v = [];
    for(var i=0; i<s; i++){
      v[i] = this.stack[i];
    }
    return { stack: v, last_refer: this.last_refer, call_stack: _.clone(this.call_stack), tco_counter: _.clone(this.tco_counter) };
  },

  //v: stack array to restore
  //ret: lenght of restored stack
  restore_stack: function(stuff){
    v = stuff.stack;
    var s = v.length;
    for(var i=0; i<s; i++){
      this.stack[i] = v[i];
    }
    this.last_refer = stuff.last_refer;
    this.call_stack = _.clone(stuff.call_stack);
    this.tco_counter = _.clone(stuff.tco_counter);
    return s;
  },

  //s: depth of stack to save
  //n: number of args(for outer lambda) to remove (= 0 unless tail position)
  //ret: closure array
  continuation: function(s, n){
    // note: implementation of this function for final version doesn't exist in 3imp.pdf..
    var ss = this.push(n, s);
    return this.closure(["refer-local", 0,
                          ["nuate", this.save_stack(ss), 
                          ["return"]]], 
                        0,     //n (number of frees)
                        null,  //s (stack position to get frees)
                        -1);   // dotpos
  },

  // shift stack 
  // n: number of items to skip (from stack top)
  // m: number of items to shift
  // s: stack pointer (= index of stack top + 1)
  shift_args: function(n, m, s){
    for(var i = n-1; i >= -1; i--){
      this.index_set(s, i+m+1, this.index(s, i));
    }
    return s-m-1;
  },

  index: function(s, i){
    return this.stack[s-i-2];
  },

  index_set: function(s, i, v){
    this.stack[s-i-2] = v;
  },

  //ret: [body, stack[s-1], stack[s-2], .., stack[s-n], dotpos]
  closure: function(body, n, s, dotpos){
    var v = []; //(make-vector n+1+1)
    v[0] = body;
    for(var i=0; i<n; i++)
      v[i+1] = this.index(s, i-1);
    v[n+1] = dotpos;

    v.closure_p = true;

    return v;
  },

  execute: function(a, x, f, c, s){
    var ret = null;
    try{
      ret = this._execute(a, x, f, c, s);
    }
    catch(e){
      e.message = e.message + " [" + this.call_stack.join(", ") + "]";
      var state = {a:a, x:x, f:f, c:c, s:s, stack:this.stack};
      return this.on_error(e, state);
    }
    return ret;
  },

  run_dump_hook: function(a, x, f, c, s) {
    var dumper;
    var state;


    if (this.dumper) {
      dumper = this.dumper;
    }
    else if (BiwaScheme.Interpreter.dumper) {
      dumper = BiwaScheme.Interpreter.dumper;
    }
    else
      return;

    if (dumper) {
      state = {"a":a,
               "f":f,
               "c":c,
               "s":s,
               "x":x,
               "stack":this.stack};
      dumper.dump(state);
    }
  },

  _execute: function(a, x, f, c, s){
    var ret = null;
    //puts("executing "+x[0]);
    
    while(true){ //x[0] != "halt"){

      this.run_dump_hook(a, x, f, c, s);

      switch(x[0]){
      case "halt":
        return a;
      case "refer-local":
        var n=x[1], x=x[2];
        a = this.index(f, n);
        this.last_refer = "(anon)";
        break;
      case "refer-free":
        var n=x[1], x=x[2];
        a = c[n+1];
        this.last_refer = "(anon)";
        break;
      case "refer-global":
        var sym=x[1], x=x[2];
        if(BiwaScheme.TopEnv.hasOwnProperty(sym))
          var val = BiwaScheme.TopEnv[sym];
        else if(BiwaScheme.CoreEnv.hasOwnProperty(sym))
          var val = BiwaScheme.CoreEnv[sym];
        else
          throw new BiwaScheme.Error("execute: unbound symbol: "+BiwaScheme.inspect(sym));

        a = val;
        this.last_refer = sym || "(anon)";
        break;
      case "indirect":
        var x=x[1];
        a = a[0]; //unboxing
        break;
      case "constant":
        var obj=x[1], x=x[2];
        a = obj;
        this.last_refer = "(anon)";
        break;
      case "close":
        var ox=x;
        var n=ox[1], body=ox[2], x=ox[3], dotpos=ox[4];
        a = this.closure(body, n, s, dotpos);
        s -= n;
        break;
      case "box":
        var n=x[1], x=x[2];
        this.index_set(s, n, [this.index(s, n)]); //boxing
        break;
      case "test":
        var thenc=x[1], elsec=x[2];
        x = ((a!==false) ? thenc : elsec);
        break;
      case "assign-global":
        var name=x[1], x=x[2];
        if(!BiwaScheme.TopEnv.hasOwnProperty(name) &&
           !BiwaScheme.CoreEnv.hasOwnProperty(name))
          throw new BiwaScheme.Error("global variable '"+name+"' is not defined");
        
        BiwaScheme.TopEnv[name] = a;
        a = BiwaScheme.undef;
        break;
      case "assign-local":
        var n=x[1], x=x[2];
        var box = this.index(f, n);
        box[0] = a;
        a = BiwaScheme.undef;
        break;
      case "assign-free":
        var n=x[1], x=x[2];
        var box = c[n+1];
        box[0] = a;
        a = BiwaScheme.undef;
        break;
      case "conti":
        var n=x[1], x=x[2];
        a = this.continuation(s, n);
        break;
      case "nuate":
        var stack=x[1], x=x[2];
        s = this.restore_stack(stack);
        break;
      case "frame":
        var ret = x[2];
        x = x[1];
        s = this.push(ret, this.push(f, this.push(c, s)));
        this.tco_counter[this.tco_counter.length] = 0;
        break;
      case "argument":
        var x=x[1];
        s = this.push(a, s);
        break;
      case "shift":
        var n=x[1], x=x[2];

        // the number of arguments in the last call
        var n_args = this.index(s, n);  

        s = this.shift_args(n, n_args, s);
        break;
      case "tco_hinted_apply": // just like a regular apply, except we need to trace the # of TCO calls so we can generate a stacktrace
        this.tco_counter[this.tco_counter.length - 1]++;
        x = ["apply"].concat(_.rest(x));
        break;
      case "apply": //extended: n_args as second argument
        var func = a; //, n_args = x[1];
        this.call_stack.push(this.last_refer);

        // the number of arguments in the last call is
        // pushed to the stack.
        var n_args = this.index(s, -1);
        if(func instanceof Array){ //closure
          a = func;
          x = func[0];

          // The position of dot in the parameter list.
          var dotpos = func[func.length-1];

          if (dotpos >= 0) {
            // The dot is found
            // ----------------
            // => Process the &rest args: packing the rest args into a list.
            var ls = BiwaScheme.nil;
            for (var i=n_args; --i>=dotpos; ) {
              ls = new BiwaScheme.Pair(this.index(s, i), ls);
            }
            if (dotpos >= n_args) {
              // No rest argument is passed to this closure.
              // However, the closure expects the caller passes the rest argument.
              // In such case this VM prepares an empty list as the rest argument.
              // --------------------------------------------------------------
              // => We extend the stack to put the empty list.
              for(var i = -1; i < n_args; i++){
                this.index_set(s, i-1, this.index(s, i));
              }
              s++;
              // => Update the number of arguments
              this.index_set(s, -1, this.index(s, -1) + 1);  
            }
            this.index_set(s, dotpos, ls);
          }
          f = s;
          c = a;
        }
        else if(func instanceof Function){ // Apply JavaScript function
          // load arguments from stack
          var args = [];
          for(var i=0; i<n_args; i++) 
            args.push(this.index(s, i));

          // invoke the function
          var result = func(args, this);

          if(result instanceof BiwaScheme.Pause){
            // it requested the interpreter to suspend
            var pause = result;
            pause.set_state(this, ["return"], f, c, s);
            pause.ready();
            return pause;
          }
          else if(result instanceof BiwaScheme.Call){
            // it requested the interpreter to call a scheme closure

            //   [frame,
            //     [constant... (args)
            //     [constant, proc
            //     [apply]]]]
            //   [frame,
            //     [constant, after
            //     [apply 1]]]]
            //   x
            var call_after = ["frame",
                               ["argument",
                               ["constant", 1,
                               ["argument",
                               ["constant", result.after,
                               ["apply"]]]]],
                             ["return"]];
            var call_proc = ["constant", result.args.length,
                            ["argument",
                            ["constant", result.proc, 
                            ["apply", result.args.length]]]];
            var push_args = _.inject(result.args, function(opc, arg){
              // (foo 1 2) => first push 2, then 1
              //   [constant 2 ... [constant 1 ... ]
              return ["constant", arg, 
                     ["argument",
                     opc]];
            }, call_proc);
            x = ["frame",
                  push_args,
                call_after]
          }
          else{
            // the JavaScript function returned a normal value
            a = result;
            x = ["return"];
          }
        }
        else{
          // unknown function type
          throw new BiwaScheme.Error(BiwaScheme.inspect(func) + " is not a function");
        }
        break;
      case "return":
        var n=this.index(s, -1);
        var ss=s-n;
        x = this.index(ss, 0),
        f = this.index(ss, 1),
        c = this.index(ss, 2),
        s = ss-3-1;
        var num_call_stack_pops = 1 + this.tco_counter[this.tco_counter.length - 1];
        _.times(num_call_stack_pops, _.bind(function() { this.call_stack.pop() }, this));
        this.tco_counter.pop();
        break;
      default:
        throw new BiwaScheme.Bug("unknown opecode type: "+x[0]);
      }
    }

//      if(ret === null)
//        throw new BiwaScheme.Bug("interpreter exited in unusual way");
//      else
//        return ret;
    return a
  },

  evaluate: function(str, after_evaluate){
    this.parser = new BiwaScheme.Parser(str);
    this.compiler = new BiwaScheme.Compiler();
    if(after_evaluate) 
      this.after_evaluate = after_evaluate;

    if(BiwaScheme.Debug) puts("executing: " + str);
     
    this.is_top = true;
    this.file_stack = [];
    return this.resume(false);
  },

  resume: function(is_resume, a, x, f, c, s){
    var ret = BiwaScheme.undef;

    for(;;){
      if(is_resume){
        ret = this.execute(a, x, f, c, s);
        is_resume = false;
      }
      else{
        if(!this.parser) break; // adhoc: when Pause is used via invoke_closure
        var expr = this.parser.getObject();
        if(expr === BiwaScheme.Parser.EOS) break;

        // expand
        expr = BiwaScheme.Interpreter.expand(expr);

        // compile
        var opc = this.compiler.run(expr);
        //if(BiwaScheme.Debug) p(opc);

        // execute
        ret = this.execute(expr, opc, 0, [], 0);
      }

      if(ret instanceof BiwaScheme.Pause){ //suspend evaluation
        return ret;
      }
    }

    // finished executing all forms
    this.after_evaluate(ret);
    return ret;
  },

  invoke_closure: function(closure, args){
    args || (args = []);
    var n_args  = args.length;

    var x = ["constant", n_args, ["argument", ["constant", closure, ["apply"]]]]
    for(var i=0; i<n_args; i++)
      x = ["constant", args[i], ["argument", x]]

    return this.execute(closure, ["frame", x, ["halt"]], 0, closure, 0);
  },

  // only compiling (for debug use only)
  compile: function(str){
    var obj = BiwaScheme.Interpreter.read(str);
    var opc = BiwaScheme.Compiler.compile(obj);
    return opc;
  }
});

// Take a string and returns an expression.
BiwaScheme.Interpreter.read = function(str){
  var parser = new BiwaScheme.Parser(str);
  var r      = parser.getObject();
  return (r == BiwaScheme.Parser.EOS)? BiwaScheme.eof: r;
};

// Expand macro calls in a expression recursively.
//
// x - expression
// flag - used internally. do not specify this
BiwaScheme.Interpreter.expand = function(x, flag/*optional*/){
  var expand = BiwaScheme.Interpreter.expand;
  flag || (flag = {})
  var ret = null;

  if(x instanceof BiwaScheme.Pair){
    switch(x.car){
    case BiwaScheme.Sym("define"):
      var left = x.cdr.car, exp = x.cdr.cdr;
      ret = new BiwaScheme.Pair(BiwaScheme.Sym("define"),
              new BiwaScheme.Pair(left, expand(exp, flag)));
      break;
    case BiwaScheme.Sym("begin"):
      ret = new BiwaScheme.Pair(BiwaScheme.Sym("begin"), expand(x.cdr, flag));
      break;
    case BiwaScheme.Sym("quote"):
      ret = x;
      break;
    case BiwaScheme.Sym("lambda"):
      var vars=x.cdr.car, body=x.cdr.cdr;
      ret = new BiwaScheme.Pair(BiwaScheme.Sym("lambda"),
              new BiwaScheme.Pair(vars, expand(body, flag)));
      break;
    case BiwaScheme.Sym("if"):
      var testc=x.second(), thenc=x.third(), elsec=x.fourth();
      if (elsec == BiwaScheme.inner_of_nil){
        elsec = BiwaScheme.undef;
      }
      ret = BiwaScheme.List(BiwaScheme.Sym("if"),
                            expand(testc, flag),
                            expand(thenc, flag),
                            expand(elsec, flag));
      break;
    case BiwaScheme.Sym("set!"):
      var v=x.second(), x=x.third();
      ret = BiwaScheme.List(BiwaScheme.Sym("set!"), v, expand(x, flag));
      break;
    case BiwaScheme.Sym("call-with-current-continuation"): 
    case BiwaScheme.Sym("call/cc"): 
      var x=x.second();
      ret = BiwaScheme.List(BiwaScheme.Sym("call/cc"), expand(x, flag));
      break;
    default: //apply
      var transformer = null;
      if(BiwaScheme.isSymbol(x.car)){
        if(BiwaScheme.TopEnv[x.car.name] instanceof BiwaScheme.Syntax)
          transformer = BiwaScheme.TopEnv[x.car.name];
        else if(BiwaScheme.CoreEnv[x.car.name] instanceof BiwaScheme.Syntax)
          transformer = BiwaScheme.CoreEnv[x.car.name];
      }

      if(transformer){
        flag["modified"] = true;
        ret = transformer.transform(x);

//            // Debug
//            var before = BiwaScheme.to_write(x);
//            var after = BiwaScheme.to_write(ret);
//            if(before != after){
//              console.log("before: " + before)
//              console.log("expand: " + after)
//            }

        var fl;
        for(;;){
          ret = expand(ret, fl={});
          if(!fl["modified"]) 
            break;
        }
      }
      else{
        var expanded_car = expand(x.car, flag);
        var expanded_cdr = BiwaScheme.array_to_list(
                             _.map(x.cdr.to_array(),
                                   function(item){ return expand(item, flag); }));
        ret = new BiwaScheme.Pair(expanded_car, expanded_cdr);
      }
    }
  }
  else{
    ret = x;
  }
  return ret;
};
///
/// infra.js - Basis for library functions
///

//
// define_*func - define library functions
//
BiwaScheme.check_arity = function(len, min, max){
  var fname = arguments.callee.caller
                ? arguments.callee.caller.fname
                : "(?)";
  if(len < min){
    if(max && max == min)
      throw new BiwaScheme.Error(fname+": wrong number of arguments (expected: "+min+" got: "+len+")");
    else
      throw new BiwaScheme.Error(fname+": too few arguments (at least: "+min+" got: "+len+")");
  }
  else if(max && max < len)
    throw new BiwaScheme.Error(fname+": too many arguments (at most: "+max+" got: "+len+")");
}
BiwaScheme.define_libfunc = function(fname, min, max, func){
  var f = function(ar, intp){
    BiwaScheme.check_arity(ar.length, min, max);
    return func(ar, intp);
  };

  func["fname"] = fname; // for assert_*
  f["fname"]    = fname; // for check_arity
  f["inspect"] = function(){ return this.fname; }
  BiwaScheme.CoreEnv[fname] = f;
}
BiwaScheme.alias_libfunc = function(fname, aliases) {
  if (BiwaScheme.CoreEnv[fname]) {
    if (_.isArray(aliases)) {
      _.map(aliases, function(a) { BiwaScheme.alias_libfunc(fname, a); });
    } else if (_.isString(aliases)) {
      BiwaScheme.CoreEnv[aliases] = BiwaScheme.CoreEnv[fname];
    } else {
      throw new BiwaScheme.Bug("bad alias for library function " +
                               "`" + fname + "': " + aliases.toString());
    }
  } else {
    throw new BiwaScheme.Bug("library function " +
                             "`" + fname + "'" +
                             " does not exist, so can't alias it.");
  }
};
BiwaScheme.define_syntax = function(sname, func) {
  var s = new BiwaScheme.Syntax(sname, func);
  BiwaScheme.CoreEnv[sname] = s;
}
BiwaScheme.define_scmfunc = function(fname, min, max, str){
  (new Interpreter).evaluate("(define "+fname+" "+str+"\n)");
}

//  define_scmfunc("map+", 2, null, 
//    "(lambda (proc ls) (if (null? ls) ls (cons (proc (car ls)) (map proc (cdr ls)))))");

//
// assertions - type checks
//
BiwaScheme.make_assert = function(check){
  return function(/*args*/){
    var fname = arguments.callee.caller
                  ? arguments.callee.caller.fname
                  : "";
    check.apply(this, [fname].concat(_.toArray(arguments)));
  }
}
BiwaScheme.make_simple_assert = function(type, test, _fname){
  return BiwaScheme.make_assert(function(fname, obj, opt){
    if(_fname) fname = _fname;
    option = opt ? ("("+opt+")") : ""
    if(!test(obj)){
      throw new BiwaScheme.Error(fname + option + ": " +
                                 type + " required, but got " +
                                 BiwaScheme.to_write(obj));
    }
  })
}

BiwaScheme.assert_number = BiwaScheme.make_simple_assert("number", function(obj){
  return typeof(obj) == 'number' || (obj instanceof BiwaScheme.Complex);
});

BiwaScheme.assert_integer = BiwaScheme.make_simple_assert("integer", function(obj){
  return typeof(obj) == 'number' && (obj % 1 == 0)
});

BiwaScheme.assert_real = BiwaScheme.make_simple_assert("real number", function(obj){
  return typeof(obj) == 'number';
});

BiwaScheme.assert_between = BiwaScheme.make_assert(function(fname, obj, from, to){
  if( typeof(obj) != 'number' || obj != Math.round(obj) ){
    throw new BiwaScheme.Error(fname + ": " +
                               "number required, but got " +
                               BiwaScheme.to_write(obj));
  }

  if( obj < from || to < obj ){
    throw new BiwaScheme.Error(fname + ": " +
                               "number must be between " +
                               from + " and " + to + ", but got " +
                               BiwaScheme.to_write(obj));
  }
});

BiwaScheme.assert_string = BiwaScheme.make_simple_assert("string", _.isString);

BiwaScheme.assert_char = BiwaScheme.make_simple_assert("character", BiwaScheme.isChar);
BiwaScheme.assert_symbol = BiwaScheme.make_simple_assert("symbol", BiwaScheme.isSymbol);
BiwaScheme.assert_port = BiwaScheme.make_simple_assert("port", BiwaScheme.isPort);
BiwaScheme.assert_pair = BiwaScheme.make_simple_assert("pair", BiwaScheme.isPair);
BiwaScheme.assert_list = BiwaScheme.make_simple_assert("list", BiwaScheme.isList);
BiwaScheme.assert_vector = BiwaScheme.make_simple_assert("vector", BiwaScheme.isVector);

BiwaScheme.assert_hashtable = BiwaScheme.make_simple_assert("hashtable",
                                          BiwaScheme.isHashtable);
BiwaScheme.assert_mutable_hashtable = BiwaScheme.make_simple_assert("mutable hashtable",
                                            BiwaScheme.isMutableHashtable);

BiwaScheme.assert_record = BiwaScheme.make_simple_assert("record",
                                          BiwaScheme.isRecord);
BiwaScheme.assert_record_td = BiwaScheme.make_simple_assert("record type descriptor",
                                          BiwaScheme.isRecordTD);
BiwaScheme.assert_record_cd = BiwaScheme.make_simple_assert("record constructor descriptor",
                                          BiwaScheme.isRecordCD);
BiwaScheme.assert_enum_set = BiwaScheme.make_simple_assert("enum_set",
                                          BiwaScheme.isEnumSet);

BiwaScheme.assert_function = BiwaScheme.make_simple_assert("JavaScript function",
                                         _.isFunction);
BiwaScheme.assert_closure = BiwaScheme.make_simple_assert("scheme function",
                                        BiwaScheme.isClosure);
BiwaScheme.assert_procedure = BiwaScheme.make_simple_assert("scheme/js function", function(obj){
  return BiwaScheme.isClosure(obj) || _.isFunction(obj);
});

BiwaScheme.assert_date = BiwaScheme.make_simple_assert("date", function(obj){
  // FIXME: this is not accurate (about cross-frame issue)
  // https://prototype.lighthouseapp.com/projects/8886/tickets/443
  return obj instanceof Date;
});

//var assert_instance_of = BiwaScheme.make_assert(function(fname, type, obj, klass){
//  if(!(obj instanceof klass)){
//    throw new BiwaScheme.Error(fname + ": " +
//                               type + " required, but got " +
//                               BiwaScheme.to_write(obj));
//  }
//});

BiwaScheme.assert = BiwaScheme.make_assert(function(fname, success, message, _fname){
  if(!success){
    throw new BiwaScheme.Error((_fname || fname)+": "+message);
  }
});


//
// R6RS Base library
//

if( typeof(BiwaScheme)!='object' ) BiwaScheme={}; with(BiwaScheme) {
  /* --------------------------------------- namespace webscheme */ 

  ///
  /// R6RS Base library
  ///
  
  //
  //        11.4  Expressions
  //
  //            11.4.1  Quotation
  //(quote)
  //            11.4.2  Procedures
  //(lambda)
  //            11.4.3  Conditionaar
  //(if)
  //            11.4.4  Assignments
  //(set!)
  //            11.4.5  Derived conditionaar

  define_syntax("cond", function(x){
    var clauses = x.cdr;
    if(!(clauses instanceof Pair) || clauses === nil){
      throw new Error("malformed cond: cond needs list but got " +
                      to_write_ss(clauses));
    }
    // TODO: assert that clauses is a proper list

    var ret = null;
    _.each(clauses.to_array().reverse(), function(clause){
      if(!(clause instanceof Pair)){
        throw new Error("bad clause in cond: " + to_write_ss(clause));
      }

      if(clause.car === Sym("else")){ 
        if(ret !== null){
          throw new Error("'else' clause of cond followed by more clauses: " +
                          to_write_ss(clauses));
        }
        else if(clause.cdr === nil){
          // pattern A: (else)
          //  -> #f            ; not specified in R6RS...?
          ret = false;
        }
        else if(clause.cdr.cdr === nil){
          // pattern B: (else expr) 
          //  -> expr
          ret = clause.cdr.car;
        }
        else{
          // pattern C: (else expr ...)
          //  -> (begin expr ...)
          ret = new Pair(Sym("begin"), clause.cdr);
        }
      }
      else{
        var test = clause.car;
        if(clause.cdr === nil){
          // pattern 1: (test)
          //  -> (or test ret)
          ret = List(Sym("or"), test, ret);
        }
        else if (clause.cdr.cdr === nil){
          // pattern 2: (test expr)
          //  -> (if test expr ret)
          ret = List(Sym("if"), test, clause.cdr.car, ret);
        }
        else if(clause.cdr.car === Sym("=>")){
          // pattern 3: (test => expr)
          //  -> (let ((#<gensym1> test)) 
          //       (if test (expr #<gensym1>) ret))
          var test = clause.car, expr = clause.cdr.cdr.car;
          var tmp_sym = BiwaScheme.gensym();

          ret = List(Sym("let"), 
                     List( List(tmp_sym, test) ),
                     List(Sym("if"), test, List(expr, tmp_sym), ret));
        }
        else{
          // pattern 4: (test expr ...)
          //  -> (if test (begin expr ...) ret)
          ret = List(Sym("if"), test,
                     new Pair(Sym("begin"), clause.cdr),
                     ret);
        }
      }
    });
    return ret;
  });

  define_syntax("case", function(x){
    var tmp_sym = BiwaScheme.gensym();

    if(x.cdr === nil){
      throw new Error("case: at least one clause is required");
    }
    else if(!(x.cdr instanceof Pair)){
      throw new Error("case: proper list is required");
    }
    else{
      // (case key clauses ....)
      //  -> (let ((#<gensym1> key))
      var key = x.cdr.car;
      var clauses = x.cdr.cdr;

      var ret = undefined;
      _.each(clauses.to_array().reverse(), function(clause){
        if(clause.car === Sym("else")){
          // pattern 0: (else expr ...)
          //  -> (begin expr ...)
          if(ret === undefined){
            ret = new Pair(Sym("begin"), clause.cdr);
          }
          else{
            throw new Error("case: 'else' clause followed by more clauses: " +
                            to_write_ss(clauses));
          }
        }
        else{
          // pattern 1: ((datum ...) expr ...)
          //  -> (if (or (eqv? key (quote d1)) ...) (begin expr ...) ret)
          ret = List(
            Sym("if"),
            new Pair(Sym("or"), array_to_list(_.map(clause.car.to_array(), function(d){
                return List(Sym("eqv?"),
                            tmp_sym,
                            List(Sym("quote"), d));
            }))),
            new Pair(Sym("begin"), clause.cdr),
            ret
          );
        }
      });
      return new Pair(Sym("let1"),
               new Pair(tmp_sym,
                 new Pair(key,
                   new Pair(ret, nil))));
    }
  });

  define_syntax("and", function(x){
    // (and a b c) => (if a (if b c #f) #f)
    //todo: check improper list
    if(x.cdr == nil) return true;

    var objs = x.cdr.to_array();
    var i = objs.length-1;
    var t = objs[i];
    for(i=i-1; i>=0; i--)
      t = List(Sym("if"), objs[i], t, false);

    return t;
  })

  define_syntax("or", function(x){
    // (or a b c) => (if a a (if b b (if c c #f)))
    //todo: check improper list

    var objs = x.cdr.to_array()
    var f = false;
    for(var i=objs.length-1; i>=0; i--)
      f = List(Sym("if"), objs[i], objs[i], f);

    return f;
  })

  //            11.4.6  Binding constructs
  define_syntax("let", function(x){
    //(let ((a 1) (b 2)) (print a) (+ a b))
    //=> ((lambda (a b) (print a) (+ a b)) 1 2)
    var name = null;
    if (x.cdr.car instanceof Symbol) {
      name = x.cdr.car;
      x = x.cdr;
    }
    var binds = x.cdr.car, body = x.cdr.cdr;
    
    if((!(binds instanceof Pair)) && binds != BiwaScheme.nil){
      throw new Error("let: need a pair for bindings: got "+to_write(binds));
    }

    var vars = nil, vals = nil;
    for(var p=binds; p instanceof Pair; p=p.cdr){
      vars = new Pair(p.car.car, vars);
      vals = new Pair(p.car.cdr.car, vals);
    }

    var lambda = null;
    if (name) {
      // (let loop ((a 1) (b 2)) body ..)
      //=> (letrec ((loop (lambda (a b) body ..))) (loop 1 2))
      vars = array_to_list(vars.to_array().reverse());
      vals = array_to_list(vals.to_array().reverse());

      var body_lambda = new Pair(Sym("lambda"), new Pair(vars, body));
      var init_call = new Pair(name, vals);

      lambda = List(Sym("letrec"),
                    new Pair(List(name, body_lambda), nil),
                    init_call);
    }
    else {
      lambda = new Pair(new Pair(Sym("lambda"), 
                                 new Pair(vars, body)), 
                        vals);
    }
    return lambda;
  })

  define_syntax("let*", function(x){
    //(let* ((a 1) (b a)) (print a) (+ a b))
    //-> (let ((a 1)) 
    //     (let ((b a)) (print a) (+ a b)))
    var binds = x.cdr.car, body = x.cdr.cdr;
    
    if(!(binds instanceof Pair)) 
      throw new Error("let*: need a pair for bindings: got "+to_write(binds));

    var ret = null;
    _.each(binds.to_array().reverse(), function(bind){
      ret = new Pair(Sym("let"), 
               new Pair(new Pair(bind, nil),
                 ret == null ? body : new Pair(ret, nil)));
    })
    return ret;
  })

  var expand_letrec_star = function(x){
    var binds = x.cdr.car, body = x.cdr.cdr;
    
    if(!(binds instanceof Pair)) 
      throw new Error("letrec*: need a pair for bindings: got "+to_write(binds));

    var ret = body;
    _.each(binds.to_array().reverse(), function(bind){
      ret = new Pair(new Pair(Sym("set!"), bind),
              ret);
    })
    var letbody = nil;
    _.each(binds.to_array().reverse(), function(bind){
      letbody = new Pair(new Pair(bind.car, 
                           new Pair(BiwaScheme.undef, nil)),
                  letbody);
    })
    return new Pair(Sym("let"),
             new Pair(letbody,
               ret));
  }
  define_syntax("letrec", expand_letrec_star);
  define_syntax("letrec*", expand_letrec_star);

  define_syntax("let-values", function(x) {
    // (let-values (((a b) (values 1 2))
    //               ((c d . e) (values 3 4 a)))
    //              (print a b c d e))
    // =>
    // (let ((#<gensym1> (lambda () (values 1 2)))
    //       (#<gensym2> (lambda () (values 3 4 a))))
    //   (let*-values (((a b) #<gensym1>)
    //                 ((c d . e) #<gensym2>))
    //                 (print a b c d e)))
      var mv_bindings = x.cdr.car;
      var body = x.cdr.cdr;
      var ret = null;
      
      var let_bindings = nil;
      var let_star_values_bindings = nil;
      _.each(mv_bindings.to_array().reverse(), function (item) {
	  var init = item.cdr.car;
	  var tmpsym = BiwaScheme.gensym()
	  var binding = new Pair(tmpsym, 
				 new Pair(
					  new Pair(Sym("lambda"), new Pair(nil, 
									   new Pair(init, nil))),
					  nil));
	  let_bindings = new Pair(binding, let_bindings);
	  
	  var formals = item.car;
	  let_star_values_bindings = new Pair(new Pair (formals, new Pair(new Pair(tmpsym, nil), nil)),
					      let_star_values_bindings);
      });

      var let_star_values = new Pair(Sym("let*-values"),
				     new Pair(let_star_values_bindings,
					      body));
      ret = new Pair(Sym("let"), 
		     new Pair(let_bindings,
			      new Pair (let_star_values, nil)));
      return ret;
      
  });

  //let*-values
  define_syntax("let*-values", function(x){
    // (let*-values (((a b) (values 1 2))
    //               ((c d . e) (values 3 4 a)))
    //   (print a b c d e))
    // -> (call-with-values
    //      (lambda () (values 1 2))
    //      (lambda (a b)
    //        (call-with-values
    //          (lambda () (values 3 4 a))
    //          (lambda (c d . e) 
    //            (print a b c d e)))))
    var mv_bindings = x.cdr.car;
    var body = x.cdr.cdr;

    var ret = null;

    _.each(mv_bindings.to_array().reverse(), function(item){
      var formals = item.car, init = item.cdr.car;
      ret = new Pair(Sym("call-with-values"),
              new Pair(new Pair(Sym("lambda"),
                         new Pair(nil,
                           new Pair(init, nil))),
                new Pair(new Pair(Sym("lambda"),
                           new Pair(formals,
                             (ret == null ? body
                                          : new Pair(ret, nil)))), nil)));
    });
    return ret;
  });
  //            11.4.7  Sequencing
  //(begin)

  //        
  //        11.5  Equivalence predicates
  //
  BiwaScheme.eq = function(a, b){
    return a === b;
  };
   // TODO: Records (etc.)
  BiwaScheme.eqv = function(a, b){
    return a == b && (typeof(a) == typeof(b));
  };
  
  define_libfunc("eqv?", 2, 2, function(ar){
    return BiwaScheme.eqv(ar[0], ar[1]);
  })
  define_libfunc("eq?", 2, 2, function(ar){
    return BiwaScheme.eq(ar[0], ar[1]);
  })
  define_libfunc("equal?", 2, 2, function(ar){
    //TODO: must terminate for cyclic objects
    return to_write(ar[0]) == to_write(ar[1]);
  })

  //
  //        11.6  Procedure predicate
  //
  //"procedure?", 1, 1
  define_libfunc("procedure?", 1, 1, function(ar){
    return ((ar[0] instanceof Array) && (ar[0].closure_p === true)
	    || (typeof ar[0] == "function"));
  })

  //
  //        11.7  Arithmetic
  //

  //            11.7.1  Propagation of exactness and inexactness
  //            11.7.2  Representability of infinities and NaNs
  //            11.7.3  Semantics of common operations
  //                11.7.3.1  Integer division
  //                11.7.3.2  Transcendental functions
  //(no functions are introduced by above sections)

  //
  //            11.7.4  Numerical operations
  //
  
  //                11.7.4.1  Numerical type predicates
  define_libfunc("number?", 1, 1, function(ar){
    return (typeof(ar[0]) == 'number') ||
           (ar[0] instanceof Complex)  ||
           (ar[0] instanceof Rational);
  });
  define_libfunc("complex?", 1, 1, function(ar){
    return (ar[0] instanceof Complex);
  });
  define_libfunc("real?", 1, 1, function(ar){
    return (typeof(ar[0]) == 'number');
  });
  define_libfunc("rational?", 1, 1, function(ar){
    return (ar[0] instanceof Rational);
  });
  define_libfunc("integer?", 1, 1, function(ar){
    return typeof(ar[0]) == 'number'  && 
           ar[0] == Math.round(ar[0]) &&
           ar[0] != Infinity          &&
           ar[0] != -Infinity;
  });

//(real-valued? obj)    procedure 
//(rational-valued? obj)    procedure 
//(integer-valued? obj)    procedure 
//
//(exact? z)    procedure 
//(inexact? z)    procedure

  //                11.7.4.2  Generic conversions
  //
//(inexact z)    procedure 
//(exact z)    procedure
//
  //                11.7.4.3  Arithmetic operations

  //inf & nan: ok (for this section)
  define_libfunc("=", 2, null, function(ar){
    var v = ar[0];
    assert_number(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_number(ar[i]);
      if(ar[i] != v) return false;
    }
    return true;
  });
  define_libfunc("<", 2, null, function(ar){
    assert_number(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_number(ar[i]);
      if(!(ar[i-1] < ar[i])) return false;
    }
    return true;
  });
  define_libfunc(">", 2, null, function(ar){
    assert_number(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_number(ar[i]);
      if(!(ar[i-1] > ar[i])) return false;
    }
    return true;
  });
  define_libfunc("<=", 2, null, function(ar){
    assert_number(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_number(ar[i]);
      if(!(ar[i-1] <= ar[i])) return false;
    }
    return true;
  });
  define_libfunc(">=", 2, null, function(ar){
    assert_number(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_number(ar[i]);
      if(!(ar[i-1] >= ar[i])) return false;
    }
    return true;
  });

  define_libfunc("zero?", 1, 1, function(ar){
    assert_number(ar[0]);
    return ar[0] === 0; 
  });
  define_libfunc("positive?", 1, 1, function(ar){
    assert_number(ar[0]);
    return (ar[0] > 0);
  });
  define_libfunc("negative?", 1, 1, function(ar){
    assert_number(ar[0]);
    return (ar[0] < 0);
  });
  define_libfunc("odd?", 1, 1, function(ar){
    assert_number(ar[0]);
    return (ar[0] % 2 == 1) || (ar[0] % 2 == -1);
  })
  define_libfunc("even?", 1, 1, function(ar){
    assert_number(ar[0]);
    return ar[0] % 2 == 0;
  })
  define_libfunc("finite?", 1, 1, function(ar){
    assert_number(ar[0]);
    return (ar[0] != Infinity) && (ar[0] != -Infinity) && !isNaN(ar[0]);
  })
  define_libfunc("infinite?", 1, 1, function(ar){
    assert_number(ar[0]);
    return (ar[0] == Infinity) || (ar[0] == -Infinity);
  })
  define_libfunc("nan?", 1, 1, function(ar){
    assert_number(ar[0]);
    return isNaN(ar[0]);
  })
  define_libfunc("max", 2, null, function(ar){
    for(var i=0; i<ar.length; i++)
      assert_number(ar[i]);

    return Math.max.apply(null, ar)
  });
  define_libfunc("min", 2, null, function(ar){
    for(var i=0; i<ar.length; i++)
      assert_number(ar[i]);

    return Math.min.apply(null, ar);
  });

  define_libfunc("+", 0,null, function(ar){
    var n = 0;
    for(var i=0; i<ar.length; i++){
      assert_number(ar[i]);
      n+=ar[i];
    }
    return n;
  });
  define_libfunc("*", 0,null, function(ar){
    var n = 1;
    for(var i=0; i<ar.length; i++){
      assert_number(ar[i]);
      n*=ar[i];
    }
    return n;
  });
  define_libfunc("-", 1,null, function(ar){
    var len = ar.length;
    assert_number(ar[0]);

    if(len == 1)
      return -ar[0];
    else{
      var n = ar[0];
      for(var i=1; i<len; i++){
        assert_number(ar[i]);
        n-=ar[i];
      }
      return n;
    }
  });
  //for r6rs specification, (/ 0 0) or (/ 3 0) raises '&assertion exception'
  define_libfunc("/", 1,null, function(ar){
    var len = ar.length;
    assert_number(ar[0]);

    if(len == 1)
      return 1/ar[0];
    else{
      var n = ar[0];
      for(var i=1; i<len; i++){
        assert_number(ar[i]);
        n/=ar[i];
      }
      return n;
    }
  });

  define_libfunc("abs", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.abs(ar[0]);
  });

  var div = function(n, m){
    return Math.floor(n / m);
  }
  var mod = function(n, m){
    return n - Math.floor(n / m) * m;
  }
  var div0 = function(n, m){
    return (n > 0) ? Math.floor(n / m) : Math.ceil(n / m);
  }
  var mod0 = function(n, m){
    return (n > 0) ? n - Math.floor(n / m) * m 
                   : n - Math.ceil(n / m) * m;
  }
  define_libfunc("div0-and-mod0", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return new Values([div(ar[0], ar[1]), mod(ar[0], ar[1])]);
  })
  define_libfunc("div", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return div(ar[0], ar[1]);
  })
  define_libfunc("mod", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return mod(ar[0], ar[1]);
  })
  define_libfunc("div0-and-mod0", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return new Values([div0(ar[0], ar[1]), mod0(ar[0], ar[1])]);
  })
  define_libfunc("div0", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return div0(ar[0], ar[1]);
  })
  define_libfunc("mod0", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return mod0(ar[0], ar[1]);
  })

//(gcd n1 ...)    procedure 
//(lcm n1 ...)    procedure 

  define_libfunc("numerator", 1, 1, function(ar){
    assert_number(ar[0]);
    if(ar[0] instanceof Rational)
      return ar[0].numerator;
    else
      throw new Bug("todo");
  })
  define_libfunc("denominator", 1, 1, function(ar){
    assert_number(ar[0]);
    if(ar[0] instanceof Rational)
      return ar[0].denominator;
    else
      throw new Bug("todo");
  })
  define_libfunc("floor", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.floor(ar[0]);
  })
  define_libfunc("ceiling", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.ceil(ar[0]);
  })
  define_libfunc("truncate", 1, 1, function(ar){
    assert_number(ar[0]);
    return (ar[0] < 0) ? Math.ceil(ar[0]) : Math.floor(ar[0]);
  })
  define_libfunc("round", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.round(ar[0]);
  })

//(rationalize x1 x2)    procedure 

  define_libfunc("exp", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.exp(ar[0]);
  })
  define_libfunc("log", 1, 2, function(ar){
    var num = ar[0], base = ar[1];
    assert_number(num);

    if(base){ // log b num == log e num / log e b
      assert_number(base);
      return Math.log(num) / Math.log(b)
    }
    else
      return Math.log(num);
  })
  define_libfunc("sin", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.sin(ar[0]);
  })
  define_libfunc("cos", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.cos(ar[0]);
  })
  define_libfunc("tan", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.tan(ar[0]);
  })
  define_libfunc("asin", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.asin(ar[0]);
  })
  define_libfunc("acos", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.acos(ar[0]);
  })
  define_libfunc("atan", 1, 2, function(ar){
    assert_number(ar[0]);
    if(ar[1]){
      assert_number(ar[1]);
      return Math.atan2(ar[0], ar[1]);
    }
    else
      return Math.atan(ar[0]);
  })
  define_libfunc("sqrt", 1, 1, function(ar){
    assert_number(ar[0]);
    return Math.sqrt(ar[0]);
  })
  define_libfunc("exact-integer-sqrt", 1, 1, function(ar){
    assert_number(ar[0]);
    var sqrt_f = Math.sqrt(ar[0]);
    var sqrt_i = sqrt_f - (sqrt_f % 1);
    var rest   = ar[0] - sqrt_i * sqrt_i;

    return new Values([sqrt_i, rest]);
  })
  define_libfunc("expt", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return Math.pow(ar[0], ar[1]);
  })
  define_libfunc("make-rectangular", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return new Complex(ar[0], ar[1]);
  })
  define_libfunc("make-polar", 2, 2, function(ar){
    assert_number(ar[0]);
    assert_number(ar[1]);
    return Complex.from_polar(ar[0], ar[1]);
  })
  define_libfunc("real-part", 1, 1, function(ar){
    assert_number(ar[0]);
    return Complex.assure(ar[0]).real;
  })
  define_libfunc("imag-part", 1, 1, function(ar){
    assert_number(ar[0]);
    return Complex.assure(ar[0]).imag;
  })
  define_libfunc("magnitude", 1, 1, function(ar){
    assert_number(ar[0]);
    return Complex.assure(ar[0]).magnitude();
  })
  define_libfunc("angle", 1, 1, function(ar){
    assert_number(ar[0]);
    return Complex.assure(ar[0]).angle();
  })

  //
  //                11.7.4.4  Numerical Input and Output
  //
  define_libfunc("number->string", 1, 3, function(ar){
    var z = ar[0], radix = ar[1], precision = ar[2];
    if(precision)
      throw new Bug("number->string: precision is not yet implemented");
    
    radix = radix || 10;  //TODO: check radix is 2, 8, 10, or 16.
    return z.toString(radix);
  })
  define_libfunc("string->number", 1, 3, function(ar){
    var s = ar[0], radix = ar[1] || 10;
    switch(s){
      case "+inf.0": return Infinity;
      case "-inf.0": return -Infinity;
      case "+nan.0": return NaN;
      default:       if(s.match(/[eE.]/))
                       return parseFloat(s);
                     else
                       return parseInt(s, radix);

    }
  })

  //
  //        11.8  Booleans
  //

  define_libfunc("not", 1, 1, function(ar){
    return (ar[0] === false) ? true : false;
  });
  define_libfunc("boolean?", 1, 1, function(ar){
    return (ar[0] === false || ar[0] === true) ? true : false;
  });
  define_libfunc("boolean=?", 2, null, function(ar){
    var len = ar.length;
    for(var i=1; i<len; i++){
      if(ar[i] != ar[0]) return false;
    }
    return true;
  });

  //        11.9  Pairs and lists

  define_libfunc("pair?", 1, 1, function(ar){
    return (ar[0] instanceof Pair) ? true : false;
  });
  define_libfunc("cons", 2, 2, function(ar){
    return new Pair(ar[0], ar[1]);
  });
  define_libfunc("car", 1, 1, function(ar){
    //should raise &assertion for '()...
    if(!(ar[0] instanceof Pair)) throw new Error("Attempt to apply car on " + ar[0]);
    return ar[0].car;
  });
  define_libfunc("cdr", 1, 1, function(ar){
    //should raise &assertion for '()...
    if(!(ar[0] instanceof Pair)) throw new Error("Attempt to apply cdr on " + ar[0]);
    return ar[0].cdr;
  });
  define_libfunc("set-car!", 2, 2, function(ar){
    if(!(ar[0] instanceof Pair)) throw new Error("Attempt to apply set-car! on " + ar[0]);
    ar[0].car = ar[1];
    return BiwaScheme.undef;
  });
  define_libfunc("set-cdr!", 2, 2, function(ar){
    if(!(ar[0] instanceof Pair)) throw new Error("Attempt to apply set-cdr! on " + ar[0]);
    ar[0].cdr = ar[1];
    return BiwaScheme.undef;
  });

  // cadr, caddr, cadddr, etc.
  (function(){
    // To traverse into pair and raise error
    var get = function(funcname, spec, obj){
      var ret = obj;
      _.each(spec, function(is_cdr){
        if(ret instanceof Pair){
          ret = (is_cdr ? ret.cdr : ret.car);
        }
        else{
          throw new Error(funcname+": attempt to get "+(is_cdr ? "cdr" : "car")+" of "+ret);
        }
      });
      return ret;
    };
    define_libfunc("caar", 1, 1, function(ar){ return get("caar", [0, 0], ar[0]); });
    define_libfunc("cadr", 1, 1, function(ar){ return get("cadr", [1, 0], ar[0]); });
    define_libfunc("cdar", 1, 1, function(ar){ return get("cadr", [0, 1], ar[0]); });
    define_libfunc("cddr", 1, 1, function(ar){ return get("cadr", [1, 1], ar[0]); });

    define_libfunc("caaar", 1, 1, function(ar){ return get("caaar", [0, 0, 0], ar[0]); });
    define_libfunc("caadr", 1, 1, function(ar){ return get("caadr", [1, 0, 0], ar[0]); });
    define_libfunc("cadar", 1, 1, function(ar){ return get("cadar", [0, 1, 0], ar[0]); });
    define_libfunc("caddr", 1, 1, function(ar){ return get("caddr", [1, 1, 0], ar[0]); });
    define_libfunc("cdaar", 1, 1, function(ar){ return get("cdaar", [0, 0, 1], ar[0]); });
    define_libfunc("cdadr", 1, 1, function(ar){ return get("cdadr", [1, 0, 1], ar[0]); });
    define_libfunc("cddar", 1, 1, function(ar){ return get("cddar", [0, 1, 1], ar[0]); });
    define_libfunc("cdddr", 1, 1, function(ar){ return get("cdddr", [1, 1, 1], ar[0]); });

    define_libfunc("caaaar", 1, 1, function(ar){ return get("caaaar", [0, 0, 0, 0], ar[0]); });
    define_libfunc("caaadr", 1, 1, function(ar){ return get("caaadr", [1, 0, 0, 0], ar[0]); });
    define_libfunc("caadar", 1, 1, function(ar){ return get("caadar", [0, 1, 0, 0], ar[0]); });
    define_libfunc("caaddr", 1, 1, function(ar){ return get("caaddr", [1, 1, 0, 0], ar[0]); });
    define_libfunc("cadaar", 1, 1, function(ar){ return get("cadaar", [0, 0, 1, 0], ar[0]); });
    define_libfunc("cadadr", 1, 1, function(ar){ return get("cadadr", [1, 0, 1, 0], ar[0]); });
    define_libfunc("caddar", 1, 1, function(ar){ return get("caddar", [0, 1, 1, 0], ar[0]); });
    define_libfunc("cadddr", 1, 1, function(ar){ return get("cadddr", [1, 1, 1, 0], ar[0]); });
    define_libfunc("cdaaar", 1, 1, function(ar){ return get("cdaaar", [0, 0, 0, 1], ar[0]); });
    define_libfunc("cdaadr", 1, 1, function(ar){ return get("cdaadr", [1, 0, 0, 1], ar[0]); });
    define_libfunc("cdadar", 1, 1, function(ar){ return get("cdadar", [0, 1, 0, 1], ar[0]); });
    define_libfunc("cdaddr", 1, 1, function(ar){ return get("cdaddr", [1, 1, 0, 1], ar[0]); });
    define_libfunc("cddaar", 1, 1, function(ar){ return get("cddaar", [0, 0, 1, 1], ar[0]); });
    define_libfunc("cddadr", 1, 1, function(ar){ return get("cddadr", [1, 0, 1, 1], ar[0]); });
    define_libfunc("cdddar", 1, 1, function(ar){ return get("cdddar", [0, 1, 1, 1], ar[0]); });
    define_libfunc("cddddr", 1, 1, function(ar){ return get("cddddr", [1, 1, 1, 1], ar[0]); });
  })();

  define_libfunc("null?", 1, 1, function(ar){
    return (ar[0] === nil);
  });
  define_libfunc("list?", 1, 1, function(ar){
    var contents = [];
    for(var o=ar[0]; o != nil; o=o.cdr){
      if(o == nil) return true;
      if(!(o instanceof Pair)) return false;
      if(_.detect(contents, function(item){ return item === o.car; }))
        return false; //cyclic
      contents.push(o.car);
    }
    return true;
  });
  define_libfunc("list", 0, null, function(ar){
    var l = nil;
    for(var i=ar.length-1; i>=0; i--)
      l = new Pair(ar[i], l);
    return l;
  });
  define_libfunc("length", 1, 1, function(ar){
    assert_list(ar[0]);
    var n = 0;
    for(var o=ar[0]; o!=nil; o=o.cdr)
      n++;
    return n;
  });
  define_libfunc("append", 2, null, function(ar){
    var k = ar.length
    var ret = ar[--k];
    while(k--){
      _.each(ar[k].to_array().reverse(), function(item){
        ret = new Pair(item, ret);
      });
    }
    return ret;
  });
  define_libfunc("reverse", 1, 1, function(ar){
    assert_pair(ar[0]);

    var l = nil;
    for(var o=ar[0]; o!=nil; o=o.cdr)
      l = new Pair(o.car, l);
    return l;
  });
  define_libfunc("list-tail", 2, 2, function(ar){
    assert_pair(ar[0]);
    assert_integer(ar[1]);
    if(ar[1] < 0)
      throw new Error("list-tail: index out of range ("+ar[1]+")");

    var o = ar[0];
    for(var i=0; i<ar[1]; i++){
      if(!(o instanceof Pair)) throw new Error("list-tail: the list is shorter than " + ar[1]);
      o = o.cdr;
    }
    return o;
  });
  define_libfunc("list-ref", 2, 2, function(ar){
    assert_pair(ar[0]);
    assert_integer(ar[1]);
    if(ar[1] < 0)
      throw new Error("list-tail: index out of range ("+ar[1]+")");

    var o = ar[0];
    for(var i=0; i<ar[1]; i++){
      if(!(o instanceof Pair)) throw new Error("list-ref: the list is shorter than " + ar[1]);
      o = o.cdr;
    }
    return o.car;
  });
  define_libfunc("map", 2, null, function(ar){
    var proc = ar.shift(), lists = ar;
    _.each(lists, assert_list);

    var a = [];
    return Call.multi_foreach(lists, {
      // Called for each element
      // input: the element (or the elements, if more than one list is given)
      // output: a Call request of proc and args
      call: function(xs){ 
        return new Call(proc, _.map(xs, function(x){ return x.car }));
      },

      // Called when each Call request is finished
      // input: the result of Call request,
      //   the element(s) of the Call request (which is not used here)
      // output: `undefined' to continue,
      //   some value to terminate (the value will be the result)
      result: function(res){ a.push(res); },

      // Called when reached to the end of the list(s)
      // input: none
      // output: the resultant value 
      finish: function(){ return array_to_list(a); }
    })
  })
  define_libfunc("for-each", 2, null, function(ar){
    var proc = ar.shift(), lists = ar;
    _.each(lists, assert_list);

    return Call.multi_foreach(lists, {
      call: function(xs){ 
        return new Call(proc, _.map(xs, function(x){ return x.car }));
      },
      finish: function(){ return BiwaScheme.undef; }
    })
  })

  //        11.10  Symbols

  define_libfunc("symbol?", 1, 1, function(ar){
    return (ar[0] instanceof Symbol) ? true : false;
  });
  define_libfunc("symbol->string", 1, 1, function(ar){
    assert_symbol(ar[0]);
    return ar[0].name;
  });
  define_libfunc("symbol=?", 2, null, function(ar){
    assert_symbol(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_symbol(ar[i]);
      if(ar[i] != ar[0]) return false;
    }
    return true;
  });
  define_libfunc("string->symbol", 1, 1, function(ar){
    assert_string(ar[0]);
    return Sym(ar[0]);
  });

  //
  //        11.11  Characters
  //
  define_libfunc('char?', 1, 1, function(ar){
    return (ar[0] instanceof Char);
  });
  define_libfunc('char->integer', 1, 1, function(ar){
    assert_char(ar[0]);
    return ar[0].value.charCodeAt(0);
  })
  define_libfunc('integer->char', 1, 1, function(ar){
    assert_integer(ar[0]);
    return Char.get(String.fromCharCode(ar[0]));
  })

  var make_char_compare_func = function(test){
    return function(ar){
      assert_char(ar[0]);
      for(var i=1; i<ar.length; i++){
        assert_char(ar[i]);
        if(!test(ar[i-1].value, ar[i].value))
          return false;
      }
      return true;
    }
  }
  define_libfunc('char=?', 2, null, 
    make_char_compare_func(function(a, b){ return a == b }))
  define_libfunc('char<?', 2, null, 
    make_char_compare_func(function(a, b){ return a < b }))
  define_libfunc('char>?', 2, null, 
    make_char_compare_func(function(a, b){ return a > b }))
  define_libfunc('char<=?', 2, null, 
    make_char_compare_func(function(a, b){ return a <= b }))
  define_libfunc('char>=?', 2, null, 
    make_char_compare_func(function(a, b){ return a >= b }))

  //
  //        11.12  Strings
  //
  define_libfunc("string?", 1, 1, function(ar){
    return (typeof(ar[0]) == "string"); 
  })
  define_libfunc("make-string", 1, 2, function(ar){
    assert_integer(ar[0]);
    var c = " ";
    if(ar[1]){
      assert_char(ar[1]);
      c = ar[1].value;
    }
    var out = "";
    _.times(ar[0], function() { out += c; });
    return out;
  })
  define_libfunc("string", 1, null, function(ar){
    for(var i=0; i<ar.length; i++)
      assert_char(ar[i]);
    return _.map(ar, function(c){ return c.value }).join("");
  })
  define_libfunc("string-length", 1, 1, function(ar){
    assert_string(ar[0]);
    return ar[0].length;
  })
  define_libfunc("string-ref", 2, 2, function(ar){
    assert_string(ar[0]);
    assert_between(ar[1], 0, ar[0].length-1);
    return Char.get(ar[0].charAt([ar[1]]));
  })
  define_libfunc("string=?", 2, null, function(ar){
    assert_string(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_string(ar[i]);
      if(ar[0] != ar[i]) return false;
    }
    return true;
  })
  define_libfunc("string<?", 2, null, function(ar){
    assert_string(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_string(ar[i]);
      if(!(ar[i-1] < ar[i])) return false;
    }
    return true;
  })
  define_libfunc("string>?", 2, null, function(ar){
    assert_string(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_string(ar[i]);
      if(!(ar[i-1] > ar[i])) return false;
    }
    return true;
  })
  define_libfunc("string<=?", 2, null, function(ar){
    assert_string(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_string(ar[i]);
      if(!(ar[i-1] <= ar[i])) return false;
    }
    return true;
  })
  define_libfunc("string>=?", 2, null, function(ar){
    assert_string(ar[0]);
    for(var i=1; i<ar.length; i++){
      assert_string(ar[i]);
      if(!(ar[i-1] >= ar[i])) return false;
    }
    return true;
  })

  define_libfunc("substring", 3, 3, function(ar){
    assert_string(ar[0]);
    assert_integer(ar[1]);
    assert_integer(ar[2]);

    if(ar[1] < 0) throw new Error("substring: start too small: "+ar[1]);
    if(ar[2] < 0) throw new Error("substring: end too small: "+ar[2]);
    if(ar[0].length+1 <= ar[1]) throw new Error("substring: start too big: "+ar[1]);
    if(ar[0].length+1 <= ar[2]) throw new Error("substring: end too big: "+ar[2]);
    if(!(ar[1] <= ar[2])) throw new Error("substring: not start <= end: "+ar[1]+", "+ar[2]);
    
    return ar[0].substring(ar[1], ar[2]);
  })

  define_libfunc("string-append", 0, null, function(ar){
    for(var i=0; i<ar.length; i++)
      assert_string(ar[i]);
    
    return ar.join("");
  })
  define_libfunc("string->list", 1, 1, function(ar){
    assert_string(ar[0]);
    return array_to_list(_.map(ar[0].split(""), function(s){ return Char.get(s[0]); }));
  })
  define_libfunc("list->string", 1, 1, function(ar){
    assert_list(ar[0]);
    return _.map(ar[0].to_array(), function(c){ return c.value; }).join("");
  })
  define_libfunc("string-for-each", 2, null, function(ar){
    var proc = ar.shift(), strs = ar;
    _.each(strs, assert_string);
    
    return Call.multi_foreach(strs, {
      call: function(chars){ return new Call(proc, chars); },
      finish: function(){ return BiwaScheme.undef; }
    })
  })
  define_libfunc("string-copy", 1, 1, function(ar){
    // note: this is useless, because javascript strings are immutable
    assert_string(ar[0]);
    return ar[0];
  })


  //
  //        11.13  Vectors
  //
  define_libfunc("vector?", 1, 1, function(ar){
    return (ar[0] instanceof Array) && (ar[0].closure_p !== true)
  })
  define_libfunc("make-vector", 1, 2, function(ar){
    assert_integer(ar[0]);
    var vec = new Array(ar[0]);

    if(ar.length == 2){
      for(var i=0; i<ar[0]; i++)
        vec[i] = ar[1];
    }
    return vec;
  })
  define_libfunc("vector", 1, null, function(ar){
    return ar;
  })
  define_libfunc("vector-length", 1, 1, function(ar){
    assert_vector(ar[0]);
    return ar[0].length;
  })
  define_libfunc("vector-ref", 2, 2, function(ar){
    assert_vector(ar[0]);
    assert_integer(ar[1]);
    assert_between(ar[1], 0, ar[0].length-1);

    return ar[0][ar[1]];
  })
  define_libfunc("vector-set!", 3, 3, function(ar){
    assert_vector(ar[0]);
    assert_integer(ar[1]);

    ar[0][ar[1]] = ar[2];
    return BiwaScheme.undef;
  })
  define_libfunc("vector->list", 1, 1, function(ar){
    assert_vector(ar[0]);
    return array_to_list(ar[0]);
  })
  define_libfunc("list->vector", 1, 1, function(ar){
    assert_list(ar[0]);
    return ar[0].to_array();
  })
  define_libfunc("vector-fill!", 2, 2, function(ar){
    assert_vector(ar[0]);
    var vec = ar[0], obj = ar[1];

    for(var i=0; i<vec.length; i++)
      vec[i] = obj;
    return vec;
  })
  define_libfunc("vector-map", 2, null, function(ar){
    var proc = ar.shift(), vecs = ar;
    _.each(vecs, assert_vector);

    var a = [];
    return Call.multi_foreach(vecs, {
      call: function(objs){ return new Call(proc, objs); },
      result: function(res){ a.push(res); },
      finish: function(){ return a; }
    })
  })
  define_libfunc("vector-for-each", 2, null, function(ar){
    var proc = ar.shift(), vecs = ar;
    _.each(vecs, assert_vector);

    return Call.multi_foreach(vecs, {
      call: function(objs){ return new Call(proc, objs); },
      finish: function(){ return BiwaScheme.undef; }
    })
  })

  //
  //        11.14  Errors and violations
  //
//(error who message irritant1 ...)    procedure 
//(assertion-violation who message irritant1 ...)    procedure 
//(assert <expression>)    syntax 
  
  //
  //        11.15  Control features
  //
  define_libfunc("apply", 2, null, function(ar){
    var proc = ar.shift(), rest_args = ar.pop(), args = ar;
    args = args.concat(rest_args.to_array());

    return new Call(proc, args);
  })
  define_syntax("call-with-current-continuation", function(x){
    return new Pair(Sym("call/cc"),
             x.cdr);
  })
  define_libfunc("values", 0, null, function(ar){
    if (ar.length == 1) // eg. (values 3)
      return ar[0];
    else
      return new Values(ar);
  })
  define_libfunc("call-with-values", 2, 2, function(ar){
    var producer = ar[0], consumer = ar[1];
    assert_procedure(producer);
    assert_procedure(consumer);
    return new Call(producer, [], function(ar){
      var result = ar[0];
      if(result instanceof Values){
        return new Call(consumer, result.content);
      }
      else{
        // eg. (call-with-values (lambda () 3)
        //                       (lambda (x) x))
        return new Call(consumer, [result]);
      }
    })
  })

  //
  //dynamic-wind
  
  //        11.16  Iteration
  //named let
  
  //        11.17  Quasiquotation
  //quasiquote
  var expand_qq = function(f, lv){
    if(f instanceof Symbol || f === nil){
      return List(Sym("quote"), f);
    }
    else if(f instanceof Pair){
      var car = f.car;
      if(car instanceof Pair && car.car === Sym("unquote-splicing")){
        var lv = lv-1;
        if(lv == 0)
          return List(Sym("append"),
                      f.car.cdr.car,
                      expand_qq(f.cdr, lv+1));
        else
          return List(Sym("cons"),
                      List(Sym("list"), Sym("unquote-splicing"), expand_qq(f.car.cdr.car, lv)),
                      expand_qq(f.cdr, lv+1));
      }
      else if(car === Sym("unquote")){
        var lv = lv-1;
        if(lv == 0)
          return f.cdr.car;
        else
          return List(Sym("list"),
                      List(Sym("quote"), Sym("unquote")),
                      expand_qq(f.cdr.car, lv));
      }
      else if(car === Sym("quasiquote"))
        return List(Sym("list"),
                    Sym("quasiquote"),
                    expand_qq(f.cdr.car, lv+1));
      else
        return List(Sym("cons"),
                    expand_qq(f.car, lv),
                    expand_qq(f.cdr, lv));
    }
    else if(f instanceof Array){
      throw new Bug("vector quasiquotation is not implemented yet");
    }
//      // `#(1 2 (unquote f))
//      // (vector 1 2 f)
//      // `#(1 2 (unquote-splicing f) 3)
//      // (vector-append
//      //   (vector 1 2)
//      //   f
//      //   (vector 3))
//      // `#(1 2 `#(3 ,,f) 4)
//      // (vector 1 2 `#(3 ,g) 4)
//      var len = f.length;
//      if(len == 0) return f;
//
//      var vecs = [[]];
//      for(var i=0; i<len; i++){
//        if(f[i] instanceof Pair){
//          if(f[i].car === Sym("unquote")){
//            var lv = lv - 1;
//            if(lv == 0)
//              vecs.last().push(f[i]);
//            else
//              vecs.push()
//          }
//      }
//
//      var car = f[0];
//      if(car === Sym("unquote")){
//        var lv = lv - 1;
//        if(lv == 0)
//          return f.cdr.car;
//        else
//          return List(Sym("vector"),
//                      List(Sym("quote"), Sym("unquote")),
//                      expand_qq(f.cdr.car, lv));
//      }
//      else{
////        return [ Sym("vector"),
////                 expand_qq(
//      }
//    }
//  }
    else
      return f;
  }
  define_syntax("quasiquote", function(x){
    return expand_qq(x.cdr.car, 1);
  })
  //unquote
  define_syntax("unquote", function(x){
    throw new Error("unquote(,) must be inside quasiquote(`)");
  })
  //unquote-splicing
  define_syntax("unquote-splicing", function(x){
    throw new Error("unquote-splicing(,@) must be inside quasiquote(`)");
  })
  
  //        11.18  Binding constructs for syntactic keywords
  //let-syntax
  //letrec-syntax
  
  //        11.19  Macro transformers
  //syntax-rules
  //identifier-syntax
  //
  
  //        11.20  Tail calls and tail contexts
  //(no library function introduced)


  ///
  /// R6RS Standard Libraries
  ///

  //
  // Chapter 1 Unicode
  //
//(char-upcase char)    procedure 
//(char-downcase char)    procedure 
//(char-titlecase char)    procedure 
//(char-foldcase char)    procedure 
//
//(char-ci=? char1 char2 char3 ...)    procedure 
//(char-ci<? char1 char2 char3 ...)    procedure 
//(char-ci>? char1 char2 char3 ...)    procedure 
//(char-ci<=? char1 char2 char3 ...)    procedure 
//(char-ci>=? char1 char2 char3 ...)    procedure 
//
//(char-alphabetic? char)    procedure 
//(char-numeric? char)    procedure 
//(char-whitespace? char)    procedure 
//(char-upper-case? char)    procedure 
//(char-lower-case? char)    procedure 
//(char-title-case? char)    procedure 
//
//(char-general-category char)    procedure 

  //(string-upcase string)    procedure 
  define_libfunc("string-upcase", 1, 1, function(ar){
    assert_string(ar[0]);
    return ar[0].toUpperCase();
  });
  //(string-downcase string)    procedure 
  define_libfunc("string-downcase", 1, 1, function(ar){
    assert_string(ar[0]);
    return ar[0].toLowerCase();
  });
//(string-titlecase string)    procedure 
//(string-foldcase string)    procedure

  BiwaScheme.make_string_ci_function = function(compare){
    return function(ar){
      assert_string(ar[0]);
      var str = ar[0].toUpperCase();

      for(var i=1; i<ar.length; i++){
        assert_string(ar[i]);
        if (!compare(str, ar[i].toUpperCase()))
          return false;
      }
      return true;
    }
  };
  //(string-ci=? string1 string2 string3 ...)    procedure 
  define_libfunc("string-ci=?", 2, null, 
    make_string_ci_function(function(a, b){ return a == b; }));
  //(string-ci<? string1 string2 string3 ...)    procedure 
  define_libfunc("string-ci<?", 2, null, 
    make_string_ci_function(function(a, b){ return a < b; }));
  //(string-ci>? string1 string2 string3 ...)    procedure 
  define_libfunc("string-ci>?", 2, null, 
    make_string_ci_function(function(a, b){ return a > b; }));
  //(string-ci<=? string1 string2 string3 ...)    procedure 
  define_libfunc("string-ci<=?", 2, null, 
    make_string_ci_function(function(a, b){ return a <= b; }));
  //(string-ci>=? string1 string2 string3 ...)    procedure 
  define_libfunc("string-ci>=?", 2, null, 
    make_string_ci_function(function(a, b){ return a >= b; }));

//(string-normalize-nfd string)    procedure 
//(string-normalize-nfkd string)    procedure 
//(string-normalize-nfc string)    procedure 
//(string-normalize-nfkc string)    procedure 

  //
  // Chapter 2 Bytevectors
  //

  //
  // Chapter 3 List utilities
  //
  define_libfunc("find", 2, 2, function(ar){
    var proc = ar[0], ls = ar[1];
    assert_list(ls);
    return Call.foreach(ls, {
      call: function(x){ return new Call(proc, [x.car]) },
      result: function(res, x){ if(res) return x.car; },
      finish: function(){ return false }
    })
  })
  define_libfunc("for-all", 2, null, function(ar){
    var proc = ar.shift();
    var lists = ar;
    _.each(lists, assert_list);

    var last = true; //holds last result which proc returns
    return Call.multi_foreach(lists, {
      call: function(pairs){ 
        return new Call(proc, _.map(pairs, function(x){ return x.car }));
      },
      result: function(res, pairs){ 
        if(res === false) return false;
        last = res;
      },
      finish: function(){ return last; }
    })
  })
  define_libfunc("exists", 2, null, function(ar){
    var proc = ar.shift();
    var lists = ar;
    _.each(lists, assert_list);

    return Call.multi_foreach(lists, {
      call: function(pairs){ 
        return new Call(proc, _.map(pairs, function(x){ return x.car }));
      },
      result: function(res, pairs){ 
        if(res !== false) return res;
      },
      finish: function(){ return false; }
    })
  })
  define_libfunc("filter", 2, 2, function(ar){
    var proc = ar[0], ls = ar[1];
    assert_list(ls);

    var a = [];
    return Call.foreach(ls, {
      call: function(x){ return new Call(proc, [x.car]) },
      result: function(res, x){ if(res) a.push(x.car); },
      finish: function(){ return array_to_list(a) }
    })
  })
//  define_scmfunc("partition+", 2, 2, 
//    "(lambda (proc ls)  \
//       (define (partition2 proc ls t f) \
//         (if (null? ls) \
//           (values (reverse t) (reverse f)) \
//           (if (proc (car ls)) \
//             (partition2 proc (cdr ls) (cons (car ls) t) f) \
//             (partition2 proc (cdr ls) t (cons (car ls) f))))) \
//       (partition2 proc ls '() '()))");

  define_libfunc("partition", 2, 2, function(ar){
    var proc = ar[0], ls = ar[1];
    assert_list(ls);

    var t = [], f = [];
    return Call.foreach(ls, {
      call: function(x){ return new Call(proc, [x.car]) },
      result: function(res, x){ 
        if(res) t.push(x.car); 
        else    f.push(x.car); 
      },
      finish: function(){ 
        return new Values([array_to_list(t), array_to_list(f)]);
      }
    })
  })
  define_libfunc("fold-left", 3, null, function(ar){
    var proc = ar.shift(), accum = ar.shift(), lists = ar;
    _.each(lists, assert_list);

    return Call.multi_foreach(lists, {
      call: function(pairs){ 
        var args = _.map(pairs, function(x){ return x.car });
        args.unshift(accum);
        return new Call(proc, args);
      },
      result: function(res, pairs){ accum = res; },
      finish: function(){ return accum; }
    })
  })
  define_libfunc("fold-right", 3, null, function(ar){
    var proc = ar.shift(), accum = ar.shift();
    var lists = _.map(ar, function(ls){
      // reverse each list
      assert_list(ls);
      return array_to_list(ls.to_array().reverse());
    })

    return Call.multi_foreach(lists, {
      call: function(pairs){ 
        var args = _.map(pairs, function(x){ return x.car });
        args.push(accum);
        return new Call(proc, args);
      },
      result: function(res, pairs){ accum = res; },
      finish: function(){ return accum; }
    })
  })
  define_libfunc("remp", 2, 2, function(ar){
    var proc = ar[0], ls = ar[1];
    assert_list(ls);

    var ret = [];
    return Call.foreach(ls, {
      call: function(x){ return new Call(proc, [x.car]) },
      result: function(res, x){ if(!res) ret.push(x.car); },
      finish: function(){ return array_to_list(ret); }
    })
  })
  var make_remover = function(key){
    return function(ar){ 
      var obj = ar[0], ls = ar[1];
      assert_list(ls);

      var ret = [];
      return Call.foreach(ls, {
        call: function(x){ 
          return new Call(TopEnv[key] || CoreEnv[key], [obj, x.car]) 
        },
        result: function(res, x){ if(!res) ret.push(x.car); },
        finish: function(){ return array_to_list(ret); }
      })
    }
  }
  define_libfunc("remove", 2, 2, make_remover("equal?"));
  define_libfunc("remv", 2, 2, make_remover("eqv?"));
  define_libfunc("remq", 2, 2, make_remover("eq?"));

  define_libfunc("memp", 2, 2, function(ar){
    var proc = ar[0], ls = ar[1];
    assert_list(ls);

    var ret = [];
    return Call.foreach(ls, {
      call: function(x){ return new Call(proc, [x.car]) },
      result: function(res, x){ if(res) return x; },
      finish: function(){ return false; }
    })
  })
  var make_finder = function(key){
    return function(ar){ 
      var obj = ar[0], ls = ar[1];
      assert_list(ls);

      var ret = [];
      return Call.foreach(ls, {
        call: function(x){ 
          return new Call(TopEnv[key] || CoreEnv[key], [obj, x.car]) 
        },
        result: function(res, x){ if(res) return x; },
        finish: function(){ return false; }
      })
    }
  }
  define_libfunc("member", 2, 2, make_finder("equal?"));
  define_libfunc("memv", 2, 2, make_finder("eqv?"));
  define_libfunc("memq", 2, 2, make_finder("eq?"));
  
  define_libfunc("assp", 2, 2, function(ar){
    var proc = ar[0], als = ar[1];
    assert_list(als);

    var ret = [];
    return Call.foreach(als, {
      call: function(x){ 
        if(x.car.car)
          return new Call(proc, [x.car.car]);
        else
          throw new Error("ass*: pair required but got "+to_write(x.car));
      },
      result: function(res, x){ if(res) return x.car; },
      finish: function(){ return false; }
    })
  })
  var make_assoc = function(func_name, eq_func_name){
    return function(ar){ 
      var obj = ar[0], list = ar[1];
      assert_list(list);

      var ret = [];
      return Call.foreach(list, {
        call: function(ls){ 
          if(!BiwaScheme.isPair(ls.car))
            throw new Error(func_name+": pair required but got "+to_write(ls.car));
            
          var equality = (TopEnv[eq_func_name] || CoreEnv[eq_func_name]);
          return new Call(equality, [obj, ls.car.car]);
        },
        result: function(was_equal, ls){ if(was_equal) return ls.car; },
        finish: function(){ return false; }
      })
    }
  }
  define_libfunc("assoc", 2, 2, make_assoc("assoc", "equal?"));
  define_libfunc("assv", 2, 2, make_assoc("assv", "eqv?"));
  define_libfunc("assq", 2, 2, make_assoc("assq", "eq?"));

  define_libfunc("cons*", 1, null, function(ar){
    if(ar.length == 1)
      return ar[0];
    else{
      var ret = null;
      _.each(ar.reverse(), function(x){
        if(ret){
          ret = new Pair(x, ret);
        }
        else
          ret = x;
      })
      return ret;
    }
  })

  //
  // Chapter 4 Sorting
  //
  // NOTE: compare function is not supported yet.
  // it is partially implemented as list-sort/comp
  // (see extra_lib.js).
  // TODO: implement some sorting algorithm in CPS
  // so that setTimeout in compare procedures work well
  //
  //(list-sort list)
  define_libfunc("list-sort", 1, 2, function(ar){
    if(ar[1]){
      throw new Bug("list-sort: cannot take compare proc now");
    }
    assert_list(ar[0]);
    return array_to_list(ar[0].to_array().sort());
  });

  //(vector-sort proc vector)    procedure
  define_libfunc("vector-sort", 1, 2, function(ar){
    if(ar[1]){
      throw new Bug("vector-sort: cannot take compare proc now");
    }
    assert_vector(ar[0]);
      return _.clone(ar[0]).sort();
  });

  //(vector-sort! proc vector)    procedure 
  define_libfunc("vector-sort!", 1, 2, function(ar){
    if(ar[1]){
      throw new Bug("vector-sort!: cannot take compare proc now");
    }
    assert_vector(ar[0]);
    ar[0].sort();
    return BiwaScheme.undef;
  });

  //
  // Chapter 5 Control Structures
  //
  define_syntax("when", function(x){
    //(when test body ...) 
    //=> (if test (begin body ...) #<undef>)
    var test = x.cdr.car, body = x.cdr.cdr;

    return new Pair(Sym("if"), 
             new Pair(test,
               new Pair(new Pair(Sym("begin"), body),
                 new Pair(BiwaScheme.undef, nil))));
  });

  define_syntax("unless", function(x){
    //(unless test body ...) 
    //=> (if (not test) (begin body ...) #<undef>)
    var test = x.cdr.car, body = x.cdr.cdr;

    return new Pair(Sym("if"), 
             new Pair(new Pair(Sym("not"), new Pair(test, nil)),
               new Pair(new Pair(Sym("begin"), body),
                 new Pair(BiwaScheme.undef, nil))));
  });

  define_syntax("do", function(x){
    //(do ((var1 init1 step1)
    //     (var2 init2 step2) ...)
    //    (test expr1 expr2 ...)
    //  body1 body2 ...)
    //=> (let loop` ((var1 init1) (var2 init2) ...)
    //     (if test 
    //       (begin expr1 expr2 ...)
    //       (begin body1 body2 ...
    //              (loop` step1 step2 ...)))))

    // parse arguments
    if(!BiwaScheme.isPair(x.cdr))
      throw new Error("do: no variables of do");
    var varsc = x.cdr.car;
    if(!BiwaScheme.isPair(varsc))
      throw new Error("do: variables must be given as a list");
    if(!BiwaScheme.isPair(x.cdr.cdr))
      throw new Error("do: no resulting form of do");
    var resultc = x.cdr.cdr.car;
    var bodyc = x.cdr.cdr.cdr;

    // construct subforms
    var loop = BiwaScheme.gensym();

    var init_vars = array_to_list(varsc.map(function(var_def){
      var a = var_def.to_array();
      return List(a[0], a[1]);
    }));

    var test = resultc.car;
    var result_exprs = new Pair(Sym("begin"), resultc.cdr);

    var next_loop = new Pair(loop, array_to_list(varsc.map(function(var_def){
      var a = var_def.to_array();
      return a[2] || a[0];
    })));
    var body_exprs = new Pair(Sym("begin"), bodyc).concat(List(next_loop));

    // combine subforms 
    return List(Sym("let"), 
                loop,
                init_vars,
                List(Sym("if"),
                     test,
                     result_exprs,
                     body_exprs));
  });

  //(case-lambda <case-lambda clause> ...)    syntax
  define_syntax("case-lambda", function(x){
    // (case-lambda (() body0 ...)
    //              ((a) body1 ...)
    //              ((a b . cc) body2 ...)
    //              (rest bodyn ...))
    //=> (lambda args`
    //     (let1 len` (length args`)
    //       (if (= len` (length '()))
    //         ((lambda () body0 ...) args`)
    //         (if (= len` (length '(a)))
    //           ((lambda (a) body1 ...) args`)
    //           (if (>= len` (length '(a b)))
    //             ((lambda (a b . cc) body2 ...) args`)
    //             ((lambda rest bodyn ...) args`)
//    var len = BiwaScheme.gensym();
//    if(!BiwaScheme.isPair(x.cdr))
//      throw new Error("do: no variables of do");

  });

  //
  // Chapter 6 Records
  // see also: src/system/record.js
  //

  // 6.2 Records: Syntactic layer
  //eqv, eq

  //(define-record-type <name spec> <record clause>*)    syntax 
  define_syntax("define-record-type", function(x){
    // (define-record-type <name spec> <record clause>*)
    var name_spec = x.cdr.car;
    var record_clauses = x.cdr.cdr;

    // 1. parse name spec
    // <name spec>: either
    // - <record name> eg: point
    // - (<record name> <constructor name> <predicate name>) 
    //   eg: (point make-point point?)
    if(BiwaScheme.isSymbol(name_spec)){
      var record_name = name_spec;
      var constructor_name = Sym("make-"+name_spec.name);
      var predicate_name = Sym(name_spec.name+"?");
    }
    else{
      assert_list(name_spec);
      var record_name = name_spec.car;
      var constructor_name = name_spec.cdr.car;
      var predicate_name = name_spec.cdr.cdr.car;
      assert_symbol(record_name);
      assert_symbol(constructor_name);
      assert_symbol(predicate_name);
    }
    
    // 2. parse record clauses
    var sealed = false;
    var opaque = false;
    var nongenerative = false;
    var uid = false;
    var parent_name;
    var parent_rtd = false;
    var parent_cd = false;
    var protocol = false;
    var fields = [];

    // <record clause>:
    _.each(record_clauses.to_array(), function(clause){
      switch(clause.car){
        // - (fields <field spec>*)
        case Sym("fields"):
          fields = _.map(clause.cdr.to_array(), function(field_spec, idx){
            if(BiwaScheme.isSymbol(field_spec)){
              // - <field name>
              return {name: field_spec, idx: idx, mutable: false,
                      accessor_name: null, mutator_name: null};
            }
            else{
              assert_list(field_spec);
              assert_symbol(field_spec.car);
              switch(field_spec.car){
                case Sym("immutable"):
                  // - (immutable <field name>)
                  // - (immutable <field name> <accessor name>)
                  var field_name = field_spec.cdr.car;
                  assert_symbol(field_name);

                  if(BiwaScheme.isNil(field_spec.cdr.cdr))
                    return {name: field_name, idx: idx, mutable: false};
                  else
                    return {name: field_name, idx: idx, mutable: false,
                            accessor_name: field_spec.cdr.cdr.car};
                  break;

                case Sym("mutable"):
                  // - (mutable <field name>)
                  // - (mutable <field name> <accessor name> <mutator name>)
                  var field_name = field_spec.cdr.car;
                  assert_symbol(field_name);

                  if(BiwaScheme.isNil(field_spec.cdr.cdr))
                    return {name: field_name, idx: idx, mutable: true}
                  else
                    return {name: field_name, idx: idx, mutable: true,
                            accessor_name: field_spec.cdr.cdr.car,
                            mutator_name:  field_spec.cdr.cdr.cdr.car};
                  break;
                default:
                  throw new Error("define-record-type: field definition "+
                              "must start with `immutable' or `mutable' "+
                              "but got "+BiwaScheme.inspect(field_spec.car));
              }
            }
          });
          break;
        // - (parent <name>)
        case Sym("parent"):
          parent_name = clause.cdr.car;
          assert_symbol(parent_name);
          break;
        // - (protocol <expr>)
        case Sym("protocol"):
          protocol = clause.cdr.car;
          break;
        // - (sealed <bool>)
        case Sym("sealed"):
          sealed = !!clause.cdr.car;
          break;
        // - (opaque <bool>)
        case Sym("opaque"):
          opaque = !!clause.cdr.car;
          break;
        // - (nongenerative <uid>?)
        case Sym("nongenerative"):
          nongenerative = true;
          uid = clause.cdr.car;
          break;
        // - (parent-rtd <rtd> <cd>)
        case Sym("parent-rtd"):
          parent_rtd = clause.cdr.car;
          parent_cd = clause.cdr.cdr.car;
          break;
        default:
          throw new BiwaScheme.Error("define-record-type: unknown clause `"+
                                     BiwaScheme.to_write(clause.car)+"'");
      }
    });

    if(parent_name){
      parent_rtd = [Sym("record-type-descriptor"), parent_name];
      parent_cd  = [Sym("record-constructor-descriptor"), parent_name];
    }

    // 3. build the definitions
    // Note: In this implementation, rtd and cd are not bound to symbols.
    // They are referenced through record name by record-type-descriptor
    // and record-constructor-descriptor. These relation are stored in
    // the hash BiwaScheme.Record._DefinedTypes.
    var rtd = [Sym("record-type-descriptor"), record_name];
    var cd  = [Sym("record-constructor-descriptor"), record_name];

    // registration
    var rtd_fields = _.map(fields, function(field){
      return List(Sym(field.mutable ? "mutable" : "immutable"), field.name);
    });
    rtd_fields.is_vector = true; //tell List not to convert
    var rtd_def = [Sym("make-record-type-descriptor"),
                    [Sym("quote"), record_name], parent_rtd, uid,
                    sealed, opaque, rtd_fields];
    var cd_def = [Sym("make-record-constructor-descriptor"),
                    Sym("__rtd"), parent_cd, protocol];
    var registration =
      [Sym("let*"), [[Sym("__rtd"), rtd_def],
                    [Sym("__cd"), cd_def]],
        [Sym("_define-record-type"),
          [Sym("quote"), record_name], Sym("__rtd"), Sym("__cd")]];

    // accessors and mutators
    var accessor_defs = _.map(fields, function(field){
      var name = field.accessor_name ||
                   Sym(record_name.name+"-"+field.name.name);

      return [Sym("define"), name, [Sym("record-accessor"), rtd, field.idx]];
    });

    var mutator_defs = _.filter(fields, function(field){
      return field.mutable;
    });
    mutator_defs = _.map(mutator_defs, function(field){
      var name = field.mutator_name ||
                   Sym(record_name.name+"-"+field.name.name+"-set!");

      return [Sym("define"), name, [Sym("record-mutator"), rtd, field.idx]];
    });

    // Wrap the definitions with `begin'
    // Example:
    //   (begin
    //     (let* ((__rtd (make-record-type-descriptor 'square
    //                     (record-type-descriptor rect)
    //                     #f #f #f 
    //                     #((mutable w) (mutable h))))
    //            (__cd (make-record-constructor-descriptor __rtd
    //                    (record-constructor-descriptor rect)
    //                    (lambda (n) ...))))
    //       (_define-record-type 'square __rtd __cd))
    //
    //     (define make-square
    //       (record-constructor
    //         (record-constructor-descriptor square)))
    //     (define square?
    //       (record-predicate (record-type-descriptor square)))
    //     (define square-w
    //       (record-accessor (record-type-descriptor square) 0))
    //     (define square-h
    //       (record-accessor (record-type-descriptor square) 1))
    //     (define set-square-w!
    //       (record-mutator (record-type-descriptor square) 0))
    //     (define set-square-h!
    //       (record-mutator (record-type-descriptor square) 1)))
    //
    return deep_array_to_list(
      [Sym("begin"),
        registration,
        [Sym("define"), constructor_name, [Sym("record-constructor"), cd]],
        [Sym("define"), predicate_name, [Sym("record-predicate"), rtd]],
        ].concat(accessor_defs).
          concat(mutator_defs)
    );
  });

  define_libfunc("_define-record-type", 3, 3, function(ar){
    assert_symbol(ar[0]);
    assert_record_td(ar[1]);
    assert_record_cd(ar[2]);
    BiwaScheme.Record.define_type(ar[0].name, ar[1], ar[2]);
    return BiwaScheme.undef;
  });

  //(record-type-descriptor <record name>)    syntax 
  define_syntax("record-type-descriptor", function(x){
    return deep_array_to_list([Sym("_record-type-descriptor"), [Sym("quote"), x.cdr.car]]);
  });
  define_libfunc("_record-type-descriptor", 1, 1, function(ar){
    assert_symbol(ar[0]);
    var type = BiwaScheme.Record.get_type(ar[0].name);
    if(type)
      return type.rtd;
    else
      throw new Error("record-type-descriptor: unknown record type "+ar[0].name);
  });

  //(record-constructor-descriptor <record name>)    syntax 
  define_syntax("record-constructor-descriptor", function(x){
    return deep_array_to_list([Sym("_record-constructor-descriptor"), [Sym("quote"), x.cdr.car]]);
  });
  define_libfunc("_record-constructor-descriptor", 1, 1, function(ar){
    assert_symbol(ar[0]);
    var type = BiwaScheme.Record.get_type(ar[0].name);
    if(type)
      return type.cd;
    else
      throw new Error("record-constructor-descriptor: unknown record type "+ar[0].name);
  });

  // 6.3  Records: Procedural layer
  //(make-record-type-descriptor name    procedure
  define_libfunc("make-record-type-descriptor", 6, 6, function(ar){
    var name = ar[0], parent_rtd = ar[1], uid = ar[2],
        sealed = ar[3], opaque = ar[4], fields = ar[5];
    
    assert_symbol(name);
    if(parent_rtd) assert_record_td(parent_rtd);
    if(uid){
      assert_symbol(uid);
      var _rtd = BiwaScheme.Record.RTD.NongenerativeRecords[uid.name];
      if(_rtd){
        // the record type is already defined.
        return _rtd;
        // should check equality of other arguments..
      }
    }
    sealed = !!sealed;
    opaque = !!opaque;
    assert_vector(fields);
    for(var i=0; i<fields.length; i++){
      var list = fields[i];
      assert_symbol(list.car, "mutability");
      assert_symbol(list.cdr.car, "field name");
      fields[i] = [list.cdr.car.name, (list.car == Sym("mutable"))];
    };

    var rtd = new BiwaScheme.Record.RTD(name, parent_rtd, uid,
                                     sealed, opaque, fields);
    if(uid)
      BiwaScheme.Record.RTD.NongenerativeRecords[uid.name] = rtd;

    return rtd;
  });

  //(record-type-descriptor? obj)    procedure 
  define_libfunc("record-type-descriptor?", 1, 1, function(ar){
    return (ar[0] instanceof BiwaScheme.Record.RTD);
  });

  //(make-record-constructor-descriptor rtd    procedure 
  define_libfunc("make-record-constructor-descriptor", 3, 3, function(ar){
    var rtd = ar[0], parent_cd = ar[1], protocol = ar[2];

    assert_record_td(rtd);
    if(parent_cd) assert_record_cd(parent_cd);
    if(protocol) assert_procedure(protocol);

    return new BiwaScheme.Record.CD(rtd, parent_cd, protocol);
  });

  //(record-constructor constructor-descriptor)    procedure
  define_libfunc("record-constructor", 1, 1, function(ar){
    var cd = ar[0];
    assert_record_cd(cd);

    return cd.record_constructor();
  });

  //(record-predicate rtd)    procedure
  define_libfunc("record-predicate", 1, 1, function(ar){
    var rtd = ar[0];
    assert_record_td(rtd);

    return function(args){
      var obj = args[0];

      return (obj instanceof BiwaScheme.Record) &&
             (obj.rtd === rtd);
    };
  });

  //(record-accessor rtd k)    procedure 
  define_libfunc("record-accessor", 2, 2, function(ar){
    var rtd = ar[0], k = ar[1];
    assert_record_td(rtd);
    assert_integer(k);
    for(var _rtd = rtd.parent_rtd; _rtd; _rtd = _rtd.parent_rtd)
      k += _rtd.fields.length;

    return function(args){
      var record = args[0];
      var error_msg = rtd.name.name+"-"+rtd.field_name(k)+": "+
                      BiwaScheme.to_write(record)+
                      " is not a "+rtd.name.name;
      assert(BiwaScheme.isRecord(record), error_msg);

      var descendant = false;
      for(var _rtd = record.rtd; _rtd; _rtd = _rtd.parent_rtd){
        if(_rtd == rtd) descendant = true;
      }
      assert(descendant, error_msg);

      return record.get(k);
    };
  });

  //(record-mutator rtd k)    procedure
  define_libfunc("record-mutator", 2, 2, function(ar){
    var rtd = ar[0], k = ar[1];
    assert_record_td(rtd);
    assert_integer(k);
    for(var _rtd = rtd.parent_rtd; _rtd; _rtd = _rtd.parent_rtd)
      k += _rtd.fields.length;

    return function(args){
      var record = args[0], val = args[1];
      var func_name = rtd.field_name(k);

      assert_record(record);
      assert(record.rtd === rtd,
            func_name+": "+BiwaScheme.to_write(record)+
            " is not a "+rtd.name.name);
      assert(!record.rtd.sealed,
            func_name+": "+rtd.name.name+" is sealed (can't mutate)");

      record.set(k, val);
    };
  });

  // 6.4  Records: Inspection
  //(record? obj)    procedure
  define_libfunc("record?", 1, 1, function(ar){
    var obj = ar[0];
    if(BiwaScheme.isRecord(obj)){
      if(obj.rtd.opaque)
        return false; // opaque records pretend as if it is not a record.
      else
        return true;
    }
    else
      return false;
  });

  //(record-rtd record)    procedure
  define_libfunc("record-rtd", 1, 1, function(ar){
    assert_record(ar[0]);
    return ar[0].rtd;
  });

  //(record-type-name rtd)    procedure
  define_libfunc("record-type-name", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return ar[0].name;
  });

  //(record-type-parent rtd)    procedure
  define_libfunc("record-type-parent", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return ar[0].parent_rtd;
  });

  //(record-type-uid rtd)    procedure 
  define_libfunc("record-type-uid", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return ar[0].uid;
  });

  //(record-type-generative? rtd)    procedure 
  define_libfunc("record-type-generative?", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return ar[0].generative;
  });

  //(record-type-sealed? rtd)    procedure
  define_libfunc("record-type-sealed?", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return ar[0].sealed;
  });

  //(record-type-opaque? rtd)    procedure
  define_libfunc("record-type-opaque?", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return ar[0].opaque;
  });

  //(record-type-field-names rtd)    procedure
  define_libfunc("record-type-field-names", 1, 1, function(ar){
    assert_record_td(ar[0]);
    return _.map(ar[0].fields, function(field){ return field.name; });
  });

  //(record-field-mutable? rtd k)    procedure 
  define_libfunc("record-field-mutable?", 2, 2, function(ar){
    var rtd = ar[0], k = ar[1];
    assert_record_td(ar[0]);
    assert_integer(k);

    for(var _rtd = rtd.parent_rtd; _rtd; _rtd = _rtd.parent_rtd)
      k += _rtd.fields.length;

    return ar[0].fields[k].mutable;
  });

  //
  // Chapter 7 Exceptions and conditions
  //
//(with-exception-handler handler thunk)    procedure
//(guard (<variable>    syntax
  //(raise obj)    procedure 
  define_libfunc("raise", 1, 1, function(ar){
    throw new BiwaScheme.UserError(BiwaScheme.to_write(ar[0]));
  });
//(raise-continuable obj)    procedure
//
//&condition    condition type
//(condition condition1 ...)    procedure 
//(simple-conditions condition)    procedure
//(condition? obj)    procedure
//(condition-predicate rtd)    procedure 
//(condition-accessor rtd proc)    procedure
//
//&message    condition type 
//&warning    condition type 
//&serious    condition type 
//&error    condition type 
//&violation    condition type 
//&assertion    condition type 
//&irritants    condition type 
//&who    condition type 
//&non-continuable    condition type 
//&implementation-restriction    condition type 
//&lexical    condition type 
//&syntax    condition type 
//&undefined    condition type 

  //
  // Chapter 8 I/O
  //
//  //    8  I/O
//  //        8.1  Condition types
//&i/o    condition type 
//&i/o-read    condition type 
//&i/o-write    condition type 
//&i/o-invalid-position    condition type 
//&i/o-filename    condition type 
//&i/o-file-protection    condition type
//&i/o-file-is-read-only    condition type
//&i/o-file-already-exists    condition type 
//&i/o-file-does-not-exist    condition type
//&i/o-port    condition type 
//
//  //        8.2  Port I/O
//  //            8.2.1  File names
//  //(no function introduced)
//
//  //            8.2.2  File options
//(file-options <file-options symbol> ...)    syntax 
//
//  //            8.2.3  Buffer modes
//(buffer-mode <buffer-mode symbol>)    syntax  
//(buffer-mode? obj)    procedure
//
//  //            8.2.4  Transcoders
//(latin-1-codec)    procedure 
//(utf-8-codec)    procedure 
//(utf-16-codec)    procedure
//(eol-style <eol-style symbol>)    syntax
//(native-eol-style)    procedure
//&i/o-decoding    condition type
//&i/o-encoding    condition type 
//(error-handling-mode <error-handling-mode symbol>)    syntax 
//(make-transcoder codec)    procedure 
//(make-transcoder codec eol-style)    procedure 
//(make-transcoder codec eol-style handling-mode)    procedure
//(native-transcoder)    procedure
//(transcoder-codec transcoder)    procedure 
//(transcoder-eol-style transcoder)    procedure 
//(transcoder-error-handling-mode transcoder)    procedure 
//(bytevector->string bytevector transcoder)    procedure 
//(string->bytevector string transcoder)    procedure
//
  //            8.2.5  End-of-file object
  //-> 8.3 (eof-object)    procedure 
  //-> 8.3 (eof-object? obj)    procedure 

  //            8.2.6  Input and output ports
  define_libfunc("port?", 1, 1, function(ar){
    return (ar[0] instanceof Port);
  })
//(port-transcoder port)    procedure 
  define_libfunc("textual-port?", 1, 1, function(ar){
    assert_port(ar[0]);
    return !ar[0].is_binary;
  })
  define_libfunc("binary-port?", 1, 1, function(ar){
    assert_port(ar[0]);
    return ar[0].is_binary;
  })
//(transcoded-port binary-port transcoder)    procedure
//(port-has-port-position? port)    procedure 
//(port-position port)    procedure
//(port-has-set-port-position!? port)    procedure 
//(set-port-position! port pos)    procedure
  define_libfunc("close-port", 1, 1, function(ar){
    assert_port(ar[0]);
    ar[0].close();
    return BiwaScheme.undef;
  })
  //(call-with-port port proc)    procedure
  define_libfunc("call-with-port", 2, 2, function(ar){
    var port = ar[0], proc = ar[1];
    assert_port(port);
    assert_closure(proc);

    return new Call(proc, [port], function(ar){
      // Automatically close the port 
      port.close();
      return ar[0]; // TODO: values
    });
  });

  //            8.2.7  Input ports
  //8.3 (input-port? obj)    procedure 
//(port-eof? input-port)    procedure 
//(open-file-input-port filename)    procedure
//(open-bytevector-input-port bytevector)    procedure
//(open-string-input-port string)    procedure 
//(standard-input-port)    procedure 
//8.3 (current-input-port)    procedure
//(make-custom-binary-input-port id read!    procedure
//(make-custom-textual-input-port id read!    procedure
//
//  //            8.2.8  Binary input
//(get-u8 binary-input-port)    procedure
//(lookahead-u8 binary-input-port)    procedure
//(get-bytevector-n binary-input-port count)    procedure 
//(get-bytevector-n! binary-input-port    procedure
//(get-bytevector-some binary-input-port)    procedure
//(get-bytevector-all binary-input-port)    procedure
//
//  //            8.2.9  Textual input
//(get-char textual-input-port)    procedure
//(lookahead-char textual-input-port)    procedure 
//(get-string-n textual-input-port count)    procedure
//(get-string-n! textual-input-port string start count)    procedure
//(get-string-all textual-input-port)    procedure 
//(get-line textual-input-port)    procedure
//(get-datum textual-input-port)    procedure
//
  //            8.2.10  Output ports
  //8.3 (output-port? obj)    procedure
//(flush-output-port output-port)    procedure 
//(output-port-buffer-mode output-port)    procedure 
//(open-file-output-port filename)    procedure 
//(open-bytevector-output-port)    procedure 
//(call-with-bytevector-output-port proc)    procedure 
//(open-string-output-port)    procedure   
  //(call-with-string-output-port proc)    procedure 
  define_libfunc("call-with-string-output-port", 1, 1, function(ar){
    var proc = ar[0];
    assert_procedure(proc);

    var port = new BiwaScheme.Port.StringOutput();

    return new Call(proc, [port], function(ar){
      port.close();
      return port.output_string();
    });
  });

//(standard-output-port)    procedure 
//(standard-error-port)    procedure 
//8.3 (current-output-port)    procedure 
//8.3 (current-error-port)    procedure 
//(make-custom-binary-output-port id    procedure
  //(make-custom-textual-output-port id write! get-position set-position! close)
//  define_libfunc("make-custom-textual-output-port", 5, 5, function(ar){
//    assert_string(ar[0]);
//    assert_closure(ar[1]);
//    assert_closure(ar[2]);
//    assert_closure(ar[3]);
//    assert_closure(ar[4]);
//    return new Port(ar[0], ar[1], ar[2], ar[3], ar[4]);
//  })
//
//  //            8.2.11  Binary output
//(put-u8 binary-output-port octet)    procedure
//(put-bytevector binary-output-port bytevector)    procedure 
//
  //            8.2.12  Textual output
  define_libfunc("put-char", 2, 2, function(ar){
    assert_port(ar[0]);
    assert_char(ar[1]);
    ar[0].put_string(ar[1].value);
    return BiwaScheme.undef;
  })
  define_libfunc("put-string", 2, 2, function(ar){
    assert_port(ar[0]);
    assert_string(ar[1]);
    ar[0].put_string(ar[1]);
    return BiwaScheme.undef;
  })
  define_libfunc("put-datum", 2, 2, function(ar){
    assert_port(ar[0]);
    ar[0].put_string(to_write(ar[1]));
    return BiwaScheme.undef;
  })
//
//  //            8.2.13  Input/output ports
//(open-file-input/output-port filename)    procedure 
//(make-custom-binary-input/output-port    procedure 
//(make-custom-textual-input/output-port    procedure
//
//  //        8.3  Simple I/O
  define_libfunc("eof-object", 0, 0, function(ar){
    return eof;
  })
  define_libfunc("eof-object?", 1, 1, function(ar){
    return ar[0] === eof;
  })
//(call-with-input-file filename proc)    procedure 
//(call-with-output-file filename proc)    procedure
  define_libfunc("input-port?", 1, 1, function(ar){
    assert_port(ar[0]);
    return ar[0].is_input;
  })
  define_libfunc("output-port?", 1, 1, function(ar){
    assert_port(ar[0]);
    return ar[0].is_output;
  })
  define_libfunc("current-input-port", 0, 0, function(ar){
    return Port.current_input;
  })
  define_libfunc("current-output-port", 0, 0, function(ar){
    return Port.current_output;
  })
  define_libfunc("current-error-port", 0, 0, function(ar){
    return Port.current_error;
  })
//(with-input-from-file filename thunk)    procedure 
//(with-output-to-file filename thunk)    procedure
//(open-input-file filename)    procedure
//(open-output-file filename)    procedure 
  define_libfunc("close-input-port", 1, 1, function(ar){
    assert_port(ar[0]);
    if(!ar[0].is_input)
      throw new Error("close-input-port: port is not input port");
    ar[0].close();
    return BiwaScheme.undef;
  });
  define_libfunc("close-output-port", 1, 1, function(ar){
    assert_port(ar[0]);
    if(!ar[0].is_output)
      throw new Error("close-output-port: port is not output port");
    ar[0].close();
    return BiwaScheme.undef;
  });
//(read-char)    procedure 
//(peek-char)    procedure 
  define_libfunc("read", 0, 1, function(ar){
    var port = ar[0] || Port.current_input;
    assert_port(port);

    return port.get_string(function(str){
	    return Interpreter.read(str);
    });
  })

  define_libfunc("write-char", 1, 2, function(ar){
    var port = ar[1] || Port.current_output;
    assert_char(ar[0]);
    port.put_string(ar[0].value);
    return BiwaScheme.undef;
  });
  define_libfunc("newline", 0, 1, function(ar){
    var port = ar[0] || Port.current_output;
    port.put_string("\n");
    return BiwaScheme.undef;
  });
  define_libfunc("display", 1, 2, function(ar){
    var port = ar[1] || Port.current_output;
    port.put_string(to_display(ar[0]));
    return BiwaScheme.undef;
  });
  define_libfunc("write", 1, 2, function(ar){
    var port = ar[1] || Port.current_output;
    assert_port(port);
    port.put_string(to_write(ar[0]));
    return BiwaScheme.undef;
  });

  //
  // Chapter 9 File System
  // Chapter 10 Command-line access and exit values
  //
  // see src/library/node_functions.js

  //
  // Chapter 11 Arithmetic
  //
////        11.1  Bitwise operations
////        11.2  Fixnums
//(fixnum? obj)    procedure
//(fixnum-width)    procedure 
//(least-fixnum)    procedure 
//(greatest-fixnum)    procedure 
//(fx=? fx1 fx2 fx3 ...)    procedure 
//(fx>? fx1 fx2 fx3 ...)    procedure 
//(fx<? fx1 fx2 fx3 ...)    procedure 
//(fx>=? fx1 fx2 fx3 ...)    procedure 
//(fx<=? fx1 fx2 fx3 ...)    procedure 
//(fxzero? fx)    procedure 
//(fxpositive? fx)    procedure 
//(fxnegative? fx)    procedure 
//(fxodd? fx)    procedure 
//(fxeven? fx)    procedure
//(fxmax fx1 fx2 ...)    procedure 
//(fxmin fx1 fx2 ...)    procedure
//(fx+ fx1 fx2)    procedure 
//(fx* fx1 fx2)    procedure
//(fx- fx1 fx2)    procedure 
//(fxdiv-and-mod fx1 fx2)    procedure 
//(fxdiv fx1 fx2)    procedure 
//(fxmod fx1 fx2)    procedure 
//(fxdiv0-and-mod0 fx1 fx2)    procedure 
//(fxdiv0 fx1 fx2)    procedure 
//(fxmod0 fx1 fx2)    procedure 
//(fx+/carry fx1 fx2 fx3)    procedure
//(fx-/carry fx1 fx2 fx3)    procedure
//(fx*/carry fx1 fx2 fx3)    procedure 
//(fxnot fx)    procedure
//(fxand fx1 ...)    procedure 
//(fxior fx1 ...)    procedure 
//(fxxor fx1 ...)    procedure
//(fxif fx1 fx2 fx3)    procedure
//(fxbit-count fx)    procedure
//(fxlength fx)    procedure
//(fxfirst-bit-set fx)    procedure 
//(fxbit-set? fx1 fx2)    procedure
//(fxcopy-bit fx1 fx2 fx3)    procedure 
//(fxbit-field fx1 fx2 fx3)    procedure
//(fxcopy-bit-field fx1 fx2 fx3 fx4)    procedure
//(fxarithmetic-shift fx1 fx2)    procedure
//(fxarithmetic-shift-left fx1 fx2)    procedure 
//(fxarithmetic-shift-right fx1 fx2)    procedure
//(fxrotate-bit-field fx1 fx2 fx3 fx4)    procedure
//(fxreverse-bit-field fx1 fx2 fx3)    procedure
//
////        11.3  Flonums
//(flonum? obj)    procedure
//(real->flonum x)    procedure
//(fl=? fl1 fl2 fl3 ...)    procedure 
//(fl<? fl1 fl2 fl3 ...)    procedure 
//(fl<=? fl1 fl2 fl3 ...)    procedure 
//(fl>? fl1 fl2 fl3 ...)    procedure 
//(fl>=? fl1 fl2 fl3 ...)    procedure
//(flinteger? fl)    procedure 
//(flzero? fl)    procedure 
//(flpositive? fl)    procedure 
//(flnegative? fl)    procedure 
//(flodd? ifl)    procedure 
//(fleven? ifl)    procedure 
//(flfinite? fl)    procedure 
//(flinfinite? fl)    procedure 
//(flnan? fl)    procedure
//(flmax fl1 fl2 ...)    procedure 
//(flmin fl1 fl2 ...)    procedure
//(fl+ fl1 ...)    procedure 
//(fl* fl1 ...)    procedure 
//(fl- fl1 fl2 ...)    procedure 
//(fl- fl)    procedure 
//(fl/ fl1 fl2 ...)    procedure 
//(fl/ fl)    procedure 
//(flabs fl)    procedure
//(fldiv-and-mod fl1 fl2)    procedure 
//(fldiv fl1 fl2)    procedure 
//(flmod fl1 fl2)    procedure 
//(fldiv0-and-mod0 fl1 fl2)    procedure 
//(fldiv0 fl1 fl2)    procedure 
//(flmod0 fl1 fl2)    procedure 
//(flnumerator fl)    procedure 
//(fldenominator fl)    procedure 
//(flfloor fl)    procedure 
//(flceiling fl)    procedure 
//(fltruncate fl)    procedure 
//(flround fl)    procedure
//(flexp fl)    procedure 
//(fllog fl)    procedure 
//(fllog fl1 fl2)    procedure 
//(flsin fl)    procedure 
//(flcos fl)    procedure 
//(fltan fl)    procedure 
//(flasin fl)    procedure 
//(flacos fl)    procedure 
//(flatan fl)    procedure 
//(flatan fl1 fl2)    procedure
//(flsqrt fl)    procedure
//(flexpt fl1 fl2)    procedure 
//&no-infinities    condition type 
//&no-nans    condition type 
//(fixnum->flonum fx)    procedure 

  ////        11.4  Exact bitwise arithmetic
  //(bitwise-not ei)    procedure
  define_libfunc("bitwise-not", 1, 1, function(ar){
    return ~(ar[0]);
  });

  //(bitwise-and ei1 ...)    procedure 
  define_libfunc("bitwise-and", 1, null, function(ar){
    return _.reduce(ar, function(ret, item){ return ret & item; });
  });

  //(bitwise-ior ei1 ...)    procedure 
  define_libfunc("bitwise-ior", 1, null, function(ar){
    return _.reduce(ar, function(ret, item){ return ret | item; });
  });

  //(bitwise-xor ei1 ...)    procedure 
  define_libfunc("bitwise-xor", 1, null, function(ar){
    return _.reduce(ar, function(ret, item){ return ret ^ item; });
  });

  //(bitwise-if ei1 ei2 ei3)    procedure
  define_libfunc("bitwise-if", 3, 3, function(ar){
    return (ar[0] & ar[1]) | (~ar[0] & ar[2]);
  });

  //(bitwise-bit-count ei)    procedure 
  define_libfunc("bitwise-bit-count", 1, 1, function(ar){
    var e = Math.abs(ar[0]), ret = 0;
    for (; e != 0; e >>= 1) {
      if(e & 1) ret++;
    }
    return ret;
  });

  //(bitwise-length ei)    procedure
  define_libfunc("bitwise-length", 1, 1, function(ar){
    var e = Math.abs(ar[0]), ret = 0;
    for (; e != 0; e >>= 1) {
      ret++;
    }
    return ret;
  });

  //(bitwise-first-bit-set ei)    procedure 
  define_libfunc("bitwise-first-bit-set", 1, 1, function(ar){
    var e = Math.abs(ar[0]), ret = 0;
    if (e == 0) return -1;
    for (; e != 0; e >>= 1) {
      if (e & 1) return ret;
      ret++;
    }
  });

  //(bitwise-bit-set? ei1 ei2)    procedure 
  define_libfunc("bitwise-bit-set?", 2, 2, function(ar){
    return !!(ar[0] & (1 << ar[1]));
  });

  //(bitwise-copy-bit ei1 n b)    procedure
  define_libfunc("bitwise-copy-bit", 3, 3, function(ar){
    var mask = (1 << ar[1]);
    return (mask & (ar[2] << ar[1])) |   // Set n-th bit to b
           (~mask & ar[0]);              // and use ei1 for rest of the bits
  });

  //(bitwise-bit-field ei1 start end)    procedure
  define_libfunc("bitwise-bit-field", 3, 3, function(ar){
    var mask = ~(-1 << ar[2]);  // Has 1 at 0...end
    return (mask & ar[0]) >> ar[1];
  });

  //(bitwise-copy-bit-field dst start end src)    procedure 
  define_libfunc("bitwise-copy-bit-field", 4, 4, function(ar){
    var dst=ar[0], start=ar[1], end=ar[2], src=ar[3];
    var mask = ~(-1 << end) &   // Has 1 at 0...end
                (-1 << start)   // Clear 0...start
    return (mask & (src << start)) |
           (~mask & dst);
  });

  //(bitwise-arithmetic-shift ei1 ei2)    procedure
  define_libfunc("bitwise-arithmetic-shift", 2, 2, function(ar){
    return (ar[1] >= 0) ? (ar[0] << ar[1]) : (ar[0] >> -ar[1]);
  });

  //(bitwise-arithmetic-shift-left ei1 ei2)    procedure 
  define_libfunc("bitwise-arithmetic-shift-left", 2, 2, function(ar){
    return ar[0] << ar[1];
  });

  //(bitwise-arithmetic-shift-right ei1 ei2)    procedure 
  define_libfunc("bitwise-arithmetic-shift-right", 2, 2, function(ar){
    return ar[0] >> ar[1];
  });

  //(bitwise-rotate-bit-field ei1 start end count)    procedure 
  define_libfunc("bitwise-rotate-bit-field", 4, 4, function(ar){
    var n=ar[0], start=ar[1], end=ar[2], count=ar[3];
    var width = end - start;
    if (width <= 0) return n;

    count %= width;
    var orig_field = (~(-1 << end) & n) >> start;
    var rotated_field = (orig_field << count) |
                        (orig_field >> (width - count))
    
    var mask = ~(-1 << end) & (-1 << start);
    return (mask & (rotated_field << start)) |
           (~mask & n);
  });
  
  //(bitwise-reverse-bit-field ei1 ei2 ei3)    procedure 
  define_libfunc("bitwise-reverse-bit-field", 3, 3, function(ar){
    var ret=n=ar[0], start=ar[1], end=ar[2];
    var orig_field = ((~(-1 << end) & n) >> start);
    for (var i=0; i<(end-start); i++, orig_field>>=1) {
      var bit = orig_field & 1;
      var setpos = end - 1 - i;
      var mask = (1 << setpos);
      ret = (mask & (bit << setpos)) | (~mask & ret);
    }
    return ret;
  });

  //
  // Chapter 12 syntax-case
  //

  //
  // Chapter 13 Hashtables
  //

  //13.1  Constructors
  //(define h (make-eq-hashtale)
  //(define h (make-eq-hashtable 1000))
  define_libfunc("make-eq-hashtable", 0, 1, function(ar){
    // Note: ar[1] (hashtable size) is just ignored
    return new Hashtable(Hashtable.eq_hash, Hashtable.eq_equiv);
  });
  //(make-eqv-hashtable)    procedure 
  //(make-eqv-hashtable k)    procedure 
  define_libfunc("make-eqv-hashtable", 0, 1, function(ar){
    return new Hashtable(Hashtable.eqv_hash, Hashtable.eqv_equiv);
  });
  //(make-hashtable hash-function equiv)    procedure 
  //(make-hashtable hash-function equiv k)    procedure
  define_libfunc("make-hashtable", 2, 3, function(ar){
    assert_procedure(ar[0]);
    assert_procedure(ar[1]);
    return new Hashtable(ar[0], ar[1]);
  });

  //13.2  Procedures
  // (hashtable? hash)
  define_libfunc("hashtable?", 1, 1, function(ar){
    return ar[0] instanceof Hashtable;
  });
  //(hashtable-size hash)
  define_libfunc("hashtable-size", 1, 1, function(ar){
    assert_hashtable(ar[0]);
    return ar[0].keys().length;
  });

  // Find a pair from a hashtable with given key.
  //
  // hash      - a BiwaScheme.Hashtable
  // key       - an object
  // callbacks - an object contains callback functions
  //             .on_found     - function(pair, hashed)
  //               pair   - [Object key, Object value]
  //               hashed - Object hashed
  //             .on_not_found - function(hashed)
  //               hashed - Object hashed
  //
  // Returns an instance of BiwaScheme.Call.
  BiwaScheme.find_hash_pair = function(hash, key, callbacks){
    // invoke hash proc 
    return new Call(hash.hash_proc, [key], function(ar){
      var hashed = ar[0];
      var candidate_pairs = hash.candidate_pairs(hashed);

      if (!candidate_pairs){ // shortcut: obviously not found
        return callbacks.on_not_found(hashed);
      }

      // search the exact key from candidates
      return Call.foreach(candidate_pairs, {
        call: function(pair){
          // invoke the equivalence proc
          return new Call(hash.equiv_proc, [key, pair[0]]);
        },
        result: function(equal, pair){
          if(equal) {       // found
            return callbacks.on_found(pair, hashed);
          }
        },
        finish: function(){ // not found
          return callbacks.on_not_found(hashed);
        }
      });
    });
  };

  //(hashtable-ref hash "foo" #f)
  define_libfunc("hashtable-ref", 3, 3, function(ar){
    var hash = ar[0], key = ar[1], ifnone = ar[2];
    assert_hashtable(hash);

    return BiwaScheme.find_hash_pair(hash, key, {
      on_found: function(pair){
        return pair[1];
      },
      on_not_found: function(hashed){
        return ifnone;
      }
    });
  });

  //(hashtable-set! hash "foo" '(1 2))
  define_libfunc("hashtable-set!", 3, 3, function(ar){
    var hash = ar[0], key = ar[1], value = ar[2];
    assert_hashtable(hash);
    assert(hash.mutable, "hashtable is not mutable");

    return BiwaScheme.find_hash_pair(hash, key, {
      on_found: function(pair){
        pair[1] = value;
        return BiwaScheme.undef;
      },
      on_not_found: function(hashed){
        hash.add_pair(hashed, key, value);
        return BiwaScheme.undef;
      }
    });
  });

  //(hashtable-delete! hash "foo")
  define_libfunc("hashtable-delete!", 2, 2, function(ar){
    var hash = ar[0], key = ar[1];
    assert_hashtable(hash);
    assert(hash.mutable, "hashtable is not mutable");

    return BiwaScheme.find_hash_pair(hash, key, {
      on_found: function(pair, hashed){
        hash.remove_pair(hashed, pair);
        return BiwaScheme.undef;
      },
      on_not_found: function(hashed){
        return BiwaScheme.undef;
      }
    });
  });

  //(hashtable-contains? hash "foo")
  define_libfunc("hashtable-contains?", 2, 2, function(ar){
    var hash = ar[0], key = ar[1];
    assert_hashtable(hash);

    return BiwaScheme.find_hash_pair(hash, key, {
      on_found: function(pair){
        return true;
      },
      on_not_found: function(hashed){
        return false;
      }
    });
  });

  //(hashtable-update! hashtable key proc default)    procedure 
  define_libfunc("hashtable-update!", 4, 4, function(ar){
    var hash = ar[0], key = ar[1], proc = ar[2], ifnone = ar[3];
    assert_hashtable(hash);
    assert(hash.mutable, "hashtable is not mutable");
    assert_procedure(proc);

    return BiwaScheme.find_hash_pair(hash, key, {
      on_found: function(pair, hashed){
        // invoke proc and get new value
        return new Call(proc, [pair[1]], function(ar){
          // replace the value
          pair[1] = ar[0];
          return BiwaScheme.undef;
        });
      },
      on_not_found: function(hashed){
        // invoke proc and get new value
        return new Call(proc, [ifnone], function(ar){
          // create new pair
          hash.add_pair(hashed, key, ar[0]);
          return BiwaScheme.undef;
        });
      }
    });
  });
  //(hashtable-copy hashtable)    procedure 
  //(hashtable-copy hashtable mutable)    procedure 
  define_libfunc("hashtable-copy", 1, 2, function(ar){
    var mutable = (ar[1]===undefined) ? false : !!ar[1];
    assert_hashtable(ar[0]);
    return ar[0].create_copy(mutable);
  });
  //(hashtable-clear! hashtable)    procedure 
  //(hashtable-clear! hashtable k)    procedure 
  define_libfunc("hashtable-clear!", 0, 1, function(ar){
    assert_hashtable(ar[0]);
    assert(ar[0].mutable, "hashtable is not mutable");
    ar[0].clear();
    return BiwaScheme.undef;
  });
  //(hashtable-keys hash)  ; => vector
  define_libfunc("hashtable-keys", 1, 1, function(ar){
    assert_hashtable(ar[0]);
    return ar[0].keys();
  });
  //(hashtable-entries hash)  ; => two vectors (keys, values)
  define_libfunc("hashtable-entries", 1, 1, function(ar){
    assert_hashtable(ar[0]);
    return new Values([ar[0].keys(), ar[0].values()]);
  });

  //13.3  Inspection
  
  //(hashtable-equivalence-function hashtable)    procedure 
  define_libfunc("hashtable-equivalence-function", 1, 1, function(ar){
    assert_hashtable(ar[0]);
    return ar[0].equiv_proc;
  });
  //(hashtable-hash-function hashtable)    procedure 
  define_libfunc("hashtable-hash-function", 1, 1, function(ar){
    assert_hashtable(ar[0]);
    return ar[0].hash_proc;
  });
  //(hashtable-mutable? hashtable)    procedure 
  define_libfunc("hashtable-mutable?", 1, 1, function(ar){
    assert_hashtable(ar[0]);
    return ar[0].mutable;
  });

  //13.4  Hash functions

  //(equal-hash obj)    procedure 
  define_libfunc("equal-hash", 0, 0, function(ar){
    return Hashtable.equal_hash;
  });
  //(string-hash string)    procedure
  define_libfunc("string-hash", 0, 0, function(ar){
    return Hashtable.string_hash;
  });
  //(string-ci-hash string)    procedure
  define_libfunc("string-ci-hash", 0, 0, function(ar){
    return Hashtable.string_ci_hash;
  });
  //(symbol-hash symbol)    procedure
  define_libfunc("symbol-hash", 0, 0, function(ar){
    return Hashtable.symbol_hash;
  });

  //
  // Chapter 14 Enumerators
  //
  //(make-enumeration symbol-list) -> enum-set(new type)
  define_libfunc("make-enumeration", 1, 1, function(ar){
    assert_list(ar[0]);
    var members = ar[0].to_array();
    var enum_type = new BiwaScheme.Enumeration.EnumType(members);
    return enum_type.universe();
  });

  //(enum-set-universe enum-set) -> enum-set(same type as the argument)
  define_libfunc("enum-set-universe", 1, 1, function(ar){
    assert_enum_set(ar[0]);
    return ar[0].enum_type.universe();
  });

  //(enum-set-indexer enum-set) -> (lambda (sym)) -> integer or #f
  define_libfunc("enum-set-indexer", 1, 1, function(ar){
    assert_enum_set(ar[0]);
    return ar[0].enum_type.indexer();
  });

  //(enum-set-constructor enum-set) -> (lambda (syms)) -> enum-set(same type as the argument)
  define_libfunc("enum-set-constructor", 1, 1, function(ar){
    assert_enum_set(ar[0]);
    return ar[0].enum_type.constructor();
  });

  //(enum-set->list enum-set) -> symbol-list
  define_libfunc("enum-set->list", 1, 1, function(ar){
    assert_enum_set(ar[0]);
    return ar[0].symbol_list();
  });

  //(enum-set-member? symbol enum-set) -> bool
  define_libfunc("enum-set-member?", 2, 2, function(ar){
    assert_symbol(ar[0]);
    assert_enum_set(ar[1]);
    return ar[1].is_member(ar[0]);
  });

  //(enum-set-subset? esa esb) -> bool
  define_libfunc("enum-set-subset?", 2, 2, function(ar){
    assert_enum_set(ar[0]);
    assert_enum_set(ar[1]);
    return ar[0].is_subset(ar[1]);
  });

  //(enum-set=? esa esb) -> bool
  define_libfunc("enum-set=?", 2, 2, function(ar){
    assert_enum_set(ar[0]);
    assert_enum_set(ar[1]);
    return ar[0].equal_to(ar[1]);
  });

  //(enum-set-union es1 es2) -> enum-set
  define_libfunc("enum-set-union", 2, 2, function(ar){
    assert_enum_set(ar[0]);
    assert_enum_set(ar[1]);
    assert(ar[0].enum_type === ar[1].enum_type,
           "two enum-sets must be the same enum-type", "enum-set-union");
    return ar[0].union(ar[1]);
  });

  //(enum-set-intersection es1 es2) -> enum-set
  define_libfunc("enum-set-intersection", 2, 2, function(ar){
    assert_enum_set(ar[0]);
    assert_enum_set(ar[1]);
    return ar[0].intersection(ar[1]);
  });

  //(enum-set-difference es1 es2) -> enum-set
  define_libfunc("enum-set-difference", 2, 2, function(ar){
    assert_enum_set(ar[0]);
    assert_enum_set(ar[1]);
    return ar[0].difference(ar[1]);
  });

  //(enum-set-complement enum-set) -> enum-set
  define_libfunc("enum-set-complement", 1, 1, function(ar){
    assert_enum_set(ar[0]);
    return ar[0].complement();
  });

  //(enum-set-projection esa esb) -> enum-set
  define_libfunc("enum-set-projection", 2, 2, function(ar){
    assert_enum_set(ar[0]);
    assert_enum_set(ar[1]);
    return ar[0].projection(ar[1]);
  });

  //(define-enumeration <type-name> (<symbol> ...) <constructor-syntax>)
  // Example: 
  //   (define-enumeration color (red green black white) color-set)
  //   this defines:
  //     - an EnumType
  //     - (color red) ;=> 'red
  //     - (color-set red black) ;=> #<enum-set (red black)>
  define_syntax("define-enumeration", function(x){
    // Extract parameters 
    var type_name = x.cdr.car;
    assert(BiwaScheme.isSymbol(type_name),
           "expected symbol for type_name", "define-enumeration");
    type_name = type_name.name;

    var members = x.cdr.cdr.car;
    assert(BiwaScheme.isList(members),
           "expected list of symbol for members", "define-enumeration");
    members = members.to_array();

    var constructor_name = x.cdr.cdr.cdr.car;
    assert(BiwaScheme.isSymbol(constructor_name),
           "expected symbol for constructor_name", "define-enumeration");
    constructor_name = constructor_name.name;

    // Define EnumType
    var enum_type = new BiwaScheme.Enumeration.EnumType(members);
    
    // Define (color red)
    define_syntax(type_name, function(x){
      // (color)
      assert(!BiwaScheme.isNil(x.cdr),
             "an argument is needed", type_name);

      var arg = x.cdr.car;
      assert_symbol(arg, type_name);
      
      // Check arg is included in the universe
      assert(_.include(enum_type.members, arg),
        arg.name+" is not included in the universe: "+
          BiwaScheme.to_write(enum_type.members),
        type_name);

      return BiwaScheme.List(Sym("quote"), arg);
    });

    // Define (color-set red black)
    define_syntax(constructor_name, function(x){
      assert_list(x.cdr, constructor_name);

      var symbols = x.cdr.to_array();

      // Check each argument is included in the universe
      _.each(symbols, function(arg){
        assert_symbol(arg, constructor_name);
        assert(_.include(enum_type.members, arg),
          arg.name+" is not included in the universe: "+
            BiwaScheme.to_write(enum_type.members),
          constructor_name);
      });

      // Create an EnumSet
      return new BiwaScheme.Enumeration.EnumSet(enum_type, symbols);
    });
  });

  //
  // Chapter 15 Composite library
  //
  //(rnrs 6) = all - eval - mutable pairs - mutable strings - r5rs compatibility

  //
  // Chapter 16 eval
  //
  //(eval expression environment)    procedure 
  define_libfunc("eval", 1, 1, function(ar, intp){
    //TODO: environment
    //TODO: this implementation has a bug that
    //  expressions which contains #<undef>, etc. cannot be evaluated.
    var expr = ar[0];
    var intp2 = new Interpreter(intp);
    return intp2.evaluate(expr.to_write());
  });
//(environment import-spec ...)    procedure

  //
  // Chapter 17 Mutable pairs
  //
//(set-car! pair obj)    procedure
//(set-cdr! pair obj)    procedure

  //
  // Chapter 18 Mutable strings
  //
  //(string-set! string k char)    procedure
 // (string-fill! string char)    procedure 
 
  //
  // Chapter 19 R5RS compatibility
  //
//(exact->inexact z)    procedure 
//(inexact->exact z)    procedure 
//
//(quotient n1 n2)    procedure 
//(remainder n1 n2)    procedure 
//(modulo n1 n2)    procedure
//
//(delay <expression>)    syntax  
//(force promise)    procedure 
//(make-promise (lambda () <expression>))
//
//(null-environment n)    procedure 
//(scheme-report-environment n)    procedure 

  /* --------------------------------------- namespace webscheme */ 
}
if( typeof(BiwaScheme)!='object' ) BiwaScheme={}; with(BiwaScheme) {

  //
  // interface to javascript
  //
  define_libfunc("js-eval", 1, 1, function(ar){
    return eval(ar[0]);
  });
  define_libfunc("js-ref", 2, 2, function(ar){
    if(_.isString(ar[1])){
      return ar[0][ar[1]];
    }
    else{
      assert_symbol(ar[1]);
      return ar[0][ar[1].name];
    }
  });
  define_libfunc("js-set!", 3, 3, function(ar){
    assert_string(ar[1]);
    ar[0][ar[1]] = ar[2];
    return BiwaScheme.undef;
  });

  // (js-call (js-eval "Math.pow") 2 4)
  define_libfunc("js-call", 1, null, function(ar){
    var js_func = ar.shift();
    assert_function(js_func);

    var receiver = null;
    return js_func.apply(receiver, ar);
  });
  // (js-invoke (js-new "Date") "getTime")
  define_libfunc("js-invoke", 2, null, function(ar){
    var js_obj = ar.shift();
    var func_name = ar.shift();
    if(!_.isString(func_name)){
      assert_symbol(func_name);
      func_name = func_name.name;
    }
    if(js_obj[func_name])
      return js_obj[func_name].apply(js_obj, ar);
    else
      throw new Error("js-invoke: function "+func_name+" is not defined");
  });

  // Short hand for JavaScript method call.
  //
  // (js-invocation obj '(foo 1 2 3))  ;=> obj.foo(1,2,3)
  // (js-invocation obj '(foo 1 2 3)   ;=> obj.foo(1,2,3)
  //                    'bar           ;      .bar
  //                    '(baz 4 5))    ;      .baz(4,5)
  // (js-invocation 'Math '(pow 2 3))  ;=> Math.pow(2,3)
  //
  // It also converts
  //   (lambda (e) ...) to
  //   (js-closure (lambda (e) ...))
  //   and
  //   '((a . b) (c . 4)) to
  //   {a: "b", c: 4}
  //
  // TODO: provide corresponding macro ".." 
  define_libfunc("js-invocation", 2, null, function(ar, intp){
    var receiver = ar.shift();
    // TODO: convert lambdas by js-closure 
    if(BiwaScheme.isSymbol(receiver)){
      receiver = eval(receiver.name); //XXX: is this ok?
    }

    var v = receiver;

    // Process each method call
    _.each(ar, function(callspec){
        if(BiwaScheme.isSymbol(callspec)){
          // Property access
          v = v[callspec.name];
        }
        else if(BiwaScheme.isList(callspec)){
          // Method call
          var args = callspec.to_array();

          assert_symbol(args[0]);
          var method = args.shift().name;

          // Convert arguments
          args = _.map(args, function(arg){
              if(BiwaScheme.isClosure(arg)){
                // closure -> JavaScript funciton
                return BiwaScheme.js_closure(arg, intp);
              }
              else if(BiwaScheme.isList(arg)){
                // alist -> JavaScript Object
                var o = {};
                arg.foreach(function(pair){
                    assert_symbol(pair.car);
                    o[pair.car.name] = pair.cdr;
                  });
                return o;
              }
              else
                return arg;
            });

          // Call the method
          if(!_.isFunction(v[method])){
            throw new BiwaScheme.Error("js-invocation: the method `"+method+"' not found");
          }
          v = v[method].apply(v, args);
        }
        else{
          // (wrong argument)
          throw new BiwaScheme.Error("js-invocation: expected list or symbol for callspec but got " + BiwaScheme.inspect(callspec));
        }
      });

    return v;
  });

  // (js-new "Date" 2005 1 1)
  // (js-new "Draggable elem 'onEnd (lambda (drg) ...))
  //   If symbol is given, following arguments are converted to 
  //   an js object. If any of them is a scheme closure,
  //   it is converted to js function which invokes that closure.
  //
  define_libfunc("js-new", 1, null, function(ar, intp){
    // make js object from key-value pair
    var array_to_obj = function(ary){
      if((ary.length % 2) != 0)
        throw new Error("js-new: odd number of key-value pair");

      var obj = {};
      for(var i=0; i<ary.length; i+=2){
        var key = ary[i], value = ary[i+1];
        assert_symbol(key);
        if(value.closure_p === true)
          value = BiwaScheme.js_closure(value, intp);

        obj[key.name] = value;
      }
      return obj;
    };

    var ctor = ar.shift();
    assert_string(ctor);
    if(ar.length == 0){
      return eval("new " + ctor + "()");
    }
    else{
      // pack args to js object, if symbol appears
      var args = [];
      for(var i=0; i<ar.length; i++){
        if(ar[i] instanceof Symbol){
          args.push(array_to_obj(ar.slice(i)));
          break;
        }
        else{
          args.push(ar[i]);
        }
      }
      // construct js code to create new object
      var args_str = _.map(ar, function(value, i){
        return "args['" + i + "']";
      }).join(",");
      return eval("new " + ctor + "(" + args_str + ")");
    }
  });

  // (js-obj "foo" 1 "bar" 2)
  // -> {"foo": 1, "bar": 2}
  define_libfunc("js-obj", 0, null, function(ar){
    if(ar.length % 2 != 0){
      throw new Error("js-obj: number of arguments must be even");
    }

    var obj = {};
    for(i=0; i<ar.length/2; i++){
      assert_string(ar[i*2]);
      obj[ar[i*2]] = ar[i*2+1];
    }
    return obj;
  });

  BiwaScheme.js_closure = function(proc, intp){
    var intp2 = new Interpreter(intp);
    return function(/*args*/){
      return intp2.invoke_closure(proc, _.toArray(arguments));
    };
  };
  // (js-closure (lambda (event) ..))
  // Returns a js function which executes the given procedure.
  //
  // Example
  //   (add-handler! ($ "#btn") "click" (js-closure on-click))
  define_libfunc("js-closure", 1, 1, function(ar, intp){
    assert_closure(ar[0]);
    return BiwaScheme.js_closure(ar[0], intp);
  });

  define_libfunc("js-null?", 1, 1, function(ar){
    return ar[0] === null;
  });

  define_libfunc("js-undefined?", 1, 1, function(ar){
    return ar[0] === undefined;
  });

  define_libfunc("js-function?", 1, 1, function(ar){
    return _.isFunction(ar[0]);
  });

  define_libfunc("js-array-to-list", 1, 1, function(ar){
    return BiwaScheme.array_to_list(ar[0]);
  });

  define_libfunc("list-to-js-array", 1, 1, function(ar){
    return ar[0].to_array();
  });

  BiwaScheme.alist_to_js_obj = function(alist) {
    if (alist === nil) {
      return {} ;
    }
    assert_list(alist);
    var obj = {};
    alist.foreach(function(item){
      assert_string(item.car);
      obj[item.car] = item.cdr;
    });
    return obj;
  };
  define_libfunc("alist-to-js-obj", 1, 1, function(ar) {
    return BiwaScheme.alist_to_js_obj(ar[0]);
  });

  BiwaScheme.js_obj_to_alist = function(obj) {
    if (obj === undefined) {
      return BiwaScheme.nil;
    }
    var arr = [];
    _.each(obj, function(val, key) {
      arr.push(new Pair(key, val));
    });
    var alist = BiwaScheme.array_to_list(arr);
    return alist;
  };
  define_libfunc("js-obj-to-alist", 1, 1, function(ar) {
    return BiwaScheme.js_obj_to_alist(ar[0]);
  });

  //
  // timer, sleep
  //
  define_libfunc("timer", 2, 2, function(ar, intp){
    var proc = ar[0], sec = ar[1];
    assert_closure(proc);
    assert_real(sec);
    var intp2 = new Interpreter(intp);
    setTimeout(function(){ intp2.invoke_closure(proc); }, sec * 1000);
    return BiwaScheme.undef;
  });
  define_libfunc("set-timer!", 2, 2, function(ar, intp){
    var proc = ar[0], sec = ar[1];
    assert_closure(proc);
    assert_real(sec);
    var intp2 = new Interpreter(intp);
    return setInterval(function(){ intp2.invoke_closure(proc); }, sec * 1000);
  });
  define_libfunc("clear-timer!", 1, 1, function(ar){
    var timer_id = ar[0];
    clearInterval(timer_id);
    return BiwaScheme.undef;
  });
  define_libfunc("sleep", 1, 1, function(ar){
    var sec = ar[0];
    assert_real(sec);
    return new BiwaScheme.Pause(function(pause){
      setTimeout(function(){ pause.resume(nil); }, sec * 1000);
    });
  });

  //
  // console
  //
  // (console-debug obj1 ...)
  // (console-log obj1 ...)
  // (console-info obj1 ...)
  // (console-warn obj1 ...)
  // (console-error obj1 ...)
  //   Put objects to console, if window.console is defined.
  //   Returns obj1.
  //
  // Example:
  //     (some-func arg1 (console-debug arg2) arg3)
  var define_console_func = function(name){
    define_libfunc("console-"+name, 1, null, function(ar){
      var con = window.console;
      if(con){
        var vals = _.map(ar, function(item){
          return BiwaScheme.inspect(item, {fallback: item});
        });

        con[name].apply(con, vals);
      }
      return ar[0];
    });
  };
  define_console_func("debug");
  define_console_func("log");
  define_console_func("info");
  define_console_func("warn");
  define_console_func("error");

}

if( typeof(BiwaScheme)!='object' ) BiwaScheme={}; with(BiwaScheme) {
  define_libfunc("html-escape", 1, 1, function(ar){
    assert_string(ar[0]);
    return _.escape(ar[0]);
  });
  BiwaScheme.inspect_objs = function(objs){
    return _.map(objs, BiwaScheme.inspect).join(", ");
  };
  define_libfunc("inspect", 1, null, function(ar){
    return BiwaScheme.inspect_objs(ar);
  });
  define_libfunc("inspect!", 1, null, function(ar){
    puts(BiwaScheme.inspect_objs(ar));
    return BiwaScheme.undef;
  });

  //
  // json
  //
  // json->sexp
  // Array -> list
  // Object -> alist
  // (number, boolean, string, 
  //
  BiwaScheme.json2sexp = function(json){
    switch(true){
    case _.isNumber(json) ||
         _.isString(json) ||
         json === true || json === false:
      return json;
    case _.isArray(json):
      return array_to_list(_.map(json, json2sexp));
    case typeof(json) == "object":
      var ls = nil;
      for(key in json){
        ls = new Pair(new Pair(key, json2sexp(json[key])),
               ls);
      }
      return ls;
    default:
      throw new Error("json->sexp: detected invalid value for json: "+BiwaScheme.inspect(json));
    }
    throw new Bug("must not happen");
  }
  define_libfunc("json->sexp", 1, 1, function(ar){
    return json2sexp(ar[0]);
  })

  //
  //from Gauche
  //

  // (identity obj)
  // Returns obj.
  define_libfunc("identity", 1, 1, function(ar){
    return ar[0];
  });

  // (inc! i)
  // = (set! i (+ i 1))
  // Increments i (i.e., set i+1 to i).
  define_syntax("inc!", function(x){
    var target = x.cdr.car;
    return List(Sym("set!"),
                target, 
                [Sym("+"), target, 1]);
  });
  
  // (dec! i)
  // = (set! i (- i 1))
  // Decrements i (i.e., set i-1 to i).
  define_syntax("dec!", function(x){
    var target = x.cdr.car;
    return List(Sym("set!"),
                target, 
                [Sym("-"), target, 1]);
  });

  // string
  
  define_libfunc("string-concat", 1, 1, function(ar){
    assert_list(ar[0]);
    return ar[0].to_array().join("");
  })

  define_libfunc("string-split", 2, 2, function(ar){
    assert_string(ar[0]);
    assert_string(ar[1]);
    return array_to_list(ar[0].split(ar[1]));
  })

  define_libfunc("string-join", 1, 2, function(ar){
    assert_list(ar[0]);
    var delim = ""
    if(ar[1]){
      assert_string(ar[1]);
      delim = ar[1];
    }
    return ar[0].to_array().join(delim);
  })
  
  // lists

  define_libfunc("intersperse", 2, 2, function(ar){
    var item = ar[0], ls = ar[1];
    assert_list(ls);

    var ret = [];
    _.each(ls.to_array().reverse(),function(x){
      ret.push(x);
      ret.push(item);
    });
    ret.pop();
    return array_to_list(ret);
  });

  define_libfunc("map-with-index", 2, null, function(ar){
    var proc = ar.shift(), lists = ar;
    _.each(lists, assert_list);

    var results = [], i = 0;
    return Call.multi_foreach(lists, {
      call: function(xs){ 
        var args = _.map(xs, function(x){ return x.car });
        args.unshift(i);
        i++;
        return new Call(proc, args);
      },
      result: function(res){ results.push(res); },
      finish: function(){ return array_to_list(results); }
    });
  });

  // loop

  // (dotimes (variable limit result) body ...)
  // Iterate with variable 0 to limit-1.
  // ->
  //    (do ((tlimit limit)
  //         (variable 0 (+ variable 1)))
  //        ((>= variable tlimit) result)
  //      body ...)
  define_syntax("dotimes", function(x){
    var spec = x.cdr.car,
        bodies = x.cdr.cdr;
    var variable = spec.car,
        limit = spec.cdr.car,
        result = spec.cdr.cdr.car;
    var tlimit = BiwaScheme.gensym();

    var do_vars = deep_array_to_list([[tlimit, limit],
                                      [variable, 0, [Sym("+"), variable, 1]]]);
    var do_check = deep_array_to_list([[Sym(">="), variable, tlimit], result]);

    return new Pair(Sym("do"),
             new Pair(do_vars,
               new Pair(do_check,
                 bodies)));
  });

  // sorting
  
  // These functions takes a Scheme proc and sort the given
  // list or vector using the proc as the compare function.
  //
  // Limitations:
  //  - you should not use Ajax or sleep inside the proc
  //  - you cannot access to the free variables outside the proc
  //
  // (list-sort/comp proc list)
  // (vector-sort/comp proc vector)
  // (vector-sort/comp! proc vector)

  // utility function. takes a JS Array and a Scheme procedure,
  // returns sorted array
  var sort_with_comp = function(ary, proc, intp){
    return ary.sort(function(a, b){
        var intp2 = new BiwaScheme.Interpreter(intp);
        return intp2.invoke_closure(proc, [a, b]);
      });
  };

  define_libfunc("list-sort/comp", 1, 2, function(ar, intp){
    assert_procedure(ar[0]);
    assert_list(ar[1]);

    return array_to_list(sort_with_comp(ar[1].to_array(), ar[0], intp));
  });
  define_libfunc("vector-sort/comp", 1, 2, function(ar, intp){
    assert_procedure(ar[0]);
    assert_vector(ar[1]);

    return sort_with_comp(_.clone(ar[1]), ar[0], intp);
  });
  define_libfunc("vector-sort/comp!", 1, 2, function(ar, intp){
    assert_procedure(ar[0]);
    assert_vector(ar[1]);

    sort_with_comp(ar[1], ar[0], intp);
    return BiwaScheme.undef;
  });
  
  // macros

  //(define-macro (foo x) body ...)
  //(define-macro foo lambda)

  var rearrange_args = function (expected, given) {
    var args = [];
    var dotpos = (new Compiler).find_dot_pos(expected);
    if (dotpos == -1)
      args = given;
    else {
      for (var i = 0; i < dotpos; i++) {
        args[i] = given[i];
      }
      args[i] = array_to_list(given.slice(i));
    }
    return args;
  }
  define_syntax("define-macro", function(x){
    var head = x.cdr.car;
    var expected_args;
    if(head instanceof Pair){
      var name = head.car;
      expected_args = head.cdr;
      var body = x.cdr.cdr;
      var lambda = new Pair(Sym("lambda"),
                     new Pair(expected_args,
                       body))
    }
    else{
      var name = head;
      var lambda = x.cdr.cdr.car;
      expected_args = lambda.cdr.car;
    }

    //[close, n_frees, do_body, next]
    var opc = Compiler.compile(lambda);
    if(opc[1] != 0)
      throw new Bug("you cannot use free variables in macro expander (or define-macro must be on toplevel)")
    var cls = [opc[2]];

    TopEnv[name.name] = new Syntax(name.name, function(sexp){
      var given_args = sexp.to_array();

      given_args.shift();
      
      var intp = new Interpreter();
      var args = rearrange_args(expected_args, given_args);
      var result = intp.invoke_closure(cls, args);
      return result;
    });

    return BiwaScheme.undef;
  })

  var macroexpand_1 = function(x){
    if(x instanceof Pair){
      if(x.car instanceof Symbol && TopEnv[x.car.name] instanceof Syntax){
        var transformer = TopEnv[x.car.name];
        x = transformer.transform(x);
      }
      else
        throw new Error("macroexpand-1: `" + to_write_ss(x) + "' is not a macro");
    }
    return x;
  }
  define_syntax("%macroexpand", function(x){
    var expanded = BiwaScheme.Interpreter.expand(x.cdr.car);
    return List(Sym("quote"), expanded);
  });
  define_syntax("%macroexpand-1", function(x){
    var expanded = macroexpand_1(x.cdr.car);
    return List(Sym("quote"), expanded);
  });

  define_libfunc("macroexpand", 1, 1, function(ar){
    return BiwaScheme.Interpreter.expand(ar[0]);
  });
  define_libfunc("macroexpand-1", 1, 1, function(ar){
    return macroexpand_1(ar[0]);
  });

  define_libfunc("gensym", 0, 0, function(ar){
    return BiwaScheme.gensym();
  });
  
  // i/o

  define_libfunc("print", 1, null, function(ar){
    _.map(ar, function(item){
      puts(to_display(item), true);
    })
    puts(""); //newline
    return BiwaScheme.undef;
  })
  define_libfunc("write-to-string", 1, 1, function(ar){
    return to_write(ar[0]);
  });
  define_libfunc("read-from-string", 1, 1, function(ar){
    assert_string(ar[0]);
    return Interpreter.read(ar[0]);
  });
  define_libfunc("port-closed?", 1, 1, function(ar){
    assert_port(ar[0]);
    return !(ar[0].is_open);
  });
  //define_libfunc("with-input-from-port", 2, 2, function(ar){
  //define_libfunc("with-error-to-port", 2, 2, function(ar){
  define_libfunc("with-output-to-port", 2, 2, function(ar){
    var port = ar[0], proc = ar[1];
    assert_port(port);
    assert_procedure(proc);

    var original_port = BiwaScheme.Port.current_output;
    BiwaScheme.Port.current_output = port

    return new Call(proc, [port], function(ar){
      port.close();
      BiwaScheme.Port.current_output = original_port;

      return ar[0];
    });
  });
  
  // syntax
  
  define_syntax("let1", function(x){
    //(let1 vari expr body ...) 
    //=> ((lambda (var) body ...) expr)
    var vari = x.cdr.car; 
    var expr = x.cdr.cdr.car;
    var body = x.cdr.cdr.cdr;

    return new Pair(new Pair(Sym("lambda"),
                      new Pair(new Pair(vari, nil),
                        body)),
             new Pair(expr, nil));
  })

  //
  // Regular Expression
  //
  var assert_regexp = function(obj, fname){
    if(!(obj instanceof RegExp))
      throw new Error(fname + ": regexp required, but got " + to_write(obj));
  }

  //Function: string->regexp string &keyword case-fold 
  define_libfunc("string->regexp", 1, 1, function(ar){
    assert_string(ar[0], "string->regexp");
    return new RegExp(ar[0]); //todo: case-fold
  })
  //Function: regexp? obj 
  define_libfunc("regexp?", 1, 1, function(ar){
    return (ar[0] instanceof RegExp);
  })
  //Function: regexp->string regexp 
  define_libfunc("regexp->string", 1, 1, function(ar){
    assert_regexp(ar[0], "regexp->string");
    return ar[0].toString().slice(1, -1); //cut '/' 
  })

  define_libfunc("regexp-exec", 2, 2, function(ar){
    var rexp = ar[0];
    if(_.isString(ar[0])){
      rexp = new RegExp(ar[0]);
    }
    assert_regexp(rexp, "regexp-exec");
    assert_string(ar[1], "regexp-exec");
    var ret = rexp.exec(ar[1])
    return (ret === null) ? false : array_to_list(ret);
  })

//  //Function: rxmatch regexp string 
//  define_libfunc("rxmatch", 1, 1, function(ar){
//    assert_regexp(ar[0], "rxmatch");
//    assert_string(ar[1], "rxmatch");
//    return ar[0].match(ar[1]);
//  });
  //Function: rxmatch-start match &optional (i 0) 
  //Function: rxmatch-end match &optional (i 0) 
  //Function: rxmatch-substring match &optional (i 0) 
  //Function: rxmatch-num-matches match   
  //Function: rxmatch-after match &optional (i 0) 
  //Function: rxmatch-before match &optional (i 0) 
  //Generic application: regmatch &optional index 
  //Generic application: regmatch 'before &optional index 
  //Generic application: regmatch 'after &optional index 
  //Function: regexp-replace regexp string substitution 
  //Function: regexp-replace-all regexp string substitution 
  //Function: regexp-replace* string rx1 sub1 rx2 sub2 ... 
  //Function: regexp-replace-all* string rx1 sub1 rx2 sub2 ... 
  //Function: regexp-quote string 
  //Macro: rxmatch-let match-expr (var ...) form ... 
  //Macro: rxmatch-if match-expr (var ...) then-form else-form 
  //Macro: rxmatch-cond clause ... 
  //Macro: rxmatch-case string-expr clause ... 

}


//
// Library functions only work on Node.js
// see also: test/node_functions.js
//

(function(){
  if(BiwaScheme.on_node){
    var node = {
      fs: require('fs'),
      path: require('path'),
      process: process
    };
  }

  // Defines library functions which only works on Node.
  // - On Node: same as define_libfunc
  // - On Browser: defines a stub libfunc which just raises Error
  var define_node_libfunc = function(/*arguments*/){
    var args = _.toArray(arguments);

    if(BiwaScheme.on_node){
      BiwaScheme.define_libfunc.apply(null, args);
    }
    else{
      var func_name = args[0];
      var func = function(ar){
        throw new BiwaScheme.Error("the function '"+func_name+"' "+
          "is not supported in the browser "+
          "(works only on Node.js).");
      };
      args.pop();
      args.push(func);
      BiwaScheme.define_libfunc.apply(null, args);
    }
  };

  //
  // Chapter 9 File System
  //

  //(file-exists? filename)    procedure 
  define_node_libfunc("file-exists?", 1, 1, function(ar){
    assert_string(ar[0]);
    return node.fs.existsSync(ar[0]);
  });

  //(delete-file filename)    procedure 
  define_node_libfunc("delete-file", 1, 1, function(ar){
    assert_string(ar[0]);
    node.fs.unlinkSync(ar[0]);
    return BiwaScheme.undef;
  });

  //
  // Chapter 10 Command-line access and exit values
  //
  
  //(command-line)    procedure
  define_node_libfunc("command-line", 0, 0, function(ar){
    return BiwaScheme.List.apply(null, node.process.argv);
  });

  //(exit)    procedure 
  //(exit obj)    procedure
  define_node_libfunc("exit", 0, 1, function(ar){
    var obj = ar[0];
    var code = _.isUndefined(obj) ? 0 :
               (obj === false)    ? 1 :
               Number(obj);

    node.process.exit(code);
  });

  //
  // srfi-98 (get-environment-variable)
  //

  // (get-environment-variable name) -> string or #f
  define_node_libfunc("get-environment-variable", 1, 1, function(ar){
    assert_string(ar[0]);
    var val = node.process.env[ar[0]];
    return _.isUndefined(val) ? false : val;
  });

  // (get-environment-variables) -> alist of string (("key" . "value")"
  define_node_libfunc("get-environment-variables", 0, 0, function(ar){
    return BiwaScheme.js_obj_to_alist(node.process.env);
  });

})();
//
// srfi.js - SRFI libraries
//
// should be src/library/srfi/1.js, etc (in the future).
//

with(BiwaScheme) {
  
  //
  // srfi-1 (list)
  //
  define_libfunc("iota", 1, 3, function(ar){
    var count = ar[0];
    var start = ar[1] || 0;
    var step = (ar[2]===undefined) ? 1 : ar[2];
    assert_integer(count);
    assert_number(start);
    assert_number(step);

    var a = [], n = start;
    for(var i=0; i<count; i++){
      a.push(n);
      n += step;
    }
    return array_to_list(a);
  });

  var copy_pair = function(pair){
    var car = BiwaScheme.isPair(pair.car) ? copy_pair(pair.car)
                                          : pair.car;
    var cdr = BiwaScheme.isPair(pair.cdr) ? copy_pair(pair.cdr)
                                          : pair.cdr;
    return new Pair(car, cdr);
  };
  // (list-copy list)
  define_libfunc("list-copy", 1, 1, function(ar){
    if(BiwaScheme.isPair(ar[0])){
      return copy_pair(ar[0]);
    }
    else{
      return BiwaScheme.nil;
    }
  });

  //
  // srfi-6 & Gauche (string port)
  // 
  define_libfunc("open-input-string", 1, 1, function(ar){
    assert_string(ar[0]);
    return new Port.StringInput(ar[0]);
  })
  define_libfunc("open-output-string", 0, 0, function(ar){
    return new Port.StringOutput();
  })
  define_libfunc("get-output-string", 1, 1, function(ar){
    assert_port(ar[0]);
    if(!(ar[0] instanceof Port.StringOutput))
      throw new Error("get-output-string: port must be made by 'open-output-string'");
    return ar[0].output_string();
  })

  //
  // srfi-8 (receive)
  //

  // (receive <formals> <expression> <body>...)
  // -> (call-with-values (lambda () expression)
  //                        (lambda formals body ...))
  define_syntax("receive", function(x){
    assert(BiwaScheme.isPair(x.cdr),
           "missing formals", "receive");
    var formals = x.cdr.car;
    assert(BiwaScheme.isPair(x.cdr.cdr),
           "missing expression", "receive");
    var expression = x.cdr.cdr.car;
    var body       = x.cdr.cdr.cdr;
    
    return deep_array_to_list([Sym("call-with-values"),
      [Sym("lambda"), BiwaScheme.nil, expression],
      new BiwaScheme.Pair(Sym("lambda"),
        new BiwaScheme.Pair(formals, body))]);
  });

  // srfi-19 (time)
  //
//  // constants
//time-duration
//time-monotonic
//time-process
//time-tai
//time-thread
//time-utc
  // Current time and clock resolution
  define_libfunc("current-date", 0, 1, function(ar){
    //todo: tz-offset (ar[1])
    return new Date();
  })
//
//current-julian-day -> jdn
//current-modified-julian-day -> mjdn
//current-time [time-type] -> time
//time-resolution [time-type] -> integer
//  // Time object and accessors
//make-time type nanosecond second -> time
//time? object -> boolean
//time-type time -> time-type
//time-nanosecond time -> integer
//time-second time -> integer
//set-time-type! time time-type
//set-time-nanosecond! time integer
//set-time-second! time integer
//copy-time time1 -> time2 
//  // Time comparison procedures
//time<=? time1 time2 -> boolean
//time<? time1 time2 -> boolean
//time=? time1 time2 -> boolean
//time>=? time1 time2 -> boolean
//time>? time1 time2 -> boolean
//  // Time arithmetic procedures
//time-difference time1 time2 -> time-duration
//time-difference! time1 time2 -> time-duration
//add-duration time1 time-duration -> time
//add-duration! time1 time-duration -> time
//subtract-duration time1 time-duration -> time
//subtract-duration! time1 time-duration -> time
  // Date object and accessors
  // make-date
  define_libfunc("date?", 1, 1, function(ar){
    return (ar[0] instanceof Date);
  })
  define_libfunc("date-nanosecond", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getMilliseconds() * 1000000;
  })
  define_libfunc("date-millisecond", 1, 1, function(ar){ // not srfi-19
    assert_date(ar[0]);
    return ar[0].getMilliseconds();
  })
  define_libfunc("date-second", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getSeconds();
  })
  define_libfunc("date-minute", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getMinutes();
  })
  define_libfunc("date-hour", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getHours();
  })
  define_libfunc("date-day", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getDate();
  })
  define_libfunc("date-month", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getMonth() + 1; //Jan = 0 in javascript..
  })
  define_libfunc("date-year", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getFullYear();
  })
  //date-zone-offset
  //date-year-day
  define_libfunc("date-week-day", 1, 1, function(ar){
    assert_date(ar[0]);
    return ar[0].getDay();
  })
  //date-week-number

  // Time/Date/Julian Day/Modified Julian Day Converters
  // (snipped)
  
  // Date to String/String to Date Converters
  // TODO: support locale
  //   * date_names
  //   * ~f 5.2 sec
  //   * ~p AM/PM
  //   * ~X 2007/01/01
  BiwaScheme.date_names = {
    weekday: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
    full_weekday: ["Sunday", "Monday", "Tuesday", 
      "Wednesday", "Thursday", "Friday", "Saturday"],
    month: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", 
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    full_month: ["January", "February", "March", "April",
      "May", "June", "July", "August", "September", 
      "Octorber", "November", "December"]
  }

  BiwaScheme.date2string = function(date, format){
    var zeropad  = function(n){ return n<10 ? "0"+n : ""+n }; 
    var spacepad = function(n){ return n<10 ? " "+n : ""+n }; 
    
    var getter = {
      a: function(x){ return date_names.weekday[x.getDay()] },
      A: function(x){ return date_names.full_weekday[x.getDay()] },
      b: function(x){ return date_names.month[x.getMonth()] },
      B: function(x){ return date_names.full_month[x.getMonth()] },
      c: function(x){ return x.toString() },
      d: function(x){ return zeropad(x.getDate()) },
      D: function(x){ return getter.d(x) + getter.m(x) + getter.y(x); },
      e: function(x){ return spacepad(x.getDate()) },
      f: function(x){ return x.getSeconds() + x.getMilliseconds()/1000; },
      h: function(x){ return date_names.month[x.getMonth()] },
      H: function(x){ return zeropad(x.getHours()) },
      I: function(x){ var h = x.getHours(); return zeropad(h<13 ? h : h-12) },
      j: function(x){ throw new Bug("not implemented: day of year") },
      k: function(x){ return spacepad(x.getHours()) },
      l: function(x){ var h = x.getHours(); return spacepad(h<13 ? h : h-12) },
      m: function(x){ return zeropad(x.getMonth()) },
      M: function(x){ return zeropad(x.getMinutes()) },
      n: function(x){ return "\n" },
      N: function(x){ throw new Bug("not implemented: nanoseconds") },
      p: function(x){ return x.getHours()<13 ? "AM" : "PM" },
      r: function(x){ return getter.I(x) + ":" + getter.M(x) + ":" + getter.S(x) + " " + getter.p(x) },
      s: function(x){ return Math.floor(x.getTime() / 1000) },
      S: function(x){ return zeropad(x.getSeconds()) },
      t: function(x){ return "\t" },
      T: function(x){ return getter.H(x) + ":" + getter.M(x) + ":" + getter.S(x) },
      U: function(x){ throw new Bug("not implemented: weeknum(0~, Sun)") },
      V: function(x){ throw new Bug("not implemented: weeknum(1~, Sun?)") },
      w: function(x){ return x.getDay() },
      W: function(x){ throw new Bug("not implemented: weeknum(0~, Mon)") },
      x: function(x){ throw new Bug("not implemented: weeknum(1~, Mon)") },
      X: function(x){ return getter.Y(x) + "/" + getter.m(x) + "/" + getter.d(x) },
      y: function(x){ return x.getFullYear() % 100 },
      Y: function(x){ return x.getFullYear() },
      z: function(x){ throw new Bug("not implemented: time-zone") },
      Z: function(x){ throw new Bug("not implemented: symbol time zone") },
      1: function(x){ throw new Bug("not implemented: ISO-8601 year-month-day format") },
      2: function(x){ throw new Bug("not implemented: ISO-8601 hour-minute-second-timezone format") },
      3: function(x){ throw new Bug("not implemented: ISO-8601 hour-minute-second format") },
      4: function(x){ throw new Bug("not implemented: ISO-8601 year-month-day-hour-minute-second-timezone format") },
      5: function(x){ throw new Bug("not implemented: ISO-8601 year-month-day-hour-minute-second format") }
    }

    return format.replace(/~([\w1-5~])/g, function(str, x){
      var func = getter[x];
      if(func)
        return func(date);
      else if(x == "~")
        return "~";
      else
        return x;
    })
  }
  
  // date->string
  define_libfunc("date->string", 1, 2, function(ar){
    assert_date(ar[0]);

    if(ar[1]){
      assert_string(ar[1]);
      return date2string(ar[0], ar[1]);
    }
    else
      return ar[0].toString();
  })
  // string->date

  define_libfunc("parse-date", 1, 1, function(ar){ // not srfi-19
    assert_string(ar[0]);
    return new Date(Date.parse(ar[0]));
  })

  //
  // srfi-27
  //
  define_libfunc("random-integer", 1, 1, function(ar){
    var n = ar[0];
    assert_integer(n);
    if (n < 0)
      throw new Error("random-integer: the argument must be >= 0");
    else
      return Math.floor(Math.random() * ar[0]);
  });
  define_libfunc("random-real", 0, 0, function(ar){
    return Math.random();
  });

  //
  // srfi-28 (format)
  //

  // (format format-str obj1 obj2 ...) -> string
  // (format #f format-str ...) -> string
  // (format #t format-str ...) -> output to current port 
  // (format port format-str ...) -> output to the port 
  define_libfunc("format", 1, null, function(ar){
    if (_.isString(ar[0])) {
      var port = null, format_str = ar.shift();
    }
    else if (ar[0] === false) {
      ar.shift();
      var port = null, format_str = ar.shift();
    }
    else if (ar[0] === true) {
      ar.shift();
      var port = BiwaScheme.Port.current_output,
          format_str = ar.shift();
    }
    else {
      var port = ar.shift(), format_str = ar.shift();
      assert_port(port);
    }

    var str = format_str.replace(/~[as]/g, function(matched){
                 assert(ar.length > 0,
                        "insufficient number of arguments", "format");
                 if (matched == "~a")
                   return BiwaScheme.to_display(ar.shift());
                 else
                   return BiwaScheme.to_write(ar.shift());
              }).replace(/~%/, "\n")
                .replace(/~~/, "~");
    if (port) {
      port.put_string(str);
      return BiwaScheme.undef;
    }
    else {
      return str;
    }
  });
  
  //
  // srfi-38 (write/ss)
  //
  var user_write_ss = function(ar){
    puts(write_ss(ar[0]), true);
    return BiwaScheme.undef;
  }
  define_libfunc("write/ss", 1, 2, user_write_ss);
  define_libfunc("write-with-shared-structure", 1, 2, user_write_ss);
  define_libfunc("write*", 1, 2, user_write_ss); //from Gauche(STklos)

  //
  // srfi-43 (vector library)
  //
  define_libfunc("vector-append", 2, null, function(ar){
    var vec = [];
    return vec.concat.apply(vec, ar);
  });

  // (vector-copy vector)
  define_libfunc("vector-copy", 1, 1, function(ar){
    assert_vector(ar[0]);
    return _.clone(ar[0]);
  });

  //
  // see src/library/node_functions.js for:
  // - srfi-98 (get-environment-variable)
  //
}
if( typeof(BiwaScheme)!='object' ) BiwaScheme={}; with(BiwaScheme) {

  define_libfunc("read-line", 0, 1, function(ar){
    var port = ar[0] || Port.current_input;
    assert_port(port);
    return port.get_string();
  });

  //
  // element
  //
  define_libfunc("element-empty!", 1, 1, function(ar){
    if ($(ar[0]).attr("value")) {
      return $(ar[0]).val("");
    } else {
      return $(ar[0]).empty();
    }
  });
  alias_libfunc("element-empty!", "element-clear!");
  define_libfunc("element-visible?", 1, 1, function(ar){
    return $(ar[0]).is(":visible");
  });
  define_libfunc("element-toggle!", 1, 1, function(ar){
    return $(ar[0]).toggle();
  });
  define_libfunc("element-hide!", 1, 1, function(ar){
    return $(ar[0]).hide();
  });
  define_libfunc("element-show!", 1, 1, function(ar){
    return $(ar[0]).show();
  });
  define_libfunc("element-remove!", 1, 1, function(ar){
    return $(ar[0]).remove();
  });
  define_libfunc("element-update!", 2, 2, function(ar){
    return $(ar[0]).html(ar[1]);
  });
  define_libfunc("element-replace!", 2, 2, function(ar){
    return $(ar[0]).replaceWith(ar[1]);
  });
  define_libfunc("element-insert!", 2, 2, function(ar){
    return $(ar[0]).append(ar[1]);
  });
  define_libfunc("element-wrap!", 3, 3, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-ancestors", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-descendants", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-first-descendant", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-immediate-descendants", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-previous-sibling", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-next-sibling", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-siblings", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-match?", 2, 2, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-up", 3, 3, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-down", 3, 3, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-previous", 3, 3, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-next", 3, 3, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-select", 1, 1, function(ar){
    $(ar[0]).select();
  });
  define_libfunc("element-adjacent", 0, 0, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-identify", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-read-attribute", 2, 2, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).attr(ar[1]);
  });
  define_libfunc("element-write-attribute", 3, 3, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).attr(ar[1], ar[2]);
  });
  define_libfunc("element-height", 1, 1, function(ar){
    return $(ar[0]).height();
  });
  define_libfunc("element-width", 1, 1, function(ar){
    return $(ar[0]).width();
  });
  define_libfunc("element-class-names", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-has-class-name?", 2, 2, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).hasClass(ar[1]);
  });
  define_libfunc("element-add-class-name", 2, 2, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).addClass(ar[1]);
  });
  define_libfunc("element-remove-class-name", 2, 2, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).removeClass(ar[1]);
  });
  define_libfunc("element-toggle-class-name", 2, 2, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).toggleClass(ar[1]);
  });
  define_libfunc("element-clean-whitespace!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-empty?", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-descendant-of!", 2, 2, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("scroll-to-element!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-style", 2, 2, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-opacity", 2, 2, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-style-set!", 2, 2, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-opacity-set!", 2, 2, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-dimensions", 1, 1, function(ar){
    return new Values($(ar[0]).width(), $(ar[0]).height());
  });
  define_libfunc("element-make-positioned!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-undo-positioned!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-make-clipping!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-undo-clipping!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-cumulative-offset", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-positioned-offset", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-absolutize!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-relativize!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-cumulative-scroll-offset", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-offset-parent", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-viewport-offset", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-clone-position!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-absolutize!", 1, 1, function(ar){
    throw new Bug("not yet implemented");
  });
  define_libfunc("element-focus!", 1, 1, function(ar){
    return $(ar[0]).focus();
  });

  // usage:
  //  (element-new '(div "foo"))        => <div>foo</div>
  //  (element-new '("div#main" "foo")) => <div id='main'>foo</div>
  //  (element-new '("div.red" "foo"))  => <div class='red'>foo</div>
  //  (element-new '(div align "right" "foo"))  => <div align='right'>foo</div>
  //  (element-new '(div (span "foo"))  => <div><span>foo</span></div>
  //

  BiwaScheme.create_elements_by_string = function(spec){
    spec = spec.to_array();
    var name = spec.shift();
    if(name instanceof Symbol) name = name.name;
    var m = name.match(/(.*)\.(.*)/);
    if (m) {
      name = m[1];
      spec.unshift(Sym("class"), m[2]);
    }
    m = name.match(/(.*)\#(.*)/);
    if (m) {
      name = m[1];
      spec.unshift(Sym("id"), m[2]);
    }
    var children = [];
    var s = ["<" + name];
    for(var i=0; i<spec.length; i++){
      if(spec[i] instanceof Symbol){
        s.push(' ' + spec[i].name + '="' + spec[i+1] + '"');
        i++;
      }
      else{
        if(spec[i] instanceof Pair)
          children.push(create_elements_by_string(spec[i]));
        else
          children.push(spec[i]); // String
      }
    }
    s.push(">");
    s.push( children.join("") );
    s.push("</" + name + ">");
    return s.join("");
  };

  BiwaScheme.tree_all = function(tree, pred){
    if(tree === nil)
      return true;
    else if(pred(tree.car) === false)
      return false;
    else
      return BiwaScheme.tree_all(tree.cdr, pred); 
  };
  define_libfunc("element-new", 1, 1, function(ar){
    var string_or_symbol = function(item){
      return _.isString(item) ||
             (item instanceof Symbol) ||
             (item instanceof Pair);
    };
    if(BiwaScheme.tree_all(ar[0], string_or_symbol)){
      return $(create_elements_by_string(ar[0]))[0];
    } else {
      return nil;
    }
  });
  BiwaScheme.element_content = function(selector) {
    if ($(selector).attr("value")) {
      return $(selector).val();
    } else {
      return _.escape($(selector).html());
    }
  };
  define_libfunc("element-content", 1, 1, function(ar){
    return BiwaScheme.element_content(ar[0]);
  });

  //
  // load from network
  //
  define_libfunc("load", 1, 1, function(ar, intp){
    var path = ar[0];
    assert_string(path);
    var intp2 = new Interpreter(intp);
    return new BiwaScheme.Pause(function(pause){
      $.ajax(path, {
        success: function(data) {
          // create new interpreter not to destroy current stack.
          intp2.evaluate(data,
                         function(){
                           return pause.resume(BiwaScheme.undef);
                         });
        },
        error: function() {
          throw new Error("load: network error: failed to load"+path);
        }
      });
    });
  });

  _require = function(src, check, proc){
    var script = $("<script/>", { src: src });
    $("body").append(script);

    var checker = new Function("return !!(" + check + ")");

    if(checker()) proc();
    else          setTimeout(function(){ checker() ? proc() : setTimeout(arguments.callee, 10); }, 10);
  };

  // (js-load "lib/foo.js" "Foo")
  define_libfunc("js-load", 2, 2, function(ar){
    var path = ar[0];
    var check = ar[1];
    assert_string(path);
    assert_string(check);

    return new BiwaScheme.Pause(function(pause){
      _require(path, "window." + check, function(){
        pause.resume(BiwaScheme.undef);
      });
    });
  });

  //
  // html modification
  //

  BiwaScheme.getelem = function(ar){
    // account for getelem returning false when no results (and that getting passed back in)
    if (ar.length > 1 && ar[1] === false) {
      ar[1] = [];
    }

    var x = $.apply(this, ar);
    if (x.length > 0) {
      return x;
    } else {
      return false;
    }
  };
  define_libfunc("$",       1, 2, BiwaScheme.getelem);
  define_libfunc("getelem", 1, 2, BiwaScheme.getelem);
  define_libfunc("dom-element", 1, 1, function(ar) {
    return $(ar[0])[0];
  });

  define_libfunc("set-style!", 3, 3, function(ar){
    assert_string(ar[1]);
    $(ar[0]).css(ar[1], ar[2]);
    return BiwaScheme.undef;
  });
  define_libfunc("get-style", 2, 2, function(ar){
    assert_string(ar[1]);
    return $(ar[0]).css(ar[1]);
  });
  define_libfunc("set-content!", 2, 2, function(ar){
    assert_string(ar[1]);
    var str = ar[1].replace(/\n/g,"<br>").replace(/\t/g,"&nbsp;&nbsp;&nbsp;");
    $(ar[0]).html(str);
    return BiwaScheme.undef;
  });
  define_libfunc("get-content", 1, 1, function(ar){
    return BiwaScheme.element_content(ar[0]);
  });

  //
  // handlers
  //
  define_libfunc("set-handler!", 3, 3, function(ar, intp){
    throw new Error("set-handler! is obsolete, please use add-handler! instead");
  });
  define_libfunc("add-handler!", 3, 3, function(ar, intp){
    var selector = ar[0], evtype = ar[1], proc = ar[2];
    var intp2 = new Interpreter(intp);
    var handler = function(event){
      return _.clone(intp2).invoke_closure(proc, [event]);
    };
    $(selector).bind(evtype, handler);
    return handler;
  });
  define_libfunc("remove-handler!", 3, 3, function(ar, intp){
    var selector = ar[0], evtype = ar[1], handler = ar[2];
    $(selector).unbind(evtype, handler);
    return BiwaScheme.undef;
  });
  define_libfunc("wait-for", 2, 2, function(ar){
    var selector = ar[0], evtype = ar[1];
    var elem = $(selector);
    elem.biwascheme_wait_for = elem.biwascheme_wait_for || {};

    var prev_handler = elem.biwascheme_wait_for[evtype];
    if (prev_handler) {
      // Maybe a wait-for is called more than once,
      // and previous handler is not consumed.
      elem.unbind(evtype, prev_handler);
    }

    return new BiwaScheme.Pause(function(pause){
      var handler = function(event){
        elem.biwascheme_wait_for[evtype] = undefined;
        elem.unbind(evtype, handler);
        return pause.resume(BiwaScheme.undef);
      };

      elem.biwascheme_wait_for[evtype] = handler;
      elem.bind(evtype, handler);
    });
  });

  //
  // dom
  //
  define_libfunc("domelem", 1, null, function(ar){
    throw new Error("obsolete");
  });
  define_libfunc("dom-remove-children!", 1, 1, function(ar){
    puts("warning: dom-remove-children! is obsolete. use element-empty! instead");
    $(ar[0]).empty();
    return BiwaScheme.undef;
  });
  define_libfunc("dom-create-element", 1, 1, function(ar){
    throw new Error("obsolete");
  });
  define_libfunc("element-append-child!", 2, 2, function(ar){
    return $(ar[0]).append(ar[1]);
  });
  define_libfunc("dom-remove-child!", 2, 2, function(ar){
    throw new Error("obsolete");
  });
//  define_libfunc("dom-get-attribute", 2, 2, function(ar){
//  });
//  define_libfunc("dom-remove-child!", 2, 2, function(ar){
//  });

  //
  // communication to server
  //
  define_libfunc("http-request", 1, 1, function(ar){
    var path = ar[0];
    assert_string(path);

    return new BiwaScheme.Pause(function(pause){
      $.get(path, function(data) {
        pause.resume(data);
      }, "text");
    });
  });
  // (http-post "/foo" '(("x" . 1) ("y" . 2)))
  define_libfunc("http-post", 2, 2, function(ar){
    var path = ar[0];
    assert_string(path);
    var alist = ar[1];
    assert_list(alist);
    var h = alist_to_js_obj(alist);

    return new BiwaScheme.Pause(function(pause){
      $.post(path, h, function(data) {
        pause.resume(data);
      }, "text");
    });
  });

  BiwaScheme.jsonp_receiver = [];
  define_libfunc("receive-jsonp", 1, 1, function(ar){
    var url = ar[0];
    assert_string(url);

    var receives = BiwaScheme.jsonp_receiver;
    for(var i=0; i<receives.length; i++)
      if(receives[i] === null) break;
    var receiver_id = i;
    url += "?callback=BiwaScheme.jsonp_receiver[" + receiver_id + "]";

    return new BiwaScheme.Pause(function(pause){
      receives[receiver_id] = function(data){
        pause.resume(data);
        receives[receiver_id] = null;
      };
      var script = $("<script/>", { src: url });
      $("body").append(script);
    });
  });

  //
  // dialog, debug
  //
  define_libfunc("alert", 1, 1, function(ar){
    alert(ar[0]);
    return BiwaScheme.undef;
  });
  define_libfunc("confirm", 1, 1, function(ar){
    return confirm(ar[0]);
  });
//  define_libfunc("dumpobj", 1, 1, function(ar){
//    return eval(ar[0]);
//  });

}
//
// Dumper - graphical state dumper
//
with(BiwaScheme) {

BiwaScheme.Dumper = BiwaScheme.Class.create({
  initialize: function(dumparea){
    this.dumparea = dumparea || $("#dumparea")[0] || null;
    this.reset();
  },

  reset: function(){
    if(this.dumparea){
      // Note: this is for repl.html (needs refactoring..)
      $(this.dumparea).empty();
    }
    this.n_folds = 0;
    this.closures = [];
    this.n_dumps = 0;
    this.cur = -1;
    this.is_folded = true;
  },

  is_opc: function(obj){
    return (obj instanceof Array && typeof(obj[0]) == 'string');
  },

  dump_pad: "&nbsp;&nbsp;&nbsp;",
  dump_opc: function(obj, level, nested){
    var s="";
    var pad1="", pad2="";
    var level = level || 0;
    var nested = nested || false;
    _.times(level, _.bind(function(){ pad1 += this.dump_pad; }, this));
    _.times((level+1), _.bind(function(){ pad2 += this.dump_pad; }, this));

    s += pad1 + '[<span class="dump_opecode">' + obj[0] + '</span>';
    var i = 1;
    while(!(obj[i] instanceof Array) && i<obj.length){
      if(obj[0] == "constant")
        s += "&nbsp;<span class='dump_constant'>" + 
             this.dump_obj(obj[i]) + "</span>";
      else
        s += "&nbsp;" + this.dump_obj(obj[i]);
      i++;
    }
    if(i < obj.length) s += '<br>\n';
    for(; i<obj.length; i++){
      if(this.is_opc(obj[i])){
        s += this.dump_opc(obj[i], (i == obj.length-1 ? level : level+1), true);
      }
      else{
        s += (i == obj.length-1) ? pad1 : pad2;
        s += this.dump_obj(obj[i]);
      }
      if(i != obj.length-1) s += "<br>\n";
    }
    s += "]";
    return (nested ? s : this.add_fold(s));
  },

  fold_limit: 20,
  add_fold: function(s){
    var lines = s.split(/<br>/gmi);

    if(lines.length > this.fold_limit){
      var fold_btn   = " <span style='text-decoration:underline; color:blue; cursor:pointer;'" +
                           "onclick='BiwaScheme.Dumper.toggle_fold("+this.n_folds+")'>more</span>";
      var fold_start = "<div style='display:none' class='fold"+this.n_folds+"'>";
      var fold_end   = "</div>";
      this.n_folds++;
      return [
        lines.slice(0, this.fold_limit).join("<br>"), fold_btn,
        fold_start, lines.slice(this.fold_limit).join("<br>"), fold_end
      ].join("");
    }
    else{
      return s;
    }
  },

  stack_max_len: 80,
  dump_stack: function(stk, size){
    if(stk === null || stk === undefined) return BiwaScheme.inspect(stk);
    var s = "<table>";

    // show the 'physical' stack top
    if (stk.length == 0){
      s += "<tr><td class='dump_dead'>(stack is empty)</td></tr>";
    }
    else if (size < stk.length){
      var l = stk.length - 1;
      s += "<tr><td class='dump_dead'>[" + l + "]</td>" +
           "<td class='dump_dead'>" + 
           _.str.truncate(this.dump_obj(stk[l]), this.stack_max_len) +
           "</td></tr>";
    }

    // show the element in the stack
    for(var i=size-1; i >= 0; i--){
      s += "<tr><td class='dump_stknum'>[" + i + "]</td>" +
           "<td>" + _.str.truncate(this.dump_obj(stk[i]), this.stack_max_len) +
           "</td></tr>";
    }
    return s + "</table>";
  },

  dump_object: function(obj){
    var a = [];
    for(var k in obj){
      //if(this.prototype[k]) continue;
      a.push( k.toString() );//+" => "+this[k].toString() );
    }
    return "#<Object{"+a.join(",")+"}>";
  },

  dump_closure: function(cls){
    if(cls.length == 0) return "[]";

    var cls_num = null;
    for(var i=0; i<this.closures.length; i++){
      if(this.closures[i] == cls) cls_num = i;
    }
    if(cls_num == null){
      cls_num = this.closures.length;
      this.closures.push(cls);
    }

    var c = _.clone(cls);
    var body = c.shift();
    return [
      "c", cls_num, " <span class='dump_closure'>free vars :</span> ",
      this.dump_obj(c), " <span class='dump_closure'>body :</span> ",
      _.str.truncate(this.dump_obj(body), 100)
    ].join("");
  },

  dump_obj: function(obj){
    if(obj && typeof(obj.to_html) == 'function')
      return obj.to_html();
    else{
      var s = write_ss(obj, true); //true=Array mode
      if(s == "[object Object]") s = this.dump_object(obj);
      return _.escape(s);
    }
  },

  dump: function(obj){
    var s = "";
    if(obj instanceof Object){
      s += "<table>";

      // header
      s += "<tr><td colspan='4'>" + 
           "<a href='#' class='header'>" +
           "#"+this.n_dumps+"</a></td></tr>";

      // registers
      _.each(_.keys(obj), _.bind(function(key){
        var value = obj[key];
        if(key!="x" && key != "stack"){
          value = (key=="c" ? this.dump_closure(value)
                            : this.dump_obj(value));
          s += "<tr><td>" + key + ": </td>" +
               "<td colspan='3'>" + value + "</td></tr>";
        }
      }, this));
      s += "<tr><td>x:</td><td>" +
           (this.is_opc(obj["x"]) ? this.dump_opc(obj["x"])
                                  : this.dump_obj(obj["x"])) +
           "</td>";

      // stack
      s += "<td style='border-left: 1px solid black'>stack:</td><td>" +
           this.dump_stack(obj["stack"], obj["s"]) +
           "</td></tr>";
      s += "</table>";
    }
    else{
      s = _.escape(BiwaScheme.inspect(obj)) + "<br>\n";
    }
    var dumpitem = $("<div/>", { class: ("dump" + this.n_dumps) });
    dumpitem.html(s);
    $(this.dumparea).append(dumpitem);
    (_.bind(function(n){
        $(".header", this.dump_el(this.n_dumps)).click(_.bind(function(){
        this.dump_move_to(n);
        this.dump_fold();
      }, this));
    }, this))(this.n_dumps);
    dumpitem.hide();
    this.n_dumps++;
  },

  //
  // UI
  //
  dump_el: function(n) {
    return $(".dump"+n, this.dumparea);
  },
  dump_move_to: function(n){
    if (0 <= n && n <= this.n_dumps){
      this.dump_el(this.cur).hide();
      this.cur = n;
      this.dump_el(this.cur).show();
    }
  },

  dump_move: function(dir){
    if(0 <= this.cur && this.cur < this.n_dumps)
      this.dump_el(this.cur).hide();

    if(0 <= this.cur+dir && this.cur+dir < this.n_dumps)
      this.cur += dir;

    this.dump_el(this.cur).show();
  },

  dump_fold: function(){
    for(var i=0; i<this.n_dumps; i++)
      if(i!=this.cur) this.dump_el(i).hide();

    this.is_folded = true;
  },

  dump_unfold: function(){
    for(var i=0; i<this.n_dumps; i++)
      this.dump_el(i).show();

    this.is_folded = false;
  },

  dump_toggle_fold: function(){
    if(this.is_folded)
      this.dump_unfold();
    else
      this.dump_fold();
  }
});
} // with(BiwaScheme);

BiwaScheme.Dumper.toggle_fold = function(n){
  $(".fold"+n, this.dumparea).toggle();
};
Console = {}

Console.puts = function(str, no_newline) {
  var console;
  var text;
  console = $("#bs-console");
  if (console[0]) {
	text = _.escape(str + (no_newline ? "" : "\n"));
	var span = $("<span>");
	span.html(text.replace(/\n/g,"<br>").replace(/ /g,"&nbsp;"));
	console.append(span);
  }
  console = $('#bs-console-plain');
  if (console[0]) {
	text = _.escape(str + (no_newline ? "" : "\n"));
	console.append(text);
  }
};

Console.p = function (/*ARGS*/){
  Console.puts("p> "+_.map(_.toArray(arguments), BiwaScheme.inspect).join(" "));
};
//
// release_initializer.js - read user's program and eval it (if it exists)
//
// This file is put on the end the lib/biwascheme.js.
//
(function(){ //local namespace
  var dumper = null;
  if ($("#biwascheme-debugger")[0]) {
    dumper = new BiwaScheme.Dumper($("#biwascheme-debugger")[0]);
  }

  // Error handler (show message to console div)
  var onError = function(e, state){
    puts(e.message);
    if (dumper) {
      dumper.dump(state);
      dumper.dump_move(1);
    } else if (typeof(console) !== "undefined" && console.error) {
      console.error(e.message);
    } else {
      throw(e);
    }
  };

  // Start user's program
  var script = $("script[src$='biwascheme.js']").html() ||
               $("script[src$='biwascheme-min.js']").html();
  if (script) {
    var intp = new BiwaScheme.Interpreter(onError);
    try{
      intp.evaluate(script, function(){});
    }
    catch(e){
      onError(e);
    }
  }
})();
