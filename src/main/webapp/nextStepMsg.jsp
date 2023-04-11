<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st=con.createStatement();
String s[]=request.getParameterValues("sub");
String ds=request.getParameter("s");
String status=(String)session.getAttribute("status");
	if(ds.equals("delete")){
		for(int i=0;i<s.length;i++){	
			st.executeUpdate("update message set "+status+"='deleted' where mid='"+s[i]+"'");
		}
		if(status.equals("recieverstatus")){
%>
			<jsp:forward page="inbox.jsp"></jsp:forward>
<% 		}
		else{
%>
			<jsp:forward page="outbox.jsp"></jsp:forward>
<%			
		}
}
	else{
%>
	<form action="forward.jsp">
		<h3 align="center" >forward to<input type="text" name="user">
		<input type="submit" value="forward"></h3>
	</form>
<%
		session.setAttribute("mlength",s.length);
		for(int i=0;i<s.length;i++){
			session.setAttribute("m"+i,s[i]);
		}
	}
%>
</body>
</html>