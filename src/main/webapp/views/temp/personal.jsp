<%
    String activeItem = "Personal-Doctor";
    String activeItemmain = "home";
    request.setAttribute("activeItemmain", activeItemmain);
    request.setAttribute("activeItem", activeItem);
    String uname = (String) request.getAttribute("username");
%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lab.labManage.dto.OldDoctorTimeTableDto" %>
<%@ page import="com.lab.labManage.dto.UserDto" %>
<%@ page import="com.lab.labManage.dto.RolePermissionDto" %>
<%@ page import="com.lab.labManage.common.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>PERSONAL DOCTOR – LAB Manage</title>
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

    <script>

        function doctornameSetup(doctornamename) {

            console.log("caldsdsd=" + doctornamename);
            var doctorNames = document.getElementById("doctorName");
            console.log(doctorNames.innerHTML);
            //	var doctorusername = document.getElementById("selecteddoctorUsername");
            //	console.log('select asd name='+ doctorusername.value);
            doctorNames.innerHTML = doctornamename;

        }


        function callyoga() {
            document.getElementById("category").value = 'yoga';
            document.getElementById("frmloadDoctorByCategory").submit();
        }

        function callaerobics() {
            document.getElementById("category").value = 'aerobics';
            document.getElementById("frmloadDoctorByCategory").submit();
        }

        function callcrossfit() {
            document.getElementById("category").value = 'crossfit';
            document.getElementById("frmloadDoctorByCategory").submit();
        }

        function callstrength() {
            document.getElementById("category").value = 'strength';
            document.getElementById("frmloadDoctorByCategory").submit();
        }

        function callfunctional() {
            document.getElementById("category").value = 'functional';
            document.getElementById("frmloadDoctorByCategory").submit();
        }

        function callswiper() {
            document.getElementById("category").value = 'swiper';
        }


        function closeInfoBox() {
            document.getElementById("infoBox").hidden = true;
            document.getElementById("reqError").hidden = true;
        }

    </script>

    <!-- Demo styles -->
    <style>
        .swiper {
            /*width: 100%;*/
            /*height: 75%;*/
        }

        .swiper-slide {
            text-align: center;
            font-size: 28px;
            background-repeat: no-repeat;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
        }

        .swiper-paginationn {
            text-align: center;
        }

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

        .headers {
            font-size: 22px;
            font-weight: bold;
        }

        .displayText {
            font-size: 14.3px;
            font-family: Orbitron, sans-serif;
            font-weight: 500;
            text-transform: uppercase;
            text-align: center;
        }
        .displayText:hover{
            cursor: pointer;
            font-weight: bold;
        }

        .textSection::-webkit-scrollbar {
            width: 5px; /* Set the width of the scrollbar */
        }

        .textSection::-webkit-scrollbar-track {
            background-color: transparent;
            margin-top: 20px; /* Set the background color of the scrollbar track */
        }

        .textSection::-webkit-scrollbar-thumb {
            background-color: #888; /* Set the color of the scrollbar thumb */
        }
        .doctorsList::-webkit-scrollbar {
            width: 5px; /* Set the width of the scrollbar */
        }

        .doctorsList::-webkit-scrollbar-track {
            background-color: transparent;
            margin-top: 20px; /* Set the background color of the scrollbar track */
        }

        .doctorsList::-webkit-scrollbar-thumb {
            background-color: #888; /* Set the color of the scrollbar thumb */
        }



    </style>

</head>

<body>
<form id="frmReschedule" action="<%=request.getContextPath()%>/rescheduleRequest" method="post">
    <input type="text" name="doctorUname" id="doctorUname" value="" hidden>
    <input type="text" name="selectedDate" id="selectedDate" value="" hidden>
    <input type="text" name="selectedTime" id="selectedTime" value="" hidden>
</form>
<div class="overlay" id="infoBox" hidden>
    <div class="centered-box ps-5" style="max-width: 480px; width: 85%;">
        <button class="close-button" onclick="closeInfoBox()">&times;</button>
        <div class="textSection pt-5 mt-1 pe-5 ps-3" style="max-height: 680px; overflow: auto;">

            <p class="pb-2" style="display: inline" id="doctorUsername">Doctor Username &emsp;&ensp;:&emsp; </p>
            <p style="display: inline" id="doctorUsernamePop">N/A</p>
            <br><br>
            <p class="pb-2" style="display: inline" id="reschedulingDate">Selected Date &emsp;:&emsp; </p>
            <p style="display: inline" id="reschedulingDatePop">N/A</p>
            <br><br>
            <p class="pb-2" style="display: inline" id="reschedulingTime">Selected Time &emsp;:&emsp; </p>
            <p style="display: inline" id="reschedulingTimePop">N/A</p>
            <br><br>
            <p class="text-danger" id="reqError" hidden>Request Faild! Please select date in the calender</p>
            <div class="mt-4 mb-4">
                <button class="btn btn-primary me-3" onclick="submitRequest()">Request</button>
                <button class="btn btn-danger" onclick="closeInfoBox()">Close</button>
            </div>

        </div>
    </div>
