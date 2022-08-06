package com.busticket;

import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeepFilter
 */
@WebServlet("/DeepFilter")
public class DeepFilter extends HttpServlet {
	
	public int compareTime(String time, String sec, int i, int j, int k) {
		 LocalTime time1, time2;  
		 String hours = ""+time.charAt(0)+time.charAt(1);
		 String mins = ""+time.charAt(3)+time.charAt(4);
		time1 = LocalTime.of(Integer.parseInt(hours), Integer.parseInt(mins), Integer.parseInt(sec));
		time2 = LocalTime.of(i, j, k);
		
		int t = time1.compareTo(time2); 
		System.out.println(time+ " " + i+ j + k + " " + t);
		return t;
	}
       //request dispatcher used

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String s = request.getParameter("filterbtn");
		String buses = request.getParameter("busNames");
		String allAminities = request.getParameter("aminities");
		
		HttpSession session = request.getSession();
		String from = (String) session.getAttribute("from");
		String to = (String) session.getAttribute("to");
		String date=(String) session.getAttribute("busdate");
		String amenities=(String) session.getAttribute("amenities");
		
		//set is need to store unique values but it is not compatable with jsp 
		//so typecasting back after processing to arraylist
		ArrayList<String> busSet = (ArrayList) session.getAttribute("busesName");
		ArrayList<String> aminitiesSet = (ArrayList) session.getAttribute("aminitiesSet"); 
		
		System.out.println(amenities);
		ArrayList<BusModel> filteredBuses = new ArrayList<>();
		
		for(BusModel busModel : BusModel.busArrayList) {
			String []date1=busModel.travel_start_date.split("-");
			String []date2=date.split("-");
			if(busModel.startloc.toLowerCase().equals(from.toLowerCase()) && busModel.destination.toLowerCase().equals(to.toLowerCase())) {
				if(date1[0].equals(date2[0])&&(date1[1].equals(date2[1]))&&(date1[2].equals(date2[2]))) {
				filteredBuses.add(busModel);
			}
		} 
		}
		
		if(s!=null) {
		switch (s) {
		/*case "Radha": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getTravels_name().equals("Radha")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		
		case "Krishna": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getTravels_name().equals("Krishna")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		
		
		case "wifi": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("wifi")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "water bottle": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("water bottle")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "blankets": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("blankets")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "charging point": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("charging point")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "movie": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("movie")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "track my bus": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("track my bus")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "Emergency contact Number": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(!busModel.getAmenities().contains("Emergency contact Number")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		*/
		case "before 6 am arr" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(compareTime(busModel.arrivalTime, "00", 6, 0, 0)>0) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "6 am to 12pm arr" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if((compareTime(busModel.arrivalTime, "00", 12, 0, 0)>0) || (compareTime(busModel.arrivalTime, "00", 6, 0, 0)<0) ){
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "12pm to 6pm arr" : {
			
			for(BusModel busModel : BusModel.busArrayList) {
				
				if(compareTime(busModel.arrivalTime, "00", 18, 0, 0)>0 || compareTime(busModel.arrivalTime, "00", 12, 0, 0)<0) {
					System.out.println(compareTime(busModel.arrivalTime, "00", 12, 0, 0)<0);
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "after 6pm arr" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(compareTime(busModel.arrivalTime, "00", 18, 0, 0)<0) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "before 6 am dep" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(compareTime(busModel.departureTime, "00", 6, 0, 0)>0) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "6 am to 12pm dep" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(compareTime(busModel.departureTime, "00", 12, 0, 0)>0 || compareTime(busModel.departureTime, "00", 6, 0, 0)<0) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "12pm to 6pm dep" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(compareTime(busModel.departureTime, "00", 18, 0, 0)>0 || compareTime(busModel.departureTime, "00", 12, 0, 0)<0) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "after 6pm dep" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(compareTime(busModel.departureTime, "00", 18, 0, 0)<0) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "seater": {
			for(BusModel busModel : BusModel.busArrayList) {
				if(busModel.seating_type.equals("sleeper")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		case "sleeper" : {
			for(BusModel busModel : BusModel.busArrayList) {
				if(busModel.seating_type.equals("seater")) {
					filteredBuses.remove(busModel);
				}
			}
			break;
			}
		
		}
		}
		
		System.out.println("buses"+busSet);
		System.out.println("amenities"+allAminities);
		
		
		//bus filter 
		if(buses!=null) {//here buses=krishna value if krishna button is clicked
		for(String str : busSet) {
			if(buses.equals(str)) {   //check the presence in the busset
				for(BusModel busModel : BusModel.busArrayList) { 
					System.out.println((busModel.getTravels_name().equals(str))+busModel.getTravels_name()+str);
					if(!(busModel.getTravels_name().equals(str))) {
						filteredBuses.remove(busModel);//if the str is not present then we can remove it
						System.out.println("hello");
					}
				}
				break;
			}
		}
		}
		
		
		//aminities filter
		
		if(allAminities!=null) {
		for(String str : aminitiesSet) {
			if(allAminities.equals(str)) {
				for(BusModel busModel : BusModel.busArrayList) {
					if(!busModel.getAmenities().contains(str)) {
						filteredBuses.remove(busModel);
					}
				}
				break;
			}
		}
		}
		request.setAttribute("busfilteredList", filteredBuses);
		request.setAttribute("busesName", busSet);
		request.setAttribute("aminitiesSet", aminitiesSet);
		RequestDispatcher rd = request.getRequestDispatcher("search.jsp");//used to get details of that page only
		rd.forward(request, response);
	}

}
