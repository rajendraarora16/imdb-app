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

public class deleteMovies extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String movieURLDB = request.getParameter("movieURLDB");
		String postedByEmail = request.getParameter("postedByEmail");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM movies WHERE movieURL=? AND userEmail=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, movieURLDB);
			stmt.setString(2, postedByEmail);
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				String sqlQuery2 = "DELETE FROM movies WHERE movieURL=? AND userEmail=?";
				PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
				stmt2.setString(1, movieURLDB);
				stmt2.setString(2, postedByEmail);
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
