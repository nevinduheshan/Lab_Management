<%@ page import="com.lab.labManage.dto.ContactUsDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Messages</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="https://flowbite.com/docs/flowbite.css?v=1.6.5a"/>

    <script>
        function confirmDelete(messageId, messageSubject) {
            document.getElementById("delText").innerHTML = "Are you sure you want to delete the Message on <b>" + messageSubject + "</b> permanently? You won't be able to recover it again.";
            document.getElementById("messageId").value = messageId;
            document.getElementById("infoBox").hidden = false;

        }

        function permanentDelete() {
            document.getElementById("frmMessageDelete").submit();
        }

        function closeDeletePOP() {
            document.getElementById("infoBox").hidden = true;
        }

    </script>
</head>
<body>

<form id="frmMessageDelete" action="<%=request.getContextPath()%>/deleteMessage" method="post" hidden>
    <input type="text" id="messageId" name="messageId" value="" hidden/>
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
                    <a href="memberMessages"
                       class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Member Messages</a>
                </div>
            </li>
        </ol>
    </nav>
</div>

<%--table--%>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg ml-12 transform ease-in-out duration-500 pt-5 px-2 md:px-5 pb-4">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="px-6 py-3">
                Customer Name
            </th>
            <th scope="col" class="px-6 py-3">
                Date
            </th>
            <th scope="col" class="px-6 py-3">
                Email Address
            </th>
            <th scope="col" class="px-6 py-3">
                Phone Number
            </th>
            <th scope="col" class="px-6 py-3">
                Subject
            </th>
            <th scope="col" class="px-6 py-3">
                Description
            </th>
            <th scope="col" class="px-6 py-3">

            </th>
        </tr>
        </thead>
        <tbody>
        <%
            int tableId=0;
            if(request.getAttribute("contact_us") != null)  // Null check for the object
            {

                List<ContactUsDto> contacts   =  (List<ContactUsDto>) request.getAttribute("contact_us");

                for(int i=0; i< contacts.size();i++){
                    ContactUsDto contact = contacts.get(i);
                    tableId++;

        %>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                <%=contact.getName()%>
            </th>
            <td class="px-6 py-4">
                <%=contact.getCreatedAt()%>
            </td>
            <td class="px-6 py-4">
                <%=contact.getEmail()%>
            </td>
            <td class="px-6 py-4">
                <%=contact.getNumber()%>
            </td>
            <td class="px-6 py-4">
                <%=contact.getSubject()%>
            </td>
            <td class="px-6 py-4">
                <%=contact.getDescription()%>
            </td>
            <td class="px-6 py-4 text-right">
                    <button class="focus:outline-none text-white bg-red-700 hover:bg-red-600 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2"
                            onclick="confirmDelete(<%=contact.getId()%>,'<%=contact.getSubject()%>')">
                        Delete
                    </button>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

</div>

</body>
</html>
