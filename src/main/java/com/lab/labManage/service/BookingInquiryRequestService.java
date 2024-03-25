package com.lab.labManage.service;

import com.lab.labManage.dto.BookingInquiryRequestDto;
import com.lab.labManage.dto.UserDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class BookingInquiryRequestService {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    /**
     * get all doctor time table
     *
     * @return
     */
    public List<BookingInquiryRequestDto> getBookingInquiryRequests(String ResultsAmount) {

        Statement stmt = null;
        Connection con = null;
        ResultSet rst = null;
        List<BookingInquiryRequestDto> bookingInquiryRequests = new ArrayList<BookingInquiryRequestDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            if (ResultsAmount.equals("all")) {
                rst = stmt.executeQuery("select * from book_inquiry  order by id desc;");
            } else {
                rst = stmt.executeQuery("select * from book_inquiry where member_username = '" + ResultsAmount + "' order by id desc;");
            }


            while (rst.next()) {

                BookingInquiryRequestDto bookingInquiryRequest = new BookingInquiryRequestDto();
                bookingInquiryRequest.setId(rst.getInt("id"));
                bookingInquiryRequest.setUserUsername(rst.getString("member_username"));
                bookingInquiryRequest.setDoctorUsername(rst.getString("doctor_username"));
                bookingInquiryRequest.setSelectedClass(rst.getString("selected_class"));
                bookingInquiryRequest.setBookingDate(rst.getDate("book_date"));
                bookingInquiryRequest.setBookingTime(rst.getTime("book_time"));
                bookingInquiryRequest.setStatus(rst.getString("status"));
                bookingInquiryRequests.add(bookingInquiryRequest);

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

        return bookingInquiryRequests;

    }


    /**
     * get all doctor time table
     *
     * @return
     */
    public List<BookingInquiryRequestDto> getBookingInquiryRequestByStatus(String status) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<BookingInquiryRequestDto> bookingInquiryRequests = new ArrayList<BookingInquiryRequestDto>();
        String selectedUsername = null;
        int selectedUserId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();


            //   if(selecteddoctorUsername != null) {
            rst = stmt.executeQuery("select * from book_inquiry where status='" + status + "' ");
            //  }
            while (rst.next()) {

                BookingInquiryRequestDto bookingInquiryRequestDto = new BookingInquiryRequestDto();
                int id = rst.getInt(1);
                bookingInquiryRequestDto.setId(id);
                bookingInquiryRequestDto.setUserUsername(rst.getString(2));
                bookingInquiryRequestDto.setDoctorUsername(rst.getString(3));
                bookingInquiryRequestDto.setSelectedClass(rst.getString(4));
                bookingInquiryRequestDto.setBookingDate(rst.getDate(5));
                bookingInquiryRequestDto.setBookingTime(rst.getTime(6));
                bookingInquiryRequestDto.setStatus(rst.getString(7));
                bookingInquiryRequests.add(bookingInquiryRequestDto);


            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        }

        return bookingInquiryRequests;

    }

    /**
     * approve Booking Inquiry Request
     *
     * @return boolean
     */
    public boolean approveBookingInquiryRequest(int bookingInquiryId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<UserDto> users = new ArrayList<UserDto>();
        String selectedUsername = null;
        int selectedUserId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();

            PreparedStatement pst = con.prepareStatement("update book_inquiry set status='approve' where id=? ;");

            pst.setInt(1, bookingInquiryId);

            int executeU = pst.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
        }

        return true;

    }


    /**
     * reject Booking Inquiry Request
     *
     * @return boolean
     */
    public boolean rejectBookingInquiryRequest(int bookingInquiryId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<UserDto> users = new ArrayList<UserDto>();
        String selectedUsername = null;
        int selectedUserId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();

            PreparedStatement pst = con.prepareStatement("update book_inquiry set status='reject' where id=? ;");

            pst.setInt(1, bookingInquiryId);

            int executeU = pst.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
                return false;
            }
        }

        return true;

    }


}
