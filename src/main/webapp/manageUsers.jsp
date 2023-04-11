<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	String uid=(String)session.getAttribute("userid");
	String s[]=request.getParameterValues("users");
	if(s!=null)
		for(int i=0;i<s.length;i++)
		{	
			st.executeUpdate("update registration set status='deleted' where userid='"+s[i]+"'");
			
		}
	
%>
<jsp:forward page="users.jsp"></jsp:forward>
</body>
</html>