package com.busticket;

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
import javax.servlet.http.HttpSession;

@WebServlet("/Cancel")
public class Cancel extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(request.getParameter("ticketId").toString());
		System.out.println(id);
		
		HttpSession session = request.getSession(false);
		String name = session.getAttribute("username").toString();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}

		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
			Statement st = con.createStatement();){
			
			System.out.println(id);
			String query = "delete from ticket where ticket_id="+id; 
			System.out.println(query);
			
			PreparedStatement state = con.prepareStatement(query);
			int rs = state.executeUpdate();
			
			//state.setInt(1, id);
			//state.executeUpdate();
			
			
			//int re = st.executeUpdate(query);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("index.html");
		
		
	}


}
