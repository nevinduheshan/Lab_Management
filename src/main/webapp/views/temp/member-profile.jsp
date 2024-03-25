<%@ page import="com.lab.labManage.dto.UserDto" %>
<%@ page import="org.apache.jasper.tagplugins.jstl.core.Out" %>
<%@ page import="com.lab.labManage.dto.BookingInquiryRequestDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.lab.labManage.dto.Health_reportDto" %>
<%@ page import="com.lab.labManage.service.HealthReportService" %>

<%
    String uname = (String) request.getAttribute("username");
    Integer users_id = (Integer) request.getAttribute("users_id");
    UserDto userInfo = (UserDto) request.getAttribute("userinfo");


%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function ChangePop() {
            document.getElementById("passwordChangeBox").hidden = false;

        }

        function closePop() {
            document.getElementById("currentPassword").value = "";
            document.getElementById("newPassword").value = "";
            document.getElementById("confirmPassword").value = "";
            document.getElementById("errorText").innerText = "";
            document.getElementById("passwordChangeBox").hidden = true;

        }

        function changeSubmit() {
            var currentPassword = document.getElementById("currentPassword").value;
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (currentPassword == "" || newPassword == "" || confirmPassword == "") {
                document.getElementById("errorText").innerText = "Please fill all the fields"
            } else if (newPassword != confirmPassword) {
                document.getElementById("errorText").innerText = "New password and confirm password does not match"
            } else {
                document.getElementById("btnChange").hidden = true;
                document.getElementById("txtLoading").hidden = false;
                $.ajax({
                    type: "POST",
                    url: "changeAccountPassword",
                    contentType: 'application/json',
                    data: JSON.stringify({
                        username: "<%=uname%>",
                        currentPassword: currentPassword,
                        newPassword: newPassword,
                        confirmPassword: confirmPassword
                    }),
                    success: function (data) {
                        if (data === "success") {
                            document.getElementById("passwordChangeBox").hidden = true;
                            document.getElementById("btnChange").hidden = false;
                            document.getElementById("txtLoading").hidden = true;
                            alert("Password changed successfully");
                        } else {
                            document.getElementById("errorText").innerText = data;
                            document.getElementById("btnChange").hidden = false;
                            document.getElementById("txtLoading").hidden = true;
                        }
                    }
                });
            }
        }
    </script>
    <style>

        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 9999;
        }

        .centered-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #1E293B;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            z-index: 10000;
            color: #e3dada;
        }

        .close-button {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 30px;
            background: none;
            border: none;
            cursor: pointer;
            color: #888;
        }
    </style>

</head>
<header>
    <% if (uname != null) { %>
    <jsp:include page="tempComponent/headerAfterLogin.jsp">
        <jsp:param name="username" value=""/>

    </jsp:include>

    <% } else { %>

    <%@ include file="tempComponent/header.jsp" %>
    <% } %>
