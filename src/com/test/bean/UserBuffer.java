package com.test.bean;

import java.util.HashMap;
import java.util.Map;

public class UserBuffer
{
	private Map<String,User> userBuffer=new HashMap<String,User>();
	
	public UserBuffer()
	{
		User user=new User();
		user.setName("gc_2299");
		user.setPassword("123456");
		user.setEmail("1234567@qq.com");
		
		userBuffer.put(user.getName(), user);
	}
	
	public Boolean ValidateUser(User user)
	{
		if(!IsUserRegisiterd(user.getName()))
		{
			return false;
		}
		
		User u=userBuffer.get(user.getName());
		
		return u.getPassword().equals(user.getPassword());
	}
	
	public Boolean IsUserRegisiterd(String userName)
	{
		return userBuffer.containsKey(userName);
	}
	
	public void AddUser(User user)
	{
		userBuffer.put(user.getName(), user);
	}
}
