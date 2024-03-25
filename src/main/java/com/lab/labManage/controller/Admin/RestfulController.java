package com.lab.labManage.controller.Admin;

import com.lab.labManage.dto.OldDoctorTimeTableDto;
import com.lab.labManage.service.OldDoctorService;
import com.lab.labManage.service.UserService;
import com.lab.labManage.service.validation.CredentialValidations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@RestController
public class RestfulController {

    @Autowired
    private OldDoctorService oldDoctorService;

    @Autowired
    private CredentialValidations credentialValidations;

    @Autowired
    private UserService userService;

    @PostMapping("/calendardata")
    public List<OldDoctorTimeTableDto> allDoctorSchedules(@RequestBody Map<String, String> requestBody, HttpServletRequest request) throws SQLException {


        String formattedDate = null;
        String inputFormat = "E MMM d yyyy";
        String outputFormat = "yyyy-MM-dd";
        try {
            SimpleDateFormat inputDateFormat = new SimpleDateFormat(inputFormat);
            SimpleDateFormat outputDateFormat = new SimpleDateFormat(outputFormat);
            Date date = inputDateFormat.parse(requestBody.get("selectedDate"));
            formattedDate = outputDateFormat.format(date);
        } catch (ParseException e) {
            System.out.println("Error parsing date: " + e.getMessage());
        }

        List<OldDoctorTimeTableDto> doctorTableResults = oldDoctorService.getDoctorsTimes(formattedDate, requestBody.get("user"));

        return doctorTableResults;


    }

    @PostMapping("/calendarDataForOutClass")
    public List<OldDoctorTimeTableDto> allClassesSchedules(@RequestBody Map<String, String> requestBody, HttpServletRequest request) throws SQLException {


        String formattedDate = null;
        String inputFormat = "E MMM d yyyy";
        String outputFormat = "yyyy-MM-dd";
        try {
            SimpleDateFormat inputDateFormat = new SimpleDateFormat(inputFormat);
            SimpleDateFormat outputDateFormat = new SimpleDateFormat(outputFormat);
            Date date = inputDateFormat.parse(requestBody.get("selectedDate"));
            formattedDate = outputDateFormat.format(date);
        } catch (ParseException e) {
            System.out.println("Error parsing date: " + e.getMessage());
        }

        List<OldDoctorTimeTableDto> classesTableResults = oldDoctorService.getDoctorsClasses(formattedDate, requestBody.get("reqClasses"));

        return classesTableResults;

    }

    @PostMapping("/changeAccountPassword")
    public String changeAccountPassword(@RequestBody Map<String, String> requestBody, HttpServletRequest request) throws SQLException {

        String Strong = credentialValidations.strongPassword(requestBody.get("newPassword"));
        String Valid = credentialValidations.validPassword(
                requestBody.get("currentPassword"),
                requestBody.get("newPassword"),
                requestBody.get("confirmPassword"),
                requestBody.get("username")
        );
        if (!Strong.equals("valid")) {
            return Strong;
        } else if (!Valid.equals("valid")) {
            return Valid;
        }
        else{
            if(userService.changePassword(requestBody.get("username"), requestBody.get("newPassword"))){
                return "success";
            }
            else{
                return "Something went wrong";
            }
        }
    }


}
