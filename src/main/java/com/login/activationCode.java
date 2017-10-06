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

public class activationCode extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String email = request.getParameter("email");
		String passCode = request.getParameter("passCode");
		String passCodeDB = null;
		StringBuilder builder = new StringBuilder();
		
		//Checking..
		//System.out.println(email);
		//System.out.println("\n"+passCode);
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM verifyAccount WHERE userEmail=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next())
			{
				passCodeDB= rs.getString("passCode");
				builder.append(passCodeDB);
			}		
			con.close();
			
		}catch(Exception e1){e1.printStackTrace();}
		
		//....................................
		
		if(passCode.equals(passCodeDB))
		{
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("your database connection");
				
				String sqlQuery = "UPDATE verifyAccount SET verification=? WHERE userEmail=?";
				PreparedStatement stmt = con.prepareStatement(sqlQuery);
				stmt.setString(1, "confirmed");
				stmt.setString(2, email);
				stmt.executeUpdate();
				con.close();
				
				//Redirect to login page
				response.sendRedirect("./verificationSuccess");
			}catch(Exception e){e.printStackTrace();}
		}
		else{
			//Redirect Error page
			response.sendRedirect("./error");
		}
	}
}
