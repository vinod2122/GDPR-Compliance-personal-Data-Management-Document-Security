<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import="java.util.Date"%>
<html>
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
	
	<form action="UpdateProfile.jsp"  method="post" onsubmit="return tests()" >
			<table align="center">	
				<tr>
					 <td> firstname *</td>
					 <td><input type="text" name="fn" maxlength="15"  value="<%=fn%>"/></td>
					 <td><p id="f1"></p></td>
				</tr>
				<tr>
				        <td>lastname *</td>
					<td><input type="text" name="ln" maxlength="15" value="<%=ln%>"/></td>
					<td><p id="f2"></p></td>
				</tr>
				<tr>
					<td>userid *</td>
					<td><input type="text" name="uid" maxlength="10" disabled="disabled" value="<%=user%>"/></td>
					<td><p id="f3"></p></td>
				</tr>
				
				<tr>
				        <td> emailid *</td>
					<td><input type="text" name="eid" maxlength="20" value="<%=eid%>"/></td>
					<td><p id="f5"></p></td>
				</tr>
				<tr>
					<td> city *</td>
					<td><input type="text" name="city" maxlength="10" value="<%=city%>" /></td>
					<td><p id="f6"></p></td>
				</tr>
				<tr>
					<td> phonenumber * +</td>
					<td><input type="text" name="phone" maxlength="12" value="<%=phno%>"/></td>
					<td><p id="f7"></p></td>
				</tr>
				<tr>
					<td>security question</td>
					<td><input type="text" name="sq" value="<%=sq%>"></td>
					<td><p id="qu"></p></td>
				</tr>
				<tr>
					<td>answer</td>
					<td><input type="text" name="ans" value="<%=ans%>"></td>
					<td><p id="as"></p></td>
				</tr>
				<tr>
				        <td><input type="submit" value="update"/>
				<input type="button" value="cancel" onclick="repl()"/></td>
				</tr>
				</table>			
		</form>
	
	</body>
