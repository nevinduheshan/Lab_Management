<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.lab.labManage.dto.Health_reportDto" %>
<%@ page import="com.lab.labManage.service.HealthReportService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="reportId" value="${param.reportId}" />

<%-- Assuming HealthReportService is autowired in the controller and available as a request attribute --%>
<% HealthReportService healthReportService = (HealthReportService) request.getAttribute("healthReportService"); %>
<c:set var="healthReport" value="${healthReportService.getReportById(reportId)}" />


<html>
<head>
    <title>Buy Report</title>
</head>
<body>
<h1>Health Report Details</h1>

<c:choose>
    <c:when test="${not empty healthReport}">
        <ul>
            <li>Report ID: ${healthReport.report_id}</li>
            <li>Description: ${healthReport.description}</li>
            <!-- Add more details as needed -->
        </ul>
    </c:when>
    <c:otherwise>
        <p>No health report found for the given ID.</p>

    </c:otherwise>
</c:choose>
</body>
</html>
