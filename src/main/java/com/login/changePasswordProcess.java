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

public class changePasswordProcess extends HttpServlet{
	
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
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String email = request.getParameter("email");
		String passCode = request.getParameter("passCode");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		
		if(password.equals(confirmPassword))
		{
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
					String sqlQuery2 = "UPDATE imdb_table SET userPassword=? WHERE userEmail=?";
					PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
					stmt2.setString(1, getMD5(password));
					stmt2.setString(2, email);
					stmt2.executeUpdate();
				}
				else{
					response.sendRedirect("./error");
				}
				
				con.close();
			}catch(Exception e){e.printStackTrace();}
		}
		else{
			response.sendRedirect("./error");
		}
		response.sendRedirect("./successfullyPasswordChanged");
	}
}
