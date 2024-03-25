package com.lab.labManage.controller.Booking;

import com.lab.labManage.dto.BookingInquiryRequestDto;
import com.lab.labManage.service.LoginService;
import com.lab.labManage.dto.BookingRequestStatusEnum;
import com.lab.labManage.service.BookingInquiryRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookingInquiryRequestController {

    @Autowired
    private BookingInquiryRequestService bookingInquiryRequestService;

    @Autowired
    private LoginService loginService;

    /**
     * This method is used to load the booking inquiry
     *
     * @return
     */
    @GetMapping("/memberBookingInquiry")
    public String memberBookingInquiry(Model model, HttpServletRequest request, HttpServletResponse response) {

        if (loginService.readAdminFromCookie(request,response) == null) {
            return "redirect:/adminControl";
        }
        List<BookingInquiryRequestDto> bookingInquiryRequests = bookingInquiryRequestService.getBookingInquiryRequests("all");;
        request.setAttribute("BookingInquiries",bookingInquiryRequests);

        return "admin/memberInquiry";
    }



    /**
     * This method is used to load the booking inquiry By Status
     *
     * @return
     */
    @RequestMapping(value = "/memberBookingInquiryByStatus", method = RequestMethod.POST)
    public String memberBookingInquiryByStatus(Model model, HttpServletRequest request,@RequestParam("selectedStatus") String selectedStatus ) {

        //  bookingInquiryRequestService.getAllBookingInquiryRequest();

        List<String> BookingInquiryRequestStatus = new ArrayList<String>();
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.APPROVED.name() );
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.REJECTED.name() );
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.PENDING.name() );
        request.setAttribute("BookingInquiryRequestStatusList",BookingInquiryRequestStatus);

        request.setAttribute("selectedStatus",selectedStatus);

        List<BookingInquiryRequestDto> bookingInquiryRequests = bookingInquiryRequestService.getBookingInquiryRequestByStatus(selectedStatus);
        request.setAttribute("bookingInquiryRequests",bookingInquiryRequests);

        return "admin/memberInquiry";
    }


    /**
     * This method is used to Approve booking inquiry
     *
     * @return
     */
    @RequestMapping(value = "/memberBookingApprove", method = RequestMethod.POST)
    public String memberBookingInquiryApprove(Model model, HttpServletRequest request,@RequestParam("bookingInquiryApproveId") String bookingInquiryApproveId ) {

        //  bookingInquiryRequestService.getAllBookingInquiryRequest();

        List<String> BookingInquiryRequestStatus = new ArrayList<String>();
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.APPROVED.name() );
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.REJECTED.name() );
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.PENDING.name() );
        request.setAttribute("BookingInquiryRequestStatusList",BookingInquiryRequestStatus);

     //   String sBookingInquiryApproveId = request.getParameter("bookingInquiryApproveId");
        int bookingInquiryId = Integer.parseInt(bookingInquiryApproveId);
       boolean returnStatus = bookingInquiryRequestService.approveBookingInquiryRequest(bookingInquiryId);

        if(returnStatus) {
            request.setAttribute("bookingInquiryApproveStatus", "success");
        }else{
            request.setAttribute("bookingInquiryApproveStatus", "failure");
        }

  //      List<BookingInquiryRequestDto> bookingInquiryRequests = bookingInquiryRequestService.getBookingInquiryRequestByStatus(selectedStatus);;
   //     request.setAttribute("bookingInquiryRequests",bookingInquiryRequests);

        List<BookingInquiryRequestDto> bookingInquiryRequests = bookingInquiryRequestService.getBookingInquiryRequests("all");;

        request.setAttribute("bookingInquiryRequests",bookingInquiryRequests);

        return "admin/memberInquiry";
    }


    /**
     * This method is used to Reject booking inquiry
     *
     * @return
     */
    @RequestMapping(value = "/memberBookingReject", method = RequestMethod.POST)
    public String memberBookingInquiryReject(Model model, HttpServletRequest request,@RequestParam("bookingInquiryRejectId") String bookingInquiryRejectId ) {

        //  bookingInquiryRequestService.getAllBookingInquiryRequest();

        List<String> BookingInquiryRequestStatus = new ArrayList<String>();
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.APPROVED.name() );
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.REJECTED.name() );
        BookingInquiryRequestStatus.add( BookingRequestStatusEnum.PENDING.name() );
        request.setAttribute("BookingInquiryRequestStatusList",BookingInquiryRequestStatus);

        int bookingInquiryId = Integer.parseInt(bookingInquiryRejectId);
        boolean returnStatus = bookingInquiryRequestService.rejectBookingInquiryRequest(bookingInquiryId);

        if(returnStatus) {
            request.setAttribute("bookingInquiryRejectStatus", "success");
        }else{
            request.setAttribute("bookingInquiryRejectStatus", "failure");
        }

        List<BookingInquiryRequestDto> bookingInquiryRequests = bookingInquiryRequestService.getBookingInquiryRequests("all");;
        request.setAttribute("bookingInquiryRequests",bookingInquiryRequests);

        return "admin/memberInquiry";
    }


}
