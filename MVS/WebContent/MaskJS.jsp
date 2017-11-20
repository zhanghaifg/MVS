<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mask Verification System</title>
</head>
<body style="background-color:lightblue" onload="onLoad()">
<script type="text/javascript">
function onLoad() {
	getLogin();
	getProductName();
	getWaferName();
}
function getLogin(){
	var xhttp = new XMLHttpRequest();
  	xhttp.open("GET", "LoginLoadServlet", false);
	xhttp.send();
	var text = '<b> Welcome! '+xhttp.responseText+'<b>';
    document.getElementById("login").innerHTML = text;
}
function getProductName(){
	var xhttp = new XMLHttpRequest();
  	xhttp.open("GET", "ProductListServlet", false);
	xhttp.send();
	var productList = JSON.parse(xhttp.responseText);
	var select = "<select id='productName' name='productName' > <option value = ''></option> ";
	var size = productList.length;
	var i,name;
	for(i=0;i<size;i++) {
		name = productList[i].name;
		select += "<option value='"+name+"' >"+name+"</option> ";
	}
	select += " </select>";
    document.getElementById("selectProductName").innerHTML = select;
}
function getWaferName(){
	var xhttp = new XMLHttpRequest();
	xhttp.open("GET", "WaferServlet", false);
	xhttp.send();
	var waferList = JSON.parse(xhttp.responseText);
	var size = waferList.length;
	var select = "<b>Please select wafer mesh name:</b> <select id='meshName' name='meshName' style='width: 220px' onchange='loadDoc()' >";
	select += "<option value = ''></option>";
	var i,name;
	for(i=0;i<size;i++){
		name = waferList[i].meshName;
		select += "<option value='"+name+"' >"+name+"</option> ";
	}
	select += " </select>";
	document.getElementById("tdmeshName").innerHTML = select;
}

</script>

						<!-- Login  --> 
<table style="width:100%" cellpadding="5">
<tr>
<td align="right"  id="login" style="vertical-align: top;">  </td>
</tr>
<tr>
<td align="right" style="vertical-align: top;">  
<form action="LogoutServlet">
<input type="submit" value="Logout">
</form>
</td>
</tr>
</table>

					<!--search product  --> 
<table style="width:80%" align="center" cellpadding="3">

<tr>
<td align="center"><b>Title</b></td>
</tr>
<tr>
<td align="center"><input type="text" id="title" name="title" ></td>
</tr>
<tr>
<td align="center"><b>Select Product Name</b></td>
</tr>
<tr>
<td align="center" id = "selectProductName"> </td>
</tr>

							<!--search Mask  -->
<tr>
<td align="center"> <b> Input Mask Name: </b> <input type="text" id="maskName" name="maskName">
<button onclick="searchMask()" >Search</button> </td>
</tr> 
</table>

<!--get and select Mask  -->
<script type="text/javascript">
function searchMask(){
	var maskName = document.getElementById("maskName").value;
	if(maskName.trim()==""){
		alert("Input AAB name for mask search");
	}
	else{
		getMask(maskName);
	}
}
function getMask(maskName){
	var xhttp = new XMLHttpRequest();
	var s = "?maskName="+maskName;
  	xhttp.open("GET", "MaskSearchServlet"+s, false);
	xhttp.send();
	var mask = JSON.parse(xhttp.responseText);
//	alert(mask.status);
		makeD1(mask);
		makeD2(mask);
		makeD3(mask);
		makeU1(mask);
		makeU2(mask);
		makeU3(mask);
}
function makeD1(mask){
	var select = "<select id='maskD1' name='maskD1' style='width: 120px' value = ''> <option value = ''></option> ";
	if(mask.status) {
		var size = mask.maskD1.length;
		var i;
		for(i=0;i<size;i++){
			var name = mask.maskD1[i].maskNo;
			select += "<option value='"+name+"' >"+name+"</option> "; 	
		}
	}
	select += " </select>";
	document.getElementById("tdD1").innerHTML = select;
}
function makeU1(mask){
	var select = "<select id='maskU1' name='maskU1' style='width: 120px' > <option value = ''></option> ";
	if(mask.status){
	var size = mask.maskU1.length;
	var i;
	for(i=0;i<size;i++){
		var name = mask.maskU1[i].maskNo;
		select += "<option value='"+name+"' >"+name+"</option> "; 	
	}
	}
	select += " </select>";
	document.getElementById("tdU1").innerHTML = select;
}
function makeD2(mask){
	var select = "<select id='maskD2' name='maskD2' style='width: 120px' > <option value = ''></option> ";
	
	if(mask.status){
	var size = mask.maskD2.length;
	var i;
	for(i=0;i<size;i++){
		var name = mask.maskD2[i].maskNo;
		select += "<option value='"+name+"' >"+name+"</option> "; 	
	}
	}
	select += " </select>";
	document.getElementById("tdD2").innerHTML = select;
}

