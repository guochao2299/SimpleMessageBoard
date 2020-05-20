package com.test.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class OperateJDBC
{	
	private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	
	private static Connection getConnection() 
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");	
			System.out.println("load successfully£¡");
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		try 
		{
			String url="jdbc:mysql://localhost:3306/messageboard?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			con=DriverManager.getConnection(url, "ttt", "111111111");
			System.out.println("connected successfully!");
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}
	
	public OperateJDBC()
	{		
		
	}
	
	public Boolean ValidateUser(User user)
	{
		Boolean result=false;
		
		try
		{
			con=getConnection();			
			stmt=con.createStatement();			
			String queryString="select 1 from user where Account='"+user.getName()+"' and password= '"+user.getPassword()+"'";
			rs=stmt.executeQuery(queryString);
			result=rs.next();
			rs.close();
			stmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return result;
	}
	
	public Boolean IsUserRegisiterd(String userName)
	{
		Boolean result=false;
		
		try
		{
			con=getConnection();
			stmt=con.createStatement();
			String queryString="select 1 from user where Account='"+userName+"'";					
			rs=stmt.executeQuery(queryString);
			result=rs.next();
			rs.close();
			stmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return result;
	}
	
	public void AddUser(User user)
	{
		try
		{
			con=getConnection();			
			stmt=con.createStatement();
			String insertString="INSERT INTO user VALUES ('"+user.getName()+"','"+user.getPassword()+"','"+user.getEmail()+"')";
			stmt.executeUpdate(insertString);	
			rs.close();
			stmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public void AddMessage(String userName,String msg)
	{
		try
		{
			con=getConnection();
			stmt=con.createStatement();
			Date date = new Date();
	        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String curDate = sf.format(date);

			String insertString="INSERT INTO messages (`UserAccount`,`ReleaseTime`,`Message`) VALUES ('"+userName+"','"+curDate+"','"+msg+"')";
			stmt.executeUpdate(insertString);	
			rs.close();
			stmt.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	
	public String GetAllMessages()
	{
		StringBuilder allMsgs=new StringBuilder();
		
		try
		{
			con=getConnection();
			stmt=con.createStatement();
			String queryString="SELECT `UserAccount`,`ReleaseTime`,`Message` FROM `messageboard`.`messages` order by MsgIndex desc";
			rs=stmt.executeQuery(queryString);				
			
			rs.beforeFirst();
			while(rs.next())
			{
				allMsgs.append("["+rs.getString("ReleaseTime")+"]"+rs.getString("UserAccount")+":"+rs.getString("Message")+"<br>");
			}
			
			rs.close();
			stmt.close();
			con.close();		
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return allMsgs.toString();
	}
}
