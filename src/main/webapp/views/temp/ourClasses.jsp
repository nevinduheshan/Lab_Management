<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.lab.labManage.dto.OldDoctorTimeTableDto" %>
<%@ page import="com.lab.labManage.common.Constants" %>
<%
    String activeItem = "our-classes";
    request.setAttribute("activeItem", activeItem);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> Appointments – LAB Manage</title>
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

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/index.css">

    <script type="text/javascript">


        function loading(appointmentdatetime, doctorusername) {
            let doctorAppointmentDate = document.getElementById("doctor_appointment_date");

            const timedateArray = appointmentdatetime.split("-");
            console.log(appointmentdatetime);
            let starttime = timedateArray[0];
            let startdate = timedateArray[1];

            console.log('doctorusername=' + doctorusername);
            let startingtime = document.getElementById("startingtime");
            startingtime.value = starttime;
            let startingdate = document.getElementById("startingdate");
            startingdate.value = startdate;
            doctorAppointmentDate.value = appointmentdatetime;
            let selecteddoctorUsername = document.getElementById("selecteddoctorUsername");
            selecteddoctorUsername.value = doctorusername;
            console.log('selecteddoctorUsername1=' + selecteddoctorUsername.value);
            let selectedDate = document.getElementById("selectedDateField");

            let selectedselectedDateField = document.getElementById("selectedselectedDateField");
            selectedselectedDateField.value = selectedDate.value;

            let loggedusername = document.getElementById("loggedusername");

            let loggedloggedusername = document.getElementById("loggedloggedusername");
            loggedloggedusername.value = loggedusername.value;

            doctornameSetup(selecteddoctorUsername.value);

        }

        function doctornameSetup(doctornamename) {

            console.log("caldsdsd=" + doctornamename);
            var doctorNames = document.getElementById("doctorName");
            console.log(doctorNames.innerHTML);
            //	var doctordoctorusername = document.getElementById("selecteddoctorUsername");
            //	console.log('select asd name='+ doctordoctorusername.value);
            doctorNames.innerHTML = doctornamename;

        }


    </script>
    <style>
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

<body>
<form id="frmBookNow" action="<%=request.getContextPath()%>/bookDoctor" method="post">
    <input type="text" name="userUsername" id="userUsername" value="" hidden>
    <input type="text" name="doctorUname" id="doctorUname" value="" hidden>
    <input type="text" name="selectedDate" id="selectedDate" value="" hidden>
    <input type="text" name="selectedTime" id="selectedTime" value="" hidden>
    <input type="text" name="selectedClass" id="selectedClass" value="" hidden>
</form>
<div class="overlay" id="infoBox" hidden>
    <div class="centered-box ps-5" style="max-width: 480px; width: 85%;">
        <button class="close-button" onclick="closeInfoBox()">&times;</button>
        <div class="textSection pt-5 mt-1 pe-5 ps-3" style="max-height: 680px; overflow: auto;">

            <p class="pb-2" style="display: inline" id="bookUsername">Patient Username &ensp;:&emsp; </p>
            <p style="display: inline" id="bookUsernamePop">N/A</p>
            <br><br>

            <p class="pb-2" style="display: inline" id="doctorUsername">Selected Doctor &emsp;&ensp;:&emsp; </p>
            <p style="display: inline" id="doctorUsernamePop">N/A</p>
            <br><br>
            <p class="pb-2" style="display: inline" id="bookDate">Selected Date &emsp;:&emsp; </p>
            <p style="display: inline" id="bookDatePop">N/A</p>
            <br><br>
            <p class="pb-2" style="display: inline" id="bookTime">Selected Time &emsp;:&emsp; </p>
            <p style="display: inline" id="bookTimePop">N/A</p>
            <br><br>
            <p class="pb-2" style="display: inline" id="bookClass">Selected appointment type &emsp;:&emsp; </p>
            <p style="display: inline" id="bookClassPop">N/A</p>
            <br><br>
            <p class="text-danger" id="reqError" hidden>Request Faild! Please select date in the calender</p>
            <div class="mt-4 mb-4">
                <button class="btn btn-primary me-3" onclick="submitRequest()">Send Channel request</button>
                <button class="btn btn-danger" onclick="closeInfoBox()">Close</button>
            </div>

        </div>
    </div>
