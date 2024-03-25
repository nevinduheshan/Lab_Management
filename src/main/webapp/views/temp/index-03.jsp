<%
    String activeItem = "home3";
    String activeItemmain = "home";
    request.setAttribute("activeItemmain", activeItemmain);
    request.setAttribute("activeItem", activeItem);
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>LAB Manage</title>
    <meta name="robots" content="noindex, follow">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.png">
    <!-- CSS
       ============================================ -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <!-- Fontawesome -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.css">
    <!-- Flaticon -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/flaticon.css">
    <!-- optico Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/pbminfotech-base-icons.css">
    <!-- Themify Icons -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/themify-icons.css">
    <!-- Slick -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/swiper.min.css">
    <!-- Magnific -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css">
    <!-- AOS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
    <!-- Shortcode CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/shortcode.css">
    <!-- Base CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/base.css">
    <!-- Style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/responsive.css">
    <!-- REVOLUTION STYLE SHEETS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/revolution/rs6.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">
</head>
<header>
    <!-- Header Main Area -->
    <% String uname = (String) request.getAttribute("username"); %>
    <% if (uname != null) { %>
    <jsp:include page="tempComponent/headerAfterLogin.jsp">
        <jsp:param name="username" value="<%=uname%>"/>

    </jsp:include>

    <% } else { %>

    <%@ include file="tempComponent/header.jsp" %>
    <% } %>

</header>
<body>

