<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		function valid(){
			uid=document.my.uid.value;
			if(uid=="")
				d1.innerText="userid required"
				return false;
			else {
				d1.innerText="";
				return true;
			}
		}
		function repl2(){
		alert("dddd");
			document.location.replace("index.html");
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
<form action="quest.jsp" onsubmit="return valid()" name="my">
	<table align="center">
	<tr>
		
		<td>userid<input type="text" name="uid"></td>
		<td><p id="d1"></p>
	</tr>
	<tr>
		<td><input type="submit" value="submit">
		 <input type="button" value="cancel" onclick="repl2()"/></td>
	</tr>
	</table>
</form>
</body>
</html>