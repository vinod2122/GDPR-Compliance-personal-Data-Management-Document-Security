<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
		function val(){
				var sub=document.ss.sub.value;
				if(sub=="")
					return false;
				return true;
		}
	</script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<form action="pass.jsp" name="ss" onsubmit="return val()">
		<table align="center">
			<tr>
				<td>subject:<input type="text" name="sub" size="80"></td>
			</tr>
			<tr><td><textarea rows="10" cols="70" name="msg"></textarea>
					<input type="submit" value="send">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>