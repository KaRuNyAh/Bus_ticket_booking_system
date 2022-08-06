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

import com.mysql.cj.xdevapi.JsonArray;



@WebServlet("/bussignup")
public class bussignup extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		int busno=Integer.parseInt(request.getParameter("busno"));
		String busname=request.getParameter("busname");
		String arrivaltime=request.getParameter("arrtime");
		String depaturetime=request.getParameter("depttime");
		int reststop=Integer.parseInt(request.getParameter("reststop"));
		String startloc=request.getParameter("startloc");
		String destination=request.getParameter("destination");
		int amount=Integer.parseInt(request.getParameter("amount"));
		String drivername=request.getParameter("drivername");
		String  travelsname=request.getParameter("travelsname");
		String travelstartdate=request.getParameter("travelstartdate");
		String  travelenddate=request.getParameter("travelendate");

		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
		PreparedStatement ps=con.prepareStatement("INSERT into session values(?,?,?,?,?,?,?,?,?,?,?,?)");  

		ps.setInt(1,busno);
		ps.setString(2,busname);
		ps.setString(3,arrivaltime);
		ps.setString(4,depaturetime );
		ps.setInt(5, reststop);
		ps.setString(6, startloc);
		ps.setString(7,destination);  
		ps.setInt(8,amount);  
		ps.setString(9, drivername);
		ps.setString(10,travelsname);  
		ps.setString(11,travelstartdate); 
		ps.setString(12, travelenddate);
		
		 
	int count=	ps.executeUpdate();  

	response.sendRedirect("bussignup.jsp");//after registeration go to index page
		}catch(Exception e){
			System.out.println(e);
		}  
		}
		
		
	}

	


	



