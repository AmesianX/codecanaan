<html>
<head>
    <title>安裝 Java 軟體</title>
    <meta name="layout" content="baseadmin"/>
    <meta name="display.subnavbar" content="disable" />
    <meta name="display.footer" content="disable" />

    <r:require modules="baseadmin-faq, deployJava" />
</head>
<body>

<div class="main">

    <div class="container">

        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked ">
                    <div class="widget-header">
                        <i class="icon-cog"></i>
                        <h3>安裝免費的 Java 軟體</h3>
                    </div> <!-- /.widget-header -->

                    <div class="widget-content">

                        <div class="row">

                            <!-- Java Duke Picture -->
                            <div class="col-md-4">
                                <r:img dir="images" file="java-duke.png" />
                            </div>

                            <div class="col-md-8">

                                <div class="x-java-installed" style="display:none">
                                    <div class="page-header">
                                        <h3>
                                            <i class="icon icon-ok icon-green"></i>&nbsp;
                                            已經安裝 Java 軟體
                                        </h3>
                                    </div>
                                </div>
                                
                                <div class="x-java-not-installed" style="display:none">
                                    <div class="page-header">
                                        <h3>
                                            <i class="icon icon-warning-sign icon-gray"></i>&nbsp;
                                            無法偵測 Java 軟體
                                        </h3>
                                    </div>
                                </div>

                                <p>瀏覽器顯示「需要您的授權才能執行 Java。」嗎？如果有，請點選「<strong>永遠在這個網站上執行</strong>」按鈕。</p>
                                
                                <p>以下是系統自動偵測的結果：</p>

                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>Java</td>
                                            <td><span id="jre-version"></span></td>
                                        </tr>
                                        <tr>
                                            <td>Java Web Start</td>
                                            <td><span id="jws-version"></span></td>
                                        </tr>

                                    </tbody>
                                </table>
                                
                                <p>如果您的電腦尚未安裝 Java 軟體，請先依照網頁下方的說明進行安裝。自動偵測結果僅供參考，如果您確認電腦已經安裝 Java 軟體，請忽略以上訊息並繼續下一個步驟。</p>

                            </div> <!-- /.col -->
                        </div> <!-- /.row -->

                        <div class="padding-around text-center">
                            <g:link action="step3" class="btn btn-lg btn-primary">
                                下一個步驟
                            </g:link>

                            <br/>
                            <br/>
                            <g:link action="step1">
                                <i class="icon icon-caret-left"></i>&nbsp;
                                返回上一個步驟
                            </g:link>
                        </div>

                    </div> <!-- /widget-content -->

                </div> <!-- /.widget -->

                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon icon-lightbulb"></i>
                        <h3>立即安裝免費的最新 Java 軟體</h3>
                    </div>
                    <div class="widget-content">

                        <div class="col-md-3">
                        <g:img dir="images" file="java_logo_200px.png" class="pull-right" />
                        </div>

                        <div class="col-md-9">
                            <ol class="faq-list">
                                <li>
                                    <h4>什麼是 Java？</h4>
                                    <p>Java 可讓您玩線上遊戲、與世界各地的人聊天、計算貸款利息，並檢視 3D 影像，但還不只如此。Jave 更可整合作為企業運算基礎的企業內部網路應用程式和其他電子商務解決方案。</p>
                                </li>

                                <li>
                                    <h4>為什麼 CodeCanaan 需要 Java？</h4>
                                    <p>軟體壹學院網站使用「Java Web Start」技術開發，瀏覽器需要搭配 Java 6 以上版本，才能執行「客戶端工具」，並取得完整的教材功能。</p>
                                </li>

                                <li>
                                    <h4>如何安裝 Java？</h4>
                                    <p>Java 是免費的軟體，您不需要支付任何費用。請從「<a href="http://www.java.com/zh_TW/" target="_blank">Java</a>」網站取得最新版本的安裝程式，此程式是由 Oracle（甲骨文）公司所提供。</p>

                                    <p><a href="http://www.java.com/zh_TW/download/manual.jsp?locale=zh_TW" target="_blank">下載適合用於所有作業系統的 Java</a></p>
                                </li>

                                <li>
                                    <h4>下載後如何安裝？</h4>
                                    
                                    <div class="block-java-install-details">
                                        
                                        <p>執行下載的「jre*.exe」安裝程式，等待歡迎畫面出現。</p>
                                        
                                        <p><g:img dir="images/help" file="java-install-xp-1.png" style="display:none" /></p>
                                        
                                        <p>等待下載安裝 Java 所需的檔案，如果您的網路速度太慢或不穩，可能需要等待比較長的時間。</p>
                                        
                                        <p><g:img dir="images/help" file="java-install-xp-2.png" style="display:none" /></p>
                                        
                                        <p>看到「您已經成功安裝 Java」代表安裝過程順利；如果發生錯誤，請重新再執行一次安裝程式，或重新開機後再試一次。</p>
                                        
                                        <p><g:img dir="images/help" file="java-install-xp-3.png" style="display:none" /></p>
                                        
                                    </div>

                                    <button class="show-details btn btn-default">
                                        <i class="icon icon-picture"></i>&nbsp;
                                        顯示或隱藏圖片
                                    </button>
                                </li>
                            </ol>

                        </div>
                    </div>
                </div> <!-- /.widget -->

            </div> <!-- /.col -->

        </div> <!-- /.row -->

    </div> <!-- /.container -->

</div> <!-- /.main -->

<r:script>
(function() {

    // Show FAQ
    $('.faq-list').goFaq();

    // Toggle button for show/hide detail screenshots
    $('button.show-details').toggle(function() {
        $('div.block-java-install-details img').show();
    }, function() {
        $('div.block-java-install-details img').hide();
    });

    // Get Java status
    var hasJava = deployJava.versionCheck('1.6+');
    var hasJavaWS = deployJava.isWebStartInstalled('1.6+');
    
    // Show Installation Guide if Java not installed.
    if (hasJava && hasJavaWS) {
        $('.x-java-installed').show();
    }
    else {
        $('.x-java-not-installed').show();
    }

    $('#jre-version').html(hasJava?'<font color="green"><i class="icon icon-ok"></i>&nbsp;&nbsp;已安裝</a></font>'+' <span class="label label-success">'+deployJava.getJREs()+'</span>':'<font color="orange">無法偵測</font>'+' <span class="label label-warning">'+deployJava.getJREs()+'</span>');

    $('#jws-version').html(hasJavaWS?'<font color="green"><i class="icon icon-ok"></i>&nbsp;&nbsp;已安裝</a></font>':'<font color="orange">無法偵測</font>');

})();
</r:script>

</body>
</html>
