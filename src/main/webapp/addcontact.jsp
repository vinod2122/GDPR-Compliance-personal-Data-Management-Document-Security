<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function repl(){
		document.location.replace("AddressBook.jsp");
	}
function valid(){
	var cn=document.ac.contactname.value;
	var cid=document.ac.contactid.value;
	if(cn=="")
		return false;
	else if(cid=="")
		return false;
	else return true;
}
</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form action="storecontact.jsp" name="ac" onsubmit="return valid()">
<table align="center">
	<tr>
		<td>contact name:</td>
		<td><input type="text" name="contactname"></td>
	</tr>
	<tr>
		<td>contact id:</td>
		<td><input type="text" name="contactid"></td>
	</tr>
	<tr>
		<td><input type="submit" value="add"></td>
		<td><input type="button" value="cancel" onclick="repl()"></td>
	</tr>
</table> 
</form>
</body>
</html>