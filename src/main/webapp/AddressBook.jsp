<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function fun(){
		var len=document.ss.sivaji.length;
		if(len==null)
		{	
			if(document.ss.sivaji.checked)
				return true;
		}
		else{ 
				for(i=0;i<len;i++)
					if(document.ss.sivaji[i].checked)
						return true;
		}
		return false;
		
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	String uid=(String)session.getAttribute("userid");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from addressbook where userid='"+uid+"' order by contactname");
	Boolean z=rs.next();
%>
	<h3 align="center"><a href="addcontact.jsp">add new contact</a></h3>
<%	if(z){
%>
	<form action="ContactManage.jsp" name="ss" onsubmit="return fun()">
		<table align="center">
		<tr>
			<th>contact name</th>
			<th>contact Id</th>
		</tr>
<%		
			while(z){
%>				
		<tr>
			<td> <input type="checkbox" name="sivaji" value="<%=rs.getString("contactid")%>">
			<%=rs.getString("contactname")%></td>
			<td><%=rs.getString("contactid")%></td>
		</tr>		
<%			z=rs.next();
		}
			
%>		<tr>
			<td><input type="submit" value="send message" name="s"></td>
			<td><input type="submit" value="delete contact" name="s"></td>
		</tr>
		</table>
		
	</form>
<%
	}
	else{
%>
	<h3 align="center">NO contacts found</h3>
<%
		
	}
%>
	
</body>
</html>