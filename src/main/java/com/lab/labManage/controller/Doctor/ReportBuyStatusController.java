package com.lab.labManage.controller.Doctor;

import com.lab.labManage.dto.Health_reportDto;
import com.lab.labManage.service.HealthReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;


@Controller
public class ReportBuyStatusController {

    @Autowired
    private HealthReportService healthReportService;

    @RequestMapping(value = "/updateReportBuyStatus", method = RequestMethod.POST)
    public ResponseEntity<byte[]> updateReportBuyStatus(Model model, HttpServletRequest request,
                                                        @RequestParam("report_Id") String report_id) {
        try {
            int reportIdInt = Integer.parseInt(report_id); // Convert reportId to integer

            // Update the buy status to 2
            boolean updated = healthReportService.updateBuyStatus(reportIdInt);

            if (updated) {
                // Success message
                model.addAttribute("message", "Buy status updated successfully.");
                List<Health_reportDto> healthReport = healthReportService.getHealthReportbyId(reportIdInt);
                byte[] pdfContent = healthReportService.generatePDF(healthReport);
                HttpHeaders headers = new HttpHeaders();
                headers.setContentType(MediaType.APPLICATION_PDF);
                headers.setContentDispositionFormData("attachment", "ReportID_"+report_id+".pdf"); // Change the file name if needed

                return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
            } else {
                // Error message if update fails
                model.addAttribute("error", "Failed to update buy status.");
            }
        } catch (NumberFormatException | IOException e) {
            // Handle parsing errors
            model.addAttribute("error", "Invalid report ID or buy status.");
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}
