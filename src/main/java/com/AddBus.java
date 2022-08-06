package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBus
 */
@WebServlet("/AddBus")
public class AddBus extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String am="";
		
		int busno=Integer.parseInt(request.getParameter("busno"));
		String busname=request.getParameter("busname");
		String gps=request.getParameter("gps");
		String[] amenities=request.getParameterValues("amenities");
		for(String s:amenities) {
			am=s+am+",";
		}
		am=am+request.getParameter("other");
		String image=request.getParameter("image");
	    int no_of_seats=Integer.parseInt(request.getParameter("no_of_seats"));
		String  seating_type=request.getParameter("seating_type");

		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
		PreparedStatement ps=con.prepareStatement("INSERT into bus values(?,?,?,?,?,?,?)");  

		ps.setInt(1,busno);
		ps.setString(2,busname);
		ps.setString(3,gps);
		ps.setString(4,am);
		ps.setString(5, image);
		ps.setInt(6, no_of_seats);
		ps.setString(7,seating_type);  
		
	int count=	ps.executeUpdate();  

	//response.sendRedirect("bussignup.jsp");//after registeration go to index page
		}catch(Exception e){
			System.out.println(e);
		}
		
		ArrayList <String> amenitiesarraylist=new ArrayList<>();
		for(String s:amenities) {
			amenitiesarraylist.add(s);
			try{  
				Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
			PreparedStatement ps=con.prepareStatement("INSERT into amenities values(?,?)");  

			ps.setInt(1,busno);
			ps.setString(2, s);
			
			
		int count=	ps.executeUpdate();  

		
			}catch(Exception e){
				System.out.println(e);
			}
			
			response.sendRedirect("bussignup.jsp");//after registeration go to index page
		}
		
		
		
		
	}


}
