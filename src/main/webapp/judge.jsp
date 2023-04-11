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
String uid=(String)session.getAttribute("userid");
String s[]=request.getParameterValues("selec");
String app=request.getParameter("approval");
if(app.equals("approve")){
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update approval set status='approved' where approvalby='"+uid+"' and docid='"+s[i]+"' ");
	}
}
else{
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update approval set status='discarded' where approvalby='"+uid+"' and docid='"+s[i]+"' ");
	}
}
%>
<jsp:forward page="Approve.jsp"></jsp:forward>
</body>
</html>