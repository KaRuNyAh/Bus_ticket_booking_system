package com.busticket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class BusModel {
	//class is created (testing model before jdbc )
	int busno;
	String rc;
	String arrivalTime;
	String departureTime;
	int reststops;
	String gps;
	String startloc;
	String destination;
	ArrayList<String> amenities;
	String images;
	int no_of_seats;
	int amount;
	String seating_type;
	String driver_name;
	String travels_name;
	String driver_license_no;
	String travel_start_date;
	String travel_end_date;
	String total_time;
static 	ArrayList <BusModel> busArrayList =new ArrayList<>();
	
	public static void generateBusAarray(){
		
		ArrayList<Bus> busArray = new ArrayList<>();
		ArrayList<Driver> driverArray = new ArrayList<>();
		ArrayList<Session> sessionArray = new ArrayList<>();
		ArrayList<Amenities> amenitiesArray=new ArrayList<>();
		ArrayList<Occupied>occupiedArray=new ArrayList<>();
		
		HashMap<Integer,ArrayList<Occupied>> seatshash=new HashMap<>(); 
		
		HashMap<Integer,ArrayList<String>>amenitieshash=new HashMap<>();
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
				Statement st = con.createStatement();){
			
			
			String query = "SELECT * FROM bus";//1st 
			
			ResultSet re = st.executeQuery(query);
			int i=0;
			while(re.next()) {
				Bus bus = new Bus(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getString(5), re.getInt(6), re.getString(7));
				busArray.add(bus);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
				Statement st = con.createStatement();){
			
			
			String query = "SELECT * FROM driver";//2nd
			
			ResultSet re = st.executeQuery(query);
			int i=0;
			while(re.next()) {
				Driver driver = new Driver(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getInt(5));
				driverArray.add(driver);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
				Statement st = con.createStatement();){
			
			
			String query = "SELECT * FROM amenities";//3rd
			
			ResultSet re = st.executeQuery(query);
			int i=0;
			while(re.next()) {//for iteration 
			if(amenitieshash.containsKey(re.getInt(1))) {
				amenitieshash.get(re.getInt(1)).add(re.getString(2));//if present then add it to hash
			}
			else {
				ArrayList<String>a=new ArrayList<>();//else create new add
				a.add(re.getString(2));
				amenitieshash.put(re.getInt(1),a);
			}
			}
			
			for(int k:amenitieshash.keySet()) {
				Amenities amenities=new Amenities(k,amenitieshash.get(k));
				//so converting it to object from hashmap
				amenitiesArray.add(amenities);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try (Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai");
				Statement st = con.createStatement();){
			
			
			String query = "SELECT * FROM session";//4th
			
			ResultSet re = st.executeQuery(query);
			int i=0;
			while(re.next()) {
				Session session = new Session(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getInt(5), re.getString(6), re.getString(7), re.getInt(8), re.getString(9), re.getString(10), re.getString(11), re.getString(12));
				sessionArray.add(session);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		for(Session session : sessionArray) {
			BusModel busModel = new BusModel();
			busModel.setBusno(session.busno);
			busModel.setTravels_name(session.travelsName);
			busModel.setArrivalTime(session.arrivalTime);
			busModel.setDepartureTime(session.departureTime);
			busModel.setReststops(session.restStops);
			busModel.setStartloc(session.startLoc);
			busModel.setDestination(session.destination);
			busModel.setAmount(session.amount);
			busModel.setDriver_name(session.driverName);
			busModel.setTravel_start_date(session.startDate);
			busModel.setTravel_end_date(session.endDate);
			busModel.setTotal_time(totalTime(session.departureTime, session.arrivalTime));
			
			
			
			for(Bus bus : busArray) {
				if(bus.busno == session.busno) {
					busModel.setSeating_type(bus.seating_type);
					busModel.setGps(bus.gps);
					busModel.setImages(bus.image);
					busModel.setNo_of_seats(bus.no_of_seats);
				}
			}
			
			for(Driver driver : driverArray) {
				if(driver.busno == session.busno) {
					busModel.setRc(driver.rc);
					busModel.setDriver_license_no(driver.license);
				}
			}
			
			for(Amenities a:amenitiesArray) {
				if(a.busno == session.busno) {
					busModel.setAmenities(a.amenities_present);
					System.out.println(a.amenities_present);
				}
			}
			
			busArrayList.add(busModel);
			
		}
	//	System.out.println(busArrayList.get(0).travel_start_date);
	
	}
	
	public static String totalTime(String t1, String t2) {
		
		int t1h = Integer.parseInt(""+t1.charAt(0)+t1.charAt(1));
		int t1m = Integer.parseInt(""+t1.charAt(3)+t1.charAt(4));
		
		int t2h = Integer.parseInt(""+t2.charAt(0)+t2.charAt(1));
		int t2m = Integer.parseInt(""+t2.charAt(3)+t2.charAt(4));
		
		LocalTime time1 = LocalTime.of(t1h, t1m, 00);
        LocalTime time2 = LocalTime.of(t2h, t2m, 00);
  
        // Calculating the difference in Hours
        long hours = ChronoUnit.HOURS.between(time1, time2);
  
        // Calculating the difference in Minutes
        long minutes
            = ChronoUnit.MINUTES.between(time1, time2) % 60;
  
        
        String h = hours%10 == hours ? "0"+hours : ""+hours;
        String m = minutes%10 == minutes ? "0"+minutes : ""+minutes;

        return h + ":" + m + "hrs";
		
		
	}
	
	

	public BusModel() {
		super();
	}

	public BusModel(int busno, String rc, String arrivalTime, String departureTime, int reststops, String gps,
			String startloc, String destination, ArrayList<String> amenities, String images, int no_of_seats, int amount,
			String seating_type, String driver_name, String travels_name, String driver_license_no,
			String travel_start_date, String travel_end_date, String total_time) {
		super();
		this.busno = busno;
		this.rc = rc;
		this.arrivalTime = arrivalTime;
		this.departureTime = departureTime;
		this.reststops = reststops;
		this.gps = gps;
		this.startloc = startloc;
		this.destination = destination;
		this.amenities = amenities;
		this.images = images;
		this.no_of_seats = no_of_seats;
		this.amount = amount;
		this.seating_type = seating_type;
		this.driver_name = driver_name;
		this.travels_name = travels_name;
		this.driver_license_no = driver_license_no;
		this.travel_start_date = travel_start_date;
		this.travel_end_date = travel_end_date;
		this.total_time = total_time;
	}

	public int getBusno() {
		return busno;
	}

	public void setBusno(int busno) {
		this.busno = busno;
	}

	public String getRc() {
		return rc;
	}

	public void setRc(String rc) {
		this.rc = rc;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public int getReststops() {
		return reststops;
	}

	public void setReststops(int reststops) {
		this.reststops = reststops;
	}

	public String getGps() {
		return gps;
	}

	public void setGps(String gps) {
		this.gps = gps;
	}

	public String getStartloc() {
		return startloc;
	}

	public void setStartloc(String startloc) {
		this.startloc = startloc;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public ArrayList<String> getAmenities() {
		return amenities;
	}

	public void setAmenities(ArrayList<String> amenities) {
		this.amenities = amenities;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public int getNo_of_seats() {
		return no_of_seats;
	}

	public void setNo_of_seats(int no_of_seats) {
		this.no_of_seats = no_of_seats;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getSeating_type() {
		return seating_type;
	}

	public void setSeating_type(String seating_type) {
		this.seating_type = seating_type;
	}

	public String getDriver_name() {
		return driver_name;
	}

	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}

	public String getTravels_name() {
		return travels_name;
	}

	public void setTravels_name(String travels_name) {
		this.travels_name = travels_name;
	}

	public String getDriver_license_no() {
		return driver_license_no;
	}

	public void setDriver_license_no(String driver_license_no) {
		this.driver_license_no = driver_license_no;
	}

	public String getTravel_start_date() {
		return travel_start_date;
	}

	public void setTravel_start_date(String travel_start_date) {
		this.travel_start_date = travel_start_date;
	}

	public String getTravel_end_date() {
		return travel_end_date;
	}

	public void setTravel_end_date(String travel_end_date) {
		this.travel_end_date = travel_end_date;
	}

	public String getTotal_time() {
		return total_time;
	}

	public void setTotal_time(String total_time) {
		this.total_time = total_time;
	}
}

//object is used instead of variables..
class Bus {
	int busno;
	String busName;
	String gps;
	String aminities;
	String image;
	int no_of_seats;
	String seating_type;
	public Bus(int busno, String busName, String gps, String aminities, String image, int no_of_seats,
			String seating_type) {
		super();
		this.busno = busno;
		this.busName = busName;
		this.gps = gps;
		this.aminities = aminities;
		this.image = image;
		this.no_of_seats = no_of_seats;
		this.seating_type = seating_type;
	}
	
	
}

//object is used instead of variables..
class Session {
	int busno;
	String busName;
	String arrivalTime;
	String departureTime;
	int restStops;
	String startLoc;
	String destination;
	int amount;
	String driverName;
	String travelsName;
	String startDate;
	String endDate;
	public Session(int busno, String busName, String arrivalTime, String departureTime, int restStops, String startLoc,
			String destination, int amount, String driverName, String travelsName, String startDate, String endDate) {
		super();
		this.busno = busno;
		this.busName = busName;
		this.arrivalTime = arrivalTime;
		this.departureTime = departureTime;
		this.restStops = restStops;
		this.startLoc = startLoc;
		this.destination = destination;
		this.amount = amount;
		this.driverName = driverName;
		this.travelsName = travelsName;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	
}

//object is used instead of variables..
class Driver {
	int busno;
	String rc;
	String driverName;
	String license;
	int age;
	
	public Driver(int busno, String rc, String driverName, String license, int age) {
		super();
		this.busno = busno;
		this.rc = rc;
		this.driverName = driverName;
		this.license = license;
		this.age = age;
	}
	
	
}

//object is used instead of variables


class Amenities{
	int busno;
	ArrayList<String>  amenities_present;
	public Amenities(int busno, ArrayList<String> amenities_present) {
		super();
		this.busno = busno;
		this.amenities_present = amenities_present;
	}
}


class Occupied {
	int busno;
	String seats;
	String date;
	String depttime;
	public Occupied(int busno, String seats, String date, String depttime) {
		super();
		this.busno = busno;
		this.seats = seats;
		this.date = date;//yes
		this.depttime = depttime;
	}
	
}
