package com.busticket;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String selectedSeats = request.getParameter("array");
		String amount = request.getParameter("amount");
		String busName = request.getParameter("busName");
		System.out.println(selectedSeats+" "+amount);
		
		HttpSession session=request.getSession(false);
		session.setAttribute("amount", amount);
		session.setAttribute("selectedSeats", selectedSeats);
		
		for(BusModel bus : (ArrayList<BusModel>) session.getAttribute("buses")) {
			if(bus.getTravels_name().equals(busName)) {
				session.setAttribute("selectedBus", bus);
				System.out.println(bus.getTravels_name());
				break;
			}
		}
			
		request.setAttribute("selectedSeats", selectedSeats);
		request.setAttribute("amount", amount);
		RequestDispatcher rd = request.getRequestDispatcher("paymentnew.jsp");//for getting details about bank
		rd.forward(request, response);
	}
}
