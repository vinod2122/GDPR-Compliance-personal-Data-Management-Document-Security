<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat"%>
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
Statement st1=con.createStatement();
Statement st2=con.createStatement();
String uid=(String)session.getAttribute("userid");
String forwardto=request.getParameter("user");
if(forwardto!=null){
	Date dt=new Date();
	SimpleDateFormat sdt=new SimpleDateFormat("yyyy-MM-dd");
	int mlength=(Integer)session.getAttribute("mlength");
	
	try{
		for(int i=0;i<mlength;i++)
		{	String s=(String)session.getAttribute("m"+i);
			ResultSet rs=st1.executeQuery("select * from message where mid='"+s+"'");
			rs.next();
			st2.executeUpdate("insert into message (sender,reciever,subject,message,at,senderstatus,recieverstatus) values('"+uid+"','"+forwardto+"','"+rs.getString("subject")+"','"+rs.getString("message")+"','"+sdt.format(dt)+"','yes','yes')");	
		}
		
	%>
		<h3 align="center">message sended successfully</h3>
	<%		
	}
	catch(Exception e){
	%>	
	<h3 style="color: red">message sending failed. try again</h3>
	<%
	}
}
else{
%>
	<jsp:forward page="nextStepMsg.jsp"></jsp:forward>
<%	}
	
%>


</body>
</html>