<div class="page-wrapper pbmit-bg-color-blackish">



    <div class="pbmit-slider-area">
    <p class="rs-p-wp-fix"></p>
        <rs-module-wrap id="rev_slider_1_1_wrapper" data-alias="slider-demo-1" data-source="gallery"
                        style="visibility:hidden;background:transparent;padding:0;margin:0px auto;margin-top:0;margin-bottom:0;">
            <rs-module id="rev_slider_1_1" data-version="6.6.10">
                <rs-slides style="overflow: hidden; position: absolute;">
                    <rs-slide style="position: absolute;" data-key="rs-1" data-title="Slide"
                              data-thumb="<%=request.getContextPath()%>/revolution/images/slider-a-1-100x50.jpg"
                              data-anim="p:dark;" data-in="o:0;" data-out="o:0;">
                        <img src="<%=request.getContextPath()%>/revolution/images/dummy.png" alt="" title="slider-a-1"
                             width="1920" height="998" class="rev-slidebg tp-rs-img rs-lazyload"
                             data-lazyload="<%=request.getContextPath()%>/revolution/images/background-1.jpg"
                             data-bg="p:left center;" data-no-retina>
                        <rs-layer
                                id="slider-1-slide-1-layer-0"
                                data-type="text"
                                data-rsp_ch="on"
                                data-xy="xo:0,30px,30px,30px;yo:390px,305px,277px,204px;"
                                data-text="w:nowrap;s:100,70,60,40;l:60,45,38,25;fw:900;"
                                data-frame_0="x:-50,-41,-31,-19;"
                                data-frame_1="st:1510;sp:1000;sR:1510;"
                                data-frame_999="o:0;st:w;sR:6490;"
                                style="z-index:7;font-family:'Orbitron';"
                        >
                            <div class="pbmit-slide-title"><span class="pbmit-slide-title-stoke">Appointment </span><br><br>
                                <svg class="pbmit-svg-arrow" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="10" height="19"
                                     viewBox="0 0 19 19" xml:space="preserve"><line x1="1" y1="18" x2="17.8"
                                                                                    y2="1.2"></line>
                                    <line x1="1.2" y1="1" x2="18" y2="1"></line>
                                    <line x1="18" y1="17.8" x2="18" y2="1"></line></svg>
                                Scheduling
                            </div>
                        </rs-layer>

                        <a
                            id="slider-1-slide-1-layer-1"
                            class="rs-layer pbmit-rev-btn rev-btn"
                            href="ourclasses" target="_blank" rel="noopener"
                            data-type="button"
                            data-color="#0c0920"
                            data-rsp_ch="on"
                            data-xy="xo:0,30px,30px,30px;yo:658px,510px,449px,323px;"
                            data-text="w:normal;s:13;l:55;ls:0.5px,0.5px,0px,0px;fw:700;"
                            data-dim="minh:0px,none,none,none;"
                            data-padding="r:35,29,22,14;l:35,29,22,14;"
                            data-frame_1="st:2230;sp:1000;sR:2230;"
                            data-frame_999="o:0;st:w;sR:5770;"
                            data-frame_hover="c:#0c0920;bgc:#fff;bor:0px,0px,0px,0px;bri:120%;"
                            style="z-index:8;background-color:#ffffff;font-family:'Orbitron';text-transform:uppercase;"
                    ><span>An Appointment</span>
                    </a>

                        <rs-layer
                                id="slider-1-slide-1-layer-2"
                                data-type="text"
                                data-rsp_ch="on"
                                data-xy="xo:230px,248px,188px,115px;yo:670px,525px,398px,245px;"
                                data-text="w:normal;s:40,40,30,18;l:25,25,18,11;fw:700;"
                                data-vbility="t,t,f,f"
                                data-frame_1="x:1px,0px,0px,0px;st:3000;sp:1000;sR:3000;"
                                data-frame_999="o:0;st:w;sR:5000;"
                                style="z-index:9;font-family:'Orbitron';"
                        >
                            <div class="skincolor pbmit-custom-number">215<span>+</span></div>
                        </rs-layer>

                        <rs-layer
                                id="slider-1-slide-1-layer-3"
                                data-type="text"
                                data-bsh="c:rgba(0,0,0,0.5);"
                                data-rsp_ch="on"
                                data-xy="xo:344px,372px,35px,30px;yo:671px,525px,226px,182px;"
                                data-text="w:normal;s:13,13,15,15;l:26;ls:0.5px,0.5px,0px,0px;fw:700;"
                                data-vbility="t,t,f,f"
                                data-border="bor:6px,6px,6px,6px;"
                                data-frame_0="y:-50,-41,-31,-19;"
                                data-frame_1="st:3230;sp:1000;sR:3230;"
                                data-frame_999="o:0;st:w;sR:4770;"
                                style="z-index:10;background-color:rgba(255,255,255,0);font-family:'Orbitron';text-transform:uppercase;box-shadow:0px 9px 35px 0px rgba(26, 47, 106, 0.07);"
                        >Satisfied Customer
                        </rs-layer>

                        <rs-layer
                                id="slider-1-slide-1-layer-15"
                                data-type="text"
                                data-bsh="c:rgba(0,0,0,0.5);"
                                data-rsp_ch="on"
                                data-xy="xo:0,30px,30px,30px;yo:333px,260px,238px,165px;"
                                data-text="w:normal;s:16,16,15,15;l:26;ls:2px,0px,0px,0px;fw:700;"
                                data-vbility="t,t,t,f"
                                data-border="bor:6px,6px,6px,6px;"
                                data-frame_0="y:-50,-41,-31,-19;"
                                data-frame_1="st:910;sp:1000;sR:910;"
                                data-frame_999="o:0;st:w;sR:7090;"
                                style="z-index:6;background-color:rgba(255,255,255,0);font-family:'Orbitron';box-shadow:0px 9px 35px 0px rgba(26, 47, 106, 0.07);"
                        >
                            <div class="skincolor">YOU'RE MORE THAN JUST A PATIENT FOR ABC</div>
                        </rs-layer>
                    </rs-slide>

                    <rs-slide style="position: absolute;" data-key="rs-18" data-title="Slide"
                              data-thumb="<%=request.getContextPath()%>/revolution/images/slider-a-2-100x50.jpg"
                              data-anim="f:center;" data-in="o:0;sx:1.1;sy:1.1;m:true;row:30;col:30;"
                              data-out="a:false;">
                        <img src="<%=request.getContextPath()%>/revolution/images/dummy.png" alt="" title="slider-a-2"
                             width="1920" height="998" class="rev-slidebg tp-rs-img rs-lazyload"
                             data-lazyload="<%=request.getContextPath()%>/revolution/images/background-2.jpg"
                             data-bg="p:left center;" data-no-retina>


                        <rs-layer
                                id="slider-1-slide-18-layer-0"
                                data-type="text"
                                data-rsp_ch="on"
                                data-xy="xo:0,30px,30px,30px;yo:390px,305px,277px,204px;"
                                data-text="w:nowrap;s:100,70,60,40;l:60,45,38,25;fw:900;"
                                data-frame_0="x:-50,-41,-31,-19;"
                                data-frame_1="st:1510;sp:1000;sR:1510;"
                                data-frame_999="o:0;st:w;sR:6490;"
                                style="z-index:7;font-family:'Orbitron';"
                        >
                            <div class="pbmit-slide-title"><span class="pbmit-slide-title-stoke">Empowering  </span><br><br>
                                <svg class="pbmit-svg-arrow" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="10" height="19"
                                     viewBox="0 0 19 19" xml:space="preserve"><line x1="1" y1="18" x2="17.8"
                                                                                    y2="1.2"></line>
                                    <line x1="1.2" y1="1" x2="18" y2="1"></line>
                                    <line x1="18" y1="17.8" x2="18" y2="1"></line></svg>
                                Healthcare
                            </div>
                        </rs-layer>

                        <a
                            id="slider-1-slide-18-layer-1"
                            class="rs-layer pbmit-rev-btn rev-btn"
                            href="ourclasses" target="_blank" rel="noopener"
                            data-type="button"
                            data-color="#0c0920"
                            data-rsp_ch="on"
                            data-xy="xo:0,30px,30px,30px;yo:658px,510px,449px,323px;"
                            data-text="w:normal;s:13;l:55;ls:0.5px,0.5px,0px,0px;fw:700;"
                            data-dim="minh:0px,none,none,none;"
                            data-padding="r:35,29,22,14;l:35,29,22,14;"
                            data-frame_1="st:2230;sp:1000;sR:2230;"
                            data-frame_999="o:0;st:w;sR:5770;"
                            data-frame_hover="c:#0c0920;bgc:#fff;bor:0px,0px,0px,0px;bri:120%;"
                            style="z-index:8;background-color:#ffffff;font-family:'Orbitron';text-transform:uppercase;"
                    ><span>An Appointment</span>
                    </a><!--

								-->
                        <rs-layer
                                id="slider-1-slide-18-layer-2"
                                data-type="text"
                                data-rsp_ch="on"
                                data-xy="xo:230px,248px,188px,115px;yo:670px,525px,398px,245px;"
                                data-text="w:normal;s:40,40,30,18;l:25,25,18,11;fw:700;"
                                data-vbility="t,t,f,f"
                                data-frame_1="x:1px,0px,0px,0px;st:3000;sp:1000;sR:3000;"
                                data-frame_999="o:0;st:w;sR:5000;"
                                style="z-index:9;font-family:'Orbitron';"
                        >
                            <div class="skincolor pbmit-custom-number">215<span>+</span></div>
                        </rs-layer><!--

								-->
                        <rs-layer
                                id="slider-1-slide-18-layer-3"
                                data-type="text"
                                data-bsh="c:rgba(0,0,0,0.5);"
                                data-rsp_ch="on"
                                data-xy="xo:344px,372px,35px,30px;yo:671px,525px,226px,182px;"
                                data-text="w:normal;s:13,13,15,15;l:26;ls:0.5px,0.5px,0px,0px;fw:700;"
                                data-vbility="t,t,f,f"
                                data-border="bor:6px,6px,6px,6px;"
                                data-frame_0="y:-50,-41,-31,-19;"
                                data-frame_1="st:3230;sp:1000;sR:3230;"
                                data-frame_999="o:0;st:w;sR:4770;"
                                style="z-index:10;background-color:rgba(255,255,255,0);font-family:'Orbitron';text-transform:uppercase;box-shadow:0px 9px 35px 0px rgba(26, 47, 106, 0.07);"
                        >Satisfied Customer
                        </rs-layer><!--

								-->
                        <rs-layer
                                id="slider-1-slide-18-layer-15"
                                data-type="text"
                                data-bsh="c:rgba(0,0,0,0.5);"
                                data-rsp_ch="on"
                                data-xy="xo:0,30px,30px,30px;yo:333px,260px,238px,165px;"
                                data-text="w:normal;s:16,16,15,15;l:26;ls:2px,0px,0px,0px;fw:700;"
                                data-vbility="t,t,t,f"
                                data-border="bor:6px,6px,6px,6px;"
                                data-frame_0="y:-50,-41,-31,-19;"
                                data-frame_1="st:910;sp:1000;sR:910;"
                                data-frame_999="o:0;st:w;sR:7090;"
                                style="z-index:6;background-color:rgba(255,255,255,0);font-family:'Orbitron';box-shadow:0px 9px 35px 0px rgba(26, 47, 106, 0.07);"
                        >
                            <div class="skincolor">YOU'RE MORE THAN JUST A PATIENT FOR ABC</div>
                        </rs-layer><!--
	-->                        </rs-slide>
                    <rs-slide style="position: absolute;" data-key="rs-19" data-title="Slide"
                              data-thumb="<%=request.getContextPath()%>/revolution/images/slider-a-3-100x50.jpg"
                              data-anim="f:center;" data-in="o:0;sx:1.1;sy:1.1;m:true;row:30;col:30;"
                              data-out="a:false;">
                        <img src="<%=request.getContextPath()%>/revolution/images/dummy.png" alt="" title="slider-a-3"
                             width="1920" height="998" class="rev-slidebg tp-rs-img rs-lazyload"
                             data-lazyload="<%=request.getContextPath()%>/revolution/images/background-3.jpg"
                             data-bg="p:left center;" data-no-retina>
                        <!--
                                                    -->
                        <rs-layer
                                id="slider-1-slide-19-layer-0"
                                data-type="text"
                                data-rsp_ch="on"
                                data-xy="xo:0,30px,30px,30px;yo:390px,305px,277px,204px;"
                                data-text="w:nowrap;s:100,70,60,40;l:60,45,38,25;fw:900;"
                                data-frame_0="x:-50,-41,-31,-19;"
                                data-frame_1="st:1510;sp:1000;sR:1510;"
                                data-frame_999="o:0;st:w;sR:6490;"
                                style="z-index:7;font-family:'Orbitron';"
                        >
                            <div class="pbmit-slide-title"><span class="pbmit-slide-title-stoke">Health Report </span><br><br>
                                <svg class="pbmit-svg-arrow" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="10" height="19"
                                     viewBox="0 0 19 19" xml:space="preserve"><line x1="1" y1="18" x2="17.8"
                                                                                    y2="1.2"></line>
                                    <line x1="1.2" y1="1" x2="18" y2="1"></line>
                                    <line x1="18" y1="17.8" x2="18" y2="1"></line></svg>
                                 Management
                            </div>
                        </rs-layer><!--

								--><a
                            id="slider-1-slide-19-layer-1"
                            class="rs-layer pbmit-rev-btn rev-btn"
                            href="ourclasses" target="_blank" rel="noopener"
                            data-type="button"
                            data-color="#0c0920"
                            data-rsp_ch="on"
                            data-xy="xo:0,30px,30px,30px;yo:658px,510px,449px,323px;"
                            data-text="w:normal;s:13;l:55;ls:0.5px,0.5px,0px,0px;fw:700;"
                            data-dim="minh:0px,none,none,none;"
                            data-padding="r:35,29,22,14;l:35,29,22,14;"
                            data-frame_1="st:2230;sp:1000;sR:2230;"
                            data-frame_999="o:0;st:w;sR:5770;"
                            data-frame_hover="c:#0c0920;bgc:#fff;bor:0px,0px,0px,0px;bri:120%;"
                            style="z-index:8;background-color:#ffffff;font-family:'Orbitron';text-transform:uppercase;"
                    ><span>An Appointment</span>
                    </a><!--

								-->
                        <rs-layer
                                id="slider-1-slide-19-layer-2"
                                data-type="text"
                                data-rsp_ch="on"
                                data-xy="xo:230px,248px,188px,115px;yo:670px,525px,398px,245px;"
                                data-text="w:normal;s:40,40,30,18;l:25,25,18,11;fw:700;"
                                data-vbility="t,t,f,f"
                                data-frame_1="x:1px,0px,0px,0px;st:3000;sp:1000;sR:3000;"
                                data-frame_999="o:0;st:w;sR:5000;"
                                style="z-index:9;font-family:'Orbitron';"
                        >
                            <div class="skincolor pbmit-custom-number">215<span>+</span></div>
                        </rs-layer><!--

								-->
                        <rs-layer
                                id="slider-1-slide-19-layer-3"
                                data-type="text"
                                data-bsh="c:rgba(0,0,0,0.5);"
                                data-rsp_ch="on"
                                data-xy="xo:344px,372px,35px,30px;yo:671px,525px,226px,182px;"
                                data-text="w:normal;s:13,13,15,15;l:26;ls:0.5px,0.5px,0px,0px;fw:700;"
                                data-vbility="t,t,f,f"
                                data-border="bor:6px,6px,6px,6px;"
                                data-frame_0="y:-50,-41,-31,-19;"
                                data-frame_1="st:3230;sp:1000;sR:3230;"
                                data-frame_999="o:0;st:w;sR:4770;"
                                style="z-index:10;background-color:rgba(255,255,255,0);font-family:'Orbitron';text-transform:uppercase;box-shadow:0px 9px 35px 0px rgba(26, 47, 106, 0.07);"
                        >Satisfied Customer
                        </rs-layer><!--

								-->
                        <rs-layer
                                id="slider-1-slide-19-layer-15"
                                data-type="text"
                                data-bsh="c:rgba(0,0,0,0.5);"
                                data-rsp_ch="on"
                                data-xy="xo:0,30px,30px,30px;yo:333px,260px,238px,165px;"
                                data-text="w:normal;s:16,16,15,15;l:26;ls:2px,0px,0px,0px;fw:700;"
                                data-vbility="t,t,t,f"
                                data-border="bor:6px,6px,6px,6px;"
                                data-frame_0="y:-50,-41,-31,-19;"
                                data-frame_1="st:910;sp:1000;sR:910;"
                                data-frame_999="o:0;st:w;sR:7090;"
                                style="z-index:6;background-color:rgba(255,255,255,0);font-family:'Orbitron';box-shadow:0px 9px 35px 0px rgba(26, 47, 106, 0.07);"
                        >
                            <div class="skincolor">YOU'RE MORE THAN JUST A PATIENT FOR ABC</div>
                        </rs-layer><!--
	-->                        </rs-slide>
                </rs-slides>
                <rs-static-layers><!--
						--></rs-static-layers>
            </rs-module>
        </rs-module-wrap>
        <!-- END REVOLUTION SLIDER -->
    </div>
    <!-- page content -->
    <div class="page-content">


        <section class="client-section-one">
            <div class="container">
                <div class="row">
                    <article class="pbmit-client-style-1 col-md-20percent">
                        <div class="pbmit-client-wrapper">
                            <h4 class="pbmit-hide">Client Logo 05</h4>
                            <div class="pbmit-featured-img-wrapper">
                                <div class="pbmit-featured-wrapper">
                                    <img src="<%=request.getContextPath()%>/images/demo1/client/client-04.png"
                                         class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="pbmit-client-style-1 col-md-20percent">
                        <div class="pbmit-client-wrapper">
                            <h4 class="pbmit-hide">Client Logo 04</h4>
                            <div class="pbmit-featured-img-wrapper">
                                <div class="pbmit-featured-wrapper">
                                    <img src="<%=request.getContextPath()%>/images/demo1/client/client-05.png"
                                         class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="pbmit-client-style-1 col-md-20percent">
                        <div class="pbmit-client-wrapper">
                            <h4 class="pbmit-hide">Client Logo 03</h4>
                            <div class="pbmit-featured-img-wrapper">
                                <div class="pbmit-featured-wrapper">
                                    <img src="<%=request.getContextPath()%>/images/demo1/client/client-03.png"
                                         class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="pbmit-client-style-1 col-md-20percent">
                        <div class="pbmit-client-wrapper">
                            <h4 class="pbmit-hide">Client Logo 02</h4>
                            <div class="pbmit-featured-img-wrapper">
                                <div class="pbmit-featured-wrapper">
                                    <img src="<%=request.getContextPath()%>/images/demo1/client/client-02.png"
                                         class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </article>
                    <article class="pbmit-client-style-1 col-md-20percent">
                        <div class="pbmit-client-wrapper">
                            <h4 class="pbmit-hide">Client Logo 01</h4>
                            <div class="pbmit-featured-img-wrapper">
                                <div class="pbmit-featured-wrapper">
                                    <img src="<%=request.getContextPath()%>/images/demo1/client/client-01.png"
                                         class="img-fluid" alt="">
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div>
        </section>
        <!-- Client End -->

        <!-- Static Box End -->
        <section class="pbminfotech-ele-ptable-style-1"
                 style="background-image: url('<%=request.getContextPath()%>/revolution/images/background_girl.png'); background-repeat: no-repeat; background-size: contain; background-position: right;">
            <div class="container">
                <div class='block2'>
                    <img src="<%=request.getContextPath()%>/revolution/images/doc.png" style="" class="img-fluid mb-n3" alt="Responsive image">
                </div>
                <div class="mt-5 mb-3" id="appointment"
                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/cover-box.png'); ">
                    <h3 class="p-3 p-md-5 mt-5">Meet Our Professional Doctors!</h3>
                    <p class="text-2xl-left px-3 px-md-5 appointment_text">
                        At ABC Laboratory, we take pride in our team of experienced and dedicated </br>
                        doctors who are committed to delivering exceptional healthcare </br>
                        services and advancing scientific research.</p>


                        <div class="pbmit-ptable-btn text-end p-5 mx-5"><a href="<%=request.getContextPath()%>/ourclasses"> Make an appointment</a></div>
                </div>
            </div>
        </section>

    </div>
    <!-- page content End -->

    <!-- footer -->
    <%@ include file="tempComponent/footer.jsp" %>
    <!-- footer End -->

