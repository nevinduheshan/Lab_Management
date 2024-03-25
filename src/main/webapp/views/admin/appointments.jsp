<%@ page import="java.util.List" %>
<%@ page import="com.lab.labManage.dto.OldDoctorTimeTableDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.lab.labManage.dto.OldDoctorTimeTableDto" %>

<%-- Create a SimpleDateFormat instance for the desired format --%>
<% SimpleDateFormat format = new SimpleDateFormat("hh:mm a"); %>

<html>
<head>
    <title>Schedule</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>
    <script type="text/javascript">

        window.onload = function () {
            var currentURL = window.location.href;

            // Check if the URL contains the desired parameter
            if (currentURL.includes('?success=true')) {
                // Show a confirmation dialog with only the "OK" button
                alert("Doctor Schedule Saved successfully!");
                // Remove the parameter and update the URL without reloading the page
                var newURL = currentURL.replace('?success=true', '');
                window.history.replaceState({}, document.title, newURL);
            } else if (currentURL.includes('?success=false')) {
                // Show a confirmation dialog with only the "OK" button
                alert("Action Failed! Try Again");
                // Remove the parameter and update the URL without reloading the page
                var newURL = currentURL.replace('?success=false', '');
                window.history.replaceState({}, document.title, newURL);
            }
        };

        function preventSubmitOnEnter(event) {
            if (event.keyCode === 13) {
                event.preventDefault(); // Prevent form submission
            }
        }

        function myFunction(event) {
            event.preventDefault();
            document.getElementById("doctorUsername").classList.toggle("show");
        }


        function filterFunction() {
            var input, filter, ul, li, a, i;
            input = document.getElementById("selecteddoctorUsername");
            filter = input.value.toUpperCase();
            div = document.getElementById("doctorUsername");
            a = div.getElementsByTagName("a");
            for (i = 0; i < a.length; i++) {
                txtValue = a[i].textContent || a[i].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    a[i].style.display = "";
                } else {
                    a[i].style.display = "none";
                }
            }
        }

        function valueFunction(event) {
            event.preventDefault();
            var linkValue = event.target.textContent.trim();
            var inputField = document.getElementById("selecteddoctorUsername");
            inputField.value = linkValue;
            document.getElementById("doctorUsername").classList.toggle("show");
        }


        // block selecting past dates

        document.addEventListener("DOMContentLoaded", function () {
            // Get the current date
            var currentDate = new Date().toISOString().split("T")[0];

            // get inputfeild by id and set its restriction to currentDate
            document.getElementById("doctor_appointment_date").min = currentDate;
        });

        function validationDoctorSchedule() {

            var selecteddoctorUsername = document.getElementById("selecteddoctorUsername");
            var selecteddoctorUsernameDivObj = document.getElementById("selecteddoctorUsernameDiv");
            var doctorAppointmentDateObjDiv = document.getElementById("doctor_appointment_dateDiv");
            var doctorAppointmentDateObj = document.getElementById("doctor_appointment_date");
            var selectedClass = document.getElementById("doctor_class");

            var startTimeobj = document.getElementById("start_time");
            var startTimeDivobj = document.getElementById("start_timeDiv");

            if (selecteddoctorUsername.value == '') {
                selecteddoctorUsernameDivObj.innerHTML = ' Invalid Username ';
                return false;
            } else if (doctorAppointmentDateObj.value == '') {
                selecteddoctorUsernameDivObj.innerHTML = ' ';
                startTimeDivobj.innerHTML = ' ';
                doctorAppointmentDateObjDiv.innerHTML = ' Invalid schedule date ';
                return false;

            } else if (startTimeobj.value == '') {
                selecteddoctorUsernameDivObj.innerHTML = '';
                doctorAppointmentDateObjDiv.innerHTML = '';
                startTimeDivobj.innerHTML = ' Invalid start time ';
                return false;
            } else if (selectedClass.value == '') {
                selecteddoctorUsernameDivObj.innerHTML = '';
                doctorAppointmentDateObjDiv.innerHTML = '';
                startTimeDivobj.innerHTML = '';
                document.getElementById("doctor_class_Div").innerHTML = ' Invalid class ';
                return false;
            } else {
                document.getElementById("frmAddAppointment").submit();
                return true;
            }

        }
    </script>
