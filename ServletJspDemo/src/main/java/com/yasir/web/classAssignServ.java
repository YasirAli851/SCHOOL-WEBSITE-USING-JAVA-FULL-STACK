package com.yasir.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class classAssignServ
 */
@WebServlet("/classAssignServ")
public class classAssignServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String TeacherName=request.getParameter("TeacherName");
		String ClassAssigned=request.getParameter("classtoteacher");
		 try {
			 Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
				Statement stmt=con.createStatement();
				String sql="INSERT INTO classTeacher (TNAME,CLASS) VALUES (?,?)";
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1,TeacherName);
				ps.setString(2,ClassAssigned);
				
				ps.executeUpdate();
				request.setAttribute("alertMessage", "Class assigned successfully.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("welcomeAdmin.jsp"); 
		        dispatcher.forward(request, response);
			 }
			 catch(Exception e)
			 {
				 out.println(e);
			 }
	}

}
