<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
	Statement st=con.createStatement();
	String uid=(String)session.getAttribute("userid");
	String s[]=request.getParameterValues("mine");
	String v[]=request.getParameterValues("share");
	String ds=request.getParameter("s");
	if(ds.equals("delete")){
		if(s!=null)
		for(int i=0;i<s.length;i++)
		{	
			st.executeUpdate("delete from approval where docid='"+s[i]+"' and userid='"+uid+"'");
			st.executeUpdate("update documentload set status='deleted' where docid='"+s[i]+"'");
			
		}
		else
		for(int j=0;j<v.length;j++){
			st.executeUpdate("delete from approval where docid='"+v[j]+"' and userid='"+uid+"'");
			st.executeUpdate("update documentshared set status='deleted' where docid='"+v[j]+"' and sharedto='"+uid+"'");
		}
%>
	<jsp:forward page="DownloadView.jsp"></jsp:forward>
<%
	}
	else if(ds.equals("share")){
%>		<form action="share.jsp">
		<h3 align="center">share to:<input type="text" name="share">
			<input type="submit" value="share"></h3>
		</form>
<%
	if(s!=null){
		session.setAttribute("slength",s.length);
		session.setAttribute("vlength",0);
		for(int i=0;i<s.length;i++){
			session.setAttribute("s"+i,s[i]);
		}
	}
	else{	session.setAttribute("slength",0);
			session.setAttribute("vlength",v.length);
			for(int i=0;i<v.length;i++){
				session.setAttribute("v"+i,v[i]);
			}
	}
} 
else{ 
%>
		<form action="approval.jsp">
	<h3 align="center">approval by:<input type="text" name="approvalby">
	<input type="submit" name="send for approval"></h3>
	</form>
<%if(s!=null){
			session.setAttribute("slength",s.length);
			session.setAttribute("vlength",0);
			for(int i=0;i<s.length;i++){
				session.setAttribute("s"+i,s[i]);
			}
			
		}
		else{
			session.setAttribute("slength",0);
			session.setAttribute("vlength",v.length);
			for(int i=0;i<v.length;i++){
				session.setAttribute("v"+i,v[i]);
			}
		}
}
%>
</body>
</html>