<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.test.bean.UserBuffer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>��ʾע����</title>
</head>
<body>
<jsp:useBean id="user" class="com.test.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>
�û���Ϣ���£�<br>
�û�����<jsp:getProperty property="name" name="user"/><br>
���룺<jsp:getProperty property="password" name="user"/><br>
���䣺<jsp:getProperty property="email" name="user"/><br>

<%
	UserBuffer userBuffer=(UserBuffer)application.getAttribute("users");
	if(userBuffer==null)
	{
		userBuffer=new UserBuffer();
		application.setAttribute("users", userBuffer);
	}
	
	if(userBuffer.IsUserRegisiterd(user.getName()))
	{
		out.println("��ǰ�û����Ѵ��ڣ���������дע����Ϣ");
	}
	else
	{
		out.println("��ǰ�û�ע��ɹ��������µ�¼ϵͳ");
		userBuffer.AddUser(user);
		application.setAttribute("users", userBuffer);
	}
%>
<p><a href="register.jsp">����ע�ᴰ��</a></p>
<p><a href="login.jsp">��¼ϵͳ</a></p>

</body>
</html>