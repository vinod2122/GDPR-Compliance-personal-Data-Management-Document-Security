<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	  String actualPath = request.getParameter("path");
	  ServletOutputStream ou = response.getOutputStream();
	  out.println("actual : "+ actualPath);
	   System.out.println("actual : "+ actualPath);
	   response.setContentType("APPLICATION/OCTET-STREAM");
	   File file = new File(actualPath);
	   String fname = file.getName();
	   System.out.println(fname);
	   response.addHeader("Content-Disposition","attachment;filename=\""+fname+"\";");
	   //out.println(fname);		  
	   FileInputStream fileIn = new FileInputStream(file);
	   byte[] outputByte = new byte[4096];
	   while(fileIn.read(outputByte, 0, 4096) != -1)
	   {
	ou.write(outputByte, 0, 4096);
	   }
	   fileIn.close();
	  ou.flush();
	   ou.close();
	%>
</body>
</html>