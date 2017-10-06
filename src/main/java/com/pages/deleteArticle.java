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

public class deleteArticle extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String title = request.getParameter("title");
		String userEmailArticle = request.getParameter("userEmailArticle");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM newsArticle WHERE userEmail=? AND title=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, userEmailArticle);
			stmt.setString(2, title);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				String sqlQuery2 = "DELETE FROM newsArticle WHERE userEmail=? AND title=?";
				PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
				stmt2.setString(1, userEmailArticle);
				stmt2.setString(2, title);
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
