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
 * Servlet implementation class Seats
 */
@WebServlet("/Seats")
public class Seats extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String busName = request.getParameter("busName");
		int i =  Integer.parseInt(request.getParameter("index"));
		String seater = request.getParameter("seaterType");
		int seatCount = Integer.parseInt(request.getParameter("seatCount"));
		int fare =  Integer.parseInt(request.getParameter("fare"));
		
		
		HttpSession session = request.getSession(false);
		ArrayList<BusModel> buses = (ArrayList<BusModel>) session.getAttribute("buses");
		
		//System.out.println(buses.get(0).getBusno());
		
		if(seater.equalsIgnoreCase("seater")) {
			request.setAttribute("busName", busName);
			request.setAttribute("index", i);
			request.setAttribute("couter",seatCount);
			request.setAttribute("fare", fare);
			RequestDispatcher rd = request.getRequestDispatcher("seater.jsp");
			rd.forward(request, response);
		} else {

			request.setAttribute("busName", busName);
			request.setAttribute("index", i);
			request.setAttribute("couter",seatCount);
			request.setAttribute("fare", fare);
			RequestDispatcher rd = request.getRequestDispatcher("sleeper.jsp");
			rd.forward(request, response);
		}
	}

}
