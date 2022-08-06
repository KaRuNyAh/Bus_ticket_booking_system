package com.busticket;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class demo 
{
	
	public static void main(String []args) throws Exception 
	{
		// TODO Auto-generated constructor stub
		
		String url="jdbc:mysql://localhost:3306//busticket";
		String uname="root";
		String pass="Karunyah@sai";
		String query="select * from bus";
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st =con.createStatement();
		ResultSet rs =st.executeQuery(query);
		String userData;
		while(rs.next()) {
			int a = rs.getInt(1);
			userData=	String.valueOf(a)+":"+rs.getString(2);
			System.out.println(userData);
		}
		st.close();
		con.close();
		//getConnection1();
		
	}
}