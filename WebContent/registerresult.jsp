<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>显示注册结果</title>
</head>
<body>
<%	
	String isRegistered=(String)application.getAttribute("isRegistered");
	
	if(isRegistered==null || isRegistered=="N")
	{
		out.println("当前用户注册成功，请重新登录系统");
	}
	else if(isRegistered=="Y")
	{
		out.println("当前用户名已存在，请重新填写注册信息");
	}
%>
<p><a href="register.jsp">返回注册窗口</a></p>
<p><a href="login.jsp">登录系统</a></p>

</body>
</html>