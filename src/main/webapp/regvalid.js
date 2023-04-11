	function repl(){
		document.location.replace("profile.jsp");
	}
	
	function tests(){
	var val=true;
	var fn=document.forms[0].fn.value;
	var ln=document.forms[0].ln.value;
	var sq=document.forms[0].sq.value;
	var ans=document.forms[0].ans.value;
	//var cepwd=document.forms[0].cepwd.value;
	var eid=document.forms[0].eid.value;
	var city=document.forms[0].city.value;
	var phnumber=document.forms[0].phone.value;
		
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
	if(sq==""){
			qu.innerText="security question required";
			val=false;
	}
	else
	 	qu.innerText=" ";
	 if(as==" "){
	 		as.innerText="answer required";
			val=false;
	 }
	 else 
	 	as.innerText=" ";
	 
	/*if(uid==""){
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
		else
			f3.innerText="";
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
	else
		f4.innerText="";
	*/
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
	else
		f6.innerText="";	
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
	
	return val;
}	