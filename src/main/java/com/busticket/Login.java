package com.busticket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
	String type="";
	String uname=request.getParameter("uname");
	String pass=request.getParameter("psw");
	type=request.getParameter("type");
	HashMap<String, String> hashMap = new HashMap<>();
	HashMap<String,String>hashMapType =new HashMap<>();
//key,value
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	} 
	catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
			Statement st = con.createStatement();){
		    String query = "SELECT name,password,type from user";
		
		ResultSet re = st.executeQuery(query);
		//int i=0;
		while(re.next()) {
			hashMap.put(re.getString(1), re.getString(2));
	        hashMapType.put(re.getString(1),re.getString(3));
			}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
//hashmap for username and password 
//another hashmap for username and type
	if(hashMap.containsKey(uname) && hashMap.get(uname).equalsIgnoreCase(pass)){//password stored is got through hashmap.get(uname)from key
		HttpSession session=request.getSession();
		session.setAttribute("username",uname);
		if(hashMapType.get(uname).equalsIgnoreCase("bus")) {
			response.sendRedirect("bussignup.jsp");//if bus go to buspage 
		}
		else if(hashMapType.get(uname).equalsIgnoreCase("passenger"))
		    response.sendRedirect("index.html");//if user type is passenger go to index page
	}
	else
		response.sendRedirect("signin.jsp");
	}
	
}
