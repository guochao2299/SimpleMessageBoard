<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.test.bean.UserBuffer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>判断用户名密码</title>
</head>
<body>
<jsp:useBean id="user" class="com.test.bean.User"></jsp:useBean>
<jsp:setProperty property="name" name="user"/>
<jsp:setProperty property="password" name="user"/>
<%
	UserBuffer userBuffer=(UserBuffer)application.getAttribute("users");
	if(userBuffer==null)
	{
		userBuffer=new UserBuffer();
		application.setAttribute("users", userBuffer);
	}
		
	if(userBuffer.ValidateUser(user))
	{
		request.getRequestDispatcher("messageboard.jsp").forward(request,response);
	}
	else
	{
		response.sendRedirect("error.jsp");
	}
%>
</body>
</html>