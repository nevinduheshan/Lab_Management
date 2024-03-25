package com.lab.labManage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {

//    private final JavaMailSender javaMailSender;
//
//    @Autowired
//    public MailService(JavaMailSender javaMailSender) {
//        this.javaMailSender = javaMailSender;
//    }
//
//    public void sendMail(String toEmail, String subject, String body) {
//        try {
//            SimpleMailMessage message = new SimpleMailMessage();
//            message.setFrom("sanija@gmail.com"); // Set your from email address
//            message.setTo(toEmail);
//            message.setText(body);
//            message.setSubject(subject);
//
//            javaMailSender.send(message);
//            System.out.println("Mail Sent Successfully to: " + toEmail);
//        } catch (Exception e) {
//            System.err.println("Failed to send email to " + toEmail + ": " + e.getMessage());
//            // Log the exception or handle it according to your application's requirements
//        }
//    }
}
