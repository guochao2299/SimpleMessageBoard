<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.test.bean.UserBuffer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>显示注册结果</title>
</head>
<body>
<jsp:useBean id="user" class="com.test.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
用户信息如下：<br>
用户名：<jsp:getProperty property="name" name="user"/><br>
密码：<jsp:getProperty property="password" name="user"/><br>
邮箱：<jsp:getProperty property="email" name="user"/><br>

<%
	UserBuffer userBuffer=(UserBuffer)application.getAttribute("users");
	if(userBuffer==null)
	{
		userBuffer=new UserBuffer();
		application.setAttribute("users", userBuffer);
	}
	
	if(userBuffer.IsUserRegisiterd(user.getName()))
	{
		out.println("当前用户名已存在，请重新填写注册信息");
	}
	else
	{
		out.println("当前用户注册成功，请重新登录系统");
		userBuffer.AddUser(user);
		application.setAttribute("users", userBuffer);
	}
%>
<p><a href="register.jsp">返回注册窗口</a></p>
<p><a href="login.jsp">登录系统</a></p>

</body>
</html>