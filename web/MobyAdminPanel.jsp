<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Area</title>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
  $('#bt').click(function(){
    $('#div1').load('mobyUser_Management.jsp');
  });
  $('#bt1').click(function(){
    $('#div1').load('mobyproduct_Registration.jsp');
  });
});
</script>

</head>

<body>

<div id="div1"><h2>Let jQuery AJAX Change This Text</h2></div>
<button id="bt">Get External Content</button>
<button id="bt1">Get External Content</button>



<style type="text/css">
ul#nav{
list-style:none;
padding:0;
margin:0 0 10px 0;	
}
ul#nav li{
display:inline;
margin-right:10px;
text-decoration:none;	
	
	
	}


</style>
</body>
</html>