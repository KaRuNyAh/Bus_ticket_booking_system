package com.busticket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Ticket
 */
@WebServlet("/Ticket")
public class Ticket extends HttpServlet {
	int ticketno=1;   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cardno = request.getParameter("cardno");//get the values from payment.jsp and check the values are not null
		String expirydate=request.getParameter("expirydate");
		String cvvno=request.getParameter("cvvno");
		String cardholdername=request.getParameter("cardholdername");
		
		HttpSession session = request.getSession(false);
        //got it from seater page through calculate function
		int amount = Integer.parseInt(session.getAttribute("amount").toString());
		String seatNumbers = session.getAttribute("selectedSeats").toString();
		String email="";int age=0;
		int passengerid = 0;
		String gender="other";
		BusModel bus = (BusModel) session.getAttribute("selectedBus");
		String name = session.getAttribute("username") == null ? "Anonymous" : (String) session.getAttribute("username");
		int status=0; 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");	
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}

		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
			Statement st = con.createStatement();){
			String query = "Select * from user";   //name from signin page
			
			ResultSet re = st.executeQuery(query);
			System.out.println(name);
			int i=0;
			while(re.next()) {
				if(name.equals(re.getString(1))) {
				email=re.getString(7);
				age=re.getInt(3);
				gender=re.getString(4);
				passengerid = re.getInt(8);
			}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//using this we show display it in ticket  
		request.setAttribute("busName", bus.getTravels_name());
		request.setAttribute("bus_no", bus.getBusno() );
		request.setAttribute("arrivalTime", bus.getDepartureTime());
		request.setAttribute("arrivalLocation", bus.getDestination());
		request.setAttribute("departureTime", bus.getArrivalTime());
		request.setAttribute("departureLocation", bus.getStartloc());
		request.setAttribute("gender", gender);
		request.setAttribute("age",age);
		request.setAttribute("ticketcount", amount/bus.getAmount());
		request.setAttribute("price",amount);
		request.setAttribute("date",bus.getTravel_start_date());
		request.setAttribute("seatingtype",bus.getSeating_type());
		request.setAttribute("seatNum", seatNumbers);
		request.setAttribute("email", email);
		System.out.println(seatNumbers);
		
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
				ticketno=re.getInt(3);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ticketno++;
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
			PreparedStatement ps=con.prepareStatement("INSERT into ticket values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
		//17 fields
		//to store it in database
			
		ps.setInt(1,bus.getBusno()); 
		ps.setInt(2,passengerid);
		ps.setInt(3,ticketno);
		ps.setString(4,name);
		ps.setInt(5,age);
		ps.setString(6, gender); 
		ps.setString(7, email);
		ps.setInt(8,amount);  
		ps.setString(9,bus.getDepartureTime());
		ps.setString(10,bus.getArrivalTime());
		ps.setString(11,bus.getStartloc());
		ps.setString(12, bus.getDestination());
		ps.setString(13, bus.getTravels_name());
		ps.setString(14, bus.getSeating_type());
		ps.setInt(15,amount/bus.getAmount()); //ticket count=total amount/one ticket
		ps.setString(16,seatNumbers);  
		ps.setString(17,bus.getTravel_start_date()); 


		status=ps.executeUpdate();  
		}catch(Exception e){}  
		
		if(cardno.length()==16 && (expirydate.length()>0)&&(cvvno.length()>0)&&(cardholdername.length()>0)) {
            RequestDispatcher rd = request.getRequestDispatcher("ticket.jsp");
			rd.forward(request, response);
		}
		else 
			response.sendRedirect("paymentnew.jsp");//paymentnew  previous page 
		
	}

}
