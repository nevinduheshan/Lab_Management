package com.lab.labManage.dto;

public class DBInfoDto {

    public final  String dburl ="jdbc:mysql://localhost:3306/lab_new";
    public final  String username ="root";
    public final  String password ="";

   public DBInfoDto(){

    }

    public  String getDburl() {
        return dburl;
    }

    public  String getUsername() {
        return username;
    }

    public  String getPassword() {
        return password;
    }
}
