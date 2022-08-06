package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DriverSignUp
 */
@WebServlet("/DriverSignUp")
public class DriverSignUp extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int busno=Integer.parseInt(request.getParameter("busno"));
		String rc=request.getParameter("rc");
		String drivername=request.getParameter("drivername");
		String driverlicense=request.getParameter("driverlicense");
		int age=Integer.parseInt(request.getParameter("age"));
		
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
		PreparedStatement ps=con.prepareStatement("INSERT into driver values(?,?,?,?,?)");  

		ps.setInt(1,busno);
		ps.setString(2, rc);
		ps.setString(3, drivername);
		ps.setString(4,driverlicense);  
		ps.setInt(5, age);
		 
	int count=	ps.executeUpdate();  

	response.sendRedirect("bussignup.jsp");//after registeration go to index page
		}catch(Exception e){
			System.out.println(e);
		}  
	}

}
