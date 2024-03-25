package com.lab.labManage.service;

import com.lab.labManage.dto.ComplainDto;
import com.lab.labManage.dto.ContactUsDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service
public class ContactUsService {
    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    /**
     *
     * @param first_name
     * @param email_address
     * @param phone_number
     * @param subject
     * @param description
     * @return
     */
    public boolean saveMemberMessage(String first_name, String email_address, Integer phone_number, String subject, String description){
        Statement stmt = null;
        Connection con = null;
        try {
            ResultSet rst = null;
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("insert into contact_us(user_name,email,phone_no,subject,description,created_at) values(?,?,?,?,?,?);");

            pst.setString(1, first_name);
            pst.setString(2, email_address);
            pst.setInt(3, Integer.parseInt(String.valueOf(phone_number)));
            pst.setString(4, subject);
            pst.setString(5, description);
            Calendar cals = Calendar.getInstance();
            java.util.Date today =  cals.getTime();
            java.sql.Date sqlDate = new Date(today.getYear(),today.getMonth(),today.getDate());
            pst.setDate(6,sqlDate);

            int rowsAffected = pst.executeUpdate();
            System.out.println("Database updated: " + rowsAffected + " row(s) affected.");

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

        return true;

    }

    public boolean saveMemberComplain(String complainDescription, String emailComplain){
        Statement stmt = null;
        Connection con = null;
        try {
            ResultSet rst = null;
            Class.forName("com.mysql.jdbc.Driver");

            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("insert into member_complain(complain_description,complain_email,created_at) values(?,?,?);");
            pst.setString(1, complainDescription);
            pst.setString(2, emailComplain);
            Calendar cals = Calendar.getInstance();
            java.util.Date today =  cals.getTime();
            java.sql.Date sqlDate = new Date(today.getYear(),today.getMonth(),today.getDate());
            pst.setDate(3,sqlDate);

            int rowsAffected = pst.executeUpdate();
            System.out.println("Database updated: " + rowsAffected + " row(s) affected.");

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

        return true;
    }

    /**
     *  get All Contact Us information
     * @return
     */
    public List<ContactUsDto> getAllContactUsInfo(){

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<ContactUsDto> contact_us = new ArrayList<ContactUsDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from contact_us ;");

            while (rst.next()) {
                ContactUsDto contactd = new ContactUsDto();
                int id = rst.getInt(1);
                contactd.setId(id);
                contactd.setName(rst.getString(2));
                contactd.setEmail(rst.getString(3));
                contactd.setNumber(rst.getString(4));
                contactd.setSubject(rst.getString(5));
                contactd.setDescription(rst.getString(6));
                contactd.setCreatedAt(rst.getDate(7));

                contact_us.add(contactd);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return contact_us;
    }

    /**
     *
     * @return
     */
    public List<ComplainDto> getAllComplainInfo(){

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<ComplainDto> complain_info = new ArrayList<ComplainDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from member_complain ;");

            while (rst.next()) {
                ComplainDto complaind = new ComplainDto();
                int id = rst.getInt(1);
                complaind.setComplainId(id);
                complaind.setDescription(rst.getString(2));
                complaind.setEmail(rst.getString(3));
                complaind.setCreatedAt(rst.getDate(4));

                complain_info.add(complaind);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return complain_info;
    }

    /**
     * @return
     */
    public int getMessageCount() {
        Connection con = null;
        Statement stmt = null;
        int mecount = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("SELECT COUNT(id) AS count FROM contact_us");
            if (rst.next()) {
                mecount = rst.getInt("count");
            }
            con.close();
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return mecount;
    }

    /**
     *
     * @return
     */
    public int getComplainCount() {
        Connection con = null;
        Statement stmt = null;
        int mecount = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("SELECT COUNT(id) AS count FROM member_complain");
            if (rst.next()) {
                mecount = rst.getInt("count");
            }
            con.close();
            stmt.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return mecount;
    }


    /**
     *
     * @param complainsId
     * @return
     */
    public boolean deleteComplain(String complainsId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<ComplainDto> complain = new ArrayList<ComplainDto>();
        String selectedComplain = null;
        int selectedComplainId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();

            int complainId = Integer.parseInt(complainsId);


            PreparedStatement pst = con.prepareStatement("delete from member_complain where id=? ;");

            //  Date appDate = new java.sql.Date(trAppDate.getTime());
            pst.setInt(1, complainId);


            int executeU = pst.executeUpdate();

            return true;

        } catch (ClassCastException classCastEx) {
            classCastEx.printStackTrace();
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }


    public boolean deleteMessage(String MesssagesId) {

        Statement stmt = null;
        Statement stmt2 = null;
        Connection con = null;
        List<ContactUsDto> complain = new ArrayList<ContactUsDto>();
        String selectedComplain = null;
        int selectedMessageId = 0;
        try {
            ResultSet rst = null;
            ResultSet rst2 = null;
            Class.forName("com.mysql.jdbc.Driver");
            //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt2 = con.createStatement();

            int messageId = Integer.parseInt(MesssagesId);


            PreparedStatement pst = con.prepareStatement("delete from contact_us where id=? ;");

            //  Date appDate = new java.sql.Date(trAppDate.getTime());
            pst.setInt(1, messageId);


            int executeU = pst.executeUpdate();

            return true;

        } catch (ClassCastException classCastEx) {
            classCastEx.printStackTrace();
            return false;
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
    }


}
