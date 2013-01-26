<html>
<head>
<title>Home</title>
<meta name="layout" content="bootstrap"/>
<r:require modules="jquery-cslider" />
</head>
<body>

<div class="row margin-below">
    <div class="span12 clearlook-wrapper">
        <!-- start: Slider -->
        <div class="slider-wrapper">
            <div id="da-slider" class="da-slider justfont">
                <div class="da-slide">
                    <h2>動手，學會寫程式</h2>
                    <p class="justfont-force">只有讓學習者自己動手練習撰寫程式，才能獲得最好的學習效果。「壹學院」提供的豐富學習教材，提供比一般書籍題庫更大量的實作練習。</p>
                    <!--<a href="#" class="da-link">連結</a>-->
                    <div class="da-img"><img src="http://lyhcode.com/assets/themes/gravis/img/parallax-slider/imac.png" alt="image01" /></div>
                </div>
                <div class="da-slide">
                    <h2>閱讀，享受高品質</h2>
                    <p class="justfont-force">「壹學院」比傳統 e-Learning 平台更重視教材閱讀品質，採用更完美的「信黑體」專業級中文網頁字型，並支援高解析度的平板閱讀器，提供媲美印刷等級的無障礙舒適閱讀。</p>
                    <!--<a href="#" class="da-link">Read more</a>-->
                    <div class="da-img"><img src="http://lyhcode.com/assets/themes/gravis/img/parallax-slider/ipad-mini.png" alt="image02" /></div>
                </div>
                <div class="da-slide">
                    <h2>數千位學習者見證</h2>
                    <p class="justfont-force">在過去幾年之中，我們開發的程式設計教學軟體，已經培訓超過 4,000 位優秀學員，問卷調查結果顯示，高達百分之九十五的學習者，肯定自己得到更好的學習效果。</p>
                    <!--<a href="#" class="da-link">Read more</a>-->
                    <div class="da-img" style="margin-left: -150px"><img src="http://lyhcode.com/assets/themes/gravis/img/parallax-slider/mapa.png" alt="image03" /></div>
                </div>
                <div class="da-slide">
                    <h2>專業，熱誠，服務</h2>
                    <p class="justfont-force">透過成功的產學合作基礎，來自業界資深開發經驗的工程師，與教學資歷豐富的認證講師協同合作，聯手打造最值得您信賴的專業教學平台。</p>
                    <!--<a href="#" class="da-link">Read more</a>-->
                    <div class="da-img" style="margin-left: -100px"><img src="http://lyhcode.com/assets/themes/gravis/img/parallax-slider/html5.png" alt="image04" /></div>
                </div>
                <nav class="da-arrows">
                    <span class="da-arrows-prev"></span>
                    <span class="da-arrows-next"></span>
                </nav>
            </div>
        </div>
        <r:script>$('#da-slider').cslider({autoplay:true,bgincrement:0});</r:script>
        <!-- end: Slider -->
    </div>
</div>

<div class="row-fluid clearlook-wrapper margin-below">
    <div class="span8 padding-around">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#announce-tab" data-toggle="tab" class="effect-text-shadow larger-font"><g:message code="postType.ANNOUNCE.label" /></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="announce-tab">
                <g:if test="${posts?.size()>0}">
                    <ul class="links">
                        <g:each in="${posts}" var="post" status="i">
                            <li class="${i==0?'first':'show-lines'}">
                                <g:link controller="post" action="show" params="[name: post.name]">${post.title}</g:link>
                                <div class="pull-right"><small style="font-family:Georgia"><em>${post.hits}</em></small>
                                <small class="muted"><g:formatDate date="${post.dateCreated}" type="date" style="SHORT" /></small></div>
                            </li>
                        </g:each>
                    </ul>
                    <div style="text-align:right">
                        <g:link controller="post" action="list" class="btn"><g:message code="default.more.label" args="[message(code:'postType.ANNOUNCE.label')]" /></g:link>
                    </div>
                </g:if>
                <g:else>
                    <g:message code="default.empty.description" />
                </g:else>
            </div>
        </div>
    </div>
    
    <div class="span4">

        <div class="margin-around">
            <google:adsense width="250" height="250" />
        </div>

        <div class="margin-below">
            <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fcodecanaan&amp;width=292&amp;height=62&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=false&amp;appId=102994276528232" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:62px;" allowTransparency="true"></iframe>
        </div>
        <div class="margin-below">
            <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fgroovy.taiwan&amp;width=292&amp;height=62&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=false&amp;appId=102994276528232" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:62px;" allowTransparency="true"></iframe>
        </div>
        <div class="margin-below">
            <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2Fnodejs.tw&amp;width=292&amp;height=62&amp;show_faces=false&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=false&amp;appId=102994276528232" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:292px; height:62px;" allowTransparency="true"></iframe>
        </div>

    </div>

