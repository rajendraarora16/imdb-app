package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registration extends HttpServlet{
	
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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		String emailDB = null;
		StringBuilder builder = new StringBuilder();
		
		//Checking email exists into Database or not!
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("your database connection");
			
			String sqlQuery = "SELECT * FROM imdb_table WHERE userEmail=?";
			PreparedStatement stmt = con.prepareStatement(sqlQuery);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next())
			{
				emailDB = rs.getString("userEmail");
				builder.append(emailDB);
			}
			con.close();
		}catch(Exception e1){e1.printStackTrace();}
		
		if(email.equals(emailDB))
		{
			//Redirect to error page.
			response.sendRedirect("./error");
		}
		else{
			
			if(name == "" || email == "" || password == "" || confirmPassword == ""){
				//Redirect page for error
				response.sendRedirect("./error");
			}
			else{
				if(password.equals(confirmPassword)){
					
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("your database connection");
						
						Calendar cal = Calendar.getInstance();
						String userJoinDate = new SimpleDateFormat("dd MMM YYYY").format(cal.getTime());
						
						String sqlQuery = "INSERT INTO imdb_table(userName, userEmail, userPassword, userJoinDate) VALUES(?, ?, ?, ?)";
						PreparedStatement stmt = con.prepareStatement(sqlQuery);
						stmt.setString(1, name);
						stmt.setString(2, email);
						stmt.setString(3, getMD5(password));
						stmt.setString(4, userJoinDate);
						stmt.executeUpdate();
						con.close();
						
						//Redirect Page to verify user!
						response.sendRedirect("./verification?email="+email);
					}catch(Exception e1){e1.printStackTrace();}
				}
				else{
					//Redirect page for error!
					response.sendRedirect("./error");
				}
			}
		}
		
	}
}
