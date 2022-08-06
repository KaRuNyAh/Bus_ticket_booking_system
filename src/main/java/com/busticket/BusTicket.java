package com.busticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
//ticket object
public class BusTicket {
	
	int busno;
	int passenger_id;
	int ticket_id;
	String username;
	int age;
	String gender;
	String mail;
	int fare;
	String dep_time;
	String arr_time;
	String from;
	String to;
	String bus_name;
	String seating_type;
	int tick_count;
	String seat_no;
	String date;
	
	
	
	public BusTicket() {
		super();
	}
	
	

	public BusTicket(int busno, int passenger_id, int ticket_id, String username, int age, String gender, String mail,
			int fare, String dep_time, String arr_time, String from, String to, String bus_name, String seating_type,
			int tick_count, String seat_no, String date) {
		super();
		this.busno = busno;
		this.passenger_id = passenger_id;
		this.ticket_id = ticket_id;
		this.username = username;
		this.age = age;
		this.gender = gender;
		this.mail = mail;
		this.fare = fare;
		this.dep_time = dep_time;
		this.arr_time = arr_time;
		this.from = from;
		this.to = to;
		this.bus_name = bus_name;
		this.seating_type = seating_type;
		this.tick_count = tick_count;
		this.seat_no = seat_no;
		this.date = date;
	}
	
	



	public int getBusno() {
		return busno;
	}



	public void setBusno(int busno) {
		this.busno = busno;
	}



	public int getPassenger_id() {
		return passenger_id;
	}



	public void setPassenger_id(int passenger_id) {
		this.passenger_id = passenger_id;
	}



	public int getTicket_id() {
		return ticket_id;
	}



	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getMail() {
		return mail;
	}



	public void setMail(String mail) {
		this.mail = mail;
	}



	public int getFare() {
		return fare;
	}



	public void setFare(int fare) {
		this.fare = fare;
	}



	public String getDep_time() {
		return dep_time;
	}



	public void setDep_time(String dep_time) {
		this.dep_time = dep_time;
	}



	public String getArr_time() {
		return arr_time;
	}



	public void setArr_time(String arr_time) {
		this.arr_time = arr_time;
	}



	public String getFrom() {
		return from;
	}



	public void setFrom(String from) {
		this.from = from;
	}



	public String getTo() {
		return to;
	}



	public void setTo(String to) {
		this.to = to;
	}



	public String getBus_name() {
		return bus_name;
	}



	public void setBus_name(String bus_name) {
		this.bus_name = bus_name;
	}



	public String getSeating_type() {
		return seating_type;
	}



	public void setSeating_type(String seating_type) {
		this.seating_type = seating_type;
	}



	public int getTick_count() {
		return tick_count;
	}



	public void setTick_count(int tick_count) {
		this.tick_count = tick_count;
	}



	public String getSeat_no() {
		return seat_no;
	}



	public void setSeat_no(String seat_no) {
		this.seat_no = seat_no;
	}



	public String getDate() {
		return date;
	}



	public void setDate(String date) {
		this.date = date;
	}



	static public BusTicket getBusTicket(String username){
		ArrayList<BusTicket> array = getAllTicket(username);
		
		if(array.size()!=0)
			return array.get(array.size()-1);
		else
			return new BusTicket();
	}
	
	static public boolean compareDate(String date) {
		LocalDate localDate = LocalDate.now(ZoneId.systemDefault());
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate inputDate = LocalDate.parse(date, dtf);
		/*local date is because today date is available in local date only so we used 
		converted from string date to local date*/
		return !inputDate.isBefore(localDate);
	}
	
	static public ArrayList<BusTicket> getAllTicket(String username){
		ArrayList<BusTicket> ticketArrayList = new ArrayList();
		
		try {
			//connection for database
			Class.forName("com.mysql.cj.jdbc.Driver");	
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		}
//we get the data from database and store it in the arrayList
		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
			Statement st = con.createStatement();){
			String query = "Select * from ticket";   
			
			ResultSet re = st.executeQuery(query);
			int i=0;
			while(re.next()) {
				if(username.equals(re.getString(4)) && compareDate(re.getString(17))) {
					BusTicket ticket = new BusTicket(re.getInt(1),re.getInt(2),re.getInt(3),re.getString(4),re.getInt(5),
							re.getString(6),re.getString(7),re.getInt(8),re.getString(9),re.getString(10),re.getString(11),
							re.getString(12),re.getString(13),re.getString(14),re.getInt(15),re.getString(16),re.getString(17));
					
					ticketArrayList.add(ticket);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ticketArrayList;
	}
}
