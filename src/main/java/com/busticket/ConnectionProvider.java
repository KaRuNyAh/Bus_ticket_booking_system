package com.busticket;  
import java.sql.Connection;
import java.sql.DriverManager;  
  
  
public class ConnectionProvider {  
static final String DB_URL = "jdbc:mysql://localhost:3306/busticket";
static final String USER = "root";
static final String PASS = "Karunyah@sai";

  
public static  Connection getCon() throws ClassNotFoundException{  
	
	Connection con=null;  
		try{  
		con=DriverManager.getConnection(DB_URL,USER,PASS);  
		}catch(Exception e){}  
	
    return con;  
}  
  
}  
