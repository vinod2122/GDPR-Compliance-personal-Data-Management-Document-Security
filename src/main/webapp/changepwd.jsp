<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
		function  valids(){
			var opw=document.cp.opwd.value;
			var npw=document.cp.npwd.value;
			var cpw=document.cp.cpwd.value;
			if(opw==""||npw==""||cpw==""){
					if(opw=="")
						opmsg.innerText=" current password required";
					else opmsg.innerText=" ";
					if(npw=="")
						npmsg.innerText="new  password required";
					else npmsg.innerText=" ";
					
					if(cpw=="")
						ns.innerText=" conform password";
					else ns.innerText=" ";
					return false;
			}
			else if(npw.length<6){
						npmsg.innerText="password should me minimum of 6 characters";
					return false;
					}
			else if(npw!=cpw){
					ns.innerText="password do not match";
				return false;
			}
				
		}
		
	</script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<form name="cp" onsubmit=" return valids()" action="change.jsp" method="post">
<table align="center">
		<tr>
		<td colspan="3"><p id="cpmsg"></p></td>
		</tr>
	<tr>
	<td>current password</td>
	<td><input type="password" name="opwd"></td>
	<td ><p id="opmsg"></p></td>
	</tr>
	<tr>
		<td>new password</td>
		<td><input type="password" name="npwd"></td>
		<td ><p id="npmsg"></p></td>
	</tr>
	<tr><td>confirm password</td>
		<td><input type="password" name="cpwd"></td>
		<td ><p id="ns"></p></td>
	</tr>
	<tr>
		<td><input type="submit" value="change"></td>
	</tr>
	</table>

</form>
</body>
</html>