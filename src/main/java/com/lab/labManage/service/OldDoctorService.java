package com.lab.labManage.service;

import com.lab.labManage.dto.OldDoctorTimeTableDto;
import com.lab.labManage.dto.UserDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.*;
import java.util.Date;

@Service
public class OldDoctorService {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Value("${image.url}")
    private String promotionImagePath;

    /**
     * This  method used to convert java.util.Date object to java.sql.Time object
     *
     * @param date
     * @return
     */
    public static java.sql.Time convert(java.util.Date date) {

        return new java.sql.Time(date.getTime());
    }


    /**
     * This method used to save doctor reschedule requests
     *
     * @return
     */

    public boolean saveRescheduleRequest(String doctorUsername, String doctorRescheduleDate, String doctorRescheduleTime) {

        Statement stmt = null;
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("insert into doctor_rescheduling_timetable (username,requested_date,requested_time) values('" + doctorUsername + "','" + doctorRescheduleDate + "','" + doctorRescheduleTime + "');");
            pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception in savesaveRescheduleRequest() method");
            e.printStackTrace();
            return false;

        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return true;
    }

    /**
     * save Doctor time table
     *
     * @param selecteddoctorUsername
     * @param doctorAppointmentDate
     * @param startTime
     * @param endTime
     * @return
     */

