<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.User" import="dao.Product" import="java.util.List" import="dao.Mask" import="dao.Wafer"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mask Verification System</title>
</head>
<body style="background-color:lightblue">
<table style="width:100%" cellpadding="5">
<tr>
<td align="right" style="vertical-align: top;">  
<% 
User user = (User) session.getAttribute("user");
if(user!=null)
	out.println("<b>Welcome! "+user.getGlobalId()+"<b>");
%>  </td>
</tr>
<tr>
<td align="right" style="vertical-align: top;">  
<form action="LogoutServlet">
<input type="submit" value="Logout">
</form>
</td>
</tr>

</table>
<!--print search mask parameters  --> 
<form action="MaskServlet">
<table style="width:50%" align="center" cellpadding="3">

<tr>
<td align="center"><b>Title</b></td>
</tr>
<tr>
<td align="center"><input type="text" name="title" <% if(session.getAttribute("title")!=null) 
{out.println("value='"+session.getAttribute("title")+"'");}%> ></td>
</tr>
<tr>
<td align="center"><b>Select Product Name</b></td>
</tr>

<tr>
<td align="center">
<!-- product input  --> 
<%
List<Product> productList = (List<Product>) session.getAttribute("productList");
if(productList!=null&&!productList.isEmpty()){
	String s = " ";
	String pn = " ";
	if(session.getAttribute("productName")!=null)
		pn = (String) session.getAttribute("productName");
	out.println("<select name='productName' >");
	out.println("<option value = ''></option>");
	for(Product x:productList) {
		if(pn.equals(x.getName())) 
			s = "selected='selected'";
		else
			s = " ";
		out.println("<option value='"+x.getName()+"' "+s+">"+x.getName()+"</option>");
	}
	out.println("</select>");
}
%>
</td>
</tr>
<!-- mask search  --> 
<tr>
<td align="center"> <b> Input Mask Name </b> </td>
</tr>
<tr>
<td align="center"> <input type="text" name="maskName" 
<%
if(session.getAttribute("maskName")!=null)
	out.println(" value='"+session.getAttribute("maskName")+"'");
%>
> <input type="submit" value="Search"> </td>
</tr>
<tr>
<td align="center"> <b> Mask Information </b> </td>
</tr>
</table>
</form>

<form action="MaskServlet1">
<table style="width:90%" align="center" border="1" cellpadding="5">


<tr>
<td align="center" style="width:30%"><b> </b></td> 
<td align="center" style="width:30%"><b>DN</b></td> 
<td align="center" style="width:30%"><b>UP</b></td>
</tr>

<tr>
<td align="center" style="width:30%"><b>Mill 1 </b></td> 

<!--print mask no.  --> 
<td align="center" style="width:30%">
<select name="maskD1" style="width: 120px"> 
<%
List<Mask> maskList = (List<Mask>) session.getAttribute("maskD1");
if(maskList!=null&&!maskList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Mask x:maskList) 
		out.println("<option value='"+x.getMaskNo()+"'>"+x.getMaskNo()+"</option>");
}
else {
	out.println("<option value=''>  </option>");	
}
%>
</select>
</td> 

<td align="center" style="width:30%">
<select name="maskU1" style="width: 120px">
<%
maskList = (List<Mask>) session.getAttribute("maskU1");
if(maskList!=null&&!maskList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Mask x:maskList) 
		out.println("<option value='"+x.getMaskNo()+"'>"+x.getMaskNo()+"</option>");
}
else {
	out.println("<option value=''>  </option>");	
}
%>
</select>
</td>
</tr>

<tr>
<td align="center" style="width:30%"><b>Mill 2 </b></td> 

<td align="center" style="width:30%">
<select name="maskD1" style="width: 120px"> 
<%
maskList = (List<Mask>) session.getAttribute("maskD2");
if(maskList!=null&&!maskList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Mask x:maskList) 
		out.println("<option value='"+x.getMaskNo()+"'>"+x.getMaskNo()+"</option>");
}
else {
	out.println("<option value=''>  </option>");	
}
%>
</select>
</td> 

<td align="center" style="width:30%">
<select name="maskU1" style="width: 120px">
<%
maskList = (List<Mask>) session.getAttribute("maskU2");
if(maskList!=null&&!maskList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Mask x:maskList) 
		out.println("<option value='"+x.getMaskNo()+"'>"+x.getMaskNo()+"</option>");
}
else {
	out.println("<option value=''>  </option>");	
}
%>
</select>
</td>
</tr>

<tr>
<td align="center" style="width:30%"><b>Mill 3 </b></td> 

<td align="center" style="width:30%">
<select name="maskD1" style="width: 120px"> 
<%
maskList = (List<Mask>) session.getAttribute("maskD3");
if(maskList!=null&&!maskList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Mask x:maskList) 
		out.println("<option value='"+x.getMaskNo()+"'>"+x.getMaskNo()+"</option>");
}
else {
	out.println("<option value=''>  </option>");	
}
%>
</select>
</td> 

<td align="center" style="width:30%">
<select name="maskU1" style="width: 120px">
<%
maskList = (List<Mask>) session.getAttribute("maskU3");
if(maskList!=null&&!maskList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Mask x:maskList) 
		out.println("<option value='"+x.getMaskNo()+"'>"+x.getMaskNo()+"</option>");
}
else {
	out.println("<option value=''>  </option>");	
}
%>
</select>
</td>
</tr>

</table>
<br>
<!-- search wafers  --> 
<table style="width:50%" align="center" cellpadding="3">
<tr>
<td align="center" > <b>Please select wafer mesh name:</b>

<select id="meshName" name="meshName" style="width: 220px" onchange="loadDoc()" >
<%
List<Wafer> waferList = (List<Wafer>) session.getAttribute("waferList");
if(waferList!=null&&!waferList.isEmpty()) {
	out.println("<option value = ''></option>");
	for(Wafer x:waferList)
		out.println("<option value='"+x.getMeshName()+"'>"+x.getMeshName()+"</option>");
}
%>
</select>
</td>
</tr>
</table>
<script>
function loadDoc() {
	  var xhttp = new XMLHttpRequest();

	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	      var text = this.responseText;
	      var s = JSON.parse(text);
	      var select = document.getElementById("meshName");
	      var i = select.selectedIndex-1;
	      document.getElementById("tmeshName").innerHTML = "Meshname: "+s[i].meshName;
	      document.getElementById("tpoleHeight").innerHTML = "Pole Height: "+s[i].poleHeight;
	      document.getElementById("tbasecoat").innerHTML = "Basecoat: "+s[i].basecoat;
	    }
	  };

	  xhttp.open("GET", "WaferServlet" , true);
	  xhttp.send();
	}

</script>

<!--print transducer parameters  --> 

<table style="width:50%" align="center" cellpadding="3" style="color:red">
<tr>
<td id="tmeshName" align="center"  style="color:red;font-weight: bold" >Meshname:</td>
</tr> 
<tr>
<td id="tpoleHeight" align="center" style="color:red; font-weight: bold" >Pole Height:</td>
</tr>
<tr>
<td id="tbasecoat" align="center" style="color:red; font-weight: bold" >Basecoat:</td>
</tr>
</table>

</form>

</body>
</html>