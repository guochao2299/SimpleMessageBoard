<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>判断用户名密码</title>
</head>
<body>
<%
	String userName=request.getParameter("userName");
	String userPassword=request.getParameter("userPassword");
	
	if(userName.equals("gc_2299") && userPassword.equals("123456"))
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