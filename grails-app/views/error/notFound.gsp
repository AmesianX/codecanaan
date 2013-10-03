<html>
    <head>
        <title>Page Not Found</title>
        <meta name="layout" content="baseadmin"/>
        <meta name="display.footer" content="disable" />
    </head>
<body>

<div class="container">
    
    <div class="row">
        
        <div class="col-md-12">
            
            <div class="error-container">

                <h1>Oops!</h1>
                
                <h2>404 Not Found</h2>
                
                <div class="error-details">
                    Sorry, an error has occured, Requested page not found!
                    
                </div> <!-- /error-details -->
                
                <div class="error-actions">
                    <g:link url="/" class="btn btn-primary btn-lg">
                        <i class="icon-chevron-left"></i>
                        &nbsp;
                        Back to Dashboard                       
                    </g:link>
                    
                    <a href="./faq.html" class="btn btn-default btn-lg">
                        <i class="icon-envelope"></i>
                        &nbsp;
                        Contact Support                     
                    </a>
                    
                </div> <!-- /error-actions -->
                            
            </div> <!-- /error-container -->            
            
        </div> <!-- /span12 -->
        
    </div> <!-- /row -->
    
</div> <!-- /container -->

<div class="main">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="widget stacked">
                    <div class="widget-header">
                        <i class="icon-pushpin"></i>
                        <h3>很抱歉，無法存取指定的資源</h3>
                    </div>
                    <div class="widget-content">
                        
                        <div class="alert alert-warning alert-dismissable">
                            錯誤代碼：404（Page Not Found）
                        </div>

                        <%--404 Sign--%>
                        

                        <p>通常如果您看到這項錯誤，可能的發生原因有：</p>
                        <ul>
                            <li>您輸入的網址不正確。</li>
                            <li>這個網頁已經被停用，或資源已經遭到移除。</li>
                            <li>正在存取一項未經過授權的內容。</li>
                        </ul>
                        <p>您可以選擇以下操作：</p>
                        <ul>
                            <li>返回「<a href="#" onclick="window.history.back();return false;">上一頁</a>」，重新確認您的操作或選取的項目。</li>
                            <li>從「<g:link controller="home">主畫面</g:link>」選擇您需要的功能，再重新操作一次。</li>
                            <li>如果您認為這是不應該出現的錯誤，請將問題回覆給網站管理者（lyhcode@gmail.com）。</li>
                        </ul>
                        <p>造成您的不便敬請見諒，任何問題與建議歡迎與我們聯繫，將會盡快回覆處理。</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget widget-plain">
                    <div class="widget-content">
                        <google:adsense width="160" height="600" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
