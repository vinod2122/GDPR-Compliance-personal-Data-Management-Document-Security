<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe:", "gdpr", "gdpr");
Statement st=con.createStatement();
st.executeUpdate("create table registration(firstname varchar(15),lastname varchar(15),userid varchar(20) not null,password varchar(15),emailid varchar(40),city varchar(40),regon date,phonenumber varchar(12),status varchar(10),question text,answer text,primary key(userid))");
st.executeUpdate("create table documentload(docname varchar(50), description text,docid integer  not null,version integer,author varchar(10),size1 integer,createdon date, status varchar(10),filepath varchar(200),primary key(docid),foreign key(author) references registration(userid))");
st.executeUpdate("create table documentshared(docid integer,sharedto varchar(20),sharedby varchar(20),sharedat date,status varchar(10),primary key(docid,sharedto),foreign key(docid) references documentload(docid),foreign key(sharedto) references registration(userid),foreign key(sharedby) references registration(userid))"); //foreign key(docid) references documentload(docid),");
st.executeUpdate("create table approval(tables varchar(20),docid integer,userid varchar(20),approvalby varchar(20),status text,primary key(docid,approvalby),foreign key(approvalby) references registration(userid) )");	
st.executeUpdate("create table docids(docid integer ,primary key(docid))");
st.executeUpdate("create table message(mid integer auto_increment,sender varchar(20),reciever varchar(20),subject text,message text,at Date,senderstatus varchar(10),recieverstatus varchar(10),primary key(mid),foreign key(sender) references registration(userid),foreign key(reciever) references registration(userid))");
st.executeUpdate("create table AddressBook(userid varchar(20),contactname varchar(30),contactid varchar(30),primary key(userid,contactid),foreign key(userid) references registration(userid),foreign key(contactid) references registration(userid))");
%>
success.

</body>
</html>