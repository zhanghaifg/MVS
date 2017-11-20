<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mask Order Summary</title>
</head>
<body style="background-color:lightblue" onload="onLoad()">
<script type="text/javascript">
function onLoad(){
	var xhttp = new XMLHttpRequest();
  	xhttp.open("GET", "LoadSummaryServlet", false);
	xhttp.send();
	var jsons = JSON.parse(xhttp.responseText);
	document.getElementById("globalId").innerHTML = jsons.globalId;
	document.getElementById("title").innerHTML = jsons.title;
	document.getElementById("productName").innerHTML = jsons.productName;
	document.getElementById("meshName").innerHTML = jsons.meshName;
	document.getElementById("tdD1").innerHTML = jsons.maskD1;
	document.getElementById("tdD2").innerHTML = jsons.maskD2;
	document.getElementById("tdD3").innerHTML = jsons.maskD3;
	document.getElementById("tdU1").innerHTML = jsons.maskU1;
	document.getElementById("tdU2").innerHTML = jsons.maskU2;
	document.getElementById("tdU3").innerHTML = jsons.maskU3;
}


</script>
<b> Mask Order is completed! </b> <br>
<br>
Global ID: <span id = "globalId"></span> <br>
Title: <span id = "title"></span> <br>
Product: <span id = "productName"></span><br>
Mesh name: <span id = "meshName"></span><br>
<br>
<table style="width:30%" align="left" border="1" cellpadding="5">

<tr>
<td align="center" style="width:10%"><b> </b></td> 
<td align="center" style="width:10%"><b>DN</b></td> 
<td align="center" style="width:10%"><b>UP</b></td>
</tr>

<tr>
<td align="center" style="width:10%"><b>Mill 1 </b></td> 
<td align="center" style="width:10%" id="tdD1"> </td> 
<td align="center" style="width:10%" id="tdU1"> </td> 
</tr>

<tr>
<td align="center" style="width:10%"><b>Mill 2 </b></td> 
<td align="center" style="width:10%" id="tdD2"> </td> 
<td align="center" style="width:10%" id="tdU2"> </td> 
</tr>

<tr>
<td align="center" style="width:20%"><b>Mill 3 </b></td> 
<td align="center" style="width:20%" id="tdD3"> </td> 
<td align="center" style="width:20%" id="tdU3"> </td> 
</tr>

</table>

</body>
</html>