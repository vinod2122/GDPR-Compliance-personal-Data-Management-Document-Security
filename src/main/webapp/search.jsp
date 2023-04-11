<html>
<head>
<script type="text/javascript">
	function ds(){
		sr=document.forms[0].srch.value;
		if(sr==null)		
			return false;
			return true;
	}
</script>
</head>
<body>
<form action="go.jsp" onsubmit="return ds()" method="post">
	<table>
	<tr>
		<td>
			search:<input type="text" name="srch" value="">
		</td>
	<tr>
		<td>
		within my documents<input type="radio" name="st" value="in" checked>
		out of my doucments<input type="radio" name="st" value="out">
		</td>
	</tr>
	<tr>
		<td>
		<input type="submit" value="search">
		</td>
	</tr>
	</table>
</form>	
</body>
</html>