package com.pages;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("./loginPage.jsp");
		RequetsDispatcherObj.forward(request, response);
	}
}
