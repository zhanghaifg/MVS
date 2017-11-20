<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body style="background-color:lightblue;">

<b>Mask Verification System Login</b>
<br>


<form action="LoginServlet" method="post">
<table style="width:25%"  >

<tr>
<td>Global ID:</td>
<td><input type="text" name="userId"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="password" name="password"></td>
</tr>
</table>
<input type="submit" value="Submit">

</form>

<%
if(session.getAttribute("Login")!=null&&!(Boolean)session.getAttribute("Login"))
	out.println("<font color='red'>Login failed!</font>");
%>
</body>
</html>