function makeU2(mask){
	
	var select = "<select id='maskU2' name='maskU2' style='width: 120px' > <option value = ''></option> ";
	if(mask.status){
	var size = mask.maskU2.length;
	var i;
	for(i=0;i<size;i++){
		var name = mask.maskU2[i].maskNo;
		select += "<option value='"+name+"' >"+name+"</option> "; 	
	}
	}
	select += " </select>";
	document.getElementById("tdU2").innerHTML = select;
}
function makeD3(mask){

	var select = "<select id='maskD3' name='maskD3' style='width: 120px' > <option value = ''></option> ";
	if(mask.status){
	var size = mask.maskD3.length;
	var i;
	for(i=0;i<size;i++){
		var name = mask.maskD3[i].maskNo;
		select += "<option value='"+name+"' >"+name+"</option> "; 	
	}
	}
	select += " </select>";
	document.getElementById("tdD3").innerHTML = select;
}

function makeU3(mask){
	
	var select = "<select id='maskU3' name='maskU3' style='width: 120px' > <option value = ''></option> ";
	if(mask.status){
	var size = mask.maskU3.length;
	var i;
	for(i=0;i<size;i++){
		var name = mask.maskU3[i].maskNo;
		select += "<option value='"+name+"' >"+name+"</option> "; 	
	}
	}
	select += " </select>";
	document.getElementById("tdU3").innerHTML = select;
}

</script>

						<!--print mask no.  --> 
<table style="width:90%" align="center" border="1" cellpadding="5">

<tr>
<td align="center" style="width:30%"><b> </b></td> 
<td align="center" style="width:30%"><b>DN</b></td> 
<td align="center" style="width:30%"><b>UP</b></td>
</tr>

<tr>
<td align="center" style="width:30%"><b>Mill 1 </b></td> 
<td align="center" style="width:30%" id="tdD1">
<select id="maskD1" name="maskD1" style="width: 120px" >
<option value=""></option>
</select>
</td> 
<td align="center" style="width:30%" id="tdU1">
<select id="maskU1" name="maskU1" style="width: 120px" >
<option value=""></option>
</select>
</td> 
</tr>

<tr>
<td align="center" style="width:30%"><b>Mill 2 </b></td> 
<td align="center" style="width:30%" id="tdD2">
<select id="maskD2" name="maskD2" style="width: 120px" >
<option value=""></option>
</select>
</td> 
<td align="center" style="width:30%" id="tdU2">
<select id="maskU2" name="maskU2" style="width: 120px" >
<option value=""></option>
</select>
</td> 
</tr>

<tr>
<td align="center" style="width:30%"><b>Mill 3 </b></td> 
<td align="center" style="width:30%" id="tdD3">
<select id="maskD3" name="maskD3" style="width: 120px" >
<option value=""></option>
</select>
</td> 
<td align="center" style="width:30%" id="tdU3">
<select id="maskU3" name="maskU3" style="width: 120px" >
<option value=""></option>
</select>
</td> 
</tr>

</table>

				<!-- select wafer mesh name -->
<table style="width:50%" align="center" cellpadding="3">
<tr>
<td align="center" id="tdmeshName"> </td>
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

							<!-- checkList -->

<form action="SummaryServlet" onsubmit=" return validate()">
<table style="width:90%" align="center" border="1" cellpadding="5" id="checkTable" >

<tr>
<td align="center" style="width:30%"><b>Checklist Question</b></td> 
<td align="center" style="width:30%"><b>Compliant / Not Applicable / Exception Requested</b></td> 
<td align="center" style="width:30%"><b>Remarks</b></td>
</tr>

<tr>
<td align="center" style="width:30%">1. The minimum Mill depth is 0.13um (some AABs M10P will be exceptions)</td> 
<td align="center" style="width:30%">
<input type="radio" id="rule1" name="rule1" value="compliant"> Compliant
<input type="radio" id="rule1" name="rule1" value="notApplicable"> Not Applicable 
<input type="radio" id="rule1" name="rule1" value="exception"> Exception Requested
</td> 
<td align="center" style="width:30%">
<textarea rows="3" cols="50" name="textbox" ></textarea>
</td>
</tr>

