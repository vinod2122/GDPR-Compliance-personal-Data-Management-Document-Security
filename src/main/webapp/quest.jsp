<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		function valids()
		{
			vas=document.dd.ans.value;
			if(vas==""){
				f2.innerText="answer required";
				return false
			}
			else{
				f2.innerText="";
				return true;
			}
				
		}
	</script>
</head>
<body>
<div id="templatemo_background_section_top">
		<div class="templatemo_container">
			<div id="templatemo_header">
				<div id="templatemo_logo">
					<h1>DOCUMENT MANAGEMENT SYSTEM</h1>
                    <h2>WE SECURE YOUR DOCUMENTS</h2>
				</div>
                      </div></div></div>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st1=con.createStatement();
Statement st2=con.createStatement();
String s=request.getParameter("uid");
session.setAttribute("uid",s);
int l=1;
ResultSet rs=st2.executeQuery("select userid from registration");
while(rs.next()){
	if(rs.getString("userid").equals(s)){
		ResultSet rs2=st1.executeQuery("select question from registration where userid='"+s+"'");
		rs2.next();
%>

		<form action="yourpwd.jsp" onsubmit="return valids()" name="dd">
		<table>
			<tr><td>security question:<%=rs2.getString("question")%></td><td><p id="f2"></p></td></tr>
			<tr><td>your answer<input type="text" name="ans"></td></tr>
			<tr><td><input type="submit" value="submit"></td></tr>
		</table>
	</form>
<%	l=0;
	break;
	}
}
if(l==0){}
else{
	out.print("userid not exists");
}
	
%>




</body>
</html>