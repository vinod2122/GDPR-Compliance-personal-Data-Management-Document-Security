<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.Date;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	String uid=(String)session.getAttribute("userid");
	String rec=request.getParameter("to");
	String sub=request.getParameter("sub");
	String msg=request.getParameter("msg");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	Date s1=new Date();
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd"); 
	
	if(rec==null){
		int slen=(Integer)session.getAttribute("smlength");
		for(int i=0;i<slen;i++){
			rec=(String)session.getAttribute("sm"+i);
			//st.executeUpdate("insert into message (sender,reciever,subject,message,at,senderstatus,recieverstatus) values('"+uid+"','"+rec+"','"+sub+"','"+msg+"','"+f.format(s1)+"','yes','yes')");
			st.executeUpdate("insert into message (sender,reciever,subject,message,at,senderstatus,recieverstatus) values(?,?,?,?,?,?,'yes','yes')");
		}
	%>
	<h3 align="center"> message sent success fully</h3>
	<%
	}
	else{
	try{
		//st.executeUpdate("insert into message (sender,reciever,subject,message,at,senderstatus,recieverstatus) values('"+uid+"','"+rec+"','"+sub+"','"+msg+"','"+f.format(s1)+"','yes','yes')");
		st.executeUpdate("insert into message (sender,reciever,subject,message,at,senderstatus,recieverstatus) values(?,?,?,?,?,?,'yes','yes')");
	
	%>
<h3 align="center"> message sent success fully</h3>
<%
	}
	catch(Exception e){
%>
		<h3 align="center" style="color: red"> message sending failed</h3>
<%	} 
	}
%>
</body>
</html>