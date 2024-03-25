package com.lab.labManage.controller.Admin;

//import com.lab.labManage.dto.BlogDto;
import com.lab.labManage.dto.BookingInquiryRequestDto;
import com.lab.labManage.dto.Health_reportDto;
import com.lab.labManage.dto.RoleNameDto;
import com.lab.labManage.dto.UserDto;
import com.lab.labManage.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
public class TemplateController {

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
    private ClassesService classesService;

    @Autowired
    private UserService userService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private BookingInquiryRequestService bookingInquiryRequestService;

    @Autowired
    private HealthReportService healthReportService;

    @Autowired
    private PermissionService permissionService;

    //    public static final StringBuilder USERLOGIN = new StringBuilder("userLogin");
    public static final StringBuilder USERNAME = new StringBuilder("username");
    public static final StringBuilder USERID = new StringBuilder("users_id");

    @GetMapping("/indexone")
    public String indexone(Model model) {
        return "temp/index";
    }

    @GetMapping("/indextwo")
    public String indextwo(Model model) {
        return "temp/index-02";
    }

    /**
     * @param model
     * @return
     */
    @GetMapping("/aboutusone")
    public String aboutusone(Model model) {
        return "temp/about-us-01";
    }

    /**
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/aboutustwo")
    public String aboutustwo(Model model, HttpServletRequest request, HttpServletResponse response) {

        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null) {
            request.setAttribute(USERNAME.toString(), username);
        }

        return "temp/about-us-02";
    }

    /**
     * @param model
     * @return
     */
    @GetMapping("/ourteammember")
    public String ourteammember(Model model) {
        return "temp/";
    }

    /**
     * @param model
     * @return
     */
    @GetMapping("/teammemberdetails")
    public String teammemberdetails(Model model) {
        return "temp/team-member-details";
    }
    @GetMapping("/")
    public String landing(HttpServletRequest request, HttpServletResponse response) {
        return "../index";
    }
    @GetMapping("/home")
    public String home(HttpServletRequest request, HttpServletResponse response) {

        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null && !("").equals(username)) {
            request.setAttribute(USERNAME.toString(), username);
        }
        return "temp/index-03";
    }

    /**
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/ourclasses")
    public String ourclasses(Model model, HttpServletRequest request, HttpServletResponse response) {

        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null && !("").equals(username)) {
            request.setAttribute(USERNAME.toString(), username);
        }

        List<String> Classes = classesService.getAllClassesFromDB();
        request.setAttribute("classes", Classes);

        return "temp/ourClasses";

    }

    /**
     * @param model
     * @return
     */
    @GetMapping("/gridView")
    public String gridview(Model model) {
        return "temp/portfolio-grid-view";
    }

    /**
     * @param model
     * @return
     */
    @GetMapping("/singleDetail")
    public String singledetail(Model model) {
        return "temp/portfolio-single-detail-style";
    }

    /**
     * @param request
     * @return
     */
    @GetMapping("/memberProfile")
    public String memberProfile(HttpServletRequest request, HttpServletResponse response) {

        String usrname = loginService.readUserNameFromCookie(request, response);
        String users_id = loginService.readIdFromCookie(request, response);
        if (usrname != null || users_id != null) {
            request.setAttribute(USERNAME.toString(), usrname);
            request.setAttribute(USERID.toString(), users_id);

            UserDto userDto = adminService.getUserDetails(usrname);
            request.setAttribute("userinfo", userDto);

            List<BookingInquiryRequestDto> bookRequests = bookingInquiryRequestService.getBookingInquiryRequests(usrname);
            request.setAttribute("bookRequests", bookRequests);

            List<Health_reportDto> healthReport = healthReportService.getAllHealthReports(usrname);
            request.setAttribute("healthReport", healthReport);

            System.out.println("User ID from Cookie: " + users_id);


            return "temp/member-profile";
        } else {
            return "userLogin";
        }
    }


    /**
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/Membership")
    public String Membership(Model model, HttpServletRequest request, HttpServletResponse response) {

        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null) {
            request.setAttribute(USERNAME.toString(), username);
        }

        return "temp/membership-page";
    }

    /**
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/faq")
    public String Faq(Model model, HttpServletRequest request, HttpServletResponse response) {


        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null) {
            request.setAttribute(USERNAME.toString(), username);
        }
        return "temp/faq";
    }


    /**
     * for testing dynamics timetables
     *
     * @param request
     * @return
     */
    @GetMapping("/Personal-Doctor")
    public String personal(HttpServletRequest request, HttpServletResponse response) {
        List<UserDto> doctors = oldDoctorService.getAllDoctorsInfo();
        request.setAttribute("doctors", doctors);

        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null) {
            request.setAttribute(USERNAME.toString(), username);
            List<RoleNameDto> roleNameDtos = userService.getRoleFromUsername(username);
            RoleNameDto role = roleNameDtos.get(0);
            request.setAttribute("roleId", role.getRoleid());
        }
        return "temp/personal";
    }
}
