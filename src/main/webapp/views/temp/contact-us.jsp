<%
	String activeItem="contact-us";
	request.setAttribute("activeItem", activeItem);
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Contact Us - LAB Manage</title>
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

	<link rel="stylesheet" href="path/to/iziToast.min.css">
	<script src="path/to/iziToast.min.js"></script>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
		$(document).ready(function() {
			$(".complain-form").submit(function(event) {
				var isAnonymous = $("#leaveComplain").is(":checked");

				if (!isAnonymous && $("#emailComplain").val() === "") {
					iziToast.info({
						title: 'Info',
						message: "Please type your Email or Tick",
						position: 'bottomLeft',
						timeout: 3000, // Time in milliseconds
					});
					event.preventDefault(); // Prevent form submission
				}
			});
		});
	</script>

	<script>
		function validateMessageForm(){
			var mobileNumberValid = validateMobileNumber();

			return mobileNumberValid;
		}

		// mobile-number validation
		function validateMobileNumber() {
			var phone = document.getElementById("phone_number").value;
			var errorElement = document.getElementById("number_error");

			var regex = /^\d{10,15}$/;
			if (!regex.test(phone)) {
				errorElement.innerHTML = "Invalid mobile number. Please enter a number between 8 and 15 digits.";
				return false;
			}
			errorElement.innerHTML = "";
			return true;
		}
	</script>
</head>

