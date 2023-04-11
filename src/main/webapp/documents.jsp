<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
		function valids1(){
			var len=document.docform.docs.length;
			if(len>0)
				for(i=0;i<len;i++){
					if(document.docform.docs[i].checked)
					  		return true;
				}
			else
				if(document.docform.docs.checked)
					return true;
		
			return false;
		}
	</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from documentload where status!='deleted'");
Boolean z=rs.next();
if(z){
%><form action="managedocs.jsp" method="get" name="docform"  onsubmit="return valids1()">
	<table align="center" border="1">
		<tr>
			<th>document name</th>
			<th>document id</th>
			<th>author</th>
			<th>size</th>
		</tr>
<%
	while(z){
		%>
		<tr>
			<td><input type="checkbox" name="docs" value="<%=rs.getString("docid")%>"><%=rs.getString("docname")%></td>
			<td><%=rs.getString("docid") %></td>
			<td><%=rs.getString("author") %></td>
			<td><%= rs.getString("size1")%></td>
		</tr>
<%
	z=rs.next();
	}
%>
	<tr>
		<td colspan="5"><input type="submit" value="delete"></td>
	</tr>
	</table></form>
<% 
}
%>
</body>
</html>