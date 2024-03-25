package com.lab.labManage.controller.contactus;

import com.lab.labManage.service.AdminService;
import com.lab.labManage.service.LoginService;
import com.lab.labManage.dto.ComplainDto;
import com.lab.labManage.dto.ContactUsDto;
import com.lab.labManage.service.ContactUsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class ContactusController {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Autowired
    private ContactUsService contactusService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private LoginService loginService;

    public static final StringBuilder USERNAME = new StringBuilder("username");

    /**
     * @param model
     * @return
     */
    @GetMapping("/ContactUS")
    public String ContactUs(Model model, HttpServletRequest request, HttpServletResponse response) {
        String username = loginService.readUserNameFromCookie(request, response);
        if (username != null) {
            request.setAttribute(USERNAME.toString(), username);
        }
        return "temp/contact-us";
    }


    @GetMapping("/MemberComplains")
    public String MemberComplains(Model model, HttpServletRequest request, HttpServletResponse response) {
        if (loginService.readAdminFromCookie(request,response) == null) {
            return "redirect:/adminControl";
        }
        List<ComplainDto> contactInfo = contactusService.getAllComplainInfo();
        request.setAttribute("complain_info", contactInfo);
        return "admin/MemberComplains";
    }

    @GetMapping("/memberMessages")
    public String memberMessages(Model model, HttpServletRequest request, HttpServletResponse response) {
        if (loginService.readAdminFromCookie(request,response) == null) {
            return "redirect:/adminControl";
        }
        List<ContactUsDto> messagers = contactusService.getAllContactUsInfo();
        request.setAttribute("contact_us", messagers);
        return "admin/membermessages";
    }

    @RequestMapping(value = "/saveContactMessage", method = RequestMethod.POST)
    public String saveContactMessage(@RequestParam("first_name") String first_name,
                                     @RequestParam("email_address") String email_address,
                                     @RequestParam("phone_number") Integer phone_number,
                                     @RequestParam("subject") String subject,
                                     @RequestParam("description") String description, HttpServletRequest request, HttpServletResponse response, Model model, RedirectAttributes redirectAttributes) {
        try {

            String username = loginService.readUserNameFromCookie(request, response);
            if (username != null) {
                request.setAttribute(USERNAME.toString(), username);
            }

            if (contactusService.saveMemberMessage(first_name, email_address, phone_number, subject, description)) {

                // Handle success case
                redirectAttributes.addFlashAttribute("successMessage", "Message saved successfully!");
                request.getSession().setAttribute("successMessageDisplayed", true);

                return "redirect:/ContactUS";
            } else {
                // Handle error case
                redirectAttributes.addFlashAttribute("errorMessage", "Message saved unsuccessful!");
                request.getSession().setAttribute("errorMessageDisplayed", true);
                return "redirect:/ContactUS";
            }
        } catch (Exception e) {
            // Handle exception case
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/saveComplainMessage", method = RequestMethod.POST)
    public String saveComplainMessage(@RequestParam("complainDescription") String complainDescription,
                                      @RequestParam("emailComplain") String emailComplain, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {

        try {

            String username = loginService.readUserNameFromCookie(request, response);
            if (username != null) {
                request.setAttribute(USERNAME.toString(), username);
            }

            if (contactusService.saveMemberComplain(complainDescription, emailComplain)) {

                // Handle success case
                redirectAttributes.addFlashAttribute("successComplain", "Complain saved successfully!");
                request.getSession().setAttribute("successComplainDisplayed", true);

                return "redirect:/ContactUS";
            } else {

                // Handle error case
                redirectAttributes.addFlashAttribute("errorComplain", "Complain saved unsuccessful!");
                request.getSession().setAttribute("errorComplainDisplayed", true);

                return "redirect:/ContactUS";
            }
        } catch (Exception e) {
            // Handle exception case
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "deleteComplain", method = RequestMethod.POST)
    public String deleteComplainFromAdminPanel(Model model, HttpServletRequest request, @RequestParam("complainId") String complainId) {

        if (complainId.contains("'")) {
            complainId = complainId.replaceAll("'", "");
        }
        boolean returnVal = contactusService.deleteComplain(complainId);

        List<ComplainDto> complainTable = contactusService.getAllComplainInfo();
        request.setAttribute("complainList", complainTable);

        request.setAttribute("message", "successfully delete Complain");

        if (returnVal) {
            return "redirect:/MemberComplains";
        } else {
            return "redirect:/MemberComplains";
        }
    }


    @RequestMapping(value = "deleteMessage", method = RequestMethod.POST)
    public String deleteMessageFromAdminPanel(Model model, HttpServletRequest request, @RequestParam("messageId") String messageId) {

        if (messageId.contains("'")) {
            messageId = messageId.replaceAll("'", "");
        }
        boolean returnVal = contactusService.deleteMessage(messageId);

        List<ContactUsDto> contactusTable = contactusService.getAllContactUsInfo();
        request.setAttribute("messageList", contactusTable);

        request.setAttribute("message", "successfully delete Message");

        if (returnVal) {
            return "redirect:/memberMessages";
        } else {
            return "redirect:/memberMessages";
        }
    }
}
