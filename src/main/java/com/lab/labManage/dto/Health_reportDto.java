package com.lab.labManage.dto;

import java.sql.Date;

public class Health_reportDto {
    private int report_id;
    private int users_id;
    private Date report_date;
    private String description;
    private Double sugar_level;
    private int blood_pressure_systolic;
    private int blood_pressure_diastolic;
    private Double cholesterol_level;
    private int price;

    public int getBuy_status() {
        return Buy_status;
    }

    public void setBuy_status(int buy_status) {
        Buy_status = buy_status;
    }

    private int Buy_status;

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    private String username;

    public int getReport_id() {
        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
    }

    public int getUsers_id() {
        return users_id;
    }

    public void setUsers_id(int users_id) {
        this.users_id = users_id;
    }

    public Date getReport_date() {
        return report_date;
    }

    public void setReport_date(Date report_date) {
        this.report_date = report_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getSugar_level() {
        return sugar_level;
    }

    public void setSugar_level(Double sugar_level) {
        this.sugar_level = sugar_level;
    }

    public int getBlood_pressure_systolic() {
        return blood_pressure_systolic;
    }

    public void setBlood_pressure_systolic(int blood_pressure_systolic) {
        this.blood_pressure_systolic = blood_pressure_systolic;
    }

    public int getBlood_pressure_diastolic() {
        return blood_pressure_diastolic;
    }

    public void setBlood_pressure_diastolic(int blood_pressure_diastolic) {
        this.blood_pressure_diastolic = blood_pressure_diastolic;
    }

    public Double getCholesterol_level() {
        return cholesterol_level;
    }

    public void setCholesterol_level(Double cholesterol_level) {
        this.cholesterol_level = cholesterol_level;
    }

    public String getAdditional_notes() {
        return additional_notes;
    }

    public void setAdditional_notes(String additional_notes) {
        this.additional_notes = additional_notes;
    }

    public String additional_notes;

}
