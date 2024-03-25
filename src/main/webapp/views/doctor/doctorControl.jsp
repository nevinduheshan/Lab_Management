<%@ page import="com.lab.labManage.dto.OldDoctorTimeTableDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
    <title>Doctor Panel</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>

</head>
<body>
<%-- Create a SimpleDateFormat instance for the desired format --%>
<% SimpleDateFormat format = new SimpleDateFormat("hh:mm a"); %>

<% int iUserCount = (int) request.getAttribute("userCount");%>
<% int inQuiryCount = (int) request.getAttribute("inquiryCount");%>
<% int MessageCount = (int) request.getAttribute("MessageCount");%>
<% int ComplainCount = (int) request.getAttribute("ComplainCount");%>
<% int rescheduleCount = (int) request.getAttribute("rescheduleCount");%>

<%@include file="doctorPanel.jsp" %>
<div class="content ml-12 transform ease-in-out duration-500 pt-20 px-2 md:px-5 pb-4 ">
    <nav class="flex px-5 py-3 text-gray-700  rounded-lg bg-gray-50 dark:bg-[#1E293B] " aria-label="Breadcrumb">
        <ol class="inline-flex items-center space-x-1 md:space-x-3">
            <li class="inline-flex items-center">
                <a href="doctor"
                   class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
                    <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
                    </svg>
                    Home
                </a>
            </li>
        </ol>
    </nav>

    <%--Total User--%>
    <div class="w-full lg:w-1/3 p-2">
        <a href="<%=request.getContextPath()%>/getAllUsers">
            <div class="flex items-center flex-row w-full bg-gradient-to-r dark:from-cyan-500 dark:to-blue-500 from-indigo-500 via-purple-500 to-pink-500 rounded-md p-3">
                <div class="flex text-indigo-500 dark:text-white items-center bg-white dark:bg-[#0F172A] p-2 rounded-md flex-none w-8 h-8 md:w-12 md:h-12 ">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5}
                         stroke="currentColor" class="object-scale-down transition duration-500">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z"/>
                    </svg>
                </div>
                <div class="flex flex-col justify-around flex-grow ml-5 text-white">
                    <div class="">
                        Patients
                    </div>
                    <div class="text-xs whitespace-nowrap">
                        <%= iUserCount %>
                    </div>

                </div>
                <div class=" flex items-center flex-none text-white">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5}
                         stroke="currentColor" class="w-6 h-6">
                        <path strokeLinecap="round" strokeLinejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5"/>
                    </svg>

                </div>
            </div>
        </a>
    </div>

</div>
</body>
</html>
