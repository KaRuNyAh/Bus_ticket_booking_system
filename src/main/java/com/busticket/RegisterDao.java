package com.busticket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterDao {

public static int register(User u){  
int status=0;  
try{  
	Class.forName("com.mysql.cj.jdbc.Driver");
Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/busticket", "root", "Karunyah@sai") ;
PreparedStatement ps=con.prepareStatement("INSERT into user values(?,?,?,?,?,?,?)");  
ps.setString(1,u.getUname());  
ps.setString(2,u.getUmno());
ps.setString(3,u.getUage() );
ps.setString(4, u.getUgender());
ps.setString(5, u.getUtype());
ps.setString(6, u.getUpass());
ps.setString(7,u.getUemail());  
 
              
status=ps.executeUpdate();  
}catch(Exception e){}  
      
return status;  
}

}