</header
<body>
<div>

    <%--content settings--%>
    <div class="pbmit-bg-color-blackish py-5">
        <div class="container rounded py-5">
            <div class="row">
                <div class="col-md-3 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img
                            class="rounded-circle mt-5" width="150px"
                            src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span
                            class="font-weight-bold"><%
                        if (uname != null) {
                            out.print(uname);
                        }
                    %></span><span
                            class="text-white-50"><% if (userInfo.getEmail() != null) { %> <%= userInfo.getEmail() %><% } %></span><span> </span>
                    </div>
                </div>
                <div class="col-md-5 border-right">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="text-right">Profile Settings</h4>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6"><label class="">First Name</label>
                                <input type="text" class="form-control" placeholder=""
                                       value="<% if (userInfo.getFirstName() != null) { %> <%= userInfo.getFirstName() %><% } %>"
                                       disabled style="background-color: transparent;">
                            </div>
                            <div class="col-md-6"><label class="">Last Name</label>
                                <input type="text" class="form-control userInfo"
                                       value="<% if (userInfo.getLastName() != null) { %> <%= userInfo.getLastName() %><% } %>"
                                       placeholder="" disabled style="background-color: transparent;">
                            </div>
                        </div>
                        <div class="row mt-3">

                            <div class="col-md-12"><label class="">Email</label>
                                <input type="text" class="form-control userInfo" placeholder=""
                                       value="<% if (userInfo.getEmail() != null) { %> <%= userInfo.getEmail() %><% } %>"
                                       disabled style="background-color: transparent;">
                            </div>
                            <div class="col-md-12"><label class="">Username</label><input type="text"
                                                                                          class="form-control userInfo"
                                                                                          placeholder=""
                                                                                          value="<%if(uname != null){out.print(uname);}%>"
                                                                                          disabled
                                                                                          style="background-color: transparent;">
                            </div>
                            <div class="col-md-12"><label class="">Mobile Number</label>
                                <input type="text" class="form-control userInfo" placeholder=""
                                       value="<% if (userInfo.getMobile() != null) { %> <%= userInfo.getMobile() %><% } %>"
                                       disabled style="background-color: transparent;">
                            </div>
                        </div>
                        <div class="row mt-3">

                            <div class="mt-5 text-center col-md-6">
                                <button class="btn btn-primary profile-button" id="popupButton" type="button"
                                        onclick="ChangePop()">Change
                                    Password
                                </button>
                            </div>

                        </div>


                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience">
                            <span>Join Date - <% if (userInfo.getCreatedAt() != null) { %> <%= userInfo.getCreatedAt() %><% } %></span>
                            <%--                            <span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span></div>--%>
                            <br>
                        </div>
                        <div class="mt-5 text-center col-md-6">
                            <a href="<%=request.getContextPath()%>/logout">
                                <button class="btn btn-secondary profile-button" type="button">Logout</button>
                            </a>
                        </div>
                        <div class="mt-5 text-center col-md-6">
                            <button class="btn btn-danger profile-button" type="button">Delete Account</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%--content appoinments--%>
    <div class="pbmit-bg-color-blackish py-5">
        <div class="container rounded">
            <h5 class="text-right">My Doctor Channels</h5><br>
            <div class="row" style="overflow: auto;">
                <% List<BookingInquiryRequestDto> BookingRequests = (List<BookingInquiryRequestDto>) request.getAttribute("bookRequests");
                    if (BookingRequests != null && !BookingRequests.isEmpty()) {
                %>
                <table class="table-bordered w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-3 py-3">
                            Doctor Username
                        </th>
                        <th scope="col" class="px-3 py-3">
                            Appointment Date
                        </th>
                        <th scope="col" class="px-3 py-3">
                            Appointment Time
                        </th>
                        <th scope="col" class="px-3 py-3">
                            Class
                        </th>
                        <th scope="col" class="px-3 py-3">
                            Approval
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for (int i = 0; i < BookingRequests.size(); i++) {
                    %>
                    <tr class="bg-transparent">
                        <td class="px-6 py-4 ps-3">
                            <%= BookingRequests.get(i).getDoctorUsername() %>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <%= BookingRequests.get(i).getBookingDate() %>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <%
                                SimpleDateFormat sdf24Hour = new SimpleDateFormat("HH:mm:ss");
                                SimpleDateFormat sdf12Hour = new SimpleDateFormat("hh:mm a");
                                String time = sdf24Hour.format(BookingRequests.get(i).getBookingTime());
                                out.print(sdf12Hour.format(sdf24Hour.parse(time)));
                            %>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <%= BookingRequests.get(i).getSelectedClass()%>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <%= BookingRequests.get(i).getStatus()%>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
                <% } else { %>
                <p>No classes booked</p>
                <% } %>
                <br>
            </div>

        </div>
    </div>

    <!-- Content for Health Reports -->
    <div class="pbmit-bg-color-blackish py-5">
        <div class="container rounded">
            <h5 class="text-right">Health Reports</h5><br>
            <div class="row" style="overflow: auto;">
                <% List<Health_reportDto> HealthReport = (List<Health_reportDto>) request.getAttribute("healthReport");
                    if (HealthReport != null && !HealthReport.isEmpty()) {
                %>


                <table class="table-bordered w-full text-sm text-left text-gray-500 dark:text-gray-400">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-3 py-3">
                            Report Date
                        </th>
                        <th scope="col" class="px-3 py-3">
                            Report title
                        </th>
                        <th scope="col" class="px-3 py-3">
                            price
                        </th>
                        <th>

                        </th>
                        <!-- Add more columns based on your health report fields -->
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        for (int i = 0; i < HealthReport.size(); i++) {
                    %>
                    <tr class="bg-transparent">
                        <td class="px-6 py-4 ps-3">
                            <%= HealthReport.get(i).getReport_date() %>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <%= HealthReport.get(i).getDescription() %>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <%= HealthReport.get(i).getPrice()%>
                        </td>
                        <td class="px-6 py-4 ps-3">
                            <button type="button" class="btn btn-primary"
                                    onclick="showPaymentConfirmation(<%= HealthReport.get(i).getReport_id() %>, '<%= HealthReport.get(i).getDescription() %>', '<%= HealthReport.get(i).getPrice()%>', '<%= HealthReport.get(i).getBuy_status()%>')">
                                Buy Report
                            </button>
                        </td>

                        <!-- Add more columns based on your health report fields -->
                    </tr>
                    <% } %>
                    </tbody>
                </table>
                <% } else { %>
                <p>No health reports available</p>
                <% } %>
                <br>
            </div>
        </div>
    </div>

    <div class="modal fade" id="paymentConfirmationModal" tabindex="-1" role="dialog"
         aria-labelledby="paymentConfirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content pbmit-bg-color-blackish py-5">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentConfirmationModalLabel">Payment Confirmation</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5>Confirm your payment for the following report:</h5>
                    <p><strong>Report ID:</strong> <span id="modalReportId"></span></p>
                    <p><strong>Description:</strong> <span id="reportDescription"></span></p>
                    <p><strong>Report price:</strong> <span id="reportPrice"></span></p>
                    <p><strong>Report Status:</strong> <span id="reportStatus"></span></p>
                </div>
                <form id="confirmationForm" action="<%=request.getContextPath()%>/updateReportBuyStatus" method="POST">
                    <input type="text" id="reportId" name="report_Id" hidden>
                    <p>Are you sure you want to confirm this paymesadsant?</p>
                    <!-- Add any additional fields if needed -->
                </form>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="confirmPaymentBtn" class="btn btn-primary" onclick="submitConfirmationForm()">Confirm
                        Payment
                    </button>
                </div>
            </div>
        </div>
    </div>


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

    <div class="overlay" id="passwordChangeBox" hidden>
        <div class="centered-box ps-5" style="max-width: 480px; width: 85%;">
            <button class="close-button" onclick="closePop()">&times;</button>
            <div class="textSection pt-5 mt-1 pe-5 ps-3" style="max-height: 680px; overflow: auto;">
                <p style="font-size: 26px;">Change Password</p>
                <hr>
                <p class="text-danger" id="errorText"></p>
                <input id="currentPassword" name="currentPassword" type="password" class="form-control mt-4"
                       placeholder="Current Password" aria-label="currentPassword" aria-describedby="basic-addon1">
                <input id="newPassword" name="newPassword" type="password" class="form-control mt-4"
                       placeholder="New Password" aria-label="newPassword" aria-describedby="basic-addon1">
                <input id="confirmPassword" name="confirmPassword" type="password" class="form-control mt-4"
                       placeholder="Confirm New Password" aria-label="confirmPassword" aria-describedby="basic-addon1">
                <div class="mt-5 mb-4 text-center">
                    <button class="btn btn-primary" id="btnChange" onclick="changeSubmit()">Change Now</button>
                    <p id="txtLoading" hidden>Loading...</p>
                </div>
            </div>
        </div>
    </div>


</body>
<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- jsPDF -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>


<script>
    // Function to handle form submission
    function submitConfirmationForm() {
        // Submit the form
        document.getElementById("confirmationForm").submit();
    }

    // Function to show payment confirmation modal with report details and buy status
    function showPaymentConfirmation(reportId, description, price, buyStatus) {
        $('#modalReportId').text(reportId);
        $('#reportDescription').text(description);
        $('#reportPrice').text(price);
        $('#reportStatus').text(buyStatus);

        // Set the reportId in the hidden input field
        $('#reportId').val(reportId);

        $('#paymentConfirmationModal').modal('show');
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<!-- Modal -->
<script>
    // Wait for the DOM to load
    document.addEventListener('DOMContentLoaded', function () {
        // Get the button element
        var button = document.getElementById('popupButton');

        // Add a click event listener to the button
        button.addEventListener('click', function () {
            // Use Bootstrap's modal function to show the popup
            $('#myModal').modal('show');
        });
    });


    $(document).ready(function () {
        $("#show_hide_password a").on('click', function (event) {
            event.preventDefault();
            if ($('#show_hide_password input').attr("type") == "text") {
                $('#show_hide_password input').attr('type', 'password');
                $('#show_hide_password i').addClass("fa-eye-slash");
                $('#show_hide_password i').removeClass("fa-eye");
            } else if ($('#show_hide_password input').attr("type") == "password") {
                $('#show_hide_password input').attr('type', 'text');
                $('#show_hide_password i').removeClass("fa-eye-slash");
                $('#show_hide_password i').addClass("fa-eye");
            }
        });

        $("#show_hide_newPassword a").on('click', function (event) {
            event.preventDefault();
            if ($('#show_hide_newPassword input').attr("type") == "text") {
                $('#show_hide_newPassword input').attr('type', 'password');
                $('#show_hide_newPassword i').addClass("fa-eye-slash");
                $('#show_hide_newPassword i').removeClass("fa-eye");
            } else if ($('#show_hide_newPassword input').attr("type") == "password") {
                $('#show_hide_newPassword input').attr('type', 'text');
                $('#show_hide_newPassword i').removeClass("fa-eye-slash");
                $('#show_hide_newPassword i').addClass("fa-eye");
            }
        });

        $("#show_hide_confirmPassword a").on('click', function (event) {
            event.preventDefault();
            if ($('#show_hide_confirmPassword input').attr("type") == "text") {
                $('#show_hide_confirmPassword input').attr('type', 'password');
                $('#show_hide_confirmPassword i').addClass("fa-eye-slash");
                $('#show_hide_confirmPassword i').removeClass("fa-eye");
            } else if ($('#show_hide_confirmPassword input').attr("type") == "password") {
                $('#show_hide_confirmPassword input').attr('type', 'text');
                $('#show_hide_confirmPassword i').removeClass("fa-eye-slash");
                $('#show_hide_confirmPassword i').addClass("fa-eye");
            }
        });
    });
</script>

<!-- footer -->
<%@ include file="tempComponent/footer.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.3/jspdf.umd.min.js"></script>

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
</html>
