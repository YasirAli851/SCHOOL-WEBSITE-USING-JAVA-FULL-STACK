package com.yasir.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class markAttendanceServ
 */
@WebServlet("/markAttendanceServ")
public class markAttendanceServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sname=request.getParameter("studentName");
		String sid=request.getParameter("studentId");
		String sclass=request.getParameter("studentClass");
		String attdat=request.getParameter("attendanceDate");
		String attsta=request.getParameter("attendanceStatus");
		PrintWriter out=response.getWriter();
		
		java.sql.Date sqlDate = java.sql.Date.valueOf(attdat);

//		out.println("student name is "+sname);
//		out.println("student id is "+sid);
//		out.println("student class is "+sclass);
//		out.println("student attendance date is "+sqlDate);
//		out.println("student attendance status is "+attsta);
		
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
			Statement stmt=con.createStatement();
			String sql="INSERT INTO studentAttendance (ID,CLASS,DATE,STATUS) VALUES (?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,sid);
			ps.setString(2,sclass);
			ps.setDate(3,sqlDate);
			ps.setString(4,attsta);
			
			ps.executeUpdate();
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

}
