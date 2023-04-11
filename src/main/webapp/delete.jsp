
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
	String sq=request.getParameter("s");
	if(sq.equals("delete")){
	String s[]=request.getParameterValues("del") ;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	for(int i=0;i<s.length;i++){
		st.executeUpdate("update documentload set status='deleted' where docid='"+s[i]+"'");
	} 
	}
	out.print(sq);
%>

</body>
</html>