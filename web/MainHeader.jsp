<%-- 
    Document   : MainHeader
    Created on : Nov 18, 2014, 12:01:43 PM
    Author     : SathisHka
--%>

<%@page import="DB.UserReg"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
            <link href="Css/style.css" rel="stylesheet" type="text/css" />
            <link href="Css/highlight.css" rel="stylesheet" type="text/css" />
            <link href="Css/uikit.min.css" rel="stylesheet" type="text/css" />
            <link href="Css/uikit.docs.min.css" rel="stylesheet" type="text/css" />
            <script src="Js/uikit.min.js"></script>
            <script src="Js/jquery-1.11.1.js"></script>
            
        
        
        
        
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


    function signup() {

        createXMLHttpRequest();


        var uname1 = document.getElementById("uname1").value;
        var fullname = document.getElementById("fullname").value;
        var country = document.getElementById("country").value;
        var gender = document.getElementById("gender").value;
        var email = document.getElementById("email").value;
        var pw = document.getElementById("pw").value;
        var cpassword = document.getElementById("cpassword").value;



        var url = "Signup?uname1=" + uname1 + "&fullname=" + fullname + "&country=" + country + "&gender=" + gender +
                "&email=" + email + "&pw=" + pw + "&cpassword=" + cpassword;

        xmlHttp.open("GET", url, true);
        xmlHttp.send();
        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                document.getElementById("uname1").value = "";
                document.getElementById("fullname").value = "";
                document.getElementById("country").value = "";
                document.getElementById("gender").value = "";
                document.getElementById("email").value = "";
                document.getElementById("pw").value = "";
                document.getElementById("cpassword").value = "";



            }
        };


    }



    function checklogin() {

        createXMLHttpRequest();
        var uname, pass;
        uname = document.getElementById("uname").value;
        pass = document.getElementById("pass").value;

        var url = "login?uname=" + uname + "&pass=" + pass;
        xmlHttp.open("GET", url, true);
        xmlHttp.send();

        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                var sts = xmlHttp.responseText;

                if (sts === "ok") {
                    alert("Login Complete !!!");

                    window.location.href = "All Products.jsp";
                } else {
                    alert("Incorrect Username Or Password !!!");


                }

            }


        }



    }




</script>
    </head>
    <body>
       <div class="wrap">
        <div class="header">
            <div class="headertop_desc">
                <div class="call">
                    <p><span>Need help?</span> call us <span class="number">0-112-620-415</span></span></p>&nbsp;
                    <%
                        HttpSession hs = request.getSession();
                        UserReg us = (UserReg) hs.getAttribute("user");

                    %>
                    <p><span>Hellow &nbsp;:</span> <%=us.getUsername()%></p>    

                </div>
                <div class="account_desc">
                    <ul>
                        <li><a href="#my-id1" data-uk-modal>Sign Up</label></a></li>
                        <li><a href="#my-id" data-uk-modal>Login</label></a></li>
                        <li><a href="#">Delivery</a></li>
                        <li><a href="#">Checkout</a></li>
                        <li><a href="#">My Account</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="header_top">
                <div class="logo">
                    <a href="index.html"><img src="Images/logo.gif" alt="" /></a>
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
                        <li><a href="">All Products</a></li>
                        <li><a href="">Special Offers</a></li>
                        <li><a href="">Contact</a></li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="search_box">
                    <form>
                        <input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {
                                    this.value = 'Search';
                                }"><input type="submit" value="">
                                </form>
                                </div>
                                <div class="clear"></div>
                                </div>	




                                <!-- This is the modal -->
                                <div id="my-id" class="uk-modal">
                                    <div class="uk-modal-dialog">
                                        <a class="uk-modal-close uk-close"></a>

                                        <div id="back">
                                            <h1 class="loginheader">RETURNING CUSTOMERS&nbsp;<label id="logoalign"><img src="Images/logo.gif" /></label></h1>
                                            <br />

                                            <table width="50%" class="uk-align-center">
                                                <tr>
                                                    <td >USER NAME</td>
                                                    <td><input type="text" id="uname"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td>PASSWORD</td>
                                                    <td><input type="password" id="pass"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><input type="submit" value="Login" class="btn" onclick="checklogin()" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>


                                <!-- This is the modal2 -->
                                <div id="my-id1" class="uk-modal">
                                    <div class="uk-modal-dialog">
                                        <a class="uk-modal-close uk-close"></a>

                                        <div id="back">
                                            <label id="dis" style="width:250px;"></label>
                                            <h1 class="loginheader">NEW CUSTOMERS</h1>
                                            <br />
                                            <label id="logoalign"><img src="Images/logo.gif" /></label>
                                            <table width="50%" class="uk-align-center">
                                                <tr>
                                                    <td >User Name</td>
                                                    <td><input type="text"  id="uname1"  class="textid"   /></td>
                                                </tr>
                                                <tr>
                                                    <td>Full Name</td>
                                                    <td><input type="text" id="fullname"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Country</td>
                                                    <td><input type="text" value="Srilanka" readonly="readonly" id="country"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Gender</td>
                                                    <td><input type="text"  id="gender"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td>E-Mail</td>
                                                    <td><input type="email" id="email"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Password</td>
                                                    <td><input type="password" id="pw"  class="textid" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Confirm Password</td>
                                                    <td><input type="password" id="cpassword"  class="textid" /></td>
                                                </tr>
                                                <tr>

                                                    <td colspan="2"><input type="submit" value="Login"   onclick="signup()" /></td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>

    </body>
</html>
