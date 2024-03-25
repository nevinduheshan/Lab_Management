package com.lab.labManage.service;

import com.lab.labManage.dto.Health_reportDto;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.font.Standard14Fonts;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class HealthReportService {
    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;


    public byte[] generatePDF(List<Health_reportDto> report) throws IOException {
        try (PDDocument doc = new PDDocument()) {
            PDPage page = new PDPage();
            doc.addPage(page);

            try (PDPageContentStream contents = new PDPageContentStream(doc, page)) {
                contents.beginText();
                contents.setFont(new PDType1Font(Standard14Fonts.FontName.HELVETICA), 12);

                // Define the starting position for the list
                float x = 100;
                float y = 700;

                // Define the vertical offset between each item
                float verticalOffset = 20;

                // Display each text item as a list
                contents.newLineAtOffset(x, y);
                contents.showText("Health Report of " + report.get(0).getUsername());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Report ID: " + report.get(0).getReport_id());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Report Date: " + report.get(0).getReport_date());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Description: " + report.get(0).getDescription());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Sugar Level: " + report.get(0).getSugar_level());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Blood Pressure systolic: " + report.get(0).getBlood_pressure_systolic());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Blood Pressure Diastolic: " + report.get(0).getBlood_pressure_diastolic());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Cholesterol Level: " + report.get(0).getCholesterol_level());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Additional Notes: " + report.get(0).getAdditional_notes());
                y -= verticalOffset;

                contents.newLineAtOffset(0, -verticalOffset);
                contents.showText("Price: " + report.get(0).getPrice());

                contents.endText();
            }

            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            doc.save(outputStream);
            return outputStream.toByteArray();
        }
    }

    public List<Health_reportDto> getHealthReportbyId(int reportId) {

        Statement stmt = null;
        Connection con = null;
        ResultSet rst = null;
        List<Health_reportDto> healthReportDetails = new ArrayList<Health_reportDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            rst = stmt.executeQuery("select * from health_reports where report_id = '" + reportId + "' order by report_id desc;");

            while (rst.next()) {

                Health_reportDto healthReportDetail = new Health_reportDto();
                healthReportDetail.setReport_id(rst.getInt("report_id"));
                healthReportDetail.setDescription(rst.getString("description"));
                healthReportDetail.setSugar_level(rst.getDouble("sugar_level"));
                healthReportDetail.setBlood_pressure_systolic(rst.getInt("blood_pressure_systolic"));
                healthReportDetail.setBlood_pressure_diastolic(rst.getInt("blood_pressure_diastolic"));
                healthReportDetail.setCholesterol_level(rst.getDouble("cholesterol_level"));
                healthReportDetail.setAdditional_notes(rst.getString("additional_notes"));
                healthReportDetail.setReport_date(rst.getDate("report_date"));
                healthReportDetail.setUsers_id(rst.getInt("users_id"));
                healthReportDetail.setUsername(rst.getString("username"));
                healthReportDetail.setPrice(rst.getInt("price"));
                healthReportDetail.setBuy_status(rst.getInt("Buy_status"));
                healthReportDetails.add(healthReportDetail);

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }

        return healthReportDetails;

    }

    public boolean saveHealthReport(Health_reportDto healthReport) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword)) {
                String query = "INSERT INTO health_reports(report_id, report_date, description, sugar_level, " +
                        "blood_pressure_systolic, blood_pressure_diastolic, cholesterol_level, additional_notes, users_id, username, price) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";

                try (PreparedStatement pst = con.prepareStatement(query)) {
                    pst.setInt(1, healthReport.getReport_id());
                    pst.setTimestamp(2, new Timestamp(System.currentTimeMillis())); // Assuming report_date is a timestamp
                    pst.setString(3, healthReport.getDescription());
                    pst.setDouble(4, healthReport.getSugar_level());
                    pst.setInt(5, healthReport.getBlood_pressure_systolic());
                    pst.setInt(6, healthReport.getBlood_pressure_diastolic());
                    pst.setDouble(7, healthReport.getCholesterol_level());
                    pst.setString(8, healthReport.getAdditional_notes());
                    pst.setInt(9, healthReport.getUsers_id());
                    pst.setString(10, healthReport.getUsername());
                    pst.setInt(11, healthReport.getPrice());

                    int executeUpdate = pst.executeUpdate();

                    // Check if the insertion was successful
                    return executeUpdate > 0;
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace(); // Consider logging the exception instead
            return false;
        }
    }

    /**
     * get all doctor time table
     *
     * @return
     */
    public List<Health_reportDto> getAllHealthReports(String ResultsAmount) {

        Statement stmt = null;
        Connection con = null;
        ResultSet rst = null;
        List<Health_reportDto> healthReportDetails = new ArrayList<Health_reportDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            if (ResultsAmount.equals("all")) {
                rst = stmt.executeQuery("select * from health_reports  order by report_id desc;");
            } else {
                rst = stmt.executeQuery("select * from health_reports where username = '" + ResultsAmount + "' order by report_id desc;");
            }


            while (rst.next()) {

                Health_reportDto healthReportDetail = new Health_reportDto();
                healthReportDetail.setReport_id(rst.getInt("report_id"));
                healthReportDetail.setDescription(rst.getString("description"));
                healthReportDetail.setSugar_level(rst.getDouble("sugar_level"));
                healthReportDetail.setBlood_pressure_systolic(rst.getInt("blood_pressure_systolic"));
                healthReportDetail.setBlood_pressure_diastolic(rst.getInt("blood_pressure_diastolic"));
                healthReportDetail.setCholesterol_level(rst.getDouble("cholesterol_level"));
                healthReportDetail.setAdditional_notes(rst.getString("additional_notes"));
                healthReportDetail.setReport_date(rst.getDate("report_date"));
                healthReportDetail.setUsers_id(rst.getInt("users_id"));
                healthReportDetail.setUsername(rst.getString("username"));
                healthReportDetail.setPrice(rst.getInt("price"));
                healthReportDetail.setBuy_status(rst.getInt("Buy_status"));
                healthReportDetails.add(healthReportDetail);

            }

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }

        return healthReportDetails;

    }

    public Health_reportDto getReportById(int reportId) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rst = null;
        Health_reportDto healthReportDetail = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            String query = "SELECT * FROM health_reports WHERE report_id = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, reportId);
            rst = pstmt.executeQuery();

            if (rst.next()) {
                healthReportDetail = new Health_reportDto();
                healthReportDetail.setReport_id(rst.getInt("report_id"));
                healthReportDetail.setDescription(rst.getString("description"));
                healthReportDetail.setSugar_level(rst.getDouble("sugar_level"));
                healthReportDetail.setBlood_pressure_systolic(rst.getInt("blood_pressure_systolic"));
                healthReportDetail.setBlood_pressure_diastolic(rst.getInt("blood_pressure_diastolic"));
                healthReportDetail.setCholesterol_level(rst.getDouble("cholesterol_level"));
                healthReportDetail.setAdditional_notes(rst.getString("additional_notes"));
                healthReportDetail.setReport_date(rst.getDate("report_date"));
                healthReportDetail.setUsers_id(rst.getInt("users_id"));
                healthReportDetail.setUsername(rst.getString("username"));
                healthReportDetail.setBuy_status(rst.getInt("Buy_status"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rst != null) {
                    rst.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return healthReportDetail;
    }

    public boolean updateBuyStatus(int reportId) {
        String query = "UPDATE health_reports SET Buy_status = 2 WHERE report_id = ?;";
        try {
            // Load the driver class
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection
            try (Connection con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
                 PreparedStatement pst = con.prepareStatement(query)) {

                // Set parameters
                pst.setInt(1, reportId);

                // Execute the update
                int executeUpdate = pst.executeUpdate();

                // Check if the update was successful
                return executeUpdate > 0;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            // Log the exception
            ex.printStackTrace(); // Consider using a logging framework instead
            return false;
        }
    }


}
