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
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st1=con.createStatement();	
Statement st2=con.createStatement();
String uid=(String)session.getAttribute("userid");
String sharedto=request.getParameter("share");
	if(sharedto!=null){
	Date dt=new Date();
	SimpleDateFormat sdt=new SimpleDateFormat("yyyy-MM-dd");
	int slength=(Integer)session.getAttribute("slength");
	int vlength=(Integer)session.getAttribute("vlength");
	
		for(int i=0;i<slength;i++)
		{	String s=(String)session.getAttribute("s"+i);
			ResultSet rs=st1.executeQuery("select * from documentload where docid='"+s+"'");
			rs.next();
			
			st2.executeUpdate("insert into documentshared values('"+s+"','"+sharedto +"','"+uid+"','"+ sdt.format(dt)+"','shared')");	
		}
		for(int i=0;i<vlength;i++)
		{	String s=(String)session.getAttribute("v"+i);
			ResultSet rs=st1.executeQuery("select * from documentshared where docid='"+s+"' and sharedto='"+uid+"'");
			rs.next();
			
			st2.executeUpdate("insert into documentshared values(insert into documentshared values('"+s+"','"+sharedto +"','"+uid+"','"+ sdt.format(dt)+"','shared'))");
		}
	
%>
		<jsp:forward page="DownloadView.jsp"></jsp:forward>
<%		
	}
	else{
%>
	<jsp:forward page="removedoc.jsp"></jsp:forward>
<%	}
	
}
catch(Exception e){
%>
		<h3 align="center" style="color: pink">File shared to this user</h3>
<%
}
%>
	
</body>
</html>