package com.pages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteBiography extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String bioURLDB = request.getParameter("bioURLDB");
		String userEmailArticle = request.getParameter("userEmailArticle");
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM Bio WHERE bioURL=? AND userEmail=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, bioURLDB);
			stmt.setString(2, userEmailArticle);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				String sqlQuery2 = "DELETE FROM Bio WHERE bioURL=? AND userEmail=?";
				PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
				stmt2.setString(1, bioURLDB);
				stmt2.setString(2, userEmailArticle);
				stmt2.executeUpdate();
				response.sendRedirect("./deletedSuccess");
			}
			else{
				response.sendRedirect("./error");
			}
			
			con.close();
		}catch(Exception e){e.printStackTrace();}
	}
}
