package com.lab.labManage.controller.Admin;

import com.lab.labManage.service.validation.CredentialValidations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.Calendar;


@Controller
public class UserController {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Autowired
    private CredentialValidations credentialValidations;

    @GetMapping("/register")
    public String registerUser(HttpServletRequest request) {
        String msg = request.getParameter("message");
        request.setAttribute("message", msg );
        return "register";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @GetMapping("/buy")
    public String buy() {
        return "buy";
    }



//    @GetMapping("/user/products")
//    public String getproduct(Model model) {
//        return "uproduct";
//    }

    @RequestMapping(value = "newuserregister", method = RequestMethod.GET)
    public String newUseRegister() {
        return "redirect:/register";
    }
    @RequestMapping(value = "newuserregister", method = RequestMethod.POST)
    public String newUseRegister(@RequestParam("first_name") String first_name, @RequestParam("last_name") String last_name, @RequestParam("phone") String phone, @RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("email") String email, HttpServletRequest request) {
        try {
            if(first_name.isEmpty() || last_name.isEmpty() || phone.isEmpty() || username.isEmpty() || password.isEmpty() || email.isEmpty()){
                request.setAttribute("invalidMessage", "Please fill all the fields");
                return "register";
            }
            // Validate password
            if(!credentialValidations.strongPassword(password).equals("valid")){
                request.setAttribute("invalidMessage", credentialValidations.strongPassword(password));
                return "register";
            }
            // Validate phoneNumber
            if(!credentialValidations.validMobile(phone).equals("valid")){
                request.setAttribute("invalidMessage", credentialValidations.validMobile(phone));
                return "register";
            }

            Connection con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
            Connection con2 = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);

            Statement stmt = null;
            stmt = con2.createStatement();
            ResultSet rst = stmt.executeQuery("select * from users where username='" + username + "' or email = '" + email + "' ;");
            if (rst.next()) {
                request.setAttribute("invalidMessage", "Username or Email already exist");
                return "register";
            }
            PreparedStatement pst = con.prepareStatement("insert into users(first_name,last_name,mobile,email,username,password,created_at,updated_at) values(?,?,?,?,?,?,?,?);");

            pst.setString(1, first_name);
            pst.setString(2, last_name);
            pst.setString(3, phone);
            pst.setString(4, email);
            pst.setString(5, username);
            pst.setString(6, password);
            Calendar cals = Calendar.getInstance();
            java.util.Date today =  cals.getTime();
            java.sql.Date sqlDate = new Date(today.getYear(),today.getMonth(),today.getDate());
            pst.setDate(7,sqlDate);
            pst.setDate(8,sqlDate);

            //pst.setString(4, address);
            int i = pst.executeUpdate();
            System.out.println("data base updated" + i);

            request.setAttribute("message", username +" registration successfully " );
            request.setAttribute("firstname",first_name);
            request.setAttribute("lastname", last_name);
            request.setAttribute("phone",phone);
            request.setAttribute("email",email);
            request.setAttribute("username",username);

        }catch(SQLIntegrityConstraintViolationException sqlIntConEx){

            request.setAttribute("message", " Already register for this Email address:" + email );
            return "register";
        }
        catch (Exception e) {
            System.out.println("Exception:" + e);
            request.setAttribute("message", username +  e.getMessage() );
            return "register";
        }
        request.setAttribute("success","true");
        return "register";
    }
}
