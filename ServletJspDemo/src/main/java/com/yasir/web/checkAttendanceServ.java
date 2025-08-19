package com.yasir.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;
//
///**
// * Servlet implementation class checkAttendanceServ
// */
//@WebServlet("/checkAttendanceServ")
//public class checkAttendanceServ extends HttpServlet {
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String sid=request.getParameter("studentId");
//		String sname=request.getParameter("studentName");
//		String sroll=request.getParameter("studentRoll");
//		String sclass=request.getParameter("studentClass");
//		String attdat=request.getParameter("attdatecheck");
//		PrintWriter out=response.getWriter();
//		out.println("Attendance is being checked for:");
//		out.println("NAME :"+sname);
//		out.println("ROLL :"+sroll);
//		out.println("CLASS :"+sclass);
//		out.println("ID :"+sid);
//		out.println("DATE :"+attdat);
//		
//		try
//		{
//			out.println();
//			out.println();
//			out.println();
//			
//			out.println("Attendance result is shown below :");
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
//			Statement stmt=con.createStatement();
//			ResultSet rs=stmt.executeQuery("select * from studentAttendance where ID = ' " + sid + " ' AND DATE= ' " + attdat + " '  ");
//			if(rs.next())
//			{
//				out.println("NAME "+sname);
//				out.println("ID "+rs.getString("ID"));
//				out.println("CLASS "+rs.getString("CLASS"));
//				out.println("DATE "+rs.getString("DATE"));
//				out.println("STATUS OF THE ATTENDANCE "+rs.getString("STATUS"));
//			}
//		}
//		catch(Exception e)
//		{
//			out.println(e);
//		}
//	}
//
//}



@WebServlet("/checkAttendanceServ")
public class checkAttendanceServ extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("studentId");
		String sname = request.getParameter("studentName");
		String sroll = request.getParameter("studentRoll");
		String sclass = request.getParameter("studentClass");
		String attdat = request.getParameter("attdatecheck");

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1", "root", "121Yasir@123");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM studentAttendance WHERE ID = '" + sid + "' AND DATE = '" + attdat + "'");

			if (rs.next()) {
				request.setAttribute("sname", sname);
				request.setAttribute("sid", sid);
				request.setAttribute("sroll", sroll);
				request.setAttribute("sclass", sclass);
				request.setAttribute("date", rs.getString("DATE"));
				request.setAttribute("status", rs.getString("STATUS"));
			} else {
				request.setAttribute("notfound", true);
			}

			rs.close();
			stmt.close();
			con.close();

			request.getRequestDispatcher("attendanceResult.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e.toString());
			request.getRequestDispatcher("attendanceResult.jsp").forward(request, response);
		}
	}
}

