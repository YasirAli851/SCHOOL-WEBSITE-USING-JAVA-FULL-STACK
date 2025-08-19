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

/**
 * Servlet implementation class studentRegisterServ
 */
@WebServlet("/studentRegisterServ")
public class studentRegisterServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession(true);
		 String fullName = (String) session.getAttribute("fullnameLogin");
		 String emailLogin = (String) session.getAttribute("emailLogin");
		 PrintWriter out = response.getWriter();
		 if(fullName==null && emailLogin==null)
		 {
			 	request.setAttribute("alertMessage", "Oops! You have been logged out,kindly login again to submit the student details.");
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
		 }
		 else
		 {
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
				Statement stmt=con.createStatement();
				String sql="INSERT INTO student (SNAME,ADMDATE,SCLASS,SROLL,SDOB,FNAME,MNAME,AADHAR,GENDER) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,studName);
				ps.setString(2,studAdm);
				ps.setString(3,studClass);
				ps.setString(4,studRoll);
				ps.setString(5,studDob);
				ps.setString(6,studFather);
				ps.setString(7,studMother);
				ps.setString(8,studAadhar);
				ps.setString(9,studGender);
				
				ps.executeUpdate();
				request.setAttribute("alertMessage", "Student added successfully.Please close this box");
				RequestDispatcher dispatcher = request.getRequestDispatcher("welcomeAdmin.jsp"); 
		        dispatcher.forward(request, response);
			 }
			 catch(Exception e)
			 {
				 out.println(e);
			 }
		 }
	}


}
