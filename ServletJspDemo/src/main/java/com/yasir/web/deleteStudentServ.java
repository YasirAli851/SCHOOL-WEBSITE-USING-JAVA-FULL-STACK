package com.yasir.web;

import java.io.IOException;
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

@WebServlet("/deleteStudentServ")
public class deleteStudentServ extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(true);
		String fullName = (String) session.getAttribute("fullnameLogin");
        String emailLogin = (String) session.getAttribute("emailLogin");
        if (fullName == null && emailLogin == null) {
        	request.setAttribute("alertMessage", "Oops! You have been logged out,kindly login again to submit the student details.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
        }
        else
        {
        	
    		String sId=request.getParameter("SID");
    		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
				String query="delete from student where SID=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, sId);
				int row_effected=pstmt.executeUpdate();
				if(row_effected > 0)
				{
					request.setAttribute("alertMessage", "student deleted successfully!");
//			        Thread.sleep(10000);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("welcomeAdmin.jsp");
					dispatcher.forward(request, response);
				}
				else
				{
					request.setAttribute("alertMessage", "could not delete student!");
//			        Thread.sleep(10000);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
					dispatcher.forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 			
        }
		
		
	}

}
