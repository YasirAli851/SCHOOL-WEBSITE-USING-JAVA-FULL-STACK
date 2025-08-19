package com.yasir.web;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.*;
import java.io.*;

@WebServlet("/sendEmailServlet")
public class sendEmailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
////		response.getWriter().append("Served at: ").append(request.getContextPath());
//		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
//
//        // Sender's email ID
        String senderEmail = "yasir128.ali@gmail.com";
        String recipientEmail = "naazwahida768@gmail.com";
        String subject = "Test Email";
        String messageText = "This is a test email.";

        // SMTP server setup
        String host = "smtp.gmail.com";
        final String username = "";
        final String password = "";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Get the Session object.
        Session session = Session.getInstance(properties,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
            message.setSubject(subject);
            message.setText(messageText);

            // Send the message
            Transport.send(message);
            out.println("<h3>Email sent successfully</h3>");
        } catch (MessagingException mex) {
            mex.printStackTrace();
            out.println("<h3>Error sending email: " + mex.getMessage() + "</h3>");
        }
        
        
//
	}
	


}
