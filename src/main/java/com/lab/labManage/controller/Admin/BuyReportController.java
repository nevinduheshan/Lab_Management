package com.lab.labManage.controller.Admin;

import com.lab.labManage.dto.ContactUsDto;
import com.lab.labManage.dto.Health_reportDto;
import com.lab.labManage.service.HealthReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class BuyReportController {

    @Autowired
    private HealthReportService healthReportService;



    @GetMapping("/buy-report")
    public String buyReport(@RequestParam("reportId") int reportId, Model model) {
        // Assuming you have a method to fetch report details by ID from your service
        Health_reportDto healthReport = healthReportService.getReportById(reportId);

        if (healthReport == null) {
            // Handle case where report is not found, e.g., redirect to the member profile page
            return "redirect:/memberProfile"; // Redirect to the member profile page
        }

        // Add the health report object to the model to pass it to the buy-report.jsp page
        model.addAttribute("healthReport", healthReport);

        // Return the view name for the buy-report.jsp page
        return "/temp/buy-report"; // Replace "/temp/buy-report" with the correct path to your buy-report.jsp file
    }
}
