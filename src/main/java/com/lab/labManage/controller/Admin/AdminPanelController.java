package com.lab.labManage.controller.Admin;

import com.lab.labManage.dto.OldDoctorTimeTableDto;
import com.lab.labManage.dto.ReschedulingDto;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;

import static com.lab.labManage.controller.Admin.AdminController.USERLOGIN;

/**
 * This class used to support Admin Panel
 */
@Controller
public class AdminPanelController {

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
    private UserService userservice;

    @Autowired
    private ContactUsService contactUsService;

    @Autowired
    private LoginService loginService;

    //Constant declaration
    public static final StringBuilder USERNAME = new StringBuilder("username");
    public static final StringBuilder ADMIN = new StringBuilder("admin");

    /**
     * This method used to load Admin Panel
     *
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/adminControl")
    public String adminControl(Model model, HttpServletRequest request, HttpServletResponse response) {

        String usrname = loginService.readAdminFromCookie(request, response);
        if (usrname != null) {
            request.setAttribute(USERLOGIN.toString(), usrname);
        } else {
            return "adminLogin";
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

        return "admin/adminControl";
    }

    /**
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/appointments")
    public String appointments(Model model, HttpServletRequest request, HttpServletResponse response) {

        if (loginService.readAdminFromCookie(request, response) == null) {
            return "redirect:/adminControl";
        }

        List<String> doctors = adminService.getAllDoctors();
        request.setAttribute("doctors", doctors);

        List<String> Classes = classesService.getAllClassesFromDB();
        request.setAttribute("classes", Classes);

        List<OldDoctorTimeTableDto> doctortimetables = oldDoctorService.getAllDoctorTimeTable();
        request.setAttribute("doctorTimetables", doctortimetables);

        return "admin/appointments";
    }

    /**
     * This method used to add Permission in the Admin Panel
     *
     * @param model
     * @param request
     * @return
     */
    @GetMapping("/addPermissions")
    public String addPermissions(Model model, HttpServletRequest request, HttpServletResponse response) {
        if (loginService.readAdminFromCookie(request, response) == null) {
            return "redirect:/adminControl";
        }
        List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("role", roles);

        List<String> permissions = adminService.getPermissions();
        request.setAttribute("permissions", permissions);

        return "admin/addPermissions";
    }


    @GetMapping("/userManager")
    public String userManager(Model model, HttpServletRequest request, HttpServletResponse response) {
        if (loginService.readAdminFromCookie(request, response) == null) {
            return "redirect:/adminControl";
        }

        List<UserDto> users = userservice.getAllUserInfo();
        request.setAttribute("users", users);

        List<RoleDto> roles = adminService.getRoles();
        request.setAttribute("role", roles);

        return "admin/userManager";
    }


    /**
     * This method used to Add Role in the Admin Panel
     *
     * @param request
     * @param selectedUserIdAdd
     * @param selectedRole
     * @return
     */
    @RequestMapping(value = "addRoleFromAdminPanel", method = RequestMethod.POST)
    public String addRoleFromAdminPanel(HttpServletRequest request, @RequestParam("selectedUserIdAdd") String selectedUserIdAdd, @RequestParam("role") String selectedRole, @RequestParam("description") String description) {

        if (description.isEmpty()) {
            description = "N/A";
        }
        boolean returnval = adminService.addRoleService(Integer.parseInt(selectedUserIdAdd), Integer.parseInt(selectedRole), description);

        if (returnval) {
            return "redirect:/userManager?addRole=true";
        } else {
            return "redirect:/userManager?addRole=false";
        }
    }
    /**
     * delete user from admin panel
     *
     * @param model
     * @param request
     * @param selectedUserId
     * @return
     */
    @RequestMapping(value = "/deleteUserFromAdminPanel", method = RequestMethod.POST)
    public String deleteUserFromAdminPanel(Model model, HttpServletRequest request, @RequestParam("selectedUserId") String selectedUserId, @RequestParam("adminUsername") String adminUsername) {
        if (selectedUserId != null) {
            Connection con = null;
            Statement stmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
                stmt = con.createStatement();

                // Check if references exist in the child table
                ResultSet resultSet = stmt.executeQuery("SELECT COUNT(*) FROM user_roles WHERE user_id='" + selectedUserId + "';");
                resultSet.next();
                int rowCount = resultSet.getInt(1);

                if (rowCount > 0) {
                    // Delete the references in the child table
                    int rowsAffected = stmt.executeUpdate("DELETE FROM user_roles WHERE user_id='" + selectedUserId + "';");
                    if (rowsAffected < 1) {
                        return "redirect:/userManager?deleteUser=false";
                    }
                }

                // Delete the user from the main table
                int rowsAffected = stmt.executeUpdate("DELETE FROM users WHERE id='" + selectedUserId + "';");
                if (rowsAffected > 0) {
                    adminService.addActivity(adminUsername, "Deleted-User-Panel", "userid: " + selectedUserId);
                }

                con.close();
                stmt.close();
            } catch (Exception ex) {
                ex.printStackTrace();
                return "redirect:/userManager?deleteUser=false";
            }

        }


