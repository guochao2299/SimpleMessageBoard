<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>��ʾע����</title>
</head>
<body>
<%	
	String isRegistered=(String)application.getAttribute("isRegistered");
	
	if(isRegistered==null || isRegistered=="N")
	{
		out.println("��ǰ�û�ע��ɹ��������µ�¼ϵͳ");
	}
	else if(isRegistered=="Y")
	{
		out.println("��ǰ�û����Ѵ��ڣ���������дע����Ϣ");
	}
%>
<p><a href="register.jsp">����ע�ᴰ��</a></p>
<p><a href="login.jsp">��¼ϵͳ</a></p>

</body>
</html>