</div>
<!-- Page Wrapper -->
<div class="page-wrapper">
    <% String uname = (String) request.getAttribute("username"); %>
    <% if (uname != null) { %>
    <jsp:include page="tempComponent/headerAfterLogin.jsp">
        <jsp:param name="username" value="<%=uname%>"/>

    </jsp:include>

    <% } else { %>

    <%@ include file="tempComponent/header.jsp" %>
    <% } %>


    <!-- Page Content -->
    <div class="page-content pbmit-bg-color-blackish py-5">

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
                            msgBox("success","Doctor appointment  Request Sent","topRight");
                            // Remove the parameter and update the URL without reloading the page
                            var newURL = currentURL.replace('?success=true', '');
                            window.history.replaceState({}, document.title, newURL);
                        } else if (currentURL.includes('?success=false')) {
                            // Show a confirmation dialog with only the "OK" button
                            msgBox("error","Doctor appointment Request Failed! Try Again","topRight");
                            // Remove the parameter and update the URL without reloading the page
                            var newURL = currentURL.replace('?success=false', '');
                            window.history.replaceState({}, document.title, newURL);
                        }
                    };

                    function submitRequest() {
                            document.getElementById("frmBookNow").submit();
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

                    function loadDataBasedClassName(ClassName) {

                        document.getElementById("selectClass").value = ClassName;

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
                        if (gotDate == null || gotDate == "") {
                            msgBox("warning","Please Select a Date in the Calendar","bottomLeft");
                            return;
                        }

                        $.ajax({
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/calendarDataForOutClass",
                            contentType: 'application/json',
                            data: JSON.stringify({
                                selectedDate: gotDate,
                                reqClasses: ClassName,
                            }),
                            success: function (data) {
                                if (ClassName == "allClasses") {
                                    for (let i = 0; i < data.length; i++) {
                                        var element = data[i];
                                        var ClassForTemp = element.classCategory;

                                        var date = new Date(element.doctorAppointmentDate);
                                        var dayName = daysOfWeekNames[date.getDay()];

                                        var timeparts = (element.doctorAppointmentStartTime).split(':');
                                        var hour = parseInt(timeparts[0]);

                                        document.getElementById(dayName + "-" + hour).innerText = ClassForTemp;
                                    }
                                } else {
                                    for (let i = 0; i < data.length; i++) {
                                        var element = data[i];
                                        var UsernameForTemp = element.doctorUsername;

                                        var date = new Date(element.doctorAppointmentDate);
                                        var dayName = daysOfWeekNames[date.getDay()];

                                        var timeparts = (element.doctorAppointmentStartTime).split(':');
                                        var hour = parseInt(timeparts[0]);

                                        document.getElementById(dayName + "-" + hour).innerText = UsernameForTemp;
                                    }

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

                    function bookClass(selectedDayOfWeek, SelectedTimeSlot) {
                        if (getCookieValue('username') == null) {
                            msgBox("warning","Please Log In to Book a Class","bottomLeft");
                            return;
                        }
                        const selectedDate = new Date((document.getElementById("selectedDateField").value).toString());
                        const firstDayOfWeek = new Date(selectedDate);
                        firstDayOfWeek.setDate(selectedDate.getDate() - selectedDate.getDay());
                        const weekDays = Array.from({length: 7}, (_, i) => {
                            const day = new Date(firstDayOfWeek);
                            day.setDate(firstDayOfWeek.getDate() + i);
                            return day.toLocaleDateString("en-US", {
                                weekday: "long",
                                year: "numeric",
                                month: "numeric",
                                day: "numeric"
                            });
                        });

                        if (selectedDate == null || selectedDate == "Invalid Date") {
                            msgBox("warning","Please Select a Date in the Calendar","bottomLeft");
                            return;
                        }
                        if (document.getElementById("selectClass").value == null || document.getElementById("selectClass").value == "allClasses") {
                            msgBox("warning","Please Select an appointment type","bottomLeft");

                            return;
                        }
                        if (document.getElementById(weekDays[selectedDayOfWeek].substring(0, 3).toLowerCase() + "-" + SelectedTimeSlot).innerText == "") {
                            msgBox("warning","No Doctor Available for the Selected Time Slot","bottomLeft");
                            return;
                        }

                        document.getElementById("userUsername").value = getCookieValue('username');
                        document.getElementById("bookUsernamePop").innerText = getCookieValue('username');

                        document.getElementById("doctorUname").value =  document.getElementById(weekDays[selectedDayOfWeek].substring(0, 3).toLowerCase() + "-" + SelectedTimeSlot).innerText.toLowerCase();
                        document.getElementById("doctorUsernamePop").innerText = document.getElementById(weekDays[selectedDayOfWeek].substring(0, 3).toLowerCase() + "-" + SelectedTimeSlot).innerText.toLowerCase();

                        document.getElementById("bookDatePop").innerText = (weekDays[selectedDayOfWeek]).toString();
                        document.getElementById("selectedDate").value = (weekDays[selectedDayOfWeek]).toString();

                        document.getElementById("bookTimePop").innerText = convertTo12HourFormat(SelectedTimeSlot + ":00:00");
                        document.getElementById("selectedTime").value = SelectedTimeSlot.toString() + ":00:00";

                        document.getElementById("selectedClass").value = document.getElementById("selectClass").value;
                        document.getElementById("bookClassPop").innerText = document.getElementById("selectClass").value;


                        document.getElementById("infoBox").hidden = false;


                    }
                </script>
                <input type="text" value="OurClassSection" id="selectUser" hidden>
                <input type="text" value="allClasses" id="selectClass" hidden>

                <div class="pbmit-tab-style-1 mptt-shortcode-wrapper mptt-table-responsive table-init ">
                    <ul class="nav nav-tabs doctorsList" role="tablist" style="overflow-y: scroll; height: 100px;">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" onclick="loadDataBasedClassName('allClasses')"
                               data-bs-toggle="tab"
                               aria-selected="true"
                               role="tab">
                                All Appointments
                            </a>
                        </li>
                        <%
                            if (request.getAttribute("classes") != null) {
                                List<String> Classes = (List<String>) request.getAttribute("classes");
                                for (String Class : Classes) {
                        %>
                        <li class="nav-item" role="presentation">
                            <a onclick="loadDataBasedClassName('<%=Class%>')" class="nav-link"
                               data-bs-toggle="tab" aria-selected="false" role="tab"
                               tabindex="-1">
                                <%=Class%>
                            </a>
                        </li>
                        <%
                                }
                            }
                        %>
                    </ul>
                    <div class="tab-content mptt-main-list" >
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
                                        id="sun-<%=i%>" onclick="bookClass('0',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="mon-<%=i%>" onclick="bookClass('1',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="tue-<%=i%>" onclick="bookClass('2',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="wed-<%=i%>" onclick="bookClass('3',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="thu-<%=i%>" onclick="bookClass('4',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="fri-<%=i%>" onclick="bookClass('5',<%=i%>)"></td>
                                    <td class="mptt-shortcode-event mptt-event-vertical-middle displayText"
                                        id="sat-<%=i%>" onclick="bookClass('6',<%=i%>)"></td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Classes Timetable End -->


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
<!-- Scroll To Top End -->

<!-- Include the modal using JSP include directive -->
<%@ include file="./doctorBookpopup.jsp" %>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


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