        return "redirect:/userManager?deleteUser=true";
    }

    /**
     * update user role from admin panel
     *
     * @param model
     * @param request
     * @param selectedUserId
     * @return
     */
    @RequestMapping(value = "/updateUserRoleFromAdminPanel", method = RequestMethod.POST)
    public String updateUserRoleFromAdminPanel(Model model, HttpServletRequest request, @RequestParam("selectedUserIds") String selectedUserId, @RequestParam("selectedRoleId") String selectedRoleId, @RequestParam("updateDescription") String updateDescription) {

        int iSelectedUserId = 0;
        int iSelectedRoleId = 0;
        boolean returnval = false;
        if (selectedUserId != null && selectedRoleId != null) {
            selectedUserId = selectedUserId.replaceAll("'", "");
            selectedRoleId = selectedRoleId.replaceAll("'", "");
            iSelectedUserId = Integer.parseInt(selectedUserId);
            iSelectedRoleId = Integer.parseInt(selectedRoleId);

            if (updateDescription.isEmpty()) {
                updateDescription = "N/A";
            }
            returnval = userservice.updateUserRoleFromAdminPanel(iSelectedUserId, iSelectedRoleId, updateDescription);
        }

        if (returnval) {
            return "redirect:/userManager?updateRole=true";
        } else {
            return "redirect:/userManager?updateRole=false";
        }

    }

    @GetMapping("/reschedulingRequest")
    public String reschedulingRequest(HttpServletRequest request, HttpServletResponse response) {

        if (loginService.readAdminFromCookie(request, response) == null) {
            return "redirect:/adminControl";
        }

        List<ReschedulingDto> reschedulingRequests = adminService.getReschedulingRequest();
        request.setAttribute("reschedulingRequests", reschedulingRequests);

        return "admin/reschedulingRequest";


    }

    @RequestMapping(value = "/BookingApproval", method = RequestMethod.POST)
    public String updateBookRequests(HttpServletRequest request, @RequestParam("bookId") String bookId, @RequestParam("approval") String approval) {

        boolean returnval = false;
        if (bookId != null && approval != null) {
            returnval = adminService.updateBookRequests(Integer.parseInt(bookId), approval);

            if (returnval) {
                return "redirect:/memberBookingInquiry?success=true";
            } else {
                return "redirect:/memberBookingInquiry?success=false";
            }

        }
        return "404";
    }

    @RequestMapping(value = "updatestatus", method = RequestMethod.POST)
    public String updateReschedulingRequest(HttpServletRequest request, @RequestParam("req_id") String req_id, @RequestParam("status") String status) {

        boolean returnval = false;
        if (req_id != null && status != null) {
            returnval = adminService.updateReschedulingRequest(Integer.parseInt(req_id), status);

            if (returnval) {
                return "redirect:/reschedulingRequest?success=true";
            } else {
                return "redirect:/reschedulingRequest?success=false";
            }

        }
        return "404";
    }


}
