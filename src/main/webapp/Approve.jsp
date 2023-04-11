<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
		function vals(){
			ln=document.myform.selec.length;
			if(ln==null)
				if(document.myform.selec.checked)
					return true;
			for(i=0;i<ln;i++)
				if(document.myform.selec[0].checked)
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
Statement st2=con.createStatement();
String uid=(String)session.getAttribute("userid");
ResultSet rs3;
ResultSet rs=st.executeQuery("select * from approval where approvalby='"+uid+"' and status='yetto'");
Boolean z=rs.next();
if(z){
%>
<form action="judge.jsp" method="post" onsubmit="return vals()"
	name="myform">
<table align="center">
	<tr>
		<th>document name</th>
		<th>documentid</th>
		<th>sent by</th>
		<th></th>
	</tr>
	<%while(z){ 
			
				rs3=st2.executeQuery("select * from documentload where docid='"+rs.getString("docid")+"' ");
				rs3.next();
		%>
	<tr>

		<td><input type="checkbox" name="selec"
			value='<%=rs.getString("docid")%>'> <a
			href='DownloadFile.jsp?path=C:\dms\<%=rs3.getString("filepath")%>'><%=rs3.getString("docname")%></a>
		</td>
		<td><%=rs3.getString("docid")%></td>
		<td><%=rs.getString("userid") %></td>

	</tr>
	<%	
		z=rs.next();}
		%>
	<tr>
		<td><input type="submit" value="approve" name="approval"></td>
		<td><input type="submit" value="reject" name="approval"></td>
	</tr>
</table>
</form>
<%}
else{
%>
<h3 align="center">no documents to approve</h3>
<%	
}
%>
</body>
</html>