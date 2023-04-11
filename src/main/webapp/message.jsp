<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	String status=(String)session.getAttribute("status");
if(status.equals("recieverstatus")){
%>
<h3 align="center"><a href="inbox.jsp"> back to inbox </a></h3>
<%}else{ %>
<h3 align="center"><a href="outbox.jsp"> back to outbox </a></h3>
<%} %>
<br>
<table style="color: black" bgcolor="white" align="center" height="200" width="700">
<tr>
	<td><%=request.getParameter("sub") %></td>
</tr>
<tr>
	<td>
	<%
		out.println(request.getParameter("msg"));
	%>
	</td>
</tr>
</table>
</body>
</html>