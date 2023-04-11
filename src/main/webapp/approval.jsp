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
	Statement st2=con.createStatement();
	String uid=(String)session.getAttribute("userid");
	String appBy=request.getParameter("approvalby");
	if(appBy!=null){
		int slength=(Integer)session.getAttribute("slength");
		int vlength=(Integer)session.getAttribute("vlength");
		try{
			for(int i=0;i<slength;i++)
			{	String s=(String)session.getAttribute("s"+i);
				st2.executeUpdate("insert into approval values('documentload','"+s+"','"+uid+"','"+appBy+"','yetto')");	
			}
			for(int i=0;i<vlength;i++)
			{	String s=(String)session.getAttribute("v"+i);
				st2.executeUpdate("insert into approval values('documentshared','"+s+"','"+uid+"','"+appBy+"','yetto')");
			}
%>
		<jsp:forward page="DownloadView.jsp"></jsp:forward>
<%
		}
		catch(Exception e){
	%>
			<h3 style="color: red">document(s) is not send for approval. try agin</h3>
	<% 	
		}
	}
	%>
</body>
</html>