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

public class forgetPasswordGenerate extends HttpServlet {
	
	public static String getCode(){
		return Long.toHexString(Double.doubleToLongBits(Math.random()));
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		String email = request.getParameter("email");		
		String passCode = getCode();
		
		if(email == "" || email == null){
			//Redirect page for error
			response.sendRedirect("./error");
		}
		else{
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("your database connection");
				
				String sqlQuery = "SELECT * FROM imdb_table WHERE userEmail=?";
				PreparedStatement stmt = con.prepareStatement(sqlQuery);
				stmt.setString(1, email);
				
				ResultSet rs = stmt.executeQuery();
				
				if(rs.next()){
					String emailDB = rs.getString("userEmail");
					
					String sqlQuery2 = "INSERT INTO forgetPassword(userEmail, passCode) VALUES(?, ?)";
					PreparedStatement stmt2 = con.prepareStatement(sqlQuery2);
					stmt2.setString(1, emailDB);
					stmt2.setString(2, passCode);
					stmt2.executeUpdate();				
					
					response.sendRedirect("./sendEmailForgetPassword.jsp?email="+emailDB+"&passCode="+passCode);
				}
				else{
					response.sendRedirect("./error");
					//System.out.print("something wrong!");
				}
				con.close();
			}catch(Exception e){e.printStackTrace();}
			
		}
		
	}
}
