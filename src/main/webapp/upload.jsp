<%@ page language="java"  import="java.sql.*,java.util.Date,java.text.*" %>
<html>
<head>
<script type="text/javascript">
	function check(){
		if(window.XMLHttpRequest){
			return(new XMLHttpRequest());
		}
		else if(window.ActiveXObject){
			return(new ActiveXObject("Microsoft.XMLHTTP"));
		}
		else return null;
	}
	function sendRequest(){
		var request=check();
		request.onreadystatechange=function(){handleResponse(request)};
		dns=document.forms[1].dn.value;
		vers=document.forms[1].ver.value;
		des=document.forms[1].des.value;
		request.open("get","sess.jsp?dn="+dns+"&ver="+vers+"&des="+des,true);
		request.send(null);
	}
	function handleResponse(request){
		if(request.readyState==4){
		}
	}
function valids(){

	dns=document.form1.dn.value;
	vers=document.form1.ver.value;
	val=true;
	if(dns==""){
		f1.innerText="document name required";
		val=false;
	}
	else{
		f1.innerText="";
	}
	if(vers== ""){
		f2.innerText="version required";
		val=false ;
	}
	else{
		re=/[0-9]/;
		word=new RegExp(re);
		if(!word.exec(vers)){
			f2.innerText="version should be a number";
			val=false;
		}
		else
			 f2.innerText="";
	}
	if(val==true) sendRequest();
	return val;
}
function vali(){
	var tr=valids();
	file=document.form2.uploadfile.value;
	if(file==""){
		f3.innerText="select a document";
		tr=false;
	}
	else f3.innerText="";
	return tr;
}
</script>	
</head>
<body >
<jsp:include page="header.jsp"></jsp:include>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select docid from docids");
int s=1; 
Boolean z;
if(z=rs2.next()) 
	while(z){
		s=Integer.parseInt(rs2.getString("docid"))+1;
		z=rs2.next();
	}
session.setAttribute("docid",s);
%>

<table align="center">
	<tr>
		<td>
			<form name="form1" >
			  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center" >
			    <tr>
			    	<td>author:</td>
			    	<td><input type="text" name="author" value="<%=session.getAttribute("userid") %>" disabled="disabled" ></td>
			    </tr>
			    <tr>
			    	<td>documentid:</td>
			    	<td><input type="text" name="docid" disabled="disabled" value="<%=session.getAttribute("docid")%>"></td>
			    </tr>
			    <tr>
			    	<td>documentname</td>
			    	<td><input type="text" name="dn"></td>
			    	<td><p id="f1"></p></td>
			    </tr>
			     <tr>
			    	<td>description</td>
			    	<td><textarea name="des" rows="3" cols="20"></textarea></td>
			      </tr>
			    <tr>
			    	<td>version:</td>
			    	<td><input type="text" name="ver" onblur="valids()" ></td>
			    	<td><p id="f2"></p></td>
			    </tr>
			      <%Date s1=new Date();
			   		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd"); 
			   	  %>
			      <tr>
			    	<td>date:</td>
			    	<td><input type="text" name="date" value="<%=f.format(s1) %>"disabled="disabled" ></td>
			   	 </tr> 
			 </table> 
		  </form>
	  </td>
	</tr>
   <tr>
   	 <td>
   	 	<form onsubmit="return vali()" method="post"  action="uploadFile2.jsp" name="form2" enctype="multipart/form-data">
		    <table>
			     <tr>
			     	<td><b>Select a file to upload </b></td>
			      	<td><input type="file" name="uploadfile"> </td>
			    	<td><p id="f3"></p></td>
			    </tr>
			    <tr>
			    	<td colspan="1"><input type="hidden" name="todo" value="upload">
			        	<input type="submit" name="Submit" value="Upload">
			        	<input type="reset" name="Reset" value="Cancel">
			        </td>
		    	</tr>
		    </table>
		</form>
	</td>
 </tr>
</table> 
</body>
</html>