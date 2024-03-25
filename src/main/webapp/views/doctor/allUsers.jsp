<%@ page import="java.util.List" %>
<%@ page import="com.lab.labManage.dto.UserDto" %>
<%@ page import="com.lab.labManage.dto.RoleDto" %>
<%@ page import="com.lab.labManage.dto.RoleEnum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Users</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="https://flowbite.com/docs/flowbite.css?v=1.6.5a"/>

    <style>
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
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
            top: 10px;
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


    </style>

</head>
<body>

<%@include file="doctorPanel.jsp" %>

<div class="overlay" id="infoBox" hidden>
    <div class="centered-box" style="max-width: 800px; width: 85%;">
        <button class="close-button" onclick="closeInfoBox()">&times;</button>
        <div class="textSection pt-5 mt-5 pe-5 ps-3" style="max-height: 680px; overflow: auto;">
            <p class="headers pb-2">Full Name : </p>
            <p class="pb-2" id="fullNamePOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Username : </p>
            <p class="pb-2" id="usernamePOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Email : </p>
            <p class="pb-2" id="emailPOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Email Verified at : </p>
            <p class="pb-2" id="emailVerifiedAtPOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Mobile : </p>
            <p class="pb-2" id="mobilePOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Current Role : </p>
            <p class="pb-2" id="currentRolePOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Classes: </p>
            <p class="pb-2" id="classesPOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Acoount Created at : </p>
            <p class="pb-2" id="accountCreatedAtPOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Acoount Updated at : </p>
            <p class="pb-2" id="accountUpdatedAtPOP">N/A</p>
            <hr class="pb-5 mb-5">

            <p class="headers pb-2">Description: </p>
            <p class="pb-2" id="descriptionPOP">N/A</p>
            <hr class="pb-5 mb-5">

        </div>
    </div>
</div>