</div>
<!-- page wrapper End -->

<!-- Search Box Start Here -->
<div class="pbmit-search-overlay">
    <div class="pbmit-icon-close"></div>
    <div class="pbmit-search-outer">
        <form class="pbmit-site-searchform">
            <input type="search" class="form-control field searchform-s" name="s" placeholder="Search …">
            <button type="submit">
                <i class="pbmit-base-icon-search-1"></i>
            </button>
        </form>
    </div>
</div>
<!-- Search Box End Here -->

<!-- Scroll To Top -->
<div class="pbmit-progress-wrap">
    <svg class="pbmit-progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"/>
    </svg>
</div>
<!-- Scroll To Top End -->

<!-- JS
   ============================================ -->
<!-- jQuery JS -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<!-- Popper JS -->
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<!-- jquery Waypoints JS -->
<script src="<%=request.getContextPath()%>/js/jquery.waypoints.min.js"></script>
<!-- jquery Appear JS -->
<script src="<%=request.getContextPath()%>/js/jquery.appear.js"></script>
<!-- Numinate JS -->
<script src="<%=request.getContextPath()%>/js/numinate.min.js"></script>
<!-- Slick JS -->
<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
<!-- Magnific JS -->
<script src="<%=request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
<!-- Circle Progress JS -->
<script src="<%=request.getContextPath()%>/js/circle-progress.js"></script>
<!-- countdown JS -->
<script src="<%=request.getContextPath()%>/js/jquery.countdown.min.js"></script>
<!-- AOS -->
<script src="<%=request.getContextPath()%>/js/aos.js"></script>
<!-- GSAP -->
<script src='<%=request.getContextPath()%>/js/gsap.js'></script>
<!-- Scroll Trigger -->
<script src='<%=request.getContextPath()%>/js/ScrollTrigger.js'></script>
<!-- Split Text -->
<script src='<%=request.getContextPath()%>/js/SplitText.js'></script>
<!-- Magnetic -->
<script src='<%=request.getContextPath()%>/js/magnetic.js'></script>
<!-- GSAP Animation -->
<script src='<%=request.getContextPath()%>/js/gsap-animation.js'></script>
<!-- Scripts JS -->
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<!-- Revolution JS -->
<script src="<%=request.getContextPath()%>/revolution/rslider.js"></script>
<script src="<%=request.getContextPath()%>/revolution/rbtools.min.js"></script>
<script src="<%=request.getContextPath()%>/revolution/rs6.min.js"></script>
</body>
</html>