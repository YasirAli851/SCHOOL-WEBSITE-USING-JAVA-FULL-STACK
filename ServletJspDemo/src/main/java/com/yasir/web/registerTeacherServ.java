package com.yasir.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Key;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;

import javax.crypto.spec.SecretKeySpec;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/registerTeacherServ")

public class registerTeacherServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String ALGORITHM = "AES";
    private static final byte[] keyValue = "1234567891234567".getBytes();
    private static Key generateKey() throws Exception {
        Key key = new SecretKeySpec(keyValue, ALGORITHM);
        return key;
    }
    public registerTeacherServ() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public static void sendEmail(String recEmail,String recOtp,String recName)
    {
//    	PrintWriter out=response.getWriter();
    	String senderEmail = "yasir128.ali@gmail.com";
        String recipientEmail = recEmail;
        String subject = "Otp for registration";
        String messageText = "hi "+recName+ " here's the otp for the registration : "+recOtp;

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
//            out.println("<h3>Email sent successfully</h3>");
        } catch (MessagingException mex) {
            mex.printStackTrace();
//            out.println("<h3>Error sending email: " + mex.getMessage() + "</h3>");
        }
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int isActivated=0;
		String usertype=request.getParameter("usertype");
		String fullname=request.getParameter("fullname");
		String gender=request.getParameter("gender");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String passWord=request.getParameter("password");
		PrintWriter out=response.getWriter();
		
		try
		{
			AES a=new AES();
			Key key = generateKey();
			passWord=a.encrypt(passWord,key);
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
			Statement stmt=con.createStatement();
			String sql="insert into userInfo values(?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,usertype);
			ps.setString(2,fullname);
			ps.setString(3,gender);
			ps.setString(4,mobile);
			ps.setString(5,email);
			ps.setString(6,passWord);
			ps.setInt(7, isActivated);
			
			ps.executeUpdate();
			
			Random random = new Random();
	        int randomNumber = 100000 + random.nextInt(900000);
	        String rnum=String.valueOf(randomNumber);
	        sendEmail(email,rnum,fullname);
	        
	        HttpSession session=request.getSession(true);
			
	        session.setAttribute("otp", rnum);
			session.setAttribute("fullname", fullname);
			session.setAttribute("email",email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("otpValidation.jsp"); 
	        dispatcher.forward(request, response);
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
