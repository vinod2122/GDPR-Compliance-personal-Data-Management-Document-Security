	<jsp:include page="header.jsp"></jsp:include>
	<% 
	session.invalidate();
	%>
	<jsp:forward page="index.html"></jsp:forward>
