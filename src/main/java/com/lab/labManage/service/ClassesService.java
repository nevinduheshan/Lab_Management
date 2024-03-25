package com.lab.labManage.service;

import com.lab.labManage.dto.UserDto;
import com.lab.labManage.common.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ClassesService {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Autowired
    private OldDoctorService oldDoctorService;


    public List<String> getAllClassesFromDB (){

        List<String> classes = new ArrayList<String>();

        Connection con = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("SELECT class_name FROM classes;");

            while (rst.next()) {
                classes.add(rst.getString("class_name"));
            }




        } catch (Exception ex) {

            ex.printStackTrace();
            return null;

        }
        finally {
            try {
                stmt.close();
                con.close();
            }
            catch (Exception ex) {
                ex.printStackTrace();
            }

        }

        return classes;
    }

    public HashMap<String, List<String>> getClassesInfoByDoctor(){


        HashMap<String, List<String>> doctorClassesInfo = new HashMap<String, List<String>>();



        List<String> FamilyDoctors = new ArrayList<String>();
        List<String> SpecialistDoctors = new ArrayList<String>();
        List<String> surgeonDoctors = new ArrayList<String>();
        List<String> pediatricianDoctors = new ArrayList<String>();

        List<UserDto> users = oldDoctorService.getAllDoctorsInfo();
        for( UserDto user : users){
            String classes=user.getClasses();
            if(classes != null) {
                switch (classes) {
                    case Constants.CLASSES_FAMILY:
                        FamilyDoctors.add(user.getUsername());
                        break;
                    case Constants.CLASSES_SPECIALIST:
                        SpecialistDoctors.add(user.getUsername());
                        break;
                    case Constants.CLASSES_SURGEON:
                        surgeonDoctors.add(user.getUsername());
                        break;
                    case Constants.CLASSES_PEDIATRICIAN:
                        pediatricianDoctors.add(user.getUsername());
                        break;

                    default:
                        // System.out.println("Consonant");
                }
            }


        }


        doctorClassesInfo.put(Constants.CLASSES_FAMILY,FamilyDoctors);
        doctorClassesInfo.put(Constants.CLASSES_SPECIALIST,SpecialistDoctors);
        doctorClassesInfo.put(Constants.CLASSES_SURGEON,surgeonDoctors);
        doctorClassesInfo.put(Constants.CLASSES_PEDIATRICIAN,pediatricianDoctors);


        return doctorClassesInfo;
    }

}
