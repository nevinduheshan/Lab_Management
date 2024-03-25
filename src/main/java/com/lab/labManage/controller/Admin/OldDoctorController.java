package com.lab.labManage.controller.Admin;

import com.lab.labManage.dto.OldDoctorTimeTableDto;
import com.lab.labManage.service.LoginService;
import com.lab.labManage.service.ClassesService;
import com.lab.labManage.service.OldDoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class OldDoctorController {

    @Value("${datasource.url}")
    private String databaseUrl;

    @Value("${datasource.username}")
    private String databaseUsername;

    @Value("${datasource.password}")
    private String databasePassword;

    @Value("${image.url}")
    private String promotionImagePath;

    @Autowired
    private OldDoctorService oldDoctorService;

    @Autowired
    private ClassesService classesService;

    @Autowired
    private LoginService loginService;


    /**
     * This is the end point used to send reschedule request to admin
     *
     * @param request
     * @param doctorUname
     * @param selectedDate
     * @param selectedTime
     * @return
     */

    @RequestMapping(value = "/rescheduleRequest", method = RequestMethod.POST)
    public String rescheduleRequest(HttpServletRequest request, @RequestParam("doctorUname") String doctorUname, @RequestParam("selectedDate") String selectedDate, @RequestParam("selectedTime") String selectedTime) throws ParseException {

        DateFormat inputDateFormat = new SimpleDateFormat("EEEE, M/d/yyyy");
        DateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = outputDateFormat.format(inputDateFormat.parse(selectedDate));

        boolean returnval = oldDoctorService.saveRescheduleRequest(doctorUname, formattedDate, selectedTime);

        if (returnval) {
            return "redirect:/Personal-Doctor?success=true";
        } else {
            return "redirect:/Personal-Doctor?success=false";
        }

    }


    /**
     * This is the rest end point used to Add Doctor Appointment
     *
     * @param request
     * @param selecteddoctorUsername
     * @param doctorAppointmentDate
     * @param startTime
     * @param endTime
     * @return
     */

    @RequestMapping(value = "addDoctorAppointment", method = RequestMethod.POST)
    public String addDoctorAppointment(HttpServletRequest request, @RequestParam("selecteddoctorUsername") String selecteddoctorUsername, @RequestParam("doctor_appointment_date") String doctorAppointmentDate, @RequestParam("start_time") String startTime, @RequestParam("end_time") String endTime, @RequestParam("doctor_class") String doctorClass) {


        boolean returnval = oldDoctorService.saveDoctorTimeTable(selecteddoctorUsername, doctorAppointmentDate, startTime, endTime, doctorClass);


        if (returnval) {
            return "redirect:/appointments?success=true";
        } else {

            return "redirect:/appointments?success=false";
        }

    }

    /**
     * This method is used to book Doctor
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/bookDoctor", method = RequestMethod.POST)
    public String bookDoctor(Model model, HttpServletRequest request,@RequestParam("userUsername") String userUsername, @RequestParam("doctorUname") String doctorUsername, @RequestParam("selectedDate") String selectedDate, @RequestParam("selectedTime") String selectedTime, @RequestParam("selectedClass") String selectedClass) {

        String formattedDate = null;
        String inputFormat = "EEEE, M/d/yyyy";
        String outputFormat = "yyyy-MM-dd";
        try {
            SimpleDateFormat inputDateFormat = new SimpleDateFormat(inputFormat);
            SimpleDateFormat outputDateFormat = new SimpleDateFormat(outputFormat);
            Date date = inputDateFormat.parse(selectedDate);
            formattedDate = outputDateFormat.format(date);
        } catch (ParseException e) {
            System.out.println("Error parsing date: " + e.getMessage());
            return "redirect:/ourclasses?success=false";
        }

        boolean returnval = oldDoctorService.saveBookInquiry(userUsername, doctorUsername, formattedDate, selectedTime, selectedClass);

        if (returnval) {
            return "redirect:/ourclasses?success=true";
        } else {
            return "redirect:/ourclasses?success=false";
        }
    }


    /**
     * This method use to delete Doctor Appointment
     *
     * @param model
     * @param request
     * @param doctorAppointmentId
     * @return
     */
    @RequestMapping(value = "deleteDoctorAppointment", method = RequestMethod.POST)
    public String deleteRoleFromAdminPanel(Model model, HttpServletRequest request, @RequestParam("doctorsheduleId") String doctorAppointmentId) {

        if (doctorAppointmentId.contains("'")) {
            doctorAppointmentId = doctorAppointmentId.replaceAll("'", "");
        }
        boolean returnval = oldDoctorService.deleteDoctorTimeTable(doctorAppointmentId);

        List<OldDoctorTimeTableDto> doctortimetables = oldDoctorService.getAllDoctorTimeTable();
        request.setAttribute("doctorTimetables", doctortimetables);

        request.setAttribute("message", "successfully delete selected Doctor schedule");

        if (returnval) {

            //     request.setAttribute("enableAddRole", "true");
            return "admin/appointments";
        } else {
            return "admin/appointments";
        }

    }


}
