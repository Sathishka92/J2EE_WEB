
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css"></link>

        <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
        <link rel="shortcut icon" type="image/png" href="Images/mobyshortcutlogo.png"/>








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




            function loadproduct() {
                createXMLHttpRequest();
                var url = "loadproduct";
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                        document.getElementById("pro").innerHTML = xmlHttp.responseText;
                        showCart();

                    }

                }



            }

            function buyingProduct(x) {
                createXMLHttpRequest();
                var pid, bqty;
                pid = document.getElementById("pid" + x).value;
                bqty = document.getElementById("bqty" + x).value;
                //alert(pid+"_"+bqty);
                var url = "buyingProduct?pid=" + pid + "&bqty=" + bqty;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        //alert(xmlHttp.responseText);
                        document.getElementById("message").style.display = "Block";
                        document.getElementById("message").innerHTML = "(1) item add to Cart";
                    }

                }
            }



            function removeCart(pid, cid) {
                createXMLHttpRequest();
                var url = "RemoveProduct?pid=" + pid + "&cid=" + cid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        showCart();


                    }
                }
            }

        </script>


    </head>
    <%@include file="Header.jsp" %>

    <body onload="loadproduct()"   >


        <!--Slider Content Start Here-->
        <div id="bio" >
            <div id="slidecon">

                <img src="Images/1.jpg" style="width: 100%;height: 460px;" class="sliderimg">
                    <div id="Searchbox">
                        <div class="search">

                            <div style="background-color: #006766;" class="search-in">
                                <form>
                                    <input type="text" value="Search imobile Store" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                this.value = 'Search imobile Store';
                                            }">
                                        <input type="submit" value="Search">
                                            </form>
                                            </div>
                                            </div>
                                            </div>
                                            </div>
                                            </div>

                                            <!--Slider Content End Here-->
                                            <br><br><br>

                                                        <div class="main" >
                                                            <div class="content">
                                                                <div class="content_top">
                                                                    <div class="heading">
                                                                        <h3>New Products</h3>
                                                                    </div>
                                                                    <div class="see">
                                                                        <p><a href="#">See all Products</a></p>
                                                                    </div>
                                                                    <div class="clear"></div>
                                                                </div>

                                                                <div id="message" class="alert alert-success" role="alert">


                                                                </div>


                                                                <div id="tablealign">

                                                                    <table   id="pro" class="table table-condensed">




                                                                    </table>

                                                                    <div id="cartalign">
                                                                        <table   id="view" >




                                                                        </table>
                                                                    </div>
                                                                </div>


                                                                <style type="text/css">

                                                                    #tablealign{
                                                                        width: 100%;
                                                                        height: 740px;
                                                                        margin-top: 15px;
                                                                        //border: 1px solid #cccccc;
                                                                        border-radius: 5px;

                                                                        -webkit-box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
                                                                        -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
                                                                        box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;





                                                                    }  
                                                                    #message{
                                                                        width: 500px;

                                                                        margin-top: 15px;
                                                                        margin-left: 50px;
                                                                        display: none;

                                                                    }
                                                                    #cartalign{
                                                                        width: 1100px;
                                                                        height: auto;







                                                                    }
                                                                    #pro{
                                                                        margin-left: 5%;  

                                                                    }

                                                                </style>



                                                                <br></br>

                                                                <%@include file="Footer.jsp" %>
                                                                </body>
                                                                </html>