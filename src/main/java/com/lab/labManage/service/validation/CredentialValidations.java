package com.lab.labManage.service.validation;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class CredentialValidations {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    public String strongPassword(String password) {

        String regax = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]+$";

        if (password.length() < 8) {
            return "password must be at least 8 characters";
        } else if (password.length() > 20) {
            return "password must be less than 20 characters";
        } else if (!password.matches(regax)) {
            return "Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.";
        } else {
            return "valid";
        }
    }

    public String validPassword(String currentPassword, String newPassword, String confirmPassword, String username) {

        if (!(newPassword.equals(confirmPassword))) {
            return "passwords do not match";
        }
        Statement stmt = null;
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select password from users where username = '" + username + "';");

            if (rst.next()) {
                if (!(rst.getString("password").equals(currentPassword))) {
                    return "Current password is incorrect";
                }
            } else {
                return "Unidentified User";
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return "valid";
    }

    public String validMobile(String mobile) {
        // Length requirement
        if (mobile.length() < 10 || mobile.length() > 15) {
            return "Invalid mobile number. Please enter a number between 10 and 15 digits.";
        }
        String regex = "^[+0-9]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(mobile);

        if (!matcher.matches()) {
            return "mobile number cannot contain letters or special characters";
        } else {
            return "valid";
        }

    }
}
