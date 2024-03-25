package com.lab.labManage.dto;

import java.sql.Time;
import java.util.Date;

public class ReschedulingDto {

    private int request_id;
    private String doctor_username;
    private Date requested_date;
    private Time requested_time;
    private String status;
    public int getRequest_id() {
        return request_id;
    }
    public void setRequest_id(int request_id) {
        this.request_id = request_id;
    }
    public String getDoctor_username() {
        return doctor_username;
    }
    public void setDoctor_username(String doctor_username) {
        this.doctor_username = doctor_username;
    }
    public Date getRequested_date() {
        return requested_date;
    }
    public void setRequested_date(Date requested_date) {
        this.requested_date = requested_date;
    }
    public Time getRequested_time() {
        return requested_time;
    }
    public void setRequested_time(Time requested_time) {
        this.requested_time = requested_time;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }






}
