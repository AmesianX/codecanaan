<html>
<head>
    <title>Home</title>

    <meta name="layout" content="baseadmin" />
    <meta name="display.footer" content="enable" />

    <r:require modules="jquery-cslider" />
</head>
<body>

<div class="main">
    <div class="container">

    <!-- Slider -->
    <div class="slider-wrapper visible-md visible-lg">
        <div id="da-slider" class="da-slider">
            <div class="da-slide">
                <h2>動手，學會寫程式</h2>
                <p>只有讓學習者自己動手練習撰寫程式，才能獲得最好的學習效果。「軟體設計學院」提供的豐富學習教材，提供比一般書籍題庫更大量的實作練習。</p>
                <!--<a href="#" class="da-link">連結</a>-->
                <div class="da-img"><g:img dir="images" file="slide1.png" /></div>
            </div>
            <div class="da-slide">
                <h2>閱讀，享受高品質</h2>
                <p>比傳統 e-Learning 平台更重視教材閱讀品質，採用更完美的「信黑體」專業級中文網頁字型，並支援高解析度的平板閱讀器，提供媲美印刷等級的無障礙舒適閱讀。</p>
                <div class="da-img"><g:img dir="images" file="slide2.png" /></div>
            </div>
            <div class="da-slide">
                <h2>數千位學習者見證</h2>
                <p>在過去幾年之中，我們開發的程式設計教學軟體，已經培訓超過 4,000 位優秀學員，問卷調查結果顯示，高達百分之九十五的學習者，肯定自己得到更好的學習效果。</p>
                <div class="da-img" style="margin-left: -150px"><g:img dir="images" file="slide3.png" /></div>
            </div>
            <div class="da-slide">
                <h2>專業，熱誠，服務</h2>
                <p>透過成功的產學合作基礎，來自業界資深開發經驗的工程師，與教學資歷豐富的認證講師協同合作，聯手打造最值得您信賴的專業教學平台。</p>
                <div class="da-img" style="margin-left: -100px"><g:img dir="images" file="slide4.png" /></div>
            </div>
            <nav class="da-arrows">
                <span class="da-arrows-prev"></span>
                <span class="da-arrows-next"></span>
            </nav>
        </div>
    </div>
    <r:script>
    $(document).ready(function() {
        $('#da-slider').cslider({
            autoplay: true, bgincrement: 0
        });
    });
    </r:script>
    <!-- Slider/end -->

    <div class="row">
        
        <div class="col-md-6 col-xs-12">

            <div class="widget widget-nopad stacked">
                        
                <div class="widget-header">
                    <i class="icon-list-alt"></i>
                    <h3><g:message code="postType.ANNOUNCE.label" /></h3>
                </div> <!-- /widget-header -->
                
                <div class="widget-content">

                    <g:if test="${posts}">
                        <ul class="news-items">
                            <g:each in="${posts}" var="post" status="i">
                                <li>
                                    <div class="news-item-detail">
                                        <g:link controller="post" action="show" params="[name: post.name]" class="news-item-title">${post.title}</g:link>
                                        <p class="news-item-preview"><g:truncate maxlength="100">${post.content}</g:truncate></p>
                                    </div>
                                    <div class="news-item-date">
                                        <span class="news-item-day"><g:formatDate format="dd" date="${post.dateCreated}"/></span>
                                        <span class="news-item-month"><g:formatDate format="MMM" date="${post.dateCreated}"/></span>
                                    </div>
                                </li>
                            </g:each>
                        </ul>
                    </g:if>
                    
                </div> <!-- /widget-content -->
            
            </div> <!-- /widget --> 
                    
                                        
            <div class="widget stacked">
                
                <div class="widget-header">
                    <i class="icon-file"></i>
                    <h3>Technology</h3>
                </div> <!-- /widget-header -->
                
                <div class="widget-content">
                    
                    <p class="slogan">專業程式語言認證教學平台，首創雲端教室讓您的學習如虎添翼</p>

                    <ul class="features icons-ul">
                        <li><i class="icon-li icon-ok icon-green"></i> 整合 Facebook 帳號登入</li>
                        <li><i class="icon-li icon-ok icon-green"></i> 完美結合 TQC+ 軟體設計領域認證題庫與教材</li>
                        <li><i class="icon-li icon-ok icon-green"></i> 大量強調手腦並用的程式碼實作練習題</li>
                        <li><i class="icon-li icon-ok icon-green"></i> 雲端教室數位學習服務，教學零負擔</li>
                        <li><i class="icon-li icon-ok icon-green"></i> 創新的網頁式整合開發環境，支援自動化編譯與測試</li>
                    </ul>

                    <div class="controls">
                        <g:link controller="course" action="show" id="9" class="btn btn-large btn-primary">開始使用 »</g:link>
                        
                    </div>

                    <p>即使起開放免費申請，會員登入後即可獲得免費致贈的線上課程</p>

                    <p><r:img dir="images/logoset" file="logoset.png" /></p>
                    
                </div> <!-- /widget-content -->
            
            </div> <!-- /widget -->
            
        </div> <!-- /span6 -->
        
        
        <div class="col-md-6">  
            
            
            <div class="widget stacked">
                    
                <div class="widget-header">
                    <i class="icon-bookmark"></i>
                    <h3>Quick Preview</h3>
                </div> <!-- /widget-header -->
                
                <div class="widget-content">
                    
                    <div id="preview-carousel" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="active item">
                                <g:img dir="images" file="preview-1.png" />
                            </div>
                            <div class="item">
                                <g:img dir="images" file="preview-2.png" />
                            </div>
                            <div class="item">
                                <g:img dir="images" file="preview-3.png" />
                            </div>
                            <div class="item">
                                <g:img dir="images" file="preview-4.png" />
                            </div>
                        </div>
                    </div>
                    <r:script>$('#preview-carousel').carousel();</r:script>
                
                </div> <!-- /widget-content -->
                
            </div> <!-- /widget -->
                    
            <div class="widget stacked">

                <div class="widget-header">
                    <i class="icon-facebook-sign"></i>
                    <h3>Facebook Pages</h3>
                </div> <!-- /widget-header -->
                
                <div class="widget-content">

                    <div class="col-sm-6">

                        <google:adsense width="250" height="250" />
                    </div>

                    <div class="col-sm-6">

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
                    
                </div> <!-- /widget-content -->
            
            </div> <!-- /widget -->
                                
          </div> <!-- /span6 -->
        
      </div> <!-- /row -->

    </div> <!-- /container -->
    
</div> <!-- /main -->

</div>
</body>
</html>
