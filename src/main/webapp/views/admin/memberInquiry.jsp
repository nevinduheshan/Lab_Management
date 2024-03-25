<%@ page import="com.lab.labManage.dto.BookingInquiryRequestDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Booking Inquiry</title>
    <script type="text/javascript">
        window.onload = function () {
            var currentURL = window.location.href;
            // Check if the URL contains the desired parameter
            if (currentURL.includes('?success=true')) {
                msgBox("success", "Booking Status Updated","topRight");
                // Remove the parameter and update the URL without reloading the page
                var newURL = currentURL.replace('?success=true', '');
                window.history.replaceState({}, document.title, newURL);
            } else if (currentURL.includes('?success=false')) {
                msgBox("error", "ERROR 500.. Action failed!","topRight");
                // Remove the parameter and update the URL without reloading the page
                var newURL = currentURL.replace('?success=false', '');
                window.history.replaceState({}, document.title, newURL);
            }
        };
        function sendApproval(bookId,approval) {
            document.getElementById("bookId").value = bookId;
            document.getElementById("approval").value = approval;
            document.getElementById("frmBookingApproval").submit();
        }
    </script>


</head>
<body>
<form id="frmBookingApproval" action="<%=request.getContextPath()%>/BookingApproval" method="post" hidden>
    <input type="text" id="bookId" name="bookId" value="" hidden/>
    <input type="text" id="approval" name="approval" value="" hidden/>
</form>

<%@include file="adminPanel.jsp" %>
<div class="content ml-12 transform ease-in-out duration-500 pt-20 px-2 md:px-5 pb-4">
    <nav class="flex px-5 py-3 text-gray-700  rounded-lg bg-gray-50 dark:bg-[#1E293B] " aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center">
                <a href="adminControl"
                   class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
                    <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
                    </svg>
                    Home
                </a>
            </li>
            <li>
                <div class="flex items-center">
                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fillRule="evenodd"
                              d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                              clipRule="evenodd"></path>
                    </svg>
                    <a href="#"
                       class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">
                        Patient's Booking Inquiry
                    </a>
                </div>
            </li>
        </ol>
    </nav>