</head>
<body>

<form id="frmClassDelete" onclick="" action="<%=request.getContextPath()%>/deleteDoctorAppointment" method="post" hidden>
    <input type="text" id="doctorsheduleId" name="doctorsheduleId" value="" hidden/>
</form>

<div class="overlay" id="infoBox" hidden>
    <div class="centered-box ps-5" style="max-width: 480px; width: 85%;">
        <button class="close-button" onclick="closeDeletePOP()">&times;</button>
        <div class="textSection pt-5 mt-1 pe-5 ps-3" style="max-height: 680px; overflow: auto;">
            <p style="font-size: 26px;"> Confirm delete?</p>
            <hr>
            <p class="pt-3 pb-3" id="delText">
            </p>
            <div class="mt-4 mb-4">
                <button class="focus:outline-none text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-900"
                        onclick="permanentDelete()">Delete Permanently
                </button>
                <button class="focus:outline-none text-white bg-slate-700 hover:bg-slate-800 focus:ring-4 focus:ring-slate-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-slate-600 dark:hover:bg-slate-700 dark:focus:ring-slate-900"
                        onclick="closeDeletePOP()">Cancel
                </button>
            </div>

        </div>
    </div>
</div>

<%@include file="adminPanel.jsp" %>
<div class="content ml-12 transform ease-in-out duration-500 pt-20 px-2 md:px-5 pb-4 ">
    <nav class="flex px-5 py-3 text-gray-700  rounded-lg bg-gray-50 dark:bg-[#1E293B] " aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center">
                <a href="appointments"
                   class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-4 h-4 mr-2">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5m-9-6h.008v.008H12v-.008zM12 15h.008v.008H12V15zm0 2.25h.008v.008H12v-.008zM9.75 15h.008v.008H9.75V15zm0 2.25h.008v.008H9.75v-.008zM7.5 15h.008v.008H7.5V15zm0 2.25h.008v.008H7.5v-.008zm6.75-4.5h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V15zm0 2.25h.008v.008h-.008v-.008zm2.25-4.5h.008v.008H16.5v-.008zm0 2.25h.008v.008H16.5V15z"/>
                    </svg>
                    Doctor Schedule
                </a>
            </li>
        </ol>
    </nav>
