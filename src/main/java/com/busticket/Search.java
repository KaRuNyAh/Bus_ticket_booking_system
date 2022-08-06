package com.busticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.table.TableModel;
/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
int flag=0;
    
	public static Boolean compareDate(String date) {
		
		LocalDate localDate = LocalDate.now(ZoneId.systemDefault());
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate inputDate = LocalDate.parse(date, dtf);
		/*local date is because today date is available in local date only so we used 
		converted from string date to local date*/
		return !inputDate.isBefore(localDate);
		//is not before
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(flag==0) {
			BusModel.generateBusAarray();
			flag=1;
		}
		String from = request.getParameter("From");
		String to = request.getParameter("To");
		String date = request.getParameter("Date");
	
		//System.out.println(date.toString());
		
		 if((from.length()>0 && to.length()>0 && date.length()>0)&&(!from.equalsIgnoreCase(to))&& compareDate(date))
			  {
			 //checking that the field is not empty
			ArrayList<BusModel> filteredBuses = new ArrayList<>();
			Set<String> busSet = new HashSet<>();
			Set<String> aminitiesSet = new HashSet<>();
			for(BusModel busModel : BusModel.busArrayList) {
				
				String []date1=busModel.travel_start_date.split("-");
				String []date2=date.split("-");
				System.out.println(busModel.startloc+busModel.destination);
				
				if(busModel.startloc.toLowerCase().equalsIgnoreCase(from.toLowerCase()) && busModel.destination.toLowerCase().equalsIgnoreCase(to.toLowerCase())) {
					if(date1[0].equals(date2[0])&&(date1[1].equals(date2[1]))&&(date1[2].equals(date2[2]))) {
						filteredBuses.add(busModel);
						busSet.add(busModel.getTravels_name());
						aminitiesSet.addAll(busModel.getAmenities());
					//	System.out.println("To hai");
					}
				}
			}
			//set is used to store unique values
			//set to arraylist 
			ArrayList <String>busesArraylist=new ArrayList<>(busSet);
			ArrayList <String>amenitesArraylist=new ArrayList<>(aminitiesSet);
			
			System.out.println(busesArraylist);
			System.out.println(amenitesArraylist);
			
			HttpSession session=request.getSession();
			session.setAttribute("from", from);
			session.setAttribute("to", to);
			session.setAttribute("buses", filteredBuses);
			session.setAttribute("busesName", busesArraylist);
			session.setAttribute("aminitiesSet", amenitesArraylist);
			session.setAttribute("busdate", date);//date is from index.html page
			//passing parameter to next page
			//System.out.println(filteredBuses.size());
			
			request.removeAttribute("busfilteredList");
			request.setAttribute("busfilteredList", filteredBuses);
			request.setAttribute("busesName", busesArraylist);
			request.setAttribute("aminitiesSet", amenitesArraylist);
			RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
			rd.forward(request, response);
			
		}
		else {
			request.setAttribute("flag", 1);//if error comes then come to index.jsp 
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			//.jsp is used becz .html doesnt support flag variable
			rd.forward(request, response);
		}
	}


}
