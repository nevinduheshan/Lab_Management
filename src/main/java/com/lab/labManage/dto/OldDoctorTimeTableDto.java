package com.lab.labManage.dto;

import java.sql.Time;
import java.util.Date;

public class OldDoctorTimeTableDto {
    private int id;
    private  String doctorUsername;
    private  int doctorUserId;
    private Date doctorAppointmentDate;
    //assume that doctor can book only 1 hour sessions,they can book 2 hours session
    private Time doctorAppointmentStartTime;
    private Time doctorAppointmentEndTime;
    private int startHour;

    //1- Sun,2-Mon,3-Tue,4-Wed,5-Thu,6-Fri,7-Sat
    private int dayOfWeek;

    private String classCategory;

    public Time getDoctorAppointmentEndTime() {
        return doctorAppointmentEndTime;
    }

    public void setDoctorAppointmentEndTime(Time doctorAppointmentEndTime) {
        this.doctorAppointmentEndTime = doctorAppointmentEndTime;
    }



    public String getDoctorUsername() {
        return doctorUsername;
    }

    public void setDoctorUsername(String doctorUsername) {
        this.doctorUsername = doctorUsername;
    }

    public Date getDoctorAppointmentDate() {
        return doctorAppointmentDate;
    }

    public void setDoctorAppointmentDate(Date doctorAppointmentDate) {
        this.doctorAppointmentDate = doctorAppointmentDate;
    }

    public Time getDoctorAppointmentStartTime() {
        return doctorAppointmentStartTime;
    }

    public void setDoctorAppointmentStartTime(Time doctorAppointmentStartTime) {
        this.doctorAppointmentStartTime = doctorAppointmentStartTime;
    }

    public int getDoctorUserId() {
        return doctorUserId;
    }

    public void setDoctorUserId(int doctorUserId) {
        this.doctorUserId = doctorUserId;
    }

    public int getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(int dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public int getStartHour() {
        return startHour;
    }

    public void setStartHour(int startHour) {
        this.startHour = startHour;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setClassCategory(String classCategory) {
        this.classCategory = classCategory;
    }
    public String getClassCategory() {
        return classCategory;
    }
}
