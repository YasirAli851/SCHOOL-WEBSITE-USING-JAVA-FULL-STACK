package com.yasir.web;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/logoutServ")
public class logoutServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		PrintWriter out=response.getWriter();
//		HttpSession session=request.getSession(true);
//		String FullName = (String) session.getAttribute("fullnameLogin");
//        String  EmailLogin= (String) session.getAttribute("emailLogin");
//        if (FullName != null && EmailLogin !=null) {
//            out.println(FullName+" "+EmailLogin);
//        } else {
//            out.println("Session expired. Please log in again.");
//        }
		 	HttpSession session = request.getSession(false); // Get the current session (don't create a new one if none exists)
	        if (session != null) {
	            session.invalidate(); // Invalidate the session
	            request.setAttribute("alertMessage", "Logged out Successfully!");
	            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
	        }
	        else
	        {
	        	request.setAttribute("alertMessage", "Session expired.Log in again.");
//	        	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//				dispatcher.forward(request, response);
	        }
	        
	        // Redirect to the login page after logging out
	        
	}


}
