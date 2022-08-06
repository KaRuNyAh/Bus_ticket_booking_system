package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupservlet")
public class signupservlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	String mail=request.getParameter("uemail");
	String name=request.getParameter("uname");
	String password=request.getParameter("upass");
	String age=request.getParameter("uage");
	String gender=request.getParameter("ugender");
	String type=request.getParameter("utype");
	String mobile_no=request.getParameter("umno");
	
	int passengerid = 1;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");	
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	}

	try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
		Statement st = con.createStatement();){
		String query = "Select * from ticket";   //name from signin page
		
		ResultSet re = st.executeQuery(query);
		System.out.println(name);
		int i=0;
		while(re.next()) {
			passengerid++;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}

	try{  
		Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
	PreparedStatement ps=con.prepareStatement("INSERT into user values(?,?,?,?,?,?,?,?)");  

	ps.setString(1,name);  
	ps.setString(2,mobile_no);
	ps.setString(3,age );
	ps.setString(4, gender);
	ps.setString(5, type);
	ps.setString(6, password);
	ps.setString(7,mail);  
	ps.setInt(8, passengerid);
	
	 
int count=	ps.executeUpdate();  
if(type.equalsIgnoreCase("passenger")) {
	response.sendRedirect("index.html");
	}
else {
	response.sendRedirect("bussignup.jsp");
}

	}catch(Exception e){
		System.out.println(e);
	}  
	}


}
