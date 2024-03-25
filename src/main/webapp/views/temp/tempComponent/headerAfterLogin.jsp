<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<Head>
    <%--    <% String activeItem =(String) request.getParameter("pagename");%>--%>
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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Include iziToast CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/css/iziToast.min.css">
    <!-- Include iziToast JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/izitoast@1.4.0/dist/js/iziToast.min.js"></script>
    <%--  Alerts  --%>
    <script src="<%=request.getContextPath()%>/js/alert.js"></script>

</Head>

<header class="site-header header-style-1">
    <div class="site-header-menu">
        <div class="container-fluid g-0">
            <div class="row g-0">
                <div class="col-md-12">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center justify-content-between header-content">
                            <div class="site-branding pbmit-logo-area">
                                <h1 class="site-title">
                                    <a href="<%=request.getContextPath()%>/">
                                        <img src="<%=request.getContextPath()%>/images/demo1/hospitalicon.png"
                                             class="logo-img" alt="ABC">
                                    </a>
                                </h1>
                            </div>
                            <div class="site-navigation">
                                <nav class="main-menu navbar-expand-xl navbar-light">
                                    <div class="navbar-header">
                                        <!-- Toggle Button -->
                                        <button class="navbar-toggler" type="button">
                                            <i class="pbmit-base-icon-menu-1"></i>
                                        </button>
                                    </div>
                                    <div class="pbmit-mobile-menu-bg"></div>
                                    <div class="collapse navbar-collapse clearfix show" id="pbmit-menu">
                                        <div class="pbmit-menu-wrap">
													<span class="closepanel">
														<svg class="qodef-svg--close qodef-m"
                                                             xmlns="http://www.w3.org/2000/svg" width="20.163"
                                                             height="20.163" viewBox="0 0 26.163 26.163">
															<rect width="36" height="1"
                                                                  transform="translate(0.707) rotate(45)"></rect>
															<rect width="36" height="1"
                                                                  transform="translate(0 25.456) rotate(-45)"></rect>
														</svg>
													</span>
                                            <ul class="navigation clearfix">

                                                <li class="${activeItem == 'home3' ? 'active' : ''}">
                                                    <a href="<%=request.getContextPath()%>/home" class="our-classes">Home</a>
                                                </li>

                                                <li class="${activeItem == 'our-classes' ? 'active' : ''}">
                                                    <a href="ourclasses" class="our-classes">Appointments</a>
                                                </li>
                                                <li class="${activeItem == 'Personal-Doctor' ? 'active' : ''}">
                                                    <a href="Personal-Doctor" class="Personal-Doctor">Doctors</a>
                                                </li>

                                                <li class="${activeItem == 'contact-us' ? 'active' : ''}">
                                                    <a href="ContactUS">Contact Us</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                        </div>
                        <div class="pbmit-right-box">
                            <div class="pbmit-button-box">
                                <% String username = (String) request.getAttribute("username"); %>

                                <div class="pbmit-header-button2">
                                    <a href="<%=request.getContextPath()%>/memberProfile">
                                        <span class="pbmit-header-button2-text"><% if (username != null) { %> <%=username%> <% } %></span>
                                    </a>
                                </div>

                            </div>

                            <div class="pbmit-menuarea">
                                <div class="navbar-header">
                                    <!-- Toggle Button -->
                                    <button  class="navbar-toggler pbmit-nav-menu-toggle" type="button">
                                        <svg class="qodef-svg--menu qodef-m" xmlns="http://www.w3.org/2000/svg" width="36" height="21" viewBox="0 0 36 21">
                                            <path d="M0,0H36V1H0Z" transform="translate(0 20)"></path>
                                            <path d="M0,0H36V1H0Z" transform="translate(0 10)"></path>
                                            <path d="M0,0H36V1H0Z"></path>
                                        </svg>
                                    </button>
                                </div>
                                <div class="floting-bar-wrap">
                                    <div class="floting-bar-widget-area">
                                        <aside class="widget widget_media_image">
                                            <img src="<%=request.getContextPath()%>/images/demo1/hospitalicon.png" class="img-fluid" alt="">
                                        </aside>
                                        <aside class="widget widget_text">
                                            <div class="textwidget">
                                                <p>At ABC Laboratory, we're dedicated to providing cutting-edge solutions for efficient lab management. Our comprehensive Laboratory Management System (LMS) streamlines processes, </p>
                                            </div>
                                        </aside>
                                        <aside class="widget_text widget widget_custom_html">
                                            <div class="textwidget custom-html-widget">
                                                <div class="pbmit-contact-box">
                                                    <div class="pbmit-contact-list pbmit-location">
                                                        <h4>WE ARE HERE</h4>
                                                        <span>ICBT, Colombo</span>
                                                    </div>
                                                    <div class="pbmit-contact-list pbmit-phone">
                                                        <h4>CALLS</h4>
                                                        <span> +94 76 552 8027</span>
                                                        <%--                                                        <span></span>--%>
                                                        <%--                                                        <span>pbminfo@user.com</span>--%>
                                                    </div>
                                                    <div class="pbmit-contact-list pbmit-time">
                                                        <h4>OPENING HOURS</h4>
                                                        <span>Monday to Saturday</span>
                                                        <span>5:00 am — 9:00 pm</span>
                                                        <span>Sunday</span>
                                                        <span>8:00 am — 2:00 pm</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </aside>
                                    </div>
                                    <div class="floting-bar-social-wrap">
                                        <div class="floting-bar-social-title">
                                            <h4>FOLLOW US ON</h4>
                                            <ul class="pbmit-social-links">
                                                <li class="pbmit-social-li pbmit-social-facebook">
                                                    <a href="#" target="_blank">
                                                        <span><i class="pbmit-base-icon-facebook-f"></i></span>
                                                    </a>
                                                </li>
                                                <li class="pbmit-social-li pbmit-social-twitter">
                                                    <a href="#" target="_blank">
                                                        <span><i class="pbmit-base-icon-twitter"></i></span>
                                                    </a>
                                                </li>
                                                <li class="pbmit-social-li pbmit-social-linkedin">
                                                    <a href="#" target="_blank">
                                                        <span><i class="pbmit-base-icon-linkedin-in"></i></span>
                                                    </a>
                                                </li>
                                                <li class="pbmit-social-li pbmit-social-instagram">
                                                    <a href="#" target="_blank">
                                                        <span><i class="pbmit-base-icon-instagram"></i></span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <span class="closepanel">
											<svg class="qodef-svg--close qodef-m" xmlns="http://www.w3.org/2000/svg" width="26.163" height="26.163" viewBox="0 0 26.163 26.163">
												<rect width="36" height="1" transform="translate(0.707) rotate(45)"></rect>
												<rect width="36" height="1" transform="translate(0 25.456) rotate(-45)"></rect>
											</svg>
											</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>
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
<!-- Circle Progres -->
<script src='<%=request.getContextPath()%>/js/circle-progress.min.js'></script>
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
