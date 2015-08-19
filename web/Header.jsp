
<%@page import="com.sun.net.httpserver.HttpServer"%>
<%@page import="DB.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="DB.UserLogin"%>
<%@page import="DB.LoginSessions"%>
<%@page import="java.util.List"%>
<%@page import="DB.UserType"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DB.UserReg"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Header</title>
        <link href="Css/style.css" rel="stylesheet" type="text/css" />

        <script src="Js/jquery-1.11.1.js"></script>
        <script src="Js/bootstrap.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>



            <script type="text/javascript">


                var xmlHttp;

                function createXMLHttpRequest() {
                    if (window.XMLHttpRequest) {

                        xmlHttp = new XMLHttpRequest();

                    } else if (window.ActiveXobject) {
                        xmlHttp = new ActiveXobject("Microsoft.XMLHTTP");

                    } else {
                        alert("Please Update Your Browser !!!!");
                    }


                }








                function userLogout() {
                    createXMLHttpRequest();
                    var url = "Logout";
                    xmlHttp.open("GET", url, true);
                    xmlHttp.send();
                    xmlHttp.onreadystatechange = function() {
                        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                            window.location.href = "Homepage.jsp";

                        }

                    };



                }



            </script>
    </head>




    <body >







        <div class="wrap" style="background-color: #000000;">
            <div class="header">
                <div class="headertop_desc">
                    <div class="call">
                        <div class="search-box">
                            <form> 
                                <input type="text" class="text" value="Search imobile Store" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Search imobile Store';
                                        }">
                                    <input type="submit" class ="go" value>
                                        </form> 
                            
                                        </div>

                    </div>
                    <div id="cardmem">
                        &nbsp;&nbsp;<img src="Images/paypal copy.png"></img>
                    </div>
                                        <div class="account_desc">
                                            <br>
                                                <ul>


                                                    <%

                                                        UserReg ur = (UserReg) session.getAttribute("s1");
                                                        if (ur != null) {


                                                    %>   

                                                    <li><label style="color: #e33551">Welcome to Moby</label>&nbsp&nbsp&nbsp <%=ur.getUsername()%> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                                        &nbsp&nbsp&nbsp</li>
                                                        <%}%>


                                                    <li><label> </label></li>
                                                    <li><a href="Cart.jsp">Your Cart</a></li>

                                                    <li><a href="Cart.jsp">Checkout</a></li>
                                                    <li><a href="Moby_UserAccount.jsp">User Account</a></li>
                                                    <li><a href="" onclick="userLogout()">Logout</a></li>
                                                    <li><a href="User_Signup.jsp"> Login</a></li>
                                                </ul>
                                        </div>
                                        <div class="clear"></div>
                                        </div>
                                        <div class="header_top">
                                            <div class="logo">
                                                <a href="Homepage.jsp"><img src="Images/logo.png" alt="" /></a>


                                            </div>


                                            <div class="cart">

                                                <p>Welcome to our Online Store! <span>Cart:</span><div id="dd" class="wrapper-dropdown-2"> 0 item(s) - $0.00
                                                        <ul class="dropdown">
                                                            <li>you have no items in your Shopping cart</li>
                                                        </ul></div></p>
                                            </div> <div class="clear"></div>
                                        </div>

                                        <div class="header_bottom">
                                            <div class="menu">
                                                <ul>
                                                    <li class="active"><a href="Homepage.jsp">Home</a></li>
                                                    <li><a href="">About Mobilecity</a></li>
                                                    <li><a href="Advanced_SearchMoby.jsp">All Products</a></li>
                                                    <li><a href="">Special Offers</a></li>
                                                    <li><a href="">Contact</a></li>
                                                    <div class="clear"></div>
                                                </ul>
                                            </div>

                                            <div class="clear"></div>
                                        </div>	



                                        </head>
                                        <body>



                                            <style type="text/css">
                                                #backgroundui{
                                                    -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                                                    -moz-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                                                    box-shadow: 0 3px 8px rgba(0, 0, 0, .25);  



                                                }
                                                .litag{

                                                    list-style: none;
                                                    display: box;
                                                    display: inline;
                                                    margin-top: 12px;
                                                    margin: 8px;
                                                    padding: 15px;
                                                    background: #ccff99;

                                                }
                                                .searchin{
                                                    outline: none;
                                                    padding:8px 15px;
                                                    background: #fff;
                                                    width: 71%;
                                                    border:1px solid #000000;
                                                    font-size: 1em;
                                                    color: #000000;
                                                    border-radius: 3px;
                                                    font-family: 'PT Sans Narrow', sans-serif;
                                                    -webkit-border-radius:3px;
                                                    -o-border-radius:3px;
                                                    -moz-border-radius:3px;
                                                    -ms-border-radius:3px;
                                                    margin-right: 1%;	
                                                }

                                                
                                                .search-box {
                                                    position: relative;	
                                                    background: #fff;
                                                    //margin: 1em 0;
                                                    border:1px solid #cecece;
                                                }
                                                .search-box:hover {	
                                                    border:1px solid #e48db3;
                                                    -webkit-transition: all 0.5s ease-out;
                                                    -moz-transition: all 0.5s ease-out;
                                                    -ms-transition: all 0.5s ease-out;
                                                    -o-transition: all 0.5s ease-out;
                                                    box-shadow: 1px 1px 1px -2px #e8e6e5;
                                                }
                                                .search-box form input[type="text"]   {
                                                    border: none;
                                                    outline: none;
                                                    padding: 10px 85px;
                                                    -webkit-apperance: none;
                                                    margin: 0;
                                                    background: #fff;
                                                    -webkit-transition: all 0.5s ease-out;
                                                    -moz-transition: all 0.5s ease-out;
                                                    -ms-transition: all 0.5s ease-out;
                                                    -o-transition: all 0.5s ease-out;
                                                    color: #bfafa9;
                                                    width: 100%;
                                                    font-size:1.1em;
                                                    font-weight:400;
                                                }
                                                .search-box form input[type="text"]:hover {
                                                    color:#705e57;	
                                                }
                                                .search-box form input[type="submit"] {
                                                    border: none;
                                                    outline: none;
                                                    cursor: pointer;
                                                    background-color: #01CB65;
                                                    //background:url(Images/img-sprite.png) no-repeat -400px 0px;
                                                    position: absolute;
                                                    right: 0px;
                                                    bottom: 0px;
                                                    padding: 0;
                                                    width: 60px;
                                                    height: 43px;
                                                }
                                                .search-box:hover input.go {
                                                    //background:url(Images/img-sprite.png) no-repeat -400px -25px;
                                                }

                                                #cardmem{
                                                width: auto;
                                                height: 10px;
                                                margin-top: 10px;
                                                margin-left: 15px;
                                                    
                                                }

                                            </style>

                                        </body>
                                        </html>
