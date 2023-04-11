<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function fun(){
		
		alert(document.myform.list.length);
		return false;
		
	}
</script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String uid="sivaji";//(String)session.getAttribute("userid");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from addressbook where userid='"+uid+"'");
%>
<form action="" onsubmit="return fun()" name="myform">
	<% int i=0;
	while(rs.next())
	{ 
	%>
		<input type="checkbox" id="list" value="<%=i%>" >		
	<%
		i++;	
	}
	%>
	<input type="submit" value="submit">
</form>
</body>
</html>