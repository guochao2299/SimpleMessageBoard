<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>留言簿程序用户登录</title>
</head>
<body>
<div align="center">用户登录<br>
<hr width="30%" size="3" style="background-color:rgb(64,0,0);">
<br>
<form action="deal.jsp" method="post" name="login">
	<p>用户名：<input type="text" size="15" name="name"/></p>
	<p>密码：<input type="password" size="15" name="password"/><br></p>
	<p><input type="submit" value="确定" name="submit"/></p>
</form>
<p><a href="register.jsp">新用户注册</a></p>
</div>
</body>
</html>