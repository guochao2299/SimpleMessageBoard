<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>新用户注册</title>
</head>
<body>
<div align="center">新用户注册<br>
<hr width="30%" size="1" style="background-color:rgb(64,0,0);">
<br>
<form action="registerresult.jsp" method="post" name="login">
	<p>用户名：<input type="text" size="15" name="name"/></p>
	<p>密码：<input type="password" size="15" name="password"/></p>
	<p>电子邮箱：<input type="text" size="15" name="email"/><br></p>
	<p><input type="submit" value="注册" name="submit"/></p>
</form>
</div>
</body>
</html>