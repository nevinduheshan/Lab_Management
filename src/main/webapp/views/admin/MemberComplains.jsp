<%@ page import="com.lab.labManage.dto.ComplainDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Member Complains</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
    <link rel="stylesheet" href="https://flowbite.com/docs/flowbite.css?v=1.6.5a"/>

    <script>
        function confirmDelete(passMessageId) {
            document.getElementById("delText").innerHTML = "Are you sure you want to delete the Complain permanently? You won't be able to recover it again.";
            document.getElementById("complainId").value = passMessageId;
            document.getElementById("infoBox").hidden = false;

        }

        function permanentDelete() {
            document.getElementById("frmComplainDelete").submit();
        }

        function closeDeletePOP() {
            document.getElementById("infoBox").hidden = true;
        }
    </script>
</head>
<body>

<form id="frmComplainDelete" action="<%=request.getContextPath()%>/deleteComplain" method="post" hidden>
    <input type="text" id="complainId" name="complainId" value="" hidden/>
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
                    <a href="MemberComplains"
                       class="ml-1 text-sm font-medium text-gray-700 hover:text-gray-900 md:ml-2 dark:text-gray-400 dark:hover:text-white">Member Complains</a>
                </div>
            </li>
        </ol>
    </nav>
</div>

<%--table--%>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg ml-12 transform ease-in-out duration-500 pt-5 px-2 md:px-5 pb-4">
    <% String msg = (String) request.getAttribute("message");%>
    <div id="DeleteComplain"  style="color:green;" ><% if(msg !=null){ out.println(msg); } %></div>

    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
        <tr>
            <th scope="col" class="px-6 py-3">
                Complain Description
            </th>
            <th scope="col" class="px-6 py-3">
                Date
            </th>
            <th scope="col" class="px-6 py-3">
                Email
            </th>
            <th scope="col" class="px-6 py-3">

            </th>
        </tr>
        </thead>
        <tbody>
        <%
            int tableId=0;
            if(request.getAttribute("complain_info") != null)  // Null check for the object
            {

                List<ComplainDto> complains   =  (List<ComplainDto>) request.getAttribute("complain_info");

                for(int i=0; i< complains.size();i++){
                    ComplainDto complain = complains.get(i);
                    tableId++;

        %>
        <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
            <td class="px-6 py-4">
               <%=complain.getDescription()%>
            </td>
            <td class="px-6 py-4">
                <%=complain.getCreatedAt()%>
            </td>
            <td class="px-6 py-4">
                <%=complain.getEmail()%>
            </td>
            <td class="px-6 py-4 text-right">
                    <button class="focus:outline-none text-white bg-red-700 hover:bg-red-600 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2"
                            onclick="confirmDelete(<%=complain.getComplainId()%>)">
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

</body>
</html>