</div>
<form id="frmAddAppointment" name="frmAddAppointment" action="<%=request.getContextPath()%>/addDoctorAppointment"
      method="post" class="space-y-8 divide-y divide-gray-200 md:ml-24 md:mr-16 sm:pr-10 pr-10 pl-16 mt-10">
    <div class="space-y-8 divide-y divide-gray-200 sm:space-y-5">
        <div>
            <div>
                <h3 class="text-lg leading-6 font-medium text-gray-900 dark:text-white">Add Doctor Schedule Here</h3>
                <p class="mt-1 max-w-2xl text-sm text-gray-500 dark:text-white">Booking a Doctor schedule with a gym
                    doctor is a crucial
                    step towards achieving your fitness goals.</p>
            </div>
                <% List<String> doctors = (List<String>)request.getAttribute("doctors"); %>
            <div class="mt-6 sm:mt-5 space-y-6 sm:space-y-5">
                <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-center sm:border-t sm:border-gray-200 sm:pt-5">
                    <div>
                        <label for="doctorUsername"
                               class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2 dark:text-white"> Doctor
                            / Physiotherapist
                            Username </label>
                    </div>
                    <div class="mt-1 sm:mt-0 sm:col-span-2">
                        <div>

                            <div class="mt-1">
                                <div id="selecteddoctorUsernameDiv" style="color:#ff0000;"></div>
                                <input type="text" onclick="myFunction(event)" onkeyup="filterFunction()"
                                       onkeydown="preventSubmitOnEnter(event)"
                                       id="selecteddoctorUsername" name="selecteddoctorUsername"
                                       class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm  px-4 "
                                       placeholder="Username" autocomplete="off">
                            </div>
                            <style>

                                .dropdown {
                                    position: relative;
                                    display: inline-block;
                                }

                                .dropdown-content {
                                    display: none;
                                    position: absolute;
                                    background-color: #f6f6f6;
                                    min-width: 230px;
                                    overflow: auto;
                                    border: 1px solid #ddd;
                                    z-index: 1;
                                    height: 200px;
                                    width: 320px;
                                }

                                .dropdown-content a {
                                    color: black;
                                    padding: 12px 16px;
                                    text-decoration: none;
                                    display: block;
                                }

                                /*.dropdown a:hover {background-color: #ddd;}*/

                                .show {
                                    display: block;
                                }
                            </style>

                            <div class="dropdown">
                                <div id="doctorUsername" name="doctorUsername" class="dropdown-content">
                                    <% if (doctors != null && !doctors.isEmpty()) {
                                        for (int i = 0; i < doctors.size(); i++) {
                                            String doctorUsername = doctors.get(i); %>

                                    <a class="link" onclick="valueFunction(event)"><%=doctorUsername%>
                                    </a>
                                    <% }
                                    } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                    <label class="block text-sm font-medium text-gray-700 dark:text-white sm:mt-px sm:pt-2">
                        Date </label>
                    <div class="mt-1 sm:mt-0 sm:col-span-2">
                        <div id="doctor_appointment_dateDiv" style="color:red;"></div>
                        <input type="date" name="doctor_appointment_date" id="doctor_appointment_date"
                               class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md"/>
                        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Enter Date for the Doctor
                            Appointment</p>
                    </div>
                </div>


                <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-center sm:border-t sm:border-gray-200 sm:pt-5">
                    <label class="block text-sm font-medium text-gray-700 dark:text-white"> Time </label>


                    <div class="flex items-center">

                        <div class="mt-1 sm:mt-0 sm:col-span-2 pr-4">

<%--                            <input type="time" name="start_time" id="start_time"--%>
<%--                                   class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md"/>--%>
<%--                            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Start Time</p>--%>

                <div class="select-container">
                    <select name="start_time" id="start_time" class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" size="5">
                        <option value="05:00">  5.00 am</option>
                        <option value="06:00">  6.00 am</option>
                        <option value="07:00">  7.00 am</option>
                        <option value="08:00">  8.00 am</option>
                        <option value="09:00">  9.00 am</option>
                        <option value="10:00">10.00 am</option>
                        <option value="11:00">11.00 am</option>
                        <option value="12:00">12.00 pm</option>
                        <option value="13:00"> 1.00 pm</option>
                        <option value="14:00"> 2.00 pm</option>
                        <option value="15:00"> 3.00 pm</option>
                        <option value="16:00"> 4.00 pm</option>
                        <option value="17:00"> 5.00 pm</option>
                        <option value="18:00"> 6.00 pm</option>
                        <option value="19:00"> 7.00 pm</option>
                        <option value="20:00"> 8.00 pm</option>
                        <option value="21:00"> 9.00 pm</option>
                    </select>
                    <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Start Time</p>
                </div>
                        </div>

                        <div class="select-container">
                            <select name="end_time" id="end_time" class="w-full rounded-md border border-[#e0e0e0] bg-white py-3 px-6 text-base font-medium text-[#6B7280] outline-none focus:border-[#6A64F1] focus:shadow-md" size="5">
                                <option value="05:00">  5.00 am</option>
                                <option value="06:00">  6.00 am</option>
                                <option value="07:00">  7.00 am</option>
                                <option value="08:00">  8.00 am</option>
                                <option value="09:00">  9.00 am</option>
                                <option value="10:00">10.00 am</option>
                                <option value="11:00">11.00 am</option>
                                <option value="12:00">12.00 pm</option>
                                <option value="13:00"> 1.00 pm</option>
                                <option value="14:00"> 2.00 pm</option>
                                <option value="15:00"> 3.00 pm</option>
                                <option value="16:00"> 4.00 pm</option>
                                <option value="17:00"> 5.00 pm</option>
                                <option value="18:00"> 6.00 pm</option>
                                <option value="19:00"> 7.00 pm</option>
                                <option value="20:00"> 8.00 pm</option>
                                <option value="21:00"> 9.00 pm</option>
                            </select>
                            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">End Time</p>
                        </div>


                    </div>
                </div>
                <div class="sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                    <label class="block text-sm font-medium text-gray-700 dark:text-white sm:mt-px sm:pt-2">
                        Doctor Channel type</label>

                    <div class="mt-1 sm:mt-0 sm:col-span-2">
                        <div id="doctor_class_Div"></div>
                        <select name="doctor_class" id="doctor_class"
                                class="max-w-lg block w-full shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm border-gray-300 rounded-md">
                            <option value="" disabled selected>Select</option>
                            <%
                                if (request.getAttribute("classes") != null) {
                                    List<String> Classes = (List<String>) request.getAttribute("classes");
                                    for (String Class : Classes) {
                            %>
                            <option value="<%=Class%>"><%=Class%>
                            </option>
                            <%
                                    }
                                }
                            %>
                        </select>
                        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Select a Channel type for the doctor</p>
                    </div>
                </div>

            </div>

            <div class="pt-5 mr-28">
                <div class="flex justify-end">
                    <button type="reset"
                            class="bg-white py-2 px-10 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Cancel
                    </button>
                    <button type="button" onclick="javascript:validationDoctorSchedule()"
                            class="ml-3 inline-flex justify-center py-2 px-10 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Add
                    </button>
                </div>
            </div>
