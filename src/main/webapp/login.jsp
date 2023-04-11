<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st=con.createStatement();
String uid=request.getParameter("uname");
String pwd=request.getParameter("pwd");
ResultSet rs=st.executeQuery("select * from registration where status!='deleted'");
while(rs.next()){
	String userid=(String)rs.getString("userid");
	String pass=(String)rs.getString("password");
	if((userid.equals(uid))&&(pass.equals(pwd))){
		session.setAttribute("userid",userid );
	%>	
	
	<jsp:forward page="home.jsp"></jsp:forward>

<%		
	}
}
%>

<jsp:forward page="home.html"></jsp:forward>
</body>
</html>