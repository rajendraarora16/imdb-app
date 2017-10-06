package com.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class changePassword extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String email = request.getParameter("email");
		String passCode = request.getParameter("passCode");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM forgetPassword WHERE userEmail=? AND passCode=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			stmt.setString(2, passCode);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				response.sendRedirect("./newPassword?email="+email+"&passCode="+passCode);
				
			}else{
				response.sendRedirect("./error");
			}
			
			con.close();
		}catch(Exception e){e.printStackTrace();}
	}

}
