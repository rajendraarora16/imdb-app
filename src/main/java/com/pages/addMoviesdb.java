package com.pages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addMoviesdb extends HttpServlet{
	
	/*Random generator!*/
	protected static String getRandomWord() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 8) {
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
	/*-----------------*/
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String movieURL = getRandomWord();
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String movieName = request.getParameter("movieName");
		String imgURL = request.getParameter("imgURL");
		String actName = request.getParameter("actName");
		String releasingDate = request.getParameter("releasingDate");
		String directorName = request.getParameter("directorName");
		String producerName = request.getParameter("producerName");
		String writerName = request.getParameter("writerName");
		String screenplayName = request.getParameter("screenplayName");
		String starringName = request.getParameter("starringName");
		String musicName = request.getParameter("musicName");
		String productionName = request.getParameter("productionName");
		String distributorName = request.getParameter("distributorName");
		String runningTime = request.getParameter("runningTime");
		String country = request.getParameter("country");
		String language = request.getParameter("language");
		String budget = request.getParameter("budget");
		String boxofficeName = request.getParameter("boxofficeName");
		String discription = request.getParameter("discription");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "INSERT INTO movies(movieURL, userName, userEmail, movieName, imgURL, actName, releasingDate, directorName, producerName, writerName, screenplayName, starringName, musicName, productionName, distributorName, runningTime, country, language, budget, boxofficeName, discription) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, movieURL);
			stmt.setString(2, userName);
			stmt.setString(3, userEmail);
			stmt.setString(4, movieName);
			stmt.setString(5, imgURL);
			stmt.setString(6, actName);
			stmt.setString(7, releasingDate);
			stmt.setString(8, directorName);
			stmt.setString(9, producerName);
			stmt.setString(10, writerName);
			stmt.setString(11, screenplayName);
			stmt.setString(12, starringName);
			stmt.setString(13, musicName);
			stmt.setString(14, productionName);
			stmt.setString(15, distributorName);
			stmt.setString(16, runningTime);
			stmt.setString(17, country);
			stmt.setString(18, language);
			stmt.setString(19, budget);
			stmt.setString(20, boxofficeName);
			stmt.setString(21, discription);
			stmt.executeUpdate();
			con.close();
			//Redirecting to movie page
			response.sendRedirect("./movieDetails?sid="+movieURL);
			
		}catch(Exception e){e.printStackTrace();}
	}
}
