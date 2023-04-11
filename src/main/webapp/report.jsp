<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<form action="generate.jsp">
		<table align="center">
			<tr>
				<td>reports of</td>
				<td><input type="radio" name="report" value="user" checked="checked">users</td>
				<td><input type="radio" name="report" value="document">documents</td>
			</tr>
			<tr>
				<td>from<input type="text" name="start"/>(2010-05-31)</td>
				<td>to<input type="text" name="end">(2010-05-31)</td> 
				<td><input type="submit" name="generate" value="generate"></td>
			</tr>
			
		</table>
	</form>
</body>
</html>