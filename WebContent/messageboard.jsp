<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.test.bean.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
</head>
<body>
<div>
<%
	User userName=(User)application.getAttribute("currentUser");
	String userIP=request.getRemoteAddr();
	String allMsgs=(String)application.getAttribute("messages");
%>
��ǰ�û���<%=userName.getName() %>;IP:<%=userIP %>
</div>
<div>
��������:<br>
<%=allMsgs %>
</div>
<div>
���������ԣ�
<form action="MessageServlet" method="post" name="mb">
<input type="text" name="msg">
<p><input type="submit" value="����" name="submit"/></p>
</form>
</div>

</body>
</html>