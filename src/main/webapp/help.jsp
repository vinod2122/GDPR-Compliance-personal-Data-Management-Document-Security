<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%String uid=(String)session.getAttribute("userid"); %>
	<table align="center" border="2">
		<tr>
			<th>functionality</th>
			<th>usage</th>
		</tr>
		<tr>
			<td>compose</td>
			<td>helps to create and send message to users in the system</td>
		</tr>
		<tr>
			<td>inbox</td>
			<td>here you can see the messages came to you and share requests</td>
		</tr>
		<tr>
			<td>outbox</td>
			<td>here you can see the messages send from you</td>
		</tr>
		<%if(uid.equals("admin")){ %>
		<tr>
			<td>manage documents</td>
			<td>here you can manage all the documents in the system</td>
		</tr>
		<tr>
			<td>manage users</td>
			<td>here you can manage all the users with in the system</td>
		</tr>
		<tr>
			<td>report generation</td>
			<td>to generate reports of either users or documents</td>
		</tr>
		<%}else{ %>
		<tr>
			<td>create document</td>
			<td>here you can create documents to have online storage</td>
		</tr>
		<tr>
			<td>view document</td>
			<td>
				here you can view all your documents and documents shared documents.<br>
				from here you can share documents to any one in the system or send for approval.
			</td>
		</tr>
		<tr>
			<td>Approve documents</td>
			<td>here you can approve documents came for approval by you</td>
		</tr>
		<tr>
			<td>search</td>
			<td>here you can search your documents or documents in the system</td>
		</tr>
		<%} %>
		<tr>
			<td>settings</td>
			<td>here you can change your current password</td>
		</tr>
		<tr>
			<td>address book</td>
			<td>here you can maintain all your contacts of the users in the system </td>
		</tr>
		
	</table>
</body>
</html>