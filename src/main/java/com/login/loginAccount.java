package com.login;

import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginAccount extends HttpServlet {
	
	public static String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);
            // Now we need to zero pad it if you actually want the full 32 chars.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        }
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String verification = null;
		StringBuilder builder = new StringBuilder();
		
		if(email == "" || password == ""){
			//Redirect page for error
			response.sendRedirect("./error");
		}
		
		HttpSession session = request.getSession();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM imdb_table WHERE userEmail=? AND userPassword=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			stmt.setString(2, getMD5(password));
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				
				String sqlQuery2 = "SELECT * FROM verifyAccount WHERE userEmail=?";
				PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
				stmt2.setString(1, email);
				ResultSet rs2 = stmt2.executeQuery();
				
				while(rs2.next())
				{
					verification = rs2.getString("verification");
					builder.append(verification);
				}
				
				if(verification.equals("confirmed")){
					
					session.setAttribute("userEmail", rs.getString("userEmail"));
					session.setAttribute("userName", rs.getString("userName"));
					session.setAttribute("userJoinDate", rs.getString("userJoinDate"));
					//Redirect to index page.
					response.sendRedirect("./index");
				}
				else{
					//Redirect to a verify page..
					response.sendRedirect("./verification?email="+email);
				}
			}
			else{
				response.sendRedirect("./invalidLogin");
			}
			
			con.close();
		}catch(Exception e){e.printStackTrace();}
		
	}
}

/*
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/imdb", "root", "1234");
	
	String sqlQuery = "SELECT * FROM verifyAccount WHERE userEmail=?";
	PreparedStatement stmt = con.prepareStatement(sqlQuery);
	stmt.setString(1, email);
	ResultSet rs = stmt.executeQuery();
	
	if(rs.next()){
		System.out.println("Success");
	}
	else{
		response.sendRedirect("./error");
	}
	
}catch(Exception e2){e2.printStackTrace();}
/*
 * 
		*/
