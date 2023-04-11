<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<%
	String s=request.getParameter("srch");
%>
<jsp:include page="header.jsp"></jsp:include>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st2=con.createStatement();
	Statement st3=con.createStatement();
	String us=request.getParameter("st");
	String uid=(String)session.getAttribute("userid");
%>
<table align="center" border="1">
	<tr>
		<th>document name</th>
		<th>description</th>
		<th>docid</th>
		<th>author</th>
		<th>size</th>
	</tr>
<%
	if(us.equals("in")){
		ResultSet rs1=st2.executeQuery("select * from documentload where status !='deleted' and author='"+uid+"'");
		String d[]=s.split(" ");
		while(rs1.next()){
			String k=rs1.getString("docname");
			for(int i=0;i<d.length;i++){
				if(k.startsWith(d[i])){
%>					<tr>	
						<td><a href="c:\dms\<%=rs1.getString("filepath")%>"><%=k%></a></td>
						<td><%=rs1.getString("description")%></td>
						<td><%=rs1.getString("docid")%></td>	
						<td><%=rs1.getString("author") %></td>
						<td><%=rs1.getString("size1") %></td>
								
					</tr>
<%
				}
			
			}
		}
		ResultSet rs3=st3.executeQuery("select * from documentshared where status !='deleted' and sharedto='"+uid+"'");
		while(rs3.next()){
			ResultSet rs2=st2.executeQuery("select * from documentload where docid='"+rs3.getString("docid")+"'");
			rs2.next();	
			String k=rs2.getString("docname");
			for(int i=0;i<d.length;i++){
				if(k.startsWith(d[i])){
%>					
					<tr>	
						<td><a href="c:\dms\<%=rs2.getString("filepath")%>"><%=k%></a></td>
						<td><%=rs2.getString("description")%></td>
						<td><%=rs2.getString("docid")%></td>	
						<td><%=rs2.getString("author") %></td>
						<td><%=rs2.getString("size1") %></td>
					</tr>	
<%				}
			
			}
		}
		
	}
else{
		ResultSet rs1=st2.executeQuery("select * from documentload where status !='deleted' and author!='"+uid+"'");
		String d[]=s.split(" ");
		while(rs1.next()){
			String k=rs1.getString("docname");
			for(int i=0;i<d.length;i++){
				if(k.startsWith(d[i])){
%>
					<tr>	
						<td><%=k%></td>
						<td><%=rs1.getString("description")%></td>
						<td><%=rs1.getString("docid")%></td>	
						<td><%=rs1.getString("author") %></td>
						<td><%=rs1.getString("size1") %></td>
								
					</tr>			
<%				
				}
				if(k.startsWith(d[i])){
%>
					<tr>	
						<td><%=k%></td>
						<td><%=rs1.getString("description")%></td>
						<td><%=rs1.getString("docid")%></td>	
						<td><%=rs1.getString("author") %></td>
						<td><%=rs1.getString("size1") %></td>
								
					</tr>
<%				}
			}
		}
		ResultSet rs3=st3.executeQuery("select * from documentshared where status !='deleted' and sharedto!='"+uid+"'");
		while(rs3.next()){
			ResultSet rs2=st2.executeQuery("select * from documentload where docid='"+rs3.getString("docid")+"'");
			rs2.next();	
			String k=rs2.getString("docname");
			for(int i=0;i<d.length;i++){
					if(d[i].startsWith(k)){
%>
					<tr>	
						<td><%=k%></td>
						<td><%=rs2.getString("docid")%></td>	
						<td><%=rs2.getString("author") %></td>
						<td><%=rs2.getString("size1") %></td>
					</tr>			
<%					}
					if(k.startsWith(d[i])){
%>	
						<tr>	
							<td><%=k%></td>
							<td><%=rs2.getString("docid")%></td>	
							<td><%=rs2.getString("author") %></td>
							<td><%=rs2.getString("size1") %></td>
						</tr>			
					
<%					}
			}
		}
	}
%>
</table>
</body>
</html>