    public boolean saveDoctorTimeTable(String selecteddoctorUsername, String doctorAppointmentDate, String startTime, String endTime, String classCategory) {

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

            if (selecteddoctorUsername != null) {
                rst = stmt.executeQuery("select * from users where username='" + selecteddoctorUsername + "' ;");
            }
            if (rst.next()) {
                selectedUserId = rst.getInt(1);

                PreparedStatement pst = con.prepareStatement("insert into doctor_timetable(doctor_app_date,doctor_id,start_at,end_at,created_at,updated_at,day_of_week,doctor_username,class ) values(?,?,?,?,?,?,?,?,?);");
                java.util.Date trAppDate = new SimpleDateFormat("yyyy-MM-dd").parse(doctorAppointmentDate);

                Calendar calendar = Calendar.getInstance();
                calendar.setTime(trAppDate);
                int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);

                new java.sql.Date(trAppDate.getTime());
                pst.setDate(1, new java.sql.Date(trAppDate.getTime()));
                pst.setInt(2, selectedUserId);

                DateFormat sdf = new SimpleDateFormat("HH:mm");
                java.util.Date startTimeDateObj = sdf.parse(startTime);
                java.sql.Time startTimeObj = this.convert(startTimeDateObj);

                java.util.Date endTimeDateObj = sdf.parse(endTime);
                java.sql.Time endTimeObj = this.convert(endTimeDateObj);


                pst.setTime(3, startTimeObj);
                pst.setTime(4, endTimeObj);
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                pst.setTimestamp(5, timestamp);
                pst.setTimestamp(6, timestamp);
                pst.setInt(7, dayOfWeek);
                pst.setString(8, selecteddoctorUsername);
                pst.setString(9, classCategory);


                int executeU = pst.executeUpdate();


            }


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

            }
        }

        return true;

    }

    /**
     * get all doctor time table
     *
     * @return
     */
    public List<OldDoctorTimeTableDto> getAllDoctorTimeTable() {

        Statement stmt = null;
        Connection con = null;
        List<OldDoctorTimeTableDto> doctorTimetables = new ArrayList<OldDoctorTimeTableDto>();
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
            rst = stmt.executeQuery("select * from doctor_timetable order by created_at desc;");
            //  }
            while (rst.next()) {

                OldDoctorTimeTableDto doctortimeTableDto = new OldDoctorTimeTableDto();
                doctortimeTableDto.setId(rst.getInt(1));
                doctortimeTableDto.setDoctorAppointmentDate(rst.getDate(2));
                doctortimeTableDto.setDoctorUserId(rst.getInt(3));
                doctortimeTableDto.setDoctorUsername(rst.getString(4));
                doctortimeTableDto.setDoctorAppointmentStartTime(rst.getTime(5));
                doctortimeTableDto.setDoctorAppointmentEndTime(rst.getTime(6));
                doctortimeTableDto.setClassCategory(rst.getString(10));
                doctorTimetables.add(doctortimeTableDto);

            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

        return doctorTimetables;

    }

    /**
     * This method is used to save Inquiry DB table
     *
     * @param userUsername
     * @param doctorUsername
     * @param selectedDate
     * @param selectedTime
     * @param selectedClass
     * @return
     */
    public boolean saveBookInquiry(String userUsername, String doctorUsername, String selectedDate, String selectedTime, String selectedClass) {


        Statement stmt = null;
        Connection con = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            PreparedStatement pst = con.prepareStatement("insert into book_inquiry (member_username,doctor_username,book_date,book_time,selected_class) values('" + userUsername + "','" + doctorUsername + "','" + selectedDate + "','" + selectedTime + "','" + selectedClass + "');");
            pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception in saveBookInquiry() method");
            e.printStackTrace();
            return false;

        } finally {
            try {
                stmt.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return true;
    }


    /**
     * get all doctors
     */
    public List<UserDto> getAllDoctorsInfo() {

        Connection con = null;
        Statement stmt = null;
        List<UserDto> doctors = new ArrayList<UserDto>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery(" select u.username,u.email,u.mobile,u.first_name,u.last_name,u.class,u.description from users as u where u.id in ( select user_id from user_roles where role_id=5 or role_id=6) ");
            while (rst.next()) {
                UserDto userdto = new UserDto();
                String username = rst.getString(1);
                userdto.setUsername(username);
                userdto.setEmail(rst.getString(2));
                userdto.setMobile(rst.getString(3));
                userdto.setFirstName(rst.getString(4));
                userdto.setLastName(rst.getString(5));
                userdto.setClasses(rst.getString(6));
                userdto.setDescription(rst.getString(7));
                doctors.add(userdto);
            }
            con.close();
            stmt.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return doctors;

    }

    /**
     * delete doctor Time Table
     *
     * @param doctorAppointmnetId
     * @return
     */
    public boolean deleteDoctorTimeTable(String doctorAppointmnetId) {

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

            int trainAppId = Integer.parseInt(doctorAppointmnetId);


            PreparedStatement pst = con.prepareStatement("delete from doctor_timetable where id=? ;");

            //  Date appDate = new java.sql.Date(trAppDate.getTime());
            pst.setInt(1, trainAppId);


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

    /**
     * testing doctor service get all week
     **/

    public List<OldDoctorTimeTableDto> getDoctorsTimes(String CtrlDate, String CtrlUser) throws SQLException {

        LocalDate date = LocalDate.parse(CtrlDate, DateTimeFormatter.ISO_DATE);// Format: yyyy-MM-dd
        // Get the start of the week (Sunday) for the given date
        LocalDate startOfWeek = date.with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY));

        String starDate = startOfWeek.toString();
        String endDate = startOfWeek.plusDays(6).toString();

        Statement stmt = null;
        Connection con = null;
        ResultSet rst = null;
        List<OldDoctorTimeTableDto> doctorsMaps = new ArrayList<OldDoctorTimeTableDto>();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            if (CtrlUser.equals("all")) {
                rst = stmt.executeQuery("select * from doctor_timetable where doctor_app_date >=' " + starDate + "' and  doctor_app_date <='" + endDate + "' ;");
            } else {
                rst = stmt.executeQuery("select * from doctor_timetable where doctor_app_date >=' " + starDate + "' and  doctor_app_date <='" + endDate + "' and  doctor_username = '" + CtrlUser + "';");
            }

            while (rst.next()) {
                OldDoctorTimeTableDto doctorsMap = new OldDoctorTimeTableDto();
                doctorsMap.setId(rst.getInt("id"));
                doctorsMap.setDoctorAppointmentDate(rst.getDate("doctor_app_date"));
                doctorsMap.setDoctorUsername(rst.getString("doctor_username"));
                doctorsMap.setDoctorAppointmentStartTime(rst.getTime("start_at"));
                doctorsMaps.add(doctorsMap);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            // Close the ResultSet, Statement, and Connection in the finally block
            if (rst != null) {
                rst.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return doctorsMaps;
    }
    /**
     * doctor service get classes
     **/

    public List<OldDoctorTimeTableDto> getDoctorsClasses(String CtrlDate, String CtrlClass) throws SQLException {

        LocalDate date = LocalDate.parse(CtrlDate, DateTimeFormatter.ISO_DATE);// Format: yyyy-MM-dd
        // Get the start of the week (Sunday) for the given date
        LocalDate startOfWeek = date.with(TemporalAdjusters.previousOrSame(DayOfWeek.SUNDAY));

        String starDate = startOfWeek.toString();
        String endDate = startOfWeek.plusDays(6).toString();

        Statement stmt = null;
        Connection con = null;
        ResultSet rst = null;
        List<OldDoctorTimeTableDto> classesMaps = new ArrayList<OldDoctorTimeTableDto>();

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            if (CtrlClass.equals("allClasses")) {
                rst = stmt.executeQuery("select * from doctor_timetable where doctor_app_date >=' " + starDate + "' and  doctor_app_date <='" + endDate + "' ;");
            } else {
                rst = stmt.executeQuery("select * from doctor_timetable where doctor_app_date >=' " + starDate + "' and  doctor_app_date <='" + endDate + "' and  class = '" + CtrlClass + "';");
            }

            while (rst.next()) {
                OldDoctorTimeTableDto classesMap = new OldDoctorTimeTableDto();
                classesMap.setId(rst.getInt("id"));
                classesMap.setDoctorAppointmentDate(rst.getDate("doctor_app_date"));
                classesMap.setDoctorUsername(rst.getString("doctor_username"));
                classesMap.setClassCategory(rst.getString("class"));
                classesMap.setDoctorAppointmentStartTime(rst.getTime("start_at"));
                classesMaps.add(classesMap);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            // Close the ResultSet, Statement, and Connection in the finally block
            if (rst != null) {
                rst.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return classesMaps;
    }


}


