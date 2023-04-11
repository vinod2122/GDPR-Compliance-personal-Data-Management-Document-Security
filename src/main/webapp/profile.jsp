<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html >
<head>
<script language="javascript" type="text/javascript" src="regvalid.js">
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	String uid=(String)session.getAttribute("userid");
	ResultSet rs=st.executeQuery("select * from registration where userid='"+uid+"'");
	rs.next();
	String fn=rs.getString("firstname");
	String ln=rs.getString("lastname");
	String user=rs.getString("userid");
	String  eid=rs.getString("emailid");
	String city=rs.getString("city");
	String  phno=rs.getString("phonenumber");
	String sq=rs.getString("question");
	String ans=rs.getString("answer");
	%>
	
	<form action="edit.jsp"  method="post" onsubmit="return tests()" >
			<table align="center">	
				<tr>
					 <td> firstname *</td>
					 <td><%=fn%></td>
					 <td><p id="f1"></p></td>
				</tr>
				<tr>
				        <td>lastname *</td>
					<td><%=ln%></td>
					<td><p id="f2"></p></td>
				</tr>
				<tr>
					<td>userid *</td>
					<td><%=user%></td>
					<td><p id="f3"></p></td>
				</tr>
				
				<tr>
				        <td> emailid *</td>
					<td><%=eid%></td>
					<td><p id="f5"></p></td>
				</tr>
				<tr>
					<td> city *</td>
					<td><%=city%></td>
					<td><p id="f6"></p></td>
				</tr>
				<tr>
					<td> phonenumber * +</td>
					<td><%=phno%></td>
					<td><p id="f7"></p></td>
				</tr>
				<tr>
				</tr>
				<tr>
				        <td><input type="submit" value="edit"/>
				</td>
				</tr>
				</table>			
		</form>
	</body>
</html>