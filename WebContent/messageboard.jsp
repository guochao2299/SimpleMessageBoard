<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
</head>
<body>
<div>
<%
	String userName=request.getParameter("userName");
	String userIP=request.getRemoteAddr();
	String msg=request.getParameter("msg");
	String allMsgs="";
	
	if(msg!=null)
	{
		allMsgs=(String)application.getAttribute("messages");
		if(allMsgs==null)
		{
			allMsgs=msg;
		}
		else
		{			
			allMsgs+="<br>"+msg;
		}
		
		application.setAttribute("messages", allMsgs);
	}
%>
��ǰ�û���<%=userName %>;IP:<%=userIP %>
</div>
<div>
��������:<br>
<%=allMsgs %>
</div>
<div>
���������ԣ�
<form action="messageboard.jsp" method="post" name="mb">
<input type="text" name="msg">
<p><input type="submit" value="����" name="submit"/></p>
</form>
</div>

</body>
</html>