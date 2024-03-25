package com.lab.labManage.dto;

import java.sql.Time;
import java.util.Date;

public class BookingInquiryRequestDto {
  private  int id;
  private String userUsername;
  private String doctorUsername;
  private String selectedClass;
  private Date bookingDate;
  private Time bookingTime;
  private String status;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getUserUsername() {
    return userUsername;
  }

  public void setUserUsername(String loggedUsername) {
    this.userUsername = loggedUsername;
  }

  public String getDoctorUsername() {
    return doctorUsername;
  }

  public void setDoctorUsername(String doctorUsername) {
    this.doctorUsername = doctorUsername;
  }

  public String getSelectedClass() {
    return selectedClass;
  }

  public void setSelectedClass(String adminMessage) {
    this.selectedClass = adminMessage;
  }

  public Date getBookingDate() {
    return bookingDate;
  }

  public void setBookingDate(Date bookingDate) {
    this.bookingDate = bookingDate;
  }

  public Time getBookingTime() {
    return bookingTime;
  }

  public void setBookingTime(Time bookingTime) {
    this.bookingTime = bookingTime;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }
}
