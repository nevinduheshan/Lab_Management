package com.lab.labManage.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;

@Service
public class DoctorService {
    @Value("${abc.roles}")
    private String roles;

    @Value("${abc.permissions}")
    private String permissions;

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;


    public void addActivity(String Account, String activity, String description) {

        // Get the current date
        String currentDate = LocalDate.now().toString();

        // Get the current time
        String currentTime = LocalTime.now().toString();

        Connection con = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            stmt.executeUpdate("insert into activity_log (account,activity,description,date,time) values ('" + Account + "','" + activity + "','" + description + "','" + currentDate + "','" + currentTime + "')");
            con.close();
            stmt.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