<tr>
<td align="center" style="width:30%">2. Mill3 depth may only be one of the following: 2.7, 3.0, 3.3, 3.8um, or a TBD depth shallower than 2.7um</td> 
<td align="center" style="width:30%">
<input type="radio" id="rule2" name="rule2" value="compliant"> Compliant
<input type="radio" id="rule2" name="rule2" value="notApplicable"> Not Applicable 
<input type="radio" id="rule2" name="rule2" value="exception"> Exception Requested
</td> 
<td align="center" style="width:30%">
<textarea rows="3" cols="50" name="textbox" ></textarea>
</td>
</tr>

<tr>
<td align="center" style="width:30%">3. Check Resist Thickness can support desired Mill Depths 
4um (Thin) resist for mill depth < 1.0um at Mill 1 and Mill 2 
11um (Regular) resist is used for mill depth >= 1.0 at Mill 2 and where: M2 < -0.22 (M1)+ 2.68 
15um (Thick) resist can be used with deeper Mill 3 depths where: M3 < -0.25*(M1+M2)+4.11
</td> 
<td align="center" style="width:30%">
<input type="radio" id="rule3" name="rule3" value="compliant"> Compliant
<input type="radio" id="rule3" name="rule3" value="notApplicable"> Not Applicable 
<input type="radio" id="rule3" name="rule3" value="exception"> Exception Requested
</td> 
<td align="center" style="width:30%">
<textarea rows="3" cols="50" name="textbox" ></textarea>
</td>
</tr>
</table>
<input type="hidden" id="jsonOb" name="jsonOb" value="">

<table style="width:50%" align="center" cellpadding="6">
<tr>
<td align="center" > <input type="submit" value="Submit Mask Order"></td>
</tr>
</table>
</form>

						<!-- data validation -->
<script type="text/javascript">
function validate(){
	var jsonOb = {};
	var v;
	v = document.getElementById("title").value;
	if(v==""){
		alert("Please input title!");
		return false;
	}
	jsonOb.title = v;
	
	v = document.getElementById("productName").value;
	if(v==""){
		alert("Please select product name!");
		return false;
	}
	jsonOb.productName = v;

	v = document.getElementById("maskD1").value; 
	if(v==""){
		alert("Please select mask mill 1 DN!");
		return false;
	}
	jsonOb.maskD1=v;
	
	v = document.getElementById("maskD2").value;
	if(v==""){
		alert("Please select mask mill 2 DN!");
		return false;
	}
	jsonOb.maskD2=v;
	
	v = document.getElementById("maskD3").value;
	if(v==""){
		alert("Please select mask mill 3 DN!");
		return false;
	}
	jsonOb.maskD3=v;
	
	v = document.getElementById("maskU1").value;
	if(v==""){
		alert("Please input mask mill 1 UP!");
		return false;
	}
	jsonOb.maskU1=v;
	
	v = document.getElementById("maskU2").value;
	if(v==""){
		alert("Please select mask mill 2 UP!");
		return false;
	}
	jsonOb.maskU2=v;
	
	v = document.getElementById("maskU3").value;
	if(v==""){
		alert("Please select mask mill 3 UP!");
		return false;
	}
	jsonOb.maskU3=v;
	
	v = document.getElementById("meshName").value;
	if(v==""){
		alert("Please select meshName!");
		return false;
	}
	jsonOb.meshName=v;
	
	if(!checkList()){
		alert("Please check check list!");
		return false;
	}
	
	var jsonString = JSON.stringify(jsonOb);
	document.getElementById("jsonOb").value = jsonString;
	return true;
}
function checkList(){
	var radio = document.getElementsByName("rule1");
	var v = false;
	for(var i = 0; i<radio.length;i++){
		if(radio[i].checked){
			v = true;
			break;
		}
	}
	if(!v)
		return false;
	radio = document.getElementsByName("rule2");
	v = false;
	for(var i = 0; i<radio.length;i++){
		if(radio[i].checked){
			v = true;
			break;
		}
	}
	if(!v)
		return false;
	radio = document.getElementsByName("rule3");
	v = false;
	for(var i = 0; i<radio.length;i++){
		if(radio[i].checked){
			v = true;
			break;
		}
	}
	if(!v)
		return false;
	
	return true;
	
}

</script>


</body>
</html>