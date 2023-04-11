<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
		<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<%
		String uid=(String)session.getAttribute("userid");
		
	%>
		<ul id="MenuBar1" class="MenuBarHorizontal">
		  <li><a href="home.jsp" >Home</a> </li>
		  <li><a href="profile.jsp" >Profile</a></li>
		  <li><a class="MenuBarItemSubmenu" href="#">Messages</a>
		    <ul>
		      <li><a href="SendMessage.jsp" >compose</a></li>
		      <li><a href="inbox.jsp" >Inbox</a></li>
		      <li><a href="outbox.jsp" >outbox</a></li>
		    </ul>
		  </li>
		  <li><a href="#">My Account</a>
		  <%
		  if(uid.equals("admin")){
		  %>
		  	 <ul>
		      <li><a  href="users.jsp" >manage users</a></li>
		      <li><a href="documents.jsp">manage documents</a></li>
		      <li><a href="report.jsp" >generate report</a></li>
		    </ul>
		  <%}
		  else{ %>
			   <ul>
			      <li><a  href="upload.jsp">create document</a></li>
			      <li><a href="DownloadView.jsp" >view documents</a></li>
			      <li><a href="Approve.jsp" >Approve documents</a></li>
			   </ul>
		   <%} %>
		  </li>
		  <li><a href="#">settings</a>
		  		<ul>
		  			<li><a href="changepwd.jsp" >change password</a></li>
		  		</ul>
		  </li>
		  <li><a href="AddressBook.jsp" >Address Book</a></li>
		    <li><a href="help.jsp" >Help</a></li>
		  <li><a href="logout.jsp" >Logout</a></li>
		</ul>
		
		<script type="text/javascript">
		<!--
		var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
		//-->
		</script>
		<br /><br /><br />
	</body>
</html>
