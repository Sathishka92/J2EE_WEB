
<%@page import="DB.UserReg"%>
<%@page import="DB.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="DB.LoginSessions"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>My Account</title>
<link href="Css/myaccount.css" rel="stylesheet" type="text/css" />
 <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
     <link rel="shortcut icon" type="image/png" href="Images/mobyshortcutlogo.png"/>
</head>

<body>

<div id="welcomebar">Thanks For Creating a Account in Moby... </div>
 
 
     <div id="sidebar">
     <div id="header">Your Access Pages</div>
     <div class="menu_simple">

<ul>
<%              
                UserReg ur = (UserReg)session.getAttribute("s1");
    
                Session sess = HibernateUtil.getSessionFactory().openSession();

                //LoginSessions u = (LoginSessions) sess.load(LoginSessions.class, Integer.parseInt(request.getSession().getAttribute("s1").toString()));

                Set<Privilages> p = ur.getUserType().getPrivilageses();
                
                for (Privilages pr : p) {
                    
            %>
<li><a href="<%= pr.getInterfaces().getUrl()%>">

                    <%= pr.getInterfaces().getDisplayName()%>
                </a></li>
                 <%
                }
            %>

</ul>

</div>
</div>
<div id="contentbox">
  <div id="contentheader">Profile Information</div>
    <table width="60%"  class="align">
   <tr>
    <td>User Name</td>
    <td><%=ur.getUsername()%></td>
  </tr>
  <tr>
    <td>Country</td>
    <td><%=ur.getCountry()%></td>
  </tr>
  <tr>
    <td>E-Mail</td>
    <td><%=ur.getEmail()%></td>
  </tr>
  <tr>
    <td>Password</td>
    <td><%=ur.getPassword()%></td>
  </tr>
  <tr>
    <td>Conform Password</td>
    <td><%=ur.getConPassword()%></td>
  </tr>
   
</table>

</div>   <br />    
 <div id="contentbox1">    
     <div id="contentheader">Order Information</div>
</div>     
     
     <br></br>
     <%@include file="Footer.jsp" %>
     
     
 


</body>
</html>