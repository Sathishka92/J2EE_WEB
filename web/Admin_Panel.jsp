<%@page import="DB.UserReg"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Admin Panel</title>
<link href="Css/Admin Panel.css" rel="stylesheet" type="text/css" />
<script src="Js/jquery-1.11.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#bt').click(function(){
    $('#content').load('Product_Register.jsp');
  });
  $('#bt1').click(function(){
    $('#content').load('mobyUser_Management.jsp');
  });
  $('#bt2').click(function(){
    $('#content').load('Admin_Dashboard.jsp');
  });
  $(document).ready(function(){
    $('#content').load('Admin_Dashboard.jsp');
  });
});
</script>


</head>
   
    <body id="bdy" >

<div id="wrapper">

     
  <ul id="menu">
		<li><a href="#">Dashboard</a></li>
		<li>
                    <a href="#" id="bt" >Product Registration</a>
			
		</li>
		<li>
			<a href="#" id="bt1">User Management</a>
			
		</li>
		<li><a href="#">Product Manage</a></li>
		<li><a href="#"> Stock Manage</a></li>
        <li><a href="#">Product Info</a></li>
        <li><a href="#">Cart Info Info</a></li>
        <li><a href="#">Newslater</a></li>
	</ul>

<br />
<div id="content">




</div>






</div>




</body>
</html>