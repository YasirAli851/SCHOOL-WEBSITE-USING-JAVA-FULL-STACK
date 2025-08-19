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

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

@WebServlet("/loginServ")
public class loginServ extends HttpServlet {
	public static String FullNameLogin; // for the session variable to pass to welcome page
	public static String EmailLogin; //for the session variable to pass to welcome page
	private static final long serialVersionUID = 1L;
	private static final String ALGORITHM = "AES";
    private static final byte[] keyValue = "1234567891234567".getBytes();
    public loginServ() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private static Key generateKey() throws Exception {
        Key key = new SecretKeySpec(keyValue, ALGORITHM);
        return key;
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String userType=request.getParameter("usertype");
		String userName=request.getParameter("uname");
		String passWord=request.getParameter("pwd");
		PrintWriter out=response.getWriter();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1","root","121Yasir@123");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from userInfo");
			boolean found=false;
//			out.println(userName);
			while(rs.next())
			{
				String tempEmail=rs.getString("EMAIL");
				if(userName.equals(tempEmail))
				{
					found=true;
					break;
				}
			}
			if(!found)
			{
				request.setAttribute("alertMessage", "Oops! User not found");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				//creating session for getting the name and email of the admin
//				FullNameLogin=rs.getString("FULLNAME");
//				EmailLogin=rs.getString("EMAIL");
//				HttpSession session=request.getSession(true);
//		        session.setAttribute("fullnameLogin",FullNameLogin);
//				session.setAttribute("emailLogin",EmailLogin);
				AES a=new AES();
				try
				{
					   Key key = generateKey();
					   //Encrypting the password that we have got from the user from login form
				       String encriptValue = a.encrypt(passWord,key);
				       passWord=encriptValue;
				       
				       String PwdFromDb=rs.getString("PASSWORD");
				       int isActivated=rs.getInt("ISACTIVATED");
				       
				       if(PwdFromDb.equals(passWord))
				       {
				    	   
				    	   String tempUserType=rs.getString("USERTYPE");
//				    	   	out.println("usertype from ddatabase "+tempUserType+" "+"usertype from form "+userType);
							if(tempUserType.equals(userType))
							{
								if(userType.equals("admin"))
								{
									if(isActivated==0)
									{
										request.setAttribute("alertMessage", "Please get your email verified to access your account");
										RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
										dispatcher.forward(request, response);
									}
									else
									{
										FullNameLogin=rs.getString("FULLNAME");
										EmailLogin=rs.getString("EMAIL");
										HttpSession session=request.getSession(true);
								        session.setAttribute("fullnameLogin",FullNameLogin);
										session.setAttribute("emailLogin",EmailLogin);
//										RequestDispatcher dispatcher = request.getRequestDispatcher("welcomeAdmin.jsp");
//										dispatcher.forward(request, response);
										response.sendRedirect("welcomeAdmin.jsp");
									}
									
								}
								else
								{
									if(isActivated==0)
									{
										request.setAttribute("alertMessage", "Please get your email verified to access your account");
										RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
										dispatcher.forward(request, response);
									}
									else
									{
										FullNameLogin=rs.getString("FULLNAME");
										EmailLogin=rs.getString("EMAIL");
										HttpSession session=request.getSession(true);
								        session.setAttribute("fullnameLogin",FullNameLogin);
										session.setAttribute("emailLogin",EmailLogin);
										RequestDispatcher dispatcher = request.getRequestDispatcher("welcomeTeacher.jsp");
										dispatcher.forward(request, response);
									}
									
								}
							}
							else
							{
								request.setAttribute("alertMessage", "You have not choosed your correct user type");
								RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
								dispatcher.forward(request, response);
							}
				       }
				       else
				       {
				    	   	request.setAttribute("alertMessage", "You have entered a wrong password");
							RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
							dispatcher.forward(request, response);
				       }
				}
				catch(Exception e)
				{
					out.println(e);
				}
				
				
			}
		}
		catch(Exception e)
		{
			out.println("error here "+e);
		}
//		
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}