</div>

<div class="row-fluid clearlook-wrapper">
    <div class="span6 product-marketing">
        <p class="slogan">專業程式語言認證教學平台，首創雲端教室讓您的學習如虎添翼</p>
        <ul class="features icons">
            <li><i class="icon-ok icon-2x icon-green"></i> 整合 Facebook 帳號登入</li>
            <li><i class="icon-ok icon-2x icon-green"></i> 完美結合 TQC+ 軟體設計領域認證題庫與教材</li>
            <li><i class="icon-ok icon-2x icon-green"></i> 大量強調手腦並用的程式碼實作練習題</li>
            <li><i class="icon-ok icon-2x icon-green"></i> 雲端教室數位學習服務，教學零負擔</li>
            <li><i class="icon-ok icon-2x icon-green"></i> 創新的網頁式整合開發環境，支援自動化編譯與測試</li>
        </ul>
        <div class="controls">
            <g:link controller="course" action="show" id="9" class="btn btn-large btn-primary">開始使用 »</g:link>
            <p class="rights">即使起開放免費申請，會員登入後即可獲得免費致贈的線上課程</p>
        </div>
    </div>
    <div class="span6 product-preview">
        <div id="preview-carousel" class="carousel slide">
            <div class="carousel-inner">
                <div class="active item">
                    <g:img dir="images" file="preview-1.png" />
                    <div class="carousel-caption effect-round-corner">
                        <p>教材數位化設計，使用瀏覽器上網即可閱讀！</p>
                    </div>
                </div>
                <div class="item">
                    <g:img dir="images" file="preview-2.png" />
                    <div class="carousel-caption effect-round-corner">
                        <p>強大的網頁式整合開發環境（Web-base IDE）！</p>
                    </div>
                </div>
                <div class="item">
                    <g:img dir="images" file="preview-3.png" />
                    <div class="carousel-caption effect-round-corner">
                        <p>整合自動化編譯、測試流程，資料上傳雲端保存！</p>
                    </div>
                </div>
                <div class="item">
                    <g:img dir="images" file="preview-4.png" />
                    <div class="carousel-caption effect-round-corner">
                        <p>個人化進度管理，學習效果更加倍！</p>
                    </div>
                </div>
            </div>
            <a class="carousel-control left" href="#preview-carousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#preview-carousel" data-slide="next">&rsaquo;</a>
        </div>
        <r:script>$('#preview-carousel').carousel();</r:script>
    </div>
</div>

<div class="padding-around margin-around textalign-center">
    <r:img dir="images/logoset" file="logoset.png" />
</div>

<sec:ifNotLoggedIn>
    <!--快速登入-->
    <div class="clearlook-wrapper padding-around">
        <div class="row-fluid">
            <div class="span9">
                <p class="larger-font" style="text-align:center">立即開始體驗！歡迎使用 Facebook 帳號直接登入。</p>
            </div>
            <div class="span3">
                <facebookAuth:connect permissions="email,user_about_me" />
            </div>
        </div>
    </div>
</sec:ifNotLoggedIn>

</body>
</html>
