
<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*;"%>
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
	try{
	
	String firstname=request.getParameter("fn");
	String lastname=request.getParameter("ln");
	String userid=request.getParameter("uid");
	String password=request.getParameter("pwd");
	String emailid=request.getParameter("eid");
	String city=request.getParameter("city");
	String regon=request.getParameter("date");
	String phonenumber=request.getParameter("phone");
	String status=request.getParameter("sts");
	String question=request.getParameter("qus");
	String answer=request.getParameter("ans");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1, firstname);
	ps.setString(2, lastname);
	ps.setString(3, userid);
	ps.setString(4, password);
	ps.setString(5, emailid);
	ps.setString(6, city);
	ps.setString(7, regon);
	ps.setString(8, phonenumber);
	ps.setString(9, status);
	ps.setString(10, question);
	ps.setString(11, answer);
	int i=ps.executeUpdate();
	out.println("Registered ");
	%>
	<p align="center"> you have successfully registered.<br>click here to <a href="index.html">login</a>
	
	</p>
	   <% }
	catch(Exception e){
		out.print(e);
	%>     <p> registrationfailed</p> 
	<%} 
	%>  	  
           	 
	
	</div></div></div>
       
	</body>
</html>