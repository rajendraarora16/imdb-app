package com.pages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addNewsArticle extends HttpServlet {
	
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
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		String newsTitle = request.getParameter("newsTitle");
		String newsArticle = request.getParameter("content");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		
		Calendar cal = Calendar.getInstance();
		String newsTime = new SimpleDateFormat("dd MMM YYYY 'at' hh:mm").format(cal.getTime());
		
		String postURL = getRandomWord();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "INSERT INTO newsArticle(newsURL, userName, userEmail, title, article, articleDate) VALUES(?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, postURL);
			stmt.setString(2, userName);
			stmt.setString(3, userEmail);
			stmt.setString(4, newsTitle);
			stmt.setString(5, newsArticle);
			stmt.setString(6, newsTime);
			stmt.executeUpdate();
			con.close();
			
			//Redirect to a News page with this random word.
			response.sendRedirect("./News?sid="+postURL);
		}catch(Exception e){e.printStackTrace();}
	}
}
