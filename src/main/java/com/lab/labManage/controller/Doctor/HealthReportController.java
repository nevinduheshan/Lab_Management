package com.lab.labManage.controller.Doctor;

import com.lab.labManage.dto.Health_reportDto;
import com.lab.labManage.service.HealthReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/health-report")
public class HealthReportController {

    private final HealthReportService healthReportService;


    @Autowired
    public HealthReportController(HealthReportService healthReportService) {
        this.healthReportService = healthReportService;
    }

    @GetMapping("/add")
    public String showAddReportForm(Model model) {
        return "allUsers";
    }

    @PostMapping("/save")
    public String saveHealthReport(Health_reportDto healthReport) {
        boolean saved = healthReportService.saveHealthReport(healthReport);

        if (saved) {
            return "redirect:/getAllUsers";
        } else {
            // can add an error message or redirect to an error page
            return "redirect:/health-report/add?error";
        }
    }

    @GetMapping("/get")
    public String getHealthReports(Model model,@RequestParam("userId") String userId) {
        // Fetch the health reports from the service
        List<Health_reportDto> healthReports = healthReportService.getAllHealthReports(userId);

        // Add the health reports to the model for display in the view
        model.addAttribute("healthReports", healthReports);

        // Return the view name (assuming you have a "healthReports.jsp" file)
        return "healthReports";
    }


    @GetMapping("/update-buy-status")
    public void updateBuyStatus(@RequestParam("report_Id") int reportId) {

    }

}
