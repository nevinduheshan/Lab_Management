package com.lab.labManage.controller.Doctor;

import com.lab.labManage.dto.RoleDto;
import com.lab.labManage.dto.UserDto;
import com.lab.labManage.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

import static com.lab.labManage.controller.Admin.AdminController.USERLOGIN;

@Controller
public class DoctorController {
    int doctorlogcheck = 0;
    String usernameforclass = "";
    int userid = 0;

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Autowired
    private DoctorService doctorService;

    @Autowired
    private ContactUsService contactUsService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    public static final StringBuilder DOCTORLOGIN = new StringBuilder("doctorLogin");

    /**
     * This method used to load Doctor Panel
     *
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/doctor")
    public String doctorControl(Model model, HttpServletRequest request, HttpServletResponse response) {

        String usrname = loginService.readDoctorFromCookie(request, response);
        if (usrname != null) {
            request.setAttribute(USERLOGIN.toString(), usrname);
        } else {
            return "doctorLogin";
        }


        int userCount = adminService.getUserCount();
        request.setAttribute("userCount", userCount);

        int inquiryCount = adminService.getInquiryCount();
        request.setAttribute("inquiryCount", inquiryCount);

        List<String> doctors = adminService.getAllDoctors();
        request.setAttribute("doctors", doctors);

        int rescheduleCount = adminService.getRescheduleCount();
        request.setAttribute("rescheduleCount", rescheduleCount);

        int MessageCount = contactUsService.getMessageCount();
        request.setAttribute("MessageCount", MessageCount);

        int ComplainCount = contactUsService.getComplainCount();
        request.setAttribute("ComplainCount", ComplainCount);

        return "doctor/doctorControl";
    }

    @RequestMapping(value = "doctorLoginValidate", method = RequestMethod.POST)
    public String doctorLoginValidate(@RequestParam("doctorUsername") String doctorUsername, @RequestParam("doctorPassword") String doctorPassword, Model model, HttpServletRequest request, HttpServletResponse response) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rst = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            String query = ("SELECT id, username, password FROM users AS a WHERE a.username = ? AND a.password = ? AND a.id IN (SELECT user_id FROM user_roles WHERE role_id = 5)");
//            String query = ("select u.username,u.password from users as u where u.id in ( select user_id from user_roles where role_id=2 )");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, doctorUsername);
            pstmt.setString(2, doctorPassword);
            rst = pstmt.executeQuery();



            if (rst.next()) {

                //------setup Cookie----------
                Cookie loginCookie = new Cookie("doctorCookie",usernameforclass);
                loginCookie.setValue(doctorUsername);
                //setting cookie to expiry in 60 mins
                loginCookie.setMaxAge(60*60);
                response.addCookie(loginCookie);
                //-------end of setup the cookie------

                //add an activity log
                doctorService.addActivity(doctorUsername,"Logged-Doctor","N/A");


                con.close();
                stmt.close();
                rst.close();
                return "redirect:/doctor";
            } else {
                model.addAttribute("message", "Invalid Username or Password");
                con.close();
                stmt.close();
                rst.close();
                return DOCTORLOGIN.toString();
            }

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        } finally {
            try {
                if(stmt != null){stmt.close();}
                con.close();
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }

        return DOCTORLOGIN.toString();
    }

    @GetMapping("/getAllUsers")
    public String getAllUsers(Model model, HttpServletRequest request, HttpServletResponse response) {
        if (loginService.readDoctorFromCookie(request, response) == null) {
            return "redirect:/doctorControl";
        }

        List<UserDto> users = userService.getAllUserInfo();
        request.setAttribute("users", users);

        List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("role", roles);

        return "doctor/allUsers";
    }



}
