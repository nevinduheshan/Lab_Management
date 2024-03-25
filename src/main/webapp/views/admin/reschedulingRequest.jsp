<%@ page import="com.lab.labManage.dto.ReschedulingDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rescheduling Request</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="https://flowbite.com/docs/flowbite.css?v=1.6.5a"/>
    <script>
        window.onload = function () {
            var currentURL = window.location.href;
            // Check if the URL contains the desired parameter
            if (currentURL.includes('?success=true')) {
                msgBox("success", "Status Changed","topRight");
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
        function sendRequest(requestId, status) {
            document.getElementById("req_id").value = requestId;
            document.getElementById("status").value = status;
            document.getElementById("frmStatus").submit();
        }
    </script>
</head>
<body>
<%@include file="adminPanel.jsp" %>

<div class="content ml-12 transform ease-in-out duration-500 pt-20 px-2 md:px-5 pb-4 ">
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
                    <a href="<%=request.getContextPath()%>/reschedulingRequest"
                       class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Rescheduling
                        Request</a>
                </div>
            </li>
        </ol>
    </nav>
    <section class="container px-4 mx-auto">

        <div class="mt-6 md:flex md:items-center md:justify-between">
            <div>
                <select name="dropdownSelectStatus" id="dropdownSelectStatusID"
                        class="text-white bg-blue-700 hover:bg-blue-800  font-medium rounded-lg text-sm inline-flex items-center dark:bg-gray-900 dark:hover:bg-gray-700">
                    <option value="All" selected>All</option>
                    <option value="Pending">Pending</option>
                    <option value="Accepted">Accepted</option>
                    <option value="Rejected">Rejected</option>

                </select>
            </div>
            <div class="relative flex items-center mt-4 md:mt-0">
            <span class="absolute">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-5 h-5 mx-3 text-gray-400 dark:text-gray-600">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
                </svg>
            </span>

                <input type="text" id="searchInput" placeholder="Search Doctor Username"
                       class="block w-full py-1.5 pr-5 text-gray-700 bg-white border border-gray-200 rounded-lg md:w-80 placeholder-gray-400/70 pl-11 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40">

            </div>
        </div>
        <%--        realtime serach script if needed --%>

        <script>
            // Get the input element
            const searchInput = document.getElementById('searchInput');
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


        <div class="flex flex-col mt-6">
            <div class="-mx-4 -my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div class="inline-block min-w-full py-2 align-middle md:px-6 lg:px-8">
                    <div class="overflow-hidden border border-gray-200 dark:border-gray-700 md:rounded-lg">

                        <form id="frmUserInfo" name="frmUserInfo" action="" method="Post">
                            <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                                <thead class="bg-gray-50 dark:bg-gray-800">
                                <tr>
                                    <th scope="col"
                                        class="text-center px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        Doctor Username
                                    </th>

                                    <th scope="col"
                                        class="text-center px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        Requested Date & Time
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
                                    if (request.getAttribute("reschedulingRequests") != null)  // Null check for the object
                                    {

                                        List<ReschedulingDto> reschedulingRequests = (List<ReschedulingDto>) request.getAttribute("reschedulingRequests");

                                        for (int i = 0; i < reschedulingRequests.size(); i++) {
                                            ReschedulingDto reqs = reschedulingRequests.get(i);

                                %>
                                <tr>
                                    <td class="px-4 py-4 text-sm font-medium whitespace-nowrap"
                                    >
                                        <div>
                                            <h2 class="text-center font-medium text-gray-800 dark:text-white usearch">
                                                <%= reqs.getDoctor_username() %>
                                            </h2>
                                        </div>
                                    </td>
                                    <td class="text-center px-4 py-4 text-sm font-medium whitespace-nowrap">
                                        <div>
                                            <h2 class="font-medium text-gray-800 dark:text-white">
                                                <%= reqs.getRequested_date() %>
                                            </h2>
                                            <p class="text-sm font-normal text-gray-600 dark:text-gray-400">
                                                <%
                                                    DateFormat inputDateFormat = new SimpleDateFormat("HH:mm:ss");
                                                    DateFormat outputDateFormat = new SimpleDateFormat("hh:mm a");
                                                    String formattedDate = outputDateFormat.format(inputDateFormat.parse((reqs.getRequested_time().toString())));
                                                    out.print(formattedDate);%>
                                            </p>
                                        </div>
                                    </td>

                                    <td class="uStatus text-center px-12 py-4 text-sm font-medium whitespace-nowrap ">
                                        <div class="inline px-3 py-1 text-sm font-normal rounded-full <%
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


                                        <button onclick="sendRequest(<%=reqs.getRequest_id()%>,'Accepted')"
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

                                        <button onclick="sendRequest(<%=reqs.getRequest_id()%>,'Rejected')"
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
                        </form>
                        <form id="frmStatus" name="frmStatus" action="<%=request.getContextPath()%>/updatestatus"
                              method="post">
                            <input id="status" type="hidden" name="status" value="">
                            <input id="req_id" type="hidden" name="req_id" value="">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


</body>
</html>
