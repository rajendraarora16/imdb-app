package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class verification extends HttpServlet{
	public static String getCode(){
		return Long.toHexString(Double.doubleToLongBits(Math.random()));
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		response.setContentType("text/html");
		
		String email = request.getParameter("email");
		String passCode = getCode();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "INSERT INTO verifyAccount(userEmail, verification, passCode) VALUES(?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			stmt.setString(2, "notConfirmed");
			stmt.setString(3, passCode);
			stmt.executeUpdate();
			con.close();
			
			//Redirect page to send Email
			response.sendRedirect("./sendEmail.jsp?email="+email+"&passCode="+passCode);
		}catch(Exception e1){e1.printStackTrace();}
	}

}
