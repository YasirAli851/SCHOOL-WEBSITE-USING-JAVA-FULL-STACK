package com.yasir.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class loginStudentServ
 */
@WebServlet("/loginStudentServ")
public class loginStudentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roll=request.getParameter("rollNumber");
		String id=request.getParameter("studentId");
		String sclass=request.getParameter("studentClass");
		
		PrintWriter out=response.getWriter();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
			Statement stmt=con.createStatement();
			String sql="select * from student where SID= '" + id + "' ";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				HttpSession session=request.getSession(true);
		        session.setAttribute("nameofstudent",rs.getString("SNAME"));
				session.setAttribute("idofstudent",rs.getString("SID"));
				session.setAttribute("rollofstudent",rs.getString("SROLL"));
				session.setAttribute("classofstudent",rs.getString("SCLASS"));
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("studentAction.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				request.setAttribute("alertMessage", "OOPS!,It seems that your are not registered by the admin");
				RequestDispatcher dispatcher = request.getRequestDispatcher("studentLogin.jsp");
				dispatcher.forward(request, response);
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		
	}

}
