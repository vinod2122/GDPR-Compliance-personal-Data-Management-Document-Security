<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	String uid=(String)session.getAttribute("userid");
	if(uid==null){
%>
		<jsp:forward page="index.html"></jsp:forward>
<%
	}
	else{
		
	
%>
<div id="templatemo_background_section_top">
		<div class="templatemo_container">
			<div id="templatemo_header">
				<div id="templatemo_logo">
					<h1>GDPR-COMPLIANT PERSONAL DATA MANAGEMENT</h1>
                    <h2>we secure your documents</h2>
				</div>
            <%if(!uid.equals("admin")){ %>
				<div id="templatemo_search_box">
					<jsp:include page="search.jsp"></jsp:include>
				</div>
			<%} %>
		</div>
	</div></div>
<jsp:include page="menu.jsp"></jsp:include>
<br><br><br>
<%} %>
</body>
</html>