<script type="text/javascript">

    window.onload = function () {
        var currentURL = window.location.href;

        // Check if the URL contains the desired parameter
        if (currentURL.includes('?deleteUser=true')) {
            // Show a confirmation dialog with only the "OK" button
            msgBox("success","User deleted successfully!","bottomRight")
            // Remove the parameter and update the URL without reloading the page
            var newURL = currentURL.replace('?deleteUser=true', '');
            window.history.replaceState({}, document.title, newURL);
        }
        if (currentURL.includes('?addRole=true')) {
            // Show a confirmation dialog with only the "OK" button
            msgBox("success","Role added successfully!","bottomRight")
            // Remove the parameter and update the URL without reloading the page
            var newURL = currentURL.replace('?addRole=true', '');
            window.history.replaceState({}, document.title, newURL);
        }
        if (currentURL.includes('?updateRole=true')) {
            // Show a confirmation dialog with only the "OK" button
            msgBox("success","Role updated successfully!","bottomRight")
            // Remove the parameter and update the URL without reloading the page
            var newURL = currentURL.replace('?updateRole=true', '');
            window.history.replaceState({}, document.title, newURL);
        }
    };


    var selectedOne;

    function addRoleFor(tableId) {

        var tId = 'userid' + tableId;
        var usrid = document.getElementById(tId);

        var tunameId = 'username' + tableId;
        var tuname = document.getElementById(tunameId);

        var selUId = document.getElementById("selectedUserIdAdd");
        selUId.value = usrid.value;

        var selUName = document.getElementById("selectedUserName");
        selUName.value = tuname.value;

        // //    alert('select U Name='+ tuname.value );
        //   document.getElementById("frmAddRole").submit();

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

    function deleteUser(userName) {
        selectedOne = userName;
        document.getElementById("adminUsername").value = getCookieValue("adminCookie");
    }


    function updateRoleFor(tableId) {

        var tId = 'userid' + tableId;
        var usrid = document.getElementById(tId);

        var tunameId = 'username' + tableId;
        var tuname = document.getElementById(tunameId);

        var trolename = 'role' + tableId;
        var rolename = document.getElementById(trolename);

        var troleIdname = 'roleId' + tableId;
        var roleId = document.getElementById(troleIdname);

        var tdescription = 'description' + tableId;
        var description = document.getElementById(tdescription);

        document.getElementsByName("updateDescription")[0].value = description.value;

        var selUId = document.getElementById("selectedUserIds");
        selUId.value = usrid.value;

        var selRId = document.getElementById("selectedRoleId");
        selRId.value = roleId.value;

        var selRole = document.getElementById("selectedCurrentRole");
        selRole.value = rolename.value;

        if ((rolename.value) === "DOCTOR" || (rolename.value) === "PHYSIOTHERAPY") {
            document.getElementById("updateDescription").hidden = false;
        } else {
            document.getElementById("updateDescription").hidden = true;
        }


    }


    function changennrole() {
        //     console.log('changerole');
        var seRole = document.getElementById("role");
        // var e = document.getElementById("ddlViewBy");
        var val = seRole.value;
        //   console.log('select Role value='+ val );
        var text = seRole.options[seRole.selectedIndex].text;

        //    console.log('select Role='+ text );
    }

    function addRole() {

        if (document.getElementById("role").value === "")
        {
            msgBox("warning","Please select a role","bottomLeft");

        }
        else {
            document.getElementById("frmAddRole").submit();
            document.getElementById("defaultModal").hidden=true;
        }

    }

    function updateRole(){
        if (document.getElementById("selRoles").value === "")
        {
            msgBox("warning","Please select before Update role","bottomLeft");
        }
        else {
            document.getElementById("frmupdateUserRole").submit();
            document.getElementById("defaultModalUpdate").hidden=true;
        }
    }

    function setInputValueAndSubmit() {

        var inputElement = document.getElementById('selectedUserId');
        inputElement.value = selectedOne;

        document.forms["frmDelete"].submit();
    }

    function changeRole() {
        var sel = document.getElementById("selRoles");
        var roName = sel.value;
        document.getElementById("selectedRoleId").value = roName;
    }

    function handleRowClick(tblid) {

        var username = document.getElementById("username" + tblid).value;
        document.getElementById("usernamePOP").innerText = username;

        var firstname = document.getElementById("firstname" + tblid).value;
        var lastname = document.getElementById("lastname" + tblid).value;
        document.getElementById("fullNamePOP").innerText = firstname + ' ' + lastname;

        var email = document.getElementById("email" + tblid).value;
        if (email != "null" && email !== '') {
            document.getElementById("emailPOP").innerText = email;
        } else {
            document.getElementById("emailPOP").innerText = "N/A";
        }

        var emailVerifiedAt = document.getElementById("emailVerifiedAt" + tblid).value;
        if (emailVerifiedAt != "null" && emailVerifiedAt !== '') {
            document.getElementById("emailVerifiedAtPOP").innerText = emailVerifiedAt;
        } else {
            document.getElementById("emailVerifiedAtPOP").innerText = "N/A";
        }

        var mobile = document.getElementById("mobile" + tblid).value;
        if (mobile != "null" && mobile !== '') {
            document.getElementById("mobilePOP").innerText = mobile;
        } else {
            document.getElementById("mobilePOP").innerText = "N/A";
        }

        var currentRole = document.getElementById("role" + tblid).value;
        if (currentRole != "null" && currentRole !== '') {
            document.getElementById("currentRolePOP").innerText = currentRole;
        } else {
            document.getElementById("currentRolePOP").innerText = "N/A";
        }

        var classes = document.getElementById("classes" + tblid).value;
        if (classes != "null" && classes !== '') {
            document.getElementById("classesPOP").innerText = classes;
        } else {
            document.getElementById("classesPOP").innerText = "N/A";
        }

        var accountCreatedAt = document.getElementById("createdAt" + tblid).value;
        if (accountCreatedAt != "null" && accountCreatedAt !== '') {
            document.getElementById("accountCreatedAtPOP").innerText = accountCreatedAt;
        } else {
            document.getElementById("accountCreatedAtPOP").innerText = "N/A";
        }

        var accountUpdatedAt = document.getElementById("updatedAt" + tblid).value;
        if (accountUpdatedAt != "null" && accountUpdatedAt !== '') {
            document.getElementById("accountUpdatedAtPOP").innerText = accountUpdatedAt;
        } else {
            document.getElementById("accountUpdatedAtPOP").innerText = "N/A";
        }

        var description = document.getElementById("description" + tblid).value;
        if (description != "null" && description !== '') {
            document.getElementById("descriptionPOP").innerText = description;
        } else {
            document.getElementById("descriptionPOP").innerText = "N/A";
        }


        document.getElementById("infoBox").hidden = false;


    }

    function closeInfoBox() {
        document.getElementById("infoBox").hidden = true;
    }
    function resetdata(){
        document.getElementById("role").value = "";
        document.getElementById("description").hidden = true;
    }
    function resetUpdate()
    {
        document.getElementById("selRoles").value = "";

    }

</script>
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
                    <a href="#"
                       class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Patients
                        Manage</a>
                </div>
            </li>
        </ol>
    </nav>

    <!-- component -->
    <section class="container px-4 mx-auto">

        <div class="mt-6 md:flex md:items-center md:justify-between">
            <div>
                <p class="mt-1 text-sm text-gray-500 dark:text-gray-300">All Patients</p>
            </div>

            <div class="relative flex items-center mt-4 md:mt-0">
            <span class="absolute">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-5 h-5 mx-3 text-gray-400 dark:text-gray-600">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
                </svg>
            </span>

                <input type="text" id="searchInput" placeholder="Search"
                       class="block w-full py-1.5 pr-5 text-gray-700 bg-white border border-gray-200 rounded-lg md:w-80 placeholder-gray-400/70 pl-11 rtl:pr-11 rtl:pl-5 dark:bg-gray-900 dark:text-gray-300 dark:border-gray-600 focus:border-blue-400 dark:focus:border-blue-300 focus:ring-blue-300 focus:outline-none focus:ring focus:ring-opacity-40">

            </div>
        </div>

        <%--        realtime serach script if needed --%>
        <script>
            // Get the input element
            const searchInput = document.getElementById('searchInput');

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
                                        class="py-3.5 px-4 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        <button class="flex items-center gap-x-3 focus:outline-none">
                                            <span>Username</span>
                                            <p style="font-weight: bold; font-size: 12px;">(Click for Details)</p>
                                        </button>
                                    </th>

                                    <th scope="col"
                                        class="px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        Role
                                    </th>

                                    <th scope="col"
                                        class="px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        Join Date
                                    </th>

                                    <th scope="col"
                                        class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        Email Address
                                    </th>

                                    <th scope="col"
                                        class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400">
                                        Phone Number
                                    </th>

                                    <th scope="col"
                                        class="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500 dark:text-gray-400"></th>

                                    <th scope="col" class="relative py-3.5 px-4">
                                        <span class="sr-only">Edit</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200 dark:divide-gray-700 dark:bg-gray-900">
                                <%
                                    int tableId = 0;
                                    if (request.getAttribute("users") != null)  // Null check for the object
                                    {

                                        List<UserDto> users = (List<UserDto>) request.getAttribute("users");

                                        for (int i = 0; i < users.size(); i++) {
                                            UserDto del = users.get(i);
                                            tableId++;

                                %>
                                <tr>
                                    <td class="px-4 py-4 text-sm font-medium whitespace-nowrap hover:bg-gray-600 cursor-pointer"
                                        onclick="handleRowClick(<%=tableId%>)">
                                        <div>
                                            <h2 class="font-medium text-gray-800 dark:text-white usearch"><%=del.getUsername()%>
                                            </h2>
                                            <p class="text-sm font-normal text-gray-600 dark:text-gray-400"><%=del.getFirstName()%>
                                                <%=del.getLastName()%>
                                            </p>
                                        </div>
                                    </td>
                                    <td class="px-12 py-4 text-sm font-medium whitespace-nowrap">
                                        <div class="inline px-3 py-1 text-sm font-normal rounded-full text-emerald-500 gap-x-2 bg-emerald-100/60 dark:bg-gray-800">
                                            <% if (del.getRoleId() != 0) {
                                                out.print(RoleEnum.findByNumber(del.getRoleId()));
                                            } %>
                                        </div>
                                    </td>
                                    <td class="px-12 py-4 text-sm font-medium whitespace-nowrap">
                                        <div class="inline px-3 py-1 text-sm font-normal rounded-full text-emerald-500 gap-x-2 bg-emerald-100/60 dark:bg-gray-800">
                                            <%=del.getCreatedAt()%>
                                        </div>
                                    </td>
                                    <td class="px-4 py-4 text-sm whitespace-nowrap">
                                        <div>
                                            <h4 class="text-gray-700 dark:text-gray-200"><%=del.getEmail()%>
                                            </h4>
                                        </div>
                                    </td>
                                    <td class="px-4 py-4 text-sm whitespace-nowrap">
                                        <div class="flex items-center">
                                            <h1 class="text-gray-700 dark:text-gray-200"><%=del.getMobile()%>
                                            </h1>
                                        </div>
                                    </td>

                                    <td class="px-4 py-4 text-sm whitespace-nowrap">


                                        <input id="userid<%=tableId%>" name="userid<%=tableId%>" type="hidden"
                                               value="<%=del.getUserid()%>"/>
                                        <input id="firstname<%=tableId%>" name="firstname<%=tableId%>" type="hidden"
                                               value="<%=del.getFirstName()%>"/>
                                        <input id="lastname<%=tableId%>" name="lastname<%=tableId%>" type="hidden"
                                               value="<%=del.getLastName()%>"/>
                                        <input id="username<%=tableId%>" name="username<%=tableId%>" type="hidden"
                                               value="<%=del.getUsername()%>"/>
                                        <input id="email<%=tableId%>" name="email<%=tableId%>" type="hidden"
                                               value="<%=del.getEmail()%>"/>
                                        <input id="emailVerifiedAt<%=tableId%>" name="emailVerifiedAt<%=tableId%>"
                                               type="hidden"
                                               value="<%=del.getEmailVerifiedAt()%>"/>
                                        <input id="mobile<%=tableId%>" name="mobile<%=tableId%>" type="hidden"
                                               value="<%=del.getMobile()%>"/>
                                        <input id="role<%=tableId%>" name="role<%=tableId%>" type="hidden"
                                               value="<% if(del.getRoleId() != 0 ){ out.print( RoleEnum.findByNumber(del.getRoleId())  ); } %>"/>
                                        <input id="roleId<%=tableId%>" name="roleId<%=tableId%>" type="hidden"
                                               value="<% if(del.getRoleId() != 0 ){ out.print( del.getRoleId()  ); } %>"/>
                                        <input id="classes<%=tableId%>" name="classes<%=tableId%>" type="hidden"
                                               value="<%=del.getClasses()%>"/>
                                        <input id="createdAt<%=tableId%>" name="createdAt<%=tableId%>" type="hidden"
                                               value="<%=del.getCreatedAt()%>"/>
                                        <input id="updatedAt<%=tableId%>" name="updatedAt<%=tableId%>" type="hidden"
                                               value="<%=del.getUpdatedAt()%>"/>
                                        <input id="description<%=tableId%>" name="description<%=tableId%>" type="hidden"
                                               value="<%=del.getDescription()%>"/>

                                        <button type="button" onclick="openAddReportModal('<%=del.getUserid()%>' , '<%=del.getUsername()%>')" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800" >Add Report</button>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>


                                </tbody>
                            </table>


                        </form>




                    </div>
                </div>
            </div>
        </div>
    </section>

</div>


<script src="https://flowbite.com/docs/flowbite.min.js"></script>
<script src="https://flowbite.com/docs/datepicker.min.js"></script>
</body>


<!-- Add Health Report Modal -->
<div id="addReportModal" class="overlay" hidden>
    <div class="centered-box" style="max-width: 800px; width: 85%;">
        <button class="close-button" onclick="closeAddReportModal()">&times;</button>
        <div class="textSection pt-5 mt-5 pe-5 ps-3" style="max-height: 680px; overflow: auto;">
            <!-- Modal body -->
            <form class="p-4 md:p-5" action="<%=request.getContextPath()%>/health-report/save" method="post">
                <div class="grid gap-4 mb-4 grid-cols-2">
                    <label for="users_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">User ID:</label>
                    <input type="text" id="users_id" name="users_id" value="" readonly  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">

                    <label for="username" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Username</label>
                    <input type="text" id="username" name="username" value="" readonly  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">

                    <label for="price" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Report price</label>
                    <input type="number" id="price" name="price" value=""  class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="price">

                    <!-- Add health report input fields -->
                    <label for="reportDate" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Report Date:</label>
                    <input type="date" id="reportDate" name="reportDate" required class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">

                    <div class="col-span-2">
                        <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Report Title</label>
                        <input  type="text" name="description" id="description" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Write Report title here">
                    </div>

                    <div class="col-span-2 sm:col-span-1">
                        <label for="Sugar_level" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Sugar level</label>
                        <input type="number" name="Sugar_level" id="Sugar_level" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Sugar level">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="cholesterol_level" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Cholesterol level</label>
                        <input type="number" name="cholesterol_level" id="cholesterol_level" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Cholesterol level">
                    </div>

                    <div class="col-span-2 sm:col-span-1">
                        <label for="blood_pressure_systolic" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Blood pressure systolic</label>
                        <input type="number" name="blood_pressure_systolic" id="blood_pressure_systolic" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Sugar level">
                    </div>
                    <div class="col-span-2 sm:col-span-1">
                        <label for="blood_pressure_diastolic" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">	Blood pressure diastolic</label>
                        <input type="number" name="blood_pressure_diastolic" id="blood_pressure_diastolic" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Cholesterol level">
                    </div>


                    <div class="col-span-2">
                        <label for="additional_notes" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Additional note</label>
                        <input type="text" name="additional_notes" id="additional_notes" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Type additional notes">
                    </div>
                </div>
                <button type="submit" class="text-white inline-flex items-center bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                    <svg class="me-1 -ms-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd"></path></svg>
                    Save Report
                </button>
            </form>
        </div>
    </div>
</div>


<script>

    function openAddReportModal(userId , username) {
        // Set the user ID in the modal form
        document.getElementById('users_id').value = userId;
        document.getElementById('username').value = username;
        // Show the modal
        document.getElementById('addReportModal').hidden = false;
    }

    function closeAddReportModal() {
        // Hide the modal
        document.getElementById('addReportModal').hidden = true;
    }
</script>




</html>
