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

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.annotation.WebServlet;	

/**
 * Servlet implementation class updateStudentServ
 */
@WebServlet("/updateStudentServ")
public class updateStudentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    		 String studName=request.getParameter("name");
			 String studAdm=request.getParameter("adm");
			 String studGender=request.getParameter("gender");
			 String studDob=request.getParameter("dob");
			 String studClass=request.getParameter("class");
			 String studRoll=request.getParameter("roll");
			 String studFather=request.getParameter("father_name");
			 String studMother=request.getParameter("mother_name");
			 String studAadhar=request.getParameter("aadhar");
			 
			 	try {
			 			Class.forName("com.mysql.jdbc.Driver");
			 			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
			 			String query = "UPDATE student SET SNAME=?, ADMDATE=?, SCLASS=?, SROLL=?, SDOB=?, FNAME=?, MNAME=?, AADHAR=?, GENDER=? WHERE SID=?";
					    PreparedStatement pstmt = con.prepareStatement(query);
					    
					    pstmt.setString(1, studName);
					    pstmt.setString(2, studAdm);
					    pstmt.setString(3, studClass);
					    pstmt.setString(4, studRoll);
					    pstmt.setString(5, studDob);
					    pstmt.setString(6, studFather);
					    pstmt.setString(7, studMother);
					    pstmt.setString(8, studAadhar);
					    pstmt.setString(9, studGender);
					    pstmt.setString(10, sId);

					    int rowsUpdated = pstmt.executeUpdate();
					    if (rowsUpdated > 0) {
					        request.setAttribute("alertMessage", "Thank you! Student details updated successfully.");
//					        Thread.sleep(10000);
					        RequestDispatcher dispatcher = request.getRequestDispatcher("viewStudent.jsp");
							dispatcher.forward(request, response);
					    } else {
					        request.setAttribute("alertMessage", "Update failed! Student ID not found.");
					        RequestDispatcher dispatcher = request.getRequestDispatcher("viewStudent.jsp");
							dispatcher.forward(request, response);
					    }
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
        	 	
        }
		
		
		
	}

}