</div>

<!-- Page Wrapper -->
<div class="page-wrapper">
    <% if (uname != null) { %>
    <jsp:include page="tempComponent/headerAfterLogin.jsp">
        <jsp:param name="username" value="<%=uname%>"/>

    </jsp:include>

    <% } else { %>

    <%@ include file="tempComponent/header.jsp" %>
    <% } %>

    <!-- Page Content -->
    <div class="page-content pbmit-bg-color-blackish py-5">

        <div class=" pbmit-bg-color-blackish py-5">
            <div class="container ">
                <div>
                    <h6 class="pt-5">Doctors</h6>
                    <h3 class="mt-3 mb-5 custom-text-color">Choose Your Doctors</h3>
                    <form name="frmloadDoctorByCategory" id="frmloadDoctorByCategory" method="post"
                          action="<%=request.getContextPath()%>/loadDoctorByCategory">
                        <input id="category" name="category" type="hidden" value=""/>
                        <div class="swiper mySwiper">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide"
                                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/p1.jpg'); background-size: 400px; height: 550px;"
                                     onclick="javascript:callyoga();">
                                    <P>FAMILY DOCTOR</P>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/p2.jpg');  background-size: 400px; height: 550px;"
                                     onclick="javascript:callaerobics();">
                                    <P>SPECIALIST</P>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/p1.jpg');  background-size: 400px; height: 550px;"
                                     onclick="javascript:callcrossfit();">
                                    <P>SURGEON</P>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/p4.jpg');  background-size: 400px; height: 550px;"
                                     onclick="javascript:callstrength();">
                                    <P style="margin-top: auto;">PEDIATRICIAN</P>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/p2.jpg');  background-size: 400px; height: 550px;"
                                     onclick="javascript:callfunctional();">
                                    <P style="margin-top: auto;">PHYSIOTHERAPY</P>
                                </div>
                                <div class="swiper-slide"
                                     style="background-image: url('<%=request.getContextPath()%>/revolution/images/p1.jpg');  background-size: 400px; height: 550px;"
                                     onclick="javascript:callswiper();">
                                    <P style="margin-top: auto;">genaral health</P>
                                </div>

                            </div>
                            <div class="swiper-paginationn mt-5"></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%--colspan--%>
        <div class="container">
            <div id="accordion" role="tablist" class="o-accordion ">

                <% List<UserDto> doctors = (List<UserDto>) request.getAttribute("doctors"); %>


                <% if (doctors != null && !doctors.isEmpty()) {

                    for (int k = 0; k < doctors.size(); k++) {
                        UserDto doctor = (UserDto) doctors.get(k);
                %>
                <div class="card pbmit-bg-color-blackish py-4">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true"
                       aria-controls="collapseOne">
                        <div class="card-header " role="tab" id="headingOne">
                            <div class="d-flex flex-row">
                                <div class=""><img src="<%=request.getContextPath()%>/revolution/images/p1.jpg"
                                                   style="height: 65px; width: 65px; border-radius: 50%;"></div>
                                <div><h6 class="mb-0 p-3"><%=doctor.getFirstName()%> <%=doctor.getLastName()%>
                                </h6></div>
                                <div class="bg-white w-50"
                                     style="height: 1px; margin-left: 20px; margin-right: 20px; margin-top: 32px"></div>
                            </div>
                        </div>
                    </a>

                    <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
                        <div class="ps-4 card-block">
                            <%=doctor.getDescription()%>
                        </div>
                    </div>
                </div>

                <% }

                } %>


            </div>

        </div>
        <%
            if (request.getAttribute("roleId") != null && (request.getAttribute("roleId").equals(2) || request.getAttribute("roleId").equals(5) || request.getAttribute("roleId").equals(6))) {
        %>
        <!-- Classes Timetable Start -->
        <section class="classes-timetable-section">
            <div class="container">
                <div class="pbmit-heading-subheading text-center animation-style1">
                    <h2 class="pbmit-title">Doctor Appointments </h2>
                </div>


                <jsp:include page="tempComponent/calander.jsp">
                    <jsp:param name="username" value="<%=uname%>"/>
                </jsp:include>

                <script>
                    window.onload = function () {
                        var currentURL = window.location.href;

                        // Check if the URL contains the desired parameter
                        if (currentURL.includes('?success=true')) {
                            // Show a confirmation dialog with only the "OK" button
                            msgBox("success","Rescheduling Request Sent!","topRight");
                            // Remove the parameter and update the URL without reloading the page
                            var newURL = currentURL.replace('?success=true', '');
                            window.history.replaceState({}, document.title, newURL);
                        } else if (currentURL.includes('?success=false')) {
                            // Show a confirmation dialog with only the "OK" button
                            msgBox("error","Rescheduling Request Failed! Try Again","topRight");
                            // Remove the parameter and update the URL without reloading the page
                            var newURL = currentURL.replace('?success=false', '');
                            window.history.replaceState({}, document.title, newURL);
                        }
                    };

                    function submitRequest() {
                        if (document.getElementById("selectedDate").value == null || document.getElementById("selectedDate").value == "") {
                            document.getElementById("reqError").hidden = false;
                            return;
                        } else {
                            document.getElementById("frmReschedule").submit();
                        }

                    }
                    function convertTo12HourFormat(time) {
                        // Splitting the time into hours and minutes
                        var timeParts = time.split(':');
                        var hours = parseInt(timeParts[0]);
                        var minutes = parseInt(timeParts[1]);

                        // Determining the period (AM or PM)
                        var period = hours >= 12 ? 'PM' : 'AM';

                        // Converting hours to 12-hour format
                        hours = hours % 12;
                        hours = hours ? hours : 12; // If hours is 0, set it to 12

                        // Adding leading zeros to minutes if necessary
                        minutes = minutes < 10 ? '0' + minutes : minutes;

                        // Constructing the formatted time string
                        var formattedTime = hours + ':' + minutes + ' ' + period;

                        return formattedTime;
                    }
                    function getCookieValue(cookieName) {
                        const cookies = document.cookie.split('; ');
                        for (const cookie of cookies) {
                            const [name, value] = cookie.split('=');
                            if (name === cookieName) {
                                return decodeURIComponent(value);
                            }
                        }
                        return null; // Return null if the cookie is not found
                    }
                    function loadDataBasedUsername(user) {

                        document.getElementById("selectUser").value = user;

                        for (let i = 5; i <= 21; i++) {
                            document.getElementById("sun-" + i).innerText = "";
                            document.getElementById("mon-" + i).innerText = "";
                            document.getElementById("tue-" + i).innerText = "";
                            document.getElementById("wed-" + i).innerText = "";
                            document.getElementById("thu-" + i).innerText = "";
                            document.getElementById("fri-" + i).innerText = "";
                            document.getElementById("sat-" + i).innerText = "";
                        }

                        const daysOfWeekNames = ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'];
                        var gotDate = (document.getElementById("selectedDateField").value).toString();

                        if(gotDate == null || gotDate === ""){
                            msgBox("warning","PLease select a date in the calender","bottomLeft");
                            return;
                        }

                        $.ajax({
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/calendardata",
                            contentType: 'application/json',
                            data: JSON.stringify({
                                selectedDate: gotDate,
                                user: user,
                            }),
                            success: function (data) {

                                for (let i = 0; i < data.length; i++) {
                                    var element = data[i];
                                    var UsernameForTemp = element.doctorUsername;

                                    var date = new Date(element.doctorAppointmentDate);
                                    var dayName = daysOfWeekNames[date.getDay()];

                                    var timeparts = (element.doctorAppointmentStartTime).split(':');
                                    var hour = parseInt(timeparts[0]);

                                    document.getElementById(dayName + "-" + hour).innerText = UsernameForTemp;
                                }


                            },
                            error: function (err) {
                                console.log(err);
                            },
                        },);


                    }
                    function closeInfoBox() {
                        document.getElementById("infoBox").hidden = true;
                        document.getElementById("reqError").hidden = true;
                    }

                    function rescheduleRequest (selectedDayOfWeek, SelectedTimeSlot ) {

                        const selectedDate = new Date((document.getElementById("selectedDateField").value).toString());
                        const firstDayOfWeek = new Date(selectedDate);
                        firstDayOfWeek.setDate(selectedDate.getDate() - selectedDate.getDay());
                        const weekDays = Array.from({ length: 7 }, (_, i) => {
                            const day = new Date(firstDayOfWeek);
                            day.setDate(firstDayOfWeek.getDate() + i);
                            return day.toLocaleDateString("en-US", { weekday: "long", year: "numeric", month: "numeric", day: "numeric" });
                        });


                        if (selectedDate == null || selectedDate == "Invalid Date") {
                            document.getElementById("reschedulingDatePop").innerText = "Not-Selected";
                        } else {
                            document.getElementById("reschedulingDatePop").innerText = (weekDays[selectedDayOfWeek]).toString();
                            document.getElementById("selectedDate").value = (weekDays[selectedDayOfWeek]).toString();
                        }


                        document.getElementById("reschedulingTimePop").innerText = convertTo12HourFormat(SelectedTimeSlot+":00:00");
                        document.getElementById("selectedTime").value = SelectedTimeSlot.toString()+":00:00";

                        document.getElementById("doctorUname").value = getCookieValue('username');
                        document.getElementById("doctorUsernamePop").innerText = getCookieValue('username');

                        document.getElementById("infoBox").hidden=false;


                    }
                </script>
                <input type="text" value="all" id="selectUser" hidden>
                <div class="pbmit-tab-style-1 mptt-shortcode-wrapper mptt-table-responsive table-init ">
                    <ul class="nav nav-tabs doctorsList" role="tablist" style="overflow-y: scroll; height: 100px;">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" onclick="loadDataBasedUsername('all')" data-bs-toggle="tab"
                               aria-selected="true"
                               role="tab">
                                All Doctors
                            </a>
                        </li>
                        <%
                            if (doctors != null && !doctors.isEmpty()) {
                                for (int k = 0; k < doctors.size(); k++) {
                                    UserDto doctor = (UserDto) doctors.get(k);

                        %>
                        <li class="nav-item" role="presentation">
                            <a onclick="loadDataBasedUsername('<%=doctor.getUsername()%>')" class="nav-link"
                               data-bs-toggle="tab" aria-selected="false" role="tab"
                               tabindex="-1">
                                <%=doctor.getUsername()%>
                            </a>
                        </li>
                        <% }
                        } %>
                    </ul>
                    <div class="tab-content mptt-main-list">
                        <%--doctors table--%>
                        <div class="tab-pane show active" id="tab-1" role="tabpanel">
                            <table class="mptt-shortcode-table  mptt-theme-mode">
                                <thead>
                                <tr class="mptt-shortcode-row">
                                    <th></th>
                                    <th>Sunday</th>
                                    <th>Monday</th>
                                    <th>Tuesday</th>
                                    <th>Wednesday</th>
                                    <th>Thursday</th>
                                    <th>Friday</th>
                                    <th>Saturday</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    int i;
                                    for (i = 5; i <= 21; i++) {
                                %>
                                <tr class="mptt-shortcode-row-5">
                                    <td class="mptt-shortcode-hours"><%
                                        if (i < 13) {
                                            out.print(i + ":00 AM");
                                        } else {
                                            out.print((i - 12) + ":00 PM");
                                        }
                                    %></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="sun-<%=i%>" onclick="rescheduleRequest('0',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="mon-<%=i%>" onclick="rescheduleRequest('1',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="tue-<%=i%>" onclick="rescheduleRequest('2',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="wed-<%=i%>" onclick="rescheduleRequest('3',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="thu-<%=i%>" onclick="rescheduleRequest('4',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="fri-<%=i%>" onclick="rescheduleRequest('5',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="sat-<%=i%>" onclick="rescheduleRequest('6',<%=i%>)"></td>
                                </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Classes Timetable End -->
        <% } %>

    </div>
    <!-- Page Content End -->

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
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98"/>
    </svg>
</div>
<script>
    const scrollButton = document.querySelector('.pbmit-progress-wrap');

    scrollButton.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
</script>

<!-- Scroll To Top End -->

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 10,
        pagination: {
            el: ".swiper-paginationn",
            clickable: true,
        },
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
        breakpoints: {
            640: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            768: {
                slidesPerView: 4,
                spaceBetween: 40,
            },
            1024: {
                slidesPerView: 4,
                spaceBetween: 50,
            },
        },
    });
</script>


<!-- JS

   ============================================ -->
<!-- Include the modal using JSP include directive -->
<%@ include file="doctorBookpopupToDoctor.jsp" %>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
