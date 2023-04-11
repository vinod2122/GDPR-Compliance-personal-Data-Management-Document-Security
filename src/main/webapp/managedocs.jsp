<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	String s[]=request.getParameterValues("docs");
	if(s!=null)
		for(int i=0;i<s.length;i++)
		{	
			st.executeUpdate("update documentload set status='deleted' where docid='"+s[i]+"'");
			
		}
	
%>
<jsp:forward page="documents.jsp"></jsp:forward>
</body>
</html>