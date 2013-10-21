<!DOCTYPE html>
<html>
<head>
	<title>Error 500</title>
	<meta name="layout" content="baseadmin"/>
	<r:require modules="grails-errors-style" />
</head>
<body>
<div class="container">

	<div class="error-container">

        <h1>Oops!</h1>
        
        <h2>網站存取發生錯誤</h2>
        
        <div class="error-details">
            Sorry, an error has occured, Requested page not work!

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

	<p>除了等待系統復原，您還可以嘗試這些動作：</p>
        
	<ul>
		<li>回到<a href="/">主畫面</a>。</li>
		<li><a href="http://fallback.codecanaan.com/">自動清除</a>瀏覽器對此網站保留的設定資料。</li>
		<li>手動清除瀏覽器快取和 Cookies，請參考 Google 的<a href="http://support.google.com/accounts/bin/answer.py?hl=zh-Hant&answer=32050" target="_blank">說明</a>。</li>
		<li>將問題回報給網站管理者（lyhcode@gmail.com）。</li>
	</ul>

	<div class="widget">
		<div class="widget-content">
			<g:renderException exception="${exception}" />
		</div>
	</div>
</div>

</body>
</html>