</form>

<%--divider--%>
<div class="relative">
    <div class="absolute inset-0 flex items-center" aria-hidden="true">
        <div class="w-full border-t border-gray-300"></div>
    </div>
    <div class="relative flex justify-center">
    <span class="bg-white px-2 text-gray-500">
      <svg class="h-5 w-5 text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
        <path fill="#6B7280" fill-rule="evenodd"
              d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z"
              clip-rule="evenodd"/>
      </svg>
    </span>
    </div>
</div>


<div class=" overflow-x-auto md:ml-36 md:mr-28 sm:pr-10 pr-10 pl-16 mt-20 mb-10">
    <% String msg = (String) request.getAttribute("message");%>
    <div id="deleteDoctorSchedule" style="color:green;"><% if (msg != null) {
        out.println(msg);
    } %></div>

    <div class="flex items-center justify-between pb-4 bg-white dark:bg-gray-900 px-14">
        <div>
        <p class="dark:text-white text-black">Select Channel type</p>
        <select name="dropdownSelectStatus" id="dropdownSelectStatusID"
                class="text-white bg-blue-700 hover:bg-blue-800  font-medium rounded-lg text-sm inline-flex items-center dark:bg-gray-900 dark:hover:bg-gray-700">
            <option value="All" selected>All</option>
            <option value="Specialist">Specialist</option>
            <option value="Family">Family</option>
            <option value="Surgeon">Surgeon</option>
            <option value="Pediatrician">Pediatrician</option>
            <option value="Physiotherapy">Physiotherapy</option>
        </select>
        </div>

        <input type="hidden" id="selectedStatus" name="selectedStatus" value=""/>
        <label for="searchUsers" class="sr-only">Search</label>
        <div class="relative">
            <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" aria-hidden="true" fill="currentColor"
                     viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
                          d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                          clip-rule="evenodd"></path>
                </svg>
            </div>
            <input type="text" id="searchUsers"
                   class="block p-2 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                   placeholder="Search Doctor Username">
        </div>

    </div>

    <%--table start--%>
    <script>
        // Get the input element
        const searchInput = document.getElementById('searchUsers');
        const dropdownSelectStatus = document.getElementById('dropdownSelectStatusID');

        // Add event listener for status value changes
        dropdownSelectStatus.addEventListener('change', function () {
            const filterValue = dropdownSelectStatus.value;

            // Get all table rows
            const rows = document.querySelectorAll('tbody tr');

            // Loop through each row and check if the username matches the filter value
            rows.forEach(function (row) {
                if (filterValue === 'All') {
                    row.style.display = ''; // Show the row if it matches the filter
                    return;
                }
                const status = row.querySelector('.uStatus').textContent;
                if (status.includes(filterValue)) {
                    row.style.display = ''; // Show the row if it matches the filter
                } else {
                    row.style.display = 'none'; // Hide the row if it doesn't match the filter
                }
            });
        });

        // Add event listener for input changes
        searchInput.addEventListener('input', function () {
            const filterValue = searchInput.value.toLowerCase();

            // Get all table rows
            const rows = document.querySelectorAll('tbody tr');

            // Loop through each row and check if the username matches the filter value
            rows.forEach(function (row) {
                const username = row.querySelector('.usearch').textContent.toLowerCase();
                if (username.includes(filterValue)) {
                    row.style.display = ''; // Show the row if it matches the filter
                } else {
                    row.style.display = 'none'; // Hide the row if it doesn't match the filter
                }
            });
        });
    </script>

    <script>
        function confirmDelete(ClassId, ClassTopic , ClassDoctor) {
            document.getElementById("delText").innerHTML = "Are you sure you want to delete <b> " + ClassDoctor +" </b> 's Class on <b>" + ClassTopic + "</b> permanently? You won't be able to recover it again.";
            document.getElementById("doctorsheduleId").value = ClassId;
            document.getElementById("infoBox").hidden = false;

        }

        function permanentDelete() {
            document.getElementById("frmClassDelete").submit();
        }

        function closeDeletePOP() {
            document.getElementById("infoBox").hidden = true;
        }
    </script>


        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
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
                Assigned Channel type
            </th>
            <th scope="col" class="px-3 py-3">
                Delete
            </th>
        </tr>
        </thead>


        <% List<OldDoctorTimeTableDto> oldDoctorTimeTableDtos = (List<OldDoctorTimeTableDto>) request.getAttribute("doctorTimetables"); %>
        <% if (oldDoctorTimeTableDtos != null && !oldDoctorTimeTableDtos.isEmpty()) {

            for (int i = 0; i < oldDoctorTimeTableDtos.size(); i++) {
                OldDoctorTimeTableDto oldDoctorTimeTableDto = (OldDoctorTimeTableDto) oldDoctorTimeTableDtos.get(i);
        %>
        <tbody>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white usearch">
                <%=oldDoctorTimeTableDto.getDoctorUsername() %>
            </th>
            <td class="px-6 py-4">
                <%=oldDoctorTimeTableDto.getDoctorAppointmentDate() %>
            </td>
            <td class="px-6 py-4">
                <%= format.format(oldDoctorTimeTableDto.getDoctorAppointmentStartTime()) %> -
                <%= format.format(oldDoctorTimeTableDto.getDoctorAppointmentEndTime()) %>
            </td>
            <td class="px-6 py-4 uStatus">
                <%=oldDoctorTimeTableDto.getClassCategory() %>
            </td>
            <td class="px-6 py-4">
                <form id="frmdeleteDoctorSchedule<%=oldDoctorTimeTableDto.getId()%>"
                      name="frmdeleteDoctorSchedule<%=oldDoctorTimeTableDto.getId()%>" method="post"
                      action="<%=request.getContextPath()%>/deleteDoctorAppointment">
                    <input id="doctorsheduleId<%=oldDoctorTimeTableDto.getId()%>"
                           name="doctorsheduleId<%=oldDoctorTimeTableDto.getId()%>" type="hidden"
                           value="<%=oldDoctorTimeTableDto.getId()%>">
                    <button type="button"
                            onclick="confirmDelete(<%=oldDoctorTimeTableDto.getId()%>,'<%=oldDoctorTimeTableDto.getClassCategory()%>', '<%=oldDoctorTimeTableDto.getDoctorUsername()%>')"
<%--                            onclick="javascript:deletefromDoctorSchedule('<%=oldDoctorTimeTableDto.getId()%>')"--%>
                            class="ml-3 inline-flex justify-center py-2 px-10 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Delete Channel
                    </button>
                </form>
            </td>
        </tr>
        <% }
        } %>

        </tbody>
    </table>


</div>
</body>
</html>
