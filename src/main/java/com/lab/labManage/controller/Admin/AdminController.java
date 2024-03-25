package com.lab.labManage.controller.Admin;


import com.lab.labManage.dto.RoleDto;
import com.lab.labManage.service.AdminService;
import com.lab.labManage.service.ContactUsService;
import com.lab.labManage.service.LoginService;
import com.lab.labManage.service.OldDoctorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

@Controller
public class AdminController {
    int adminlogcheck = 0;
    String usernameforclass = "";
    int userid =0;


    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Autowired
    private AdminService adminService;

    @Autowired
    private OldDoctorService oldDoctorService;

    @Autowired
    private ContactUsService contactusservice;

    public static final StringBuilder USERLOGIN = new StringBuilder("userLogin");
    public static final StringBuilder ADMINLOGIN = new StringBuilder("adminLogin");
    public static final StringBuilder USERNAME = new StringBuilder("username");



    private final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private LoginService loginService;

    /**
     *
     * @param request
     * @return
     */

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        //destroy login cookies
        loginService.clearUsernameFromCookie(request,response);
        loginService.clearAdminFromCookie(request,response);
        loginService.clearDoctorFromCookie(request,response);

        return "redirect:/home";
    }

    /**
     *
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/index")
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) {


        String username = loginService.readUserNameFromCookie(request,response);


        if (username == null || username.equalsIgnoreCase("")){
            // return "userLogin";
        return USERLOGIN.toString();
        }else {
            //            request.setAttribute(USERNAME.toString(),username);
            return "redirect:/";
        }

    }

    /**
     *  this method used in Admin panel - Add Role
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/addRole")
    public String newRole (Model model,HttpServletRequest request) {

     List<RoleDto> roles = adminService.getRoles();

        request.setAttribute("role", roles);
        return "addRole";
    }

    /**
     * This method used in Admin Panel - add Permission
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/addPermission")
    public String newPermission (Model model, HttpServletRequest request) {

    List<String> permissions = adminService.getPermissions();

        request.setAttribute( "permission", permissions );
        return "addPermission";
    }

    /**
     *
     * @param username
     * @param pass
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "userloginvalidate", method = RequestMethod.POST)
    public String userloginvalidation(@RequestParam("username") String username, @RequestParam("password") String pass, Model model,HttpServletRequest request,HttpServletResponse response) {


           boolean foundUser = loginService.findUserByUsernameAndPassword(username,pass);

           if(foundUser){

                //------setup Cookie----------
                Cookie loginCookie = new Cookie("username",username);
                //setting cookie to expiry in 60 mins
//                loginCookie.setMaxAge(60*60*24);
               loginCookie.setMaxAge(3600); // 1 hour expiration
                response.addCookie(loginCookie);
                //-------end of setup the cookie------

//                request.setAttribute("username", username);

//                return "temp/index-03";
                return "redirect:/home";
            } else {
                model.addAttribute("message", "Invalid Username or Password");

                return USERLOGIN.toString();
            }


    }



    /**
     *
     * @param model
     * @return
     */
    @GetMapping("/loginvalidate")
    public String adminlog(Model model) {

        return "admin/adminlogin";
    }

    /**
     *
     * @param username
     * @param pass
     * @param model
     * @return
     */
    @RequestMapping(value = "loginvalidate", method = RequestMethod.POST)
    public String adminlogin(@RequestParam("username") String username, @RequestParam("password") String pass, Model model) {

        if (username.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("123")) {
            adminlogcheck = 1;
            return "redirect:adminhome";
        } else {
            model.addAttribute("message", "Invalid Username or Password");
            return "adminlogin";
        }
    }




    /**
     *
     * @return
     */
    @GetMapping("/admin/customers")
    public String getCustomerDetail() {
        return "displayCustomers";
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
    @RequestMapping(value = "updateuser", method = RequestMethod.POST)
    public String updateUserProfile(@RequestParam("userid") int userid, @RequestParam("username") String username, @RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("address") String address) {

      boolean status =  loginService.updateUser(userid,username,email,password,address);
        return "redirect:/index";
    }

    /**
     *
     * @param adminUsername
     * @param adminPassword
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "adminLoginValidate", method = RequestMethod.POST)
    public String adminLoginValidate(@RequestParam("adminUsername") String adminUsername, @RequestParam("adminPassword") String adminPassword, Model model, HttpServletRequest request, HttpServletResponse response) {
        Connection con = null;
        Statement stmt = null;
        ResultSet rst = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            stmt = con.createStatement();

            String query = ("SELECT id, username, password FROM users AS a WHERE a.username = ? AND a.password = ? AND a.id IN (SELECT user_id FROM user_roles WHERE role_id = 2)");
//            String query = ("select u.username,u.password from users as u where u.id in ( select user_id from user_roles where role_id=2 )");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, adminUsername);
            pstmt.setString(2, adminPassword);
            rst = pstmt.executeQuery();



            if (rst.next()) {

                //------setup Cookie----------
                Cookie loginCookie = new Cookie("adminCookie",usernameforclass);
                loginCookie.setValue(adminUsername);
                //setting cookie to expiry in 60 mins
                loginCookie.setMaxAge(60*60);
                response.addCookie(loginCookie);
                //-------end of setup the cookie------

                //add an activity log
                adminService.addActivity(adminUsername,"Logged-Admin","N/A");


                con.close();
                stmt.close();
                rst.close();
                return "redirect:/adminControl";
            } else {
                model.addAttribute("message", "Invalid Username or Password");
                con.close();
                stmt.close();
                rst.close();
                //     return "userLogin";
                return ADMINLOGIN.toString();
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

        return ADMINLOGIN.toString();
    }
    @GetMapping("/*")
    public String notFound() {
        return "404";
    }
    @GetMapping("NA")
    public String NA() {
        return "NA";
    }




}