<body>
   <!-- Page Wrapper -->
   <div class="page-wrapper">
	   <% String uname = (String) request.getAttribute("username"); %>
	   <% if(uname != null){ %>
	   <jsp:include page="tempComponent/headerAfterLogin.jsp">
		   <jsp:param name="username" value="<%=uname%>"/>

	   </jsp:include>

	   <%  }else{ %>

	   <%@ include file="tempComponent/header.jsp" %>
	   <% } %>

		<!-- Contact Us Content -->
		<div class="page-content">  

			<!-- Contact Us Start -->
			<section class="contact-section">
				<div class="container">
				<div class="row">
					<div class="col-xl-5">
						<div class="pbmit-heading-subheading animation-style1">
							<h4 class="pbmit-subtitle"><span></span>Get In Touch</h4>
							<h2 class="pbmit-title">FIND US HERE.</h2>
						</div>
						<p>Contact us any complains or feedbacks</p>
						<div class="row">
							<div class="col-md-6">
								<div class="pbmit-ihbox pbmit-ihbox-style-5">
									<div class="pbmit-ihbox-headingicon">
										<div class="pbmit-ihbox-icon">
											<div class="pbmit-ihbox-icon-wrapper">
												<div class="pbmit-icon-wrapper pbmit-icon-type-icon">
													<i class="fa fa-square"></i>
												</div>
											</div>
										</div>
										<div class="pbmit-ihbox-contents">
											<h2 class="pbmit-element-title"> Address </h2>
											<div class="pbmit-heading-desc">ICBT, Colombo  Sri Lanka</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="pbmit-ihbox pbmit-ihbox-style-5">
									<div class="pbmit-ihbox-headingicon">
										<div class="pbmit-ihbox-icon">
											<div class="pbmit-ihbox-icon-wrapper">
												<div class="pbmit-icon-wrapper pbmit-icon-type-icon">
													<i class="fa fa-square"></i>
												</div>
											</div>
										</div>
										<div class="pbmit-ihbox-contents">
											<h2 class="pbmit-element-title"> CALLS </h2>
											<div class="pbmit-heading-desc">+94 76 552 027</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="pbmit-ihbox pbmit-ihbox-style-5">
									<div class="pbmit-ihbox-headingicon">
										<div class="pbmit-ihbox-icon">
											<div class="pbmit-ihbox-icon-wrapper">
												<div class="pbmit-icon-wrapper pbmit-icon-type-icon">
													<i class="fa fa-square"></i>
												</div>
											</div>
										</div>
										<div class="pbmit-ihbox-contents">
											<h2 class="pbmit-element-title"> OPENING HOURS </h2>
											<div class="pbmit-heading-desc">Monday to Saturday <br> 5:00 AM - 9:00 PM</div>
											<div class="pbmit-heading-desc">Sunday <br> 8:00 AM - 2:00 PM</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="pbmit-ihbox pbmit-ihbox-style-5">
									<div class="pbmit-ihbox-headingicon">
										<div class="pbmit-ihbox-icon">
											<div class="pbmit-ihbox-icon-wrapper">
												<div class="pbmit-icon-wrapper pbmit-icon-type-icon">
													<i class="fa fa-square"></i>
												</div>
											</div>
										</div>
										<div class="pbmit-ihbox-contents">
											<h2 class="pbmit-element-title"> FOLLOW US ON </h2>
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
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-7">
						<form class="contact-form" action="<%=request.getContextPath()%>/saveContactMessage" onsubmit="return validateMessageForm()" method="post">
							<h4>LEAVE A MESSAGE</h4>
							<div class="row">
							<div class="col-md-6">
								<p>
									<input required type="text" class="form-control" name="first_name" id="first_name" placeholder="Name" name="your-name">
								</p>
							</div>
							<div class="col-md-6">
								<p>
									<input required type="email" class="form-control" name="email_address" id="email_address" placeholder="Email" name="your-email">
								</p>
							</div>
							<div class="col-md-6">
								<p>
									<input type="tel" class="form-control" name="phone_number" id="phone_number" placeholder="Phone" name="tel-646" required>
								</p>

							</div>
							<div class="col-md-6">
								<p>
									<input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" name="Subject" required>
								</p>
							</div>

							<div class="col-lg-12">
								<p>
									<textarea name="description" id="description" class="form-control" placeholder="How can we help you? Feel free to get in touch!"></textarea>
								</p>
							</div>
								<span id="number_error" class="text-danger text-sm text-danger"></span>
							<div class="col-lg-12">
								<button type="submit"  type="button" class="pbmit-btn pbmit-btn-global pbmit-submit-btn">
									Send a message
								</button>
							</div>
							</div>
						</form>

						<%--successMessageDisplayed--%>
						<script>
							var successMessage = '<%= request.getAttribute("successMessage") %>';
							var successMessageDisplayed = '<%= session.getAttribute("successMessageDisplayed") %>';

							if (successMessage && successMessageDisplayed  === 'true') {
								// Display the iziToast success alert
								iziToast.success({
									title: 'Success',
									message: successMessage,
									position: 'bottomRight',
									timeout: 3000, // Time in milliseconds
									progressBarColor: 'green'
								});
							}
						</script>
						<% session.removeAttribute("successMessageDisplayed"); %>


						<%--errorMessageDisplayed--%>
						<script>
							var errorMessage = '<%= request.getAttribute("errorMessage") %>';
							var errorMessageDisplayed = '<%= session.getAttribute("errorMessageDisplayed") %>';

							if (errorMessage && errorMessageDisplayed  === 'true') {
								// Display the iziToast success alert
								iziToast.success({
									title: 'Error',
									message: errorMessage,
									position: 'bottomLeft',
									timeout: 3000, // Time in milliseconds
									color: 'red',
									progressBarColor: 'red'
								});
							}
						</script>

						<% session.removeAttribute("errorMessageDisplayed"); %>



						<form class="complain-form" style="padding-top: 100px" action="<%=request.getContextPath()%>/saveComplainMessage" method="post">
							<h4 class="">any complaints ?</h4>
							<%--<p>leave complain as an anonymous </p>--%>
							<div class="col-lg-12 pt-3">
								<p>
									<textarea required name="complainDescription" id="complainDescription" class="form-control" placeholder="Write your complain!"></textarea>
								</p>
							</div>
							<div class="col-md-12">
								<p>
									<input type="email" id="emailComplain" name="emailComplain" class="form-control" placeholder="Email (not required)" name="your-email">
								<p style="color: #F6FE84">Please give the email address if you wants to reply</p>
								</p>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="leaveComplain">
								<label class="form-check-label" style="color: #f62f48" for="leaveComplain">leave complain as an anonymous</label>
							</div>
							<div class="col-lg-12">
								<button type="submit"  type="button" class="pbmit-btn pbmit-btn-white pbmit-submit-btn">
									Send a complaint
								</button>
							</div>

						</form>

						<%--successMessageDisplayed--%>
						<script>
							var successComplain = '<%= request.getAttribute("successComplain") %>';
							var successComplainDisplayed = '<%= session.getAttribute("successComplainDisplayed") %>';

							if (successComplain && successComplainDisplayed  === 'true') {
								// Display the iziToast success alert
								iziToast.success({
									title: 'Success',
									message: successComplain,
									position: 'bottomRight',
									timeout: 3000, // Time in milliseconds
									progressBarColor: 'green'
								});
							}
						</script>
						<% session.removeAttribute("successComplainDisplayed"); %>


						<%--errorMessageDisplayed--%>
						<script>
							var errorComplain = '<%= request.getAttribute("errorComplain") %>';
							var errorComplainDisplayed = '<%= session.getAttribute("errorComplainDisplayed") %>';

							if (errorComplain && errorComplainDisplayed  === 'true') {
								// Display the iziToast success alert
								iziToast.success({
									title: 'Error',
									message: errorComplain,
									position: 'bottomLeft',
									timeout: 3000, // Time in milliseconds
									color: 'red',
									progressBarColor: 'red'
								});
							}
						</script>

						<% session.removeAttribute("errorComplainDisplayed"); %>

					</div>
				</div>
				</div>
			</section>
			<!-- Contact Us End -->

			<!-- Map Start -->
			<section>
				<div class="container-fluid g-0">
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3961.041693221128!2d79.85776301083969!3d6.8856095188201785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25bc4fdc4eac3%3A0xfde7cffd35d72eb9!2sICBT%20Campus!5e0!3m2!1sen!2slk!4v1710830112932!5m2!1sen!2slk" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</section>
			<!-- Map End -->
		</div>
		<!-- Contact Us Content End -->
      
      	<!-- footer -->
	   <%@ include file="tempComponent/footer.jsp" %>
		<!-- footer End -->

   </div>
   <!-- Page Wrapper End -->

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
			<path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
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
      
   </body>
</html>