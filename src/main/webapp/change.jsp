<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
  <jsp:include page="header.jsp"></jsp:include> 
<%
	
	String pwd=request.getParameter("opwd");
	String npwd=request.getParameter("npwd"); 
	String uid=(String)session.getAttribute("userid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select password from registration where userid='"+uid+"'");
	Boolean buf=false;
	while(rs.next()){
		if(rs.getString("password").equals(pwd)){
			st.executeUpdate("update registration set password='"+npwd+"' where userid='"+uid+"' ");
			buf=true;
			break;
		}		
	}
	if(buf){
%> 
	<h3 align="center">password  changed</h3>
<%
	}
	else{
%> 
	<h3 align="center">password is not changed</h3>
<%	}
%>
