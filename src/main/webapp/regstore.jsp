<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date;"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="templatemo_background_section_top">
		<div class="templatemo_container">
			<div id="templatemo_header">
				<div id="templatemo_logo">
					<h1>GDPR-COMPLIANT PERSONAL DATA MANAGEMENT</h1>
                    <h2>WE SECURE YOUR DOCUMENTS</h2>
				</div>
                      
        
	</div><!--  End Of Back Ground Section Top  -->
    
                   
                <div id="templatemo_section">
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	String firstname=request.getParameter("fn");
	String lastname=request.getParameter("ln");
	String userid=request.getParameter("uid");
	String password=request.getParameter("pwd");
	String emailid=request.getParameter("eid");
	String city=request.getParameter("city");
	String phonenumber=request.getParameter("phone");
	String question=request.getParameter("qus");
	String answer=request.getParameter("ans");
	Date regon=new Date();
	SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
	try{
	st.executeUpdate("insert into registration values('"+firstname+"','"+lastname+"','"+userid+"','"+password+"','"+emailid+"','"+city+"','"+s.format(regon)+"','"+phonenumber+"','offline','"+question+"','"+answer+"')");
	%>
	<p align="center"> you have successfully registered.<br>click here to <a href="index.html">login</a>
	
	</p>
	   <% }
	catch(Exception e){
	%>     <p> registrationfailed</p> 
	<%} %>  	  
           	 
	
	</div></div></div>
       
	</body>
</html>