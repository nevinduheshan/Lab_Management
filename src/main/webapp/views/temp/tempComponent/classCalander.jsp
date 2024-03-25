<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Class Calendar – LAB Manage</title>
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
    <script type="text/javascript">
       // function selectedDate(){
         //  var selDate = document.getElementById("selectedDateField");
         //   alert(selDate.value);
     //   }
    </script>

</head>
<style>
    .row .qtr {
        width: 40%;
    }

    .row .half {
        width: 100%;
    }

    @media (min-width: 800px) {
        .row {
            flex-wrap: nowrap;
        }

        .row .half {
            width: 35%;
        }

        .row .qtr {
            width: 25%;
        }
    }

    @keyframes shake {
        20%,
        60% {
            transform: translateX(4px);
        }
        40%,
        80% {
            transform: translateX(-4px);
        }
    }

    .cview__month-last:hover,
    .cview__month-next:hover {
        color: #fff;
        cursor: pointer;
    }


    .cview__month-reset {
        animation: none;
    }

    .cview__month-activate {
        animation: popIn 100ms 1 forwards;
    }

    .cview--spacer,
    .cview--date {
        width: 14.28571428571429%;
        max-width: 14.28571428571429%;
        padding: 10px;
        box-sizing: border-box;
        position: relative;
        text-align: center;
        overflow: hidden;
        text-overflow: clip;
        font-size: 14px;
        font-weight: 900;
    }

    .cview--date {
        font-size: 16px;
        font-weight: 400;
        cursor: pointer;
    }
    .cview--date.past-date {
        color: #4b4747;
    }
    .cview--date.past-date:hover::before {
        background: none;
        cursor: not-allowed;
    }

    .cview--date:hover::before {
        background: rgba(255, 255, 255, 0.2);
    }

    .cview--date.today {
        color: #F5FE83;
    }

    .cview--date.today::before {
        animation: popIn 200ms 1 forwards;
        background: rgba(255, 255, 255, 0.2);
        transform: scale(0);
    }

    @keyframes popIn {
        100% {
            transform: scale(1);
            opacity: 1;
        }
    }

    .cview--date::before {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        content: "";
        transform: scale(0.8);
        z-index: 0;
    }

    .footer__link {
        cursor: pointer;
        padding: 2px 5px;
        border-bottom: 1px solid #fff;
    }

    .custom-text-color {
        color: #F5FE83;
    }

    .text-hover:hover {
        color: #F2FF4A; /* Replace with your desired color */
    }

</style>
<section>
    <div class="container">
        <div class=" border rounded border-0 border-dark overflow-hidden">
            <div class="row g-0">
                <div class="col-md-6">
                    <div class="text-white p-4 p-md-5">
                        <h4 class="fw-bold  mb-3 custom-text-color">
                            Schedule an appointment
                        </h4>
                        <p class="">
                            To better serve you and ensure a seamless appointment booking process, we kindly request
                            that you select a suitable date from the available options below.
                        </p>

                        <div class="footer">
                            <h6 class="mt-3"><span id="dateElement" class=""> </span> <button id="footer-date" class="px-4 py-2  rounded text-hover" style=" background-color: #F5FE83; color: #000000;">Today</button></h6>
                        </div>
                        <% String selectedDateField = (String) request.getAttribute("selectedDateField"); %>

                        <% String loggedusername = (String)request.getAttribute("username");   %>
                        <form id="frmselectedDateField" name="frmselectedDateField" action="<%=request.getContextPath()%>/ClassesForSelectedDate" >
                            <input id="loggedusername" name="loggedusername" type="hidden" value="<%=loggedusername%>" >
                            <input id="selectedDateField" name="selectedDateField" class="bg-black" type="text" value="<% if(selectedDateField !=null){out.print(selectedDateField);}%>" readonly >
                        </form>

                    </div>
                </div>
                <div class="col-md-6 order-first order-md-last" style="min-height: 250px">
                    <%--calander--%>
                    <div class="body-cal" style="display: flex ">
                        <div class="calendar" id="calendar-app">
                            <div class="d-flex flex-wrap align-content-center justify-content-start w-100"
                                 id="calendar-view">
                                <div class="w-100 text-center font-weight-bold fs-5 py-3 text-uppercase d-flex flex-nowrap align-items-baseline justify-content-around">
                                    <span class="w-33 text-center fs-6 pointer text-warning" id="calendar-month-last">Apr</span>
                                    <span class="w-33 text-center fs-6 pointer text-warning fs-5 no-pointer-animation translate-up  position-relative"
                                          id="calendar-month">May</span>
                                    <span class="w-33 text-center fs-6 pointer text-warning" id="calendar-month-next">Jun</span>
                                </div>
                                <div class="w-100 text-center font-weight-bold fs-5 py-3 text-uppercase d-flex flex-nowrap align-items-baseline justify-content-around">
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Sun
                                    </div>
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Mon
                                    </div>
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Tue
                                    </div>
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Wed
                                    </div>
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Thu
                                    </div>
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Fri
                                    </div>
                                    <div class="col-1 p-3 d-flex flex-column justify-content-center align-items-center text-nowrap">
                                        Sat
                                    </div>
                                </div>

                                <div class="d-flex flex-wrap align-content-center justify-content-start w-100"
                                     id="dates"></div>
                            </div>

                        </div>
