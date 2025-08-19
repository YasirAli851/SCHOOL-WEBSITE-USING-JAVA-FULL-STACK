package com.yasir.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class OtpValidate
 */
@WebServlet("/otpValidate")
public class otpValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String otpReceived=request.getParameter("otp");
		HttpSession session = request.getSession(true);
		
		String name=(String) session.getAttribute("fullname");
		String otpFromSession=(String)session.getAttribute("otp");
		String emailFromSession=(String)session.getAttribute("email");
		if(otpReceived.equals(otpFromSession))
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
				String query = "UPDATE userInfo SET ISACTIVATED = 1 WHERE EMAIL = ?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, emailFromSession);
				pstmt.executeUpdate();
				request.setAttribute("alertMessage", "Thank You "+name+" OTP VERIFIED SUCCESSFULLY.YOU WILL BE REDIRECTED TO LOGIN PAGE.");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			catch(Exception e)
			{
				
			}
			
		}
		else
		{
			request.setAttribute("alertMessage", "OOPS! YOU HAVE ENTERED WRONG OTP.CLOSE THIS BOX TO GO BACK AND RE-ENTER THE OTP.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("otpValidation.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}