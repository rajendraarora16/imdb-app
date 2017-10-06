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

public class addBiography extends HttpServlet{
	
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
		
		String bioURL = getRandomWord();
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String fullName = request.getParameter("fullName");
		String imgURL = request.getParameter("imgURL");
		String born = request.getParameter("born");
		String residence = request.getParameter("residence");
		String occupation = request.getParameter("occupation");
		String yearsActive = request.getParameter("yearsActive");
		String religion = request.getParameter("religion");
		String relatives = request.getParameter("relatives");
		String discription = request.getParameter("discription");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "INSERT INTO Bio(bioURL, userName, userEmail, fullName, imgURL, born, residence, occupation, yearsActive, religion, relatives, discription) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, bioURL);
			stmt.setString(2, userName);
			stmt.setString(3, userEmail);
			stmt.setString(4, fullName);
			stmt.setString(5, imgURL);
			stmt.setString(6, born);
			stmt.setString(7, residence);
			stmt.setString(8, occupation);
			stmt.setString(9, yearsActive);
			stmt.setString(10, religion);
			stmt.setString(11, relatives);
			stmt.setString(12, discription);
			stmt.executeUpdate();
			con.close();
			
			//Redirect to Bio page.
			response.sendRedirect("Bio?sid="+bioURL);
		}catch(Exception e){e.printStackTrace();}
	}
}
