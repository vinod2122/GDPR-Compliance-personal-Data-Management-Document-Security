<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="free css templates, business template, HTML CSS" />
<meta name="description" content="Business Template - Free CSS Templates by TemplateMo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
		var userid;
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
			var uid=document.forms[0].uid.value;
		if(uid==""){
		}
	else{
		var request=check();
		request.onreadystatechange=function(){handleResponse(request)};
		userid=document.forms[0].uid.value;
		request.open("POST","UseridCheck.jsp?uid="+userid,true);
		request.send(null);
		}
	}
	function handleResponse(request){
		var make=true;
		if(request.readyState==4){
			s=""+request.responseText;
			if(s.match("true")){
					us.innerText=userid+" is avilable ";
					f9.innerText="";
					make=true;
			}
			 else {
				f9.innerText=userid+" is avilable ";
				us.innerText="";
				make=false;
			} 
		}
	}
	function repl(){
		document.location.replace("index.html");
	}
	function tests(){
	var val=true;
	var fn=document.forms[0].fn.value;
	var ln=document.forms[0].ln.value;
	var uid=document.forms[0].uid.value;
	var pwd=document.forms[0].pwd.value;
	var cepwd=document.forms[0].cepwd.value;
	var eid=document.forms[0].eid.value;
	var city=document.forms[0].city.value;
	var phnumber=document.forms[0].phone.value;
	var qus=document.forms[0].qus.value;
	var ans=document.forms[0].ans.value;
	if(fn==""){
		f1.innerText="first name required";
		val=false;
	}
	else
		f1.innerText="";
	if(ln==""){
		f2.innerText="last name required";
		val=false;
	}
	else
		f2.innerText="";
	if(uid==""){
		f3.innerText="userid required";
		val=false;
	}
	else{
		re=/^[0-9]/;
		word=new RegExp(re);
		if(word.exec(uid)){
			f3.innerText="userid should not start with a number";
			val=false;
		}
		else{
			f3.innerText="";
			
		}
	}
	if(pwd==""){
		f4.innerText="password required";
		val=false;
	}
	else if(pwd.length<6){
		f4.innerText="password should be minimum of 6 characters";
		val=false;
	}
	else if(pwd!=cepwd){
		f4.innerText="";
		f8.innerText="passwords do not match";
		val=false;
	}
	else{
		f4.innerText=" ";
		f8.innerText=" ";
	}
	if(eid==""){
		f5.innerText="emailid required";
		val=false;
	}
	else{
		re=/[A-Za-z0-9]+@+[A-Za-z]+.+[A-Za-z]/
		word=new RegExp(re);
		if(!re.exec(eid)){
			f5.innerText="invalid email id";
			val=false;
		}
		else
		f5.innerText="";
	}
	if(city=="")
	{
		f6.innerText="city required";
		val=false;
	}
	else {
		re=/^[0-9]/
		word=new RegExp(re);
		if(re.exec(city)){
			f6.innerText="invalid city";
			val=false;
		}
		else
		f6.innerText="";	
		
	}
	if(phnumber=="")
	{
		f7.innerText="phone number required";
		val=false;
	}
	else{
		re=/[A-Za-z]/
		word=new RegExp(re);
		
		if(re.exec(phnumber)||phnumber.length <12)
		{
			f7.innerText="invalid phone number";
			val=false;	
		}
		else

		f7.innerText="";
	 }		
	 if(qus=="")
	 {
	 	qusp.innerText="security question required";
	 	val=false;
	 }
	 else qusp.innerText=" ";
	 if(ans=="")
	 {
	 	ansp.innerText="answer required";
	 	val=false;
	 }
	 else ansp.innerText=" ";
	 if(make=="false")
	 	val=false;
	return val;
}	
</script>
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
                		<form action="index2.html"  method="post" onsubmit=" tests()" >
			<table align="center">
				<tr>
					 <td> firstname *</td>
					 <td><input type="text" name="fn" maxlength="15"/></td>
					 <td><p id="f1"></p></td>
					 
				</tr>
				<tr>
				     <td>lastname *</td>
					<td><input type="text" name="ln" maxlength="15"/></td>
					<td><p id="f2"></p></td>
				</tr>
				<tr>
					<td>userid *</td>
					<td><input type="text" name="uid" maxlength="20" onblur="sendRequest()"/></td>
					<td>(1-10 characters)</td>
					<td><p id="f3"></p><p id="f9" style="color: yellow;"></p><p id="us" style="color:yellow;"></p></td>
				</tr>
				<tr>
					<td> password *</td>
					<td><input type="password" name="pwd" maxlength="15"/></td>
					<td>(6-10 characters)</td>
					<td><p id="f4"></p></td>
				</tr>
				<tr>
					<td> confirm password *</td>
					<td><input type="password" name="cepwd" maxlength="15"/></td>
					<td><p id="f8"></p></td>
				</tr>
				<tr>
				    <td> emailid *</td>
					<td><input type="text" name="eid" maxlength="40"/></td>
					<td><p id="f5"></p></td>
				</tr>
				<tr>
					<td> city *</td>
					<td><input type="text" name="city" maxlength="40"/></td>
					<td><p id="f6"></p></td>
				</tr>
				<tr>
				    <td> regon *</td>
					<td><input type="text" name="date" maxlength="40"/></td>
					<td><p id="dt"></p></td>
				</tr>
				<tr>
					<td> phonenumber * +</td>
					<td><input type="text" name="phone" maxlength="12"/></td>
					<td>(919493474679)</td>
					<td><p id="f7"></p></td>
				</tr>
				<tr>
					<td>status *</td>
					<td><input type="text" name="sts"/></td>
					<td><p id="st"></p></td>
				</tr>
				<tr>
					<td>security question *</td>
					<td><input type="text" name="qus"/></td>
					<td><p id="qusp"></p></td>
				</tr>
				<tr>
					<td>answer *</td>
					<td><input type="text" name="ans"/></td>
					<td><p id="ansp"></p></td>
				</tr>
				<tr>
				        <td><input type="submit" value="submit"/>&nbsp;
				        <input type="button" value="cancel" onclick="repl()"/></td>
				</tr>
			</table>
		</form>
			
        </div>       	  
       
</div></div>
</body>

</html>