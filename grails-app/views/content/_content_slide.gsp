<%@ page import="codecanaan.*" %>

<!--內嵌簡報-->
<iframe id="deckjs-iframe" width="100%" height="400" src="${createLink(controller:'content', action:'deckjs', id:content.id)}" style="width:100%;height:480px;border:none"></iframe>
<r:script>
    $('#deckjs-iframe').focus();
</r:script>

<!--練習-->
<sec:ifLoggedIn>
    <label class="checkbox"><g:checkBox name="cmdCheck" value="YES" checked="${record?.passed}" /> 打勾代表你已經閱讀完畢</label>
</sec:ifLoggedIn>
