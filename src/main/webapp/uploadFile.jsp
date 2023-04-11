<%@ page language="java"  import="java.io.*,java.sql.*,java.util.Date" %>
<%@page import="java.text.SimpleDateFormat;"%>
<html>

<body>

<jsp:include page="header.jsp"></jsp:include>
<%
	String contentType = request.getContentType();
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
 		DataInputStream in = new DataInputStream(request.getInputStream());
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
	
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
			totalBytesRead += byteRead;
			}
		String file = new String(dataBytes);
		
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
		Date s1=new Date();
   		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd"); 
   	  
		String author=(String)session.getAttribute("userid");
		String docname=(String)session.getAttribute("dn");
		Integer docid=(Integer)session.getAttribute("docid");
		String version=(String)session.getAttribute("ver");
		String des=(String)session.getAttribute("des");
		saveFile=author+docname+version+saveFile;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "gdpr", "gdpr");
		Statement st1=con.createStatement();
		Statement st2=con.createStatement();
		ResultSet rs=st1.executeQuery("select docname,version from documentload where author='"+author+"'");
		String s=docname+version;
		String flag="true";
		while(rs.next()){
			String filepath=rs.getString("docname");
			String ver=rs.getString("version");
			String x=filepath+ver;
			if(x.equals(s)){
					
					flag="false";
%>
	<p align="center">document name <%=docname %> alredy exists with the version number <%=version%> </p>
<%  break;
			}
		}
				
				if(flag.equals("true")){
				String filePath = "C:\\dms\\" + saveFile;
				FileOutputStream fileOut = new FileOutputStream(filePath);
				fileOut.write(dataBytes, startPos, (endPos - startPos));
				fileOut.flush();
				fileOut.close();
				st1.executeUpdate("insert into documentload values('"+docname+"','"+des+"','"+docid+"','"+version+"','"+author+"','"+formDataLength+"','"+f.format(s1) +"','created','"+saveFile+"')");	
				ResultSet rs1=st2.executeQuery("select docid from documentload where docname='"+docname+"' and version='"+version+"' and author='"+author+"'");
				rs1.next();
				String id=rs1.getString("docid");
				st1.executeUpdate("insert into docids values('"+id+"')");
%>
		<Br><table border="0" align="center"><tr><td><b>You have successfully upload the document by the name of:</b>
		<% out.println(docname); %></td></tr></table> 		
<%			}	
		}
	else {
			out.print("not recieved");
		}
%>

</body>
</html>