</div>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg md:px-6 lg:px-8 ml-10">
    <%--search--%>
    <div class="flex items-center justify-between pb-4 bg-white dark:bg-gray-900 px-14">
        <div>
            <select name="dropdownSelectStatus" id="dropdownSelectStatusID"
                    class="text-white bg-blue-700 hover:bg-blue-800  font-medium rounded-lg text-sm inline-flex items-center dark:bg-gray-900 dark:hover:bg-gray-700">
                <option value="All" selected>All</option>
                <option value="Pending">Pending</option>
                <option value="Accepted">Accepted</option>
                <option value="Rejected">Rejected</option>

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
                   placeholder="Search Patient Username">
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

    <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
        <thead class="bg-gray-50 dark:bg-gray-800">
        <tr>
            <th scope="col"
                class="text-center px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                Patient Username
            </th>
            <th scope="col"
                class="text-center px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                Doctor Username
            </th>
            <th scope="col"
                class="text-center px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                Channel Type
            </th>
            <th scope="col"
                class="text-center px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                Channel Date & Time
            </th>
            <th scope="col"
                class="text-center px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400 ">
                Status
            </th>
            <th scope="col"
                class="text-center px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                Actions
            </th>
        </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700 dark:bg-gray-900">
                    <%
                        if (request.getAttribute("BookingInquiries") != null)  // Null check for the object
                        {

                            List<BookingInquiryRequestDto> BookingRequests = (List<BookingInquiryRequestDto>) request.getAttribute("BookingInquiries");

                            for (int i = 0; i < BookingRequests.size(); i++) {
                                BookingInquiryRequestDto reqs = BookingRequests.get(i);

                    %>
        <tr>
            <td class="px-4 py-4 text-sm font-medium whitespace-nowrap">
                <div>
                    <h2 class="text-center font-medium text-gray-800 dark:text-white usearch">
                        <%=reqs.getUserUsername()%>
                    </h2>
                </div>
            </td>
            <td class="px-4 py-4 text-sm font-medium whitespace-nowrap">
                <div>
                    <h2 class="text-center font-medium text-gray-800 dark:text-white">
                        <%=reqs.getDoctorUsername()%>
                    </h2>
                </div>
            </td>
            <td class="px-4 py-4 text-sm font-medium whitespace-nowrap">
                <div>
                    <h2 class="text-center font-medium text-gray-800 dark:text-white">
                        <%=reqs.getSelectedClass()%>
                    </h2>
                </div>
            </td>
            <td class="text-center px-4 py-4 text-sm font-medium whitespace-nowrap">
                <div>
                    <h2 class="font-medium text-gray-800 dark:text-white">
                        <%=reqs.getBookingDate()%>
                    </h2>
                    <p class="text-sm font-normal text-gray-600 dark:text-gray-400">
                                                    <%
                                                        DateFormat inputDateFormat = new SimpleDateFormat("HH:mm:ss");
                                                        DateFormat outputDateFormat = new SimpleDateFormat("hh:mm a");
                                                        String formattedDate = outputDateFormat.format(inputDateFormat.parse((reqs.getBookingTime().toString())));
                                                        out.print(formattedDate);%>
                    </p>
                </div>
            </td>

            <td class="text-center px-12 py-4 text-sm font-medium whitespace-nowrap">
                                    <div class=" uStatus inline px-3 py-1 text-sm font-normal rounded-full <%
                                                        if(Objects.equals(reqs.getStatus(), "Accepted"))
                                                        {out.print("text-emerald-600 gap-x-2 bg-emerald-100/60");}
                                                        else if(Objects.equals(reqs.getStatus(), "Rejected"))
                                                        {out.print("text-red-600 gap-x-2 bg-red-100/60");}
                                                        else{out.print("text-yellow-600 gap-x-2 bg-yellow-100/60");}
                                                        %> dark:bg-gray-800">
                                        <%= reqs.getStatus()%>
                                    </div>
            </td>
            <td class="text-center px-4 py-4 text-sm whitespace-nowrap">


                                    <button onclick="sendApproval(<%=reqs.getId()%>,'Accepted')"
                                            type="button"
                                            <%
                                                if (Objects.equals(reqs.getStatus(), "Accepted")) {
                                                    out.print("class=\"focus:outline-none text-white bg-slate-200 dark:bg-slate-800 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2\" disabled");
                                                } else {
                                                    out.print("class=\"focus:outline-none text-white bg-emerald-700 hover:bg-emerald-600 focus:ring-4 focus:ring-emerald-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2\"");
                                                }
                                            %>>
                                        Accept
                                    </button>

                                    <button onclick="sendApproval(<%=reqs.getId()%>,'Rejected')"
                                            type="button"
                                            <%
                                                if (Objects.equals(reqs.getStatus(), "Rejected")) {
                                                    out.print("class=\"focus:outline-none text-white bg-slate-200 dark:bg-slate-800 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2\" disabled");
                                                } else {
                                                    out.print("class=\"focus:outline-none text-white bg-red-700 hover:bg-red-600 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2\"");
                                                }
                                            %>>
                                        Reject
                                    </button>

            </td>
        </tr>
                    <%
                            }
                        }
                    %>
        </tbody>
    </table>

    <%--table end--%>


</div>

</body>
<script src="https://flowbite.com/docs/flowbite.min.js"></script>
<script src="https://flowbite.com/docs/datepicker.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const dropdownButton = document.getElementById("dropdownActionButton");
        const dropdownMenu = document.getElementById("dropdownAction");

        dropdownButton.addEventListener("click", function () {
            dropdownMenu.classList.toggle("hidden");
        });

        // Close the dropdown menu when clicking outside
        document.addEventListener("click", function (event) {
            if (!dropdownButton.contains(event.target) && !dropdownMenu.contains(event.target)) {
                dropdownMenu.classList.add("hidden");
            }
        });
    });
</script>
</html>
