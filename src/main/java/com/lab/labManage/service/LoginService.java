package com.lab.labManage.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

@Service
public class LoginService {


    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;


    /**
     *  clear username from Cookie
     * @param request
     * @param response
     * @return
     */
    public String clearUsernameFromCookie(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();

        String username = null;

        if(cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("username")) {
                    username = aCookie.getValue();
                    aCookie.setMaxAge(0);
                    response.addCookie(aCookie);
                    break;
                }

            }
        }
       return username;
    }
    /**
     *  clear username from Cookie
     * @param request
     * @param response
     * @return
     */
    public String clearAdminFromCookie(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();

        String adminName = null;

        if(cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("adminCookie")) {
                    adminName = aCookie.getValue();
                    aCookie.setMaxAge(0);
                    response.addCookie(aCookie);
                    break;
                }

            }
        }
        return adminName;
    }

    /**
     *  clear username from Cookie
     * @param request
     * @param response
     * @return
     */
    public String clearDoctorFromCookie(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();

        String doctorName = null;

        if(cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("doctorCookie")) {
                    doctorName = aCookie.getValue();
                    aCookie.setMaxAge(0);
                    response.addCookie(aCookie);
                    break;
                }

            }
        }
        return doctorName;
    }

    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String readDoctorFromCookie(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();

        String doctorName = null;

        if(cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("doctorCookie")) {
                    doctorName = aCookie.getValue();
                    break;
                }

            }
        }

        return doctorName;
    }

    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String readUserNameFromCookie(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();

        String username = null;

        if(cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("username")) {
                    username = aCookie.getValue();
                    System.out.println("User Name Found in Cookie: " + username);

                    break;
                }

            }
        }

        return username;
    }

    public String readIdFromCookie(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String userId = null;

        if (cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("id")) {
                    userId = aCookie.getValue();
                    System.out.println("User ID Found in Cookie: " + userId);
                    break;
                }
            }
        }

        return userId;
    }





    /**
     *
     * @param request
     * @param response
     * @return
     */
    public String readAdminFromCookie(HttpServletRequest request, HttpServletResponse response){

        Cookie[] cookies = request.getCookies();

        String adminName = null;

        if(cookies != null) {
            for (Cookie aCookie : cookies) {
                String name = aCookie.getName();

                if (name.equals("adminCookie")) {
                    adminName = aCookie.getValue();
                    break;
                }

            }
        }

        return adminName;
    }


    /**
     *
     * @param username
     * @param pass
     * @return
     */
     public boolean findUserByUsernameAndPassword(String  username, String pass) {
         Connection con = null;
         Statement stmt = null;
         boolean foundUsername = false;


         try {
             Class.forName("com.mysql.jdbc.Driver");
             //   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");
             con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);

             stmt = con.createStatement();
             ResultSet rst = stmt.executeQuery("select * from users where username='" + username + "' and password ='" + pass + "';");
             if (rst.next()) {
                 //   userid = rst.getInt(1);
             //    username = rst.getString(7);
                 foundUsername = true;

             }

             con.close();
             stmt.close();
             rst.close();

         } catch (Exception ex) {
             ex.printStackTrace();
             return false;
         }
          return foundUsername;
     }


    /**
     *
     * @param userid
     * @param username
     * @param email
     * @param password
     * @param address
     * @return
     */
     public boolean updateUser(int userid,String username,String email,String password,String address){

         try {
             Class.forName("com.mysql.jdbc.Driver");
             //       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shcart", "root", "");

             Connection con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
             PreparedStatement pst = con.prepareStatement("update users set username= ?,email = ?,password= ?, address= ? where uid = ?;");
             pst.setString(1, username);
             pst.setString(2, email);
             pst.setString(3, password);
             pst.setString(4, address);
             pst.setInt(5, userid);
             int executeOutput = pst.executeUpdate();
             return true;
         }catch(Exception ex){
             ex.printStackTrace();
             return false;
         }

     }




}
