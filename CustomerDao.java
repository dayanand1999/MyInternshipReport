package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.Customer;
import com.entity.Record;

public class CustomerDao {
	String userName="root";
	String passWord="Ajinkya@123";
	String url="jdbc:mysql://localhost:3306/sparkintern?autoReconnect=true&useSSL=false";
	String driver="com.mysql.cj.jdbc.Driver";
	Statement stmt;
	Connection con;
	ResultSet rs;
	PreparedStatement pst;
	
	public CustomerDao()
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sparkintern?autoReconnect=true&useSSL=false","root","Ajinkya@123");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<Customer> getCustomers()
	{
		List<Customer> customers = new ArrayList<Customer>();
		
		try
		{
			pst=con.prepareStatement("select * from sparkbank");
			rs=pst.executeQuery();
			while(rs.next())
			{
				Customer c1 = new Customer();
				c1.setCid(rs.getInt(1));
				c1.setName(rs.getString(2));
				c1.setEmail(rs.getString(3));
				c1.setBalance(rs.getDouble(4));
				customers.add(c1);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return customers;
	}
	
	public List<Record> getRecords()
	{
		List<Record> records = new ArrayList<Record>();
		
		try
		{
			pst=con.prepareStatement("select * from transfers");
			rs=pst.executeQuery();
			while(rs.next())
			{
				Record r1 = new Record();
				r1.setTid(rs.getInt(1));
				r1.setScid(rs.getInt(2));
				r1.setRcid(rs.getInt(3));
				r1.setAmount(rs.getDouble(4));
				records.add(r1);
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return records;
	}
	
	public double getBalance(int cid) {
		double amount = 0;
		try {
			pst=con.prepareStatement("select balance from sparkbank where cid=?");
			pst.setInt(1, cid);
			rs=pst.executeQuery();
			while(rs.next()) {
				amount = rs.getDouble("balance");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return amount;
	}
	
	public int updateAccountBalance(int cid, double amount) 
	{
		int cnt=0;
		try
		{
			pst=con.prepareStatement("update sparkbank set balance=? where cid=?");
			pst.setDouble(1, amount);
			pst.setInt(2, cid);
			cnt=pst.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return cnt;
	}

	public int recordTransfer(int scid, int rcid, double amt) {
		int cnt=0;
		try {
			pst=con.prepareStatement("insert into transfers(scid,rcid,amount) values(?,?,?)");
			pst.setInt(1, scid);
			pst.setInt(2, rcid);
			pst.setDouble(3, amt);
			cnt=pst.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
		
	}
	
}