<%--                        <div class="footer">--%>
<%--                            <span>--%>
<%--                                <span id="footer-date" class="cursor-pointer px-2 py-1 border-bottom border-white">Today is May 30</span>--%>
<%--                            </span>--%>
<%--                        </div>--%>

                        <script>
                            function CalendarApp(date) {
                                if (!(date instanceof Date)) {
                                    date = new Date();
                                }

                                this.days = [
                                    "Sunday",
                                    "Monday",
                                    "Tuesday",
                                    "Wednesday",
                                    "Thursday",
                                    "Friday",
                                    "Saturday",
                                ];
                                this.months = [
                                    "Jan",
                                    "Feb",
                                    "Mar",
                                    "Apr",
                                    "May",
                                    "Jun",
                                    "Jul",
                                    "Aug",
                                    "Sep",
                                    "Oct",
                                    "Nov",
                                    "Dec",
                                ];
                                this.quotes = [
                                    "nevindu",
                                ];
                                this.apts = [
                                    {
                                        name: "Finish this web app",
                                        endTime: new Date(2016, 4, 30, 23),
                                        startTime: new Date(2016, 4, 30, 21),
                                        day: new Date(2016, 4, 30).toString(),
                                    },
                                    {
                                        name: "My Birthday!",
                                        endTime: new Date(2016, 4, 1, 23, 59),
                                        startTime: new Date(2016, 4, 1, 0),
                                        day: new Date(2016, 4, 1).toString(),
                                    },
                                ];

                                this.aptDates = [
                                    new Date(2016, 4, 30).toString(),
                                    new Date(2016, 4, 1).toString(),
                                ];
                                this.eles = {};
                                this.calDaySelected = null;

                                this.calendar = document.getElementById("calendar-app");

                                this.calendarView = document.getElementById("dates");

                                this.calendarMonthDiv = document.getElementById("calendar-month");
                                this.calendarMonthLastDiv = document.getElementById(
                                    "calendar-month-last"
                                );
                                this.calendarMonthNextDiv = document.getElementById(
                                    "calendar-month-next"
                                );

                                this.dayInspirationalQuote = document.getElementById(
                                    "inspirational-quote"
                                );

                                this.todayIsSpan = document.getElementById("footer-date");
                                // this.eventsCountSpan = document.getElementById("footer-events");
                                this.dayViewEle = document.getElementById("day-view");
                                this.dayViewExitEle = document.getElementById("day-view-exit");
                                this.dayViewDateEle = document.getElementById("day-view-date");
                                this.addDayEventEle = document.getElementById("add-event");
                                this.dayEventsEle = document.getElementById("day-events");

                                this.dayEventAddForm = {
                                    cancelBtn: document.getElementById("add-event-cancel"),
                                    addBtn: document.getElementById("add-event-save"),
                                    nameEvent: document.getElementById("input-add-event-name"),
                                    startTime: document.getElementById("input-add-event-start-time"),
                                    endTime: document.getElementById("input-add-event-end-time"),
                                    startAMPM: document.getElementById("input-add-event-start-ampm"),
                                    endAMPM: document.getElementById("input-add-event-end-ampm"),
                                };
                                this.dayEventsList = document.getElementById("day-events-list");
                                this.dayEventBoxEle = document.getElementById("add-day-event-box");

                                /* Start the app */
                                this.showView(date);
                                this.addEventListeners();
                                this.todayIsSpan.textContent =
                                    "Today is " + this.months[date.getMonth()] + " " + date.getDate();
                            }

                            // date formal 1
                            // var today = new Date();
                            //
                            // // Get the components of the date
                            // var day = today.getDate();
                            // var month = today.getMonth() + 1; // Months are zero-based, so we add 1
                            // var year = today.getFullYear();
                            //
                            // // Create a formatted string for the date
                            // var formattedDate = day + "/" + month + "/" + year;
                            //
                            // // Display the date in a specific element
                            // document.getElementById("dateElement").textContent = formattedDate;


                            // date format 2
                            var today = new Date();
                            today.setHours(0, 0, 0, 0);

                            // Get the long date string
                            var formattedDate = today.toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' });

                            // Display the date in a specific element
                            document.getElementById("dateElement").textContent = formattedDate;




                            CalendarApp.prototype.addEventListeners = function () {
                                this.calendar.addEventListener(
                                    "click",
                                    this.mainCalendarClickClose.bind(this)
                                );
                                this.todayIsSpan.addEventListener("click", this.showView.bind(this));
                                this.calendarMonthLastDiv.addEventListener(
                                    "click",
                                    this.showNewMonth.bind(this)
                                );
                                this.calendarMonthNextDiv.addEventListener(
                                    "click",
                                    this.showNewMonth.bind(this)
                                );
                                this.dayViewDateEle.addEventListener(
                                    "click",
                                    this.showNewMonth.bind(this)
                                );
                                this.addDayEventEle.addEventListener(
                                    "click",
                                    this.addNewEventBox.bind(this)
                                );
                                this.dayEventAddForm.cancelBtn.addEventListener(
                                    "click",
                                    this.closeNewEventBox.bind(this)
                                );
                                this.dayEventAddForm.cancelBtn.addEventListener(
                                    "keyup",
                                    this.closeNewEventBox.bind(this)
                                );

                                this.dayEventAddForm.startTime.addEventListener(
                                    "keyup",
                                    this.inputChangeLimiter.bind(this)
                                );
                                this.dayEventAddForm.startAMPM.addEventListener(
                                    "keyup",
                                    this.inputChangeLimiter.bind(this)
                                );
                                this.dayEventAddForm.endTime.addEventListener(
                                    "keyup",
                                    this.inputChangeLimiter.bind(this)
                                );
                                this.dayEventAddForm.endAMPM.addEventListener(
                                    "keyup",
                                    this.inputChangeLimiter.bind(this)
                                );
                                this.dayEventAddForm.addBtn.addEventListener(
                                    "click",
                                    this.saveAddNewEvent.bind(this)
                                );
                            };
                            CalendarApp.prototype.showView = function (date) {
                                if (!date || !(date instanceof Date)) date = new Date();
                                var now = new Date(date),
                                    y = now.getFullYear(),
                                    m = now.getMonth();
                                var today = new Date();

                                // reset to 00:00:00:000 today to awoid problems with DST changes
                                today.setHours(0, 0, 0, 0);

                                var lastDayOfM = new Date(y, m + 1, 0).getDate();
                                var startingD = new Date(y, m, 1).getDay();
                                var lastM = new Date(y, now.getMonth() - 1, 1);
                                var nextM = new Date(y, now.getMonth() + 1, 1);

                                var lastw = new Date(y,m,today);
                                console.log(today.getUTCDate()+"===============================");
                                console.log(lastw.getDate()+"*****************************");

                                this.calendarMonthDiv.classList.remove("cview__month-activate");
                                this.calendarMonthDiv.classList.add("cview__month-reset");

                                while (this.calendarView.firstChild) {
                                    this.calendarView.removeChild(this.calendarView.firstChild);
                                }

                                // build up spacers
                                for (var x = 0; x < startingD; x++) {
                                    var spacer = document.createElement("div");
                                    spacer.className = "cview--spacer";
                                    this.calendarView.appendChild(spacer);
                                }

                                for (var z = 1; z <= lastDayOfM; z++) {
                                    var _date = new Date(y, m, z);
                                    var day = document.createElement("div");
                                    day.className = "cview--date";
                                    day.textContent = z;
                                    day.setAttribute("data-date", _date);
                                    day.onclick = this.showDay.bind(this);

                                    // Check if date is before today
                                    if (_date < today) {
                                        day.classList.add("past-date");
                                        day.onclick = null; // Remove click event handler
                                    } else {
                                        day.onclick = this.showDay.bind(this);
                                    }

                                    // check if todays date
                                    if (
                                        z == today.getDate() &&
                                        y == today.getFullYear() &&
                                        m == today.getMonth()
                                    ) {
                                        day.classList.add("today");
                                    }

                                    // check if has events to show
                                    if (this.aptDates.indexOf(_date.toString()) !== -1) {
                                        day.classList.add("has-events");
                                    }

                                    this.calendarView.appendChild(day);
                                }

                                var _that = this;
                                setTimeout(function () {
                                    _that.calendarMonthDiv.classList.add("cview__month-activate");
                                }, 50);

                                this.calendarMonthDiv.textContent =
                                    this.months[now.getMonth()] + " " + now.getFullYear();
                                this.calendarMonthDiv.setAttribute("data-date", now);

                                this.calendarMonthLastDiv.textContent =
                                    "<- " + this.months[lastM.getMonth()];
                                this.calendarMonthLastDiv.setAttribute("data-date", lastM);

                                this.calendarMonthNextDiv.textContent =
                                    this.months[nextM.getMonth()] + " ->";
                                this.calendarMonthNextDiv.setAttribute("data-date", nextM);
                            };
                            CalendarApp.prototype.showDay = function (e, dayEle) {
                                e.stopPropagation();
                                if (!dayEle) {
                                    dayEle = e.currentTarget;
                                }
                                var dayDate = new Date(dayEle.getAttribute("data-date"));

                                this.calDaySelected = dayEle;
                                console.log("date Selected=====================", dayEle.getAttribute("data-date"));

                                // Update the selected date in the text field
                                var selectedDateField = document.getElementById("selectedDateField");
                                selectedDateField.value = dayDate.toDateString();
                                console.log('selectedDateField='+ selectedDateField.value );

                                document.getElementById("frmselectedDateField").submit();

                         //       this.openDayWindow(dayDate);
                            };

                            CalendarApp.prototype.closeDayWindow = function () {
                                this.dayViewEle.classList.remove("calendar--day-view-active");
                                this.closeNewEventBox();
                            };
                            CalendarApp.prototype.mainCalendarClickClose = function (e) {
                                if (e.currentTarget != e.target) {
                                    return;
                                }

                                this.dayViewEle.classList.remove("calendar--day-view-active");
                                this.closeNewEventBox();
                            };


                            CalendarApp.prototype.showNewMonth = function (e) {
                                var date = e.currentTarget.dataset.date;
                                var newMonthDate = new Date(date);
                                this.showView(newMonthDate);
                                this.closeDayWindow();
                                return true;
                            };

                            var calendar = new CalendarApp();
                            console.log(calendar);
                        </script>
                    </div>
                    <%--                    <%@ include file="tempComponent/calander.jsp" %>--%>
                </div>
            </div>
        </div>
    </div>
</section>

</html>
