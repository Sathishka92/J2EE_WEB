<%-- 
    Document   : Moby_Homepage
    Created on : Mar 30, 2015, 5:17:11 PM
    Author     : Sathishka
--%>



<%@page import="java.util.List"%>
<%@page import="DB.ProductReg"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<html>
    <head>

         
        <link href="Css/Moby_Homepage.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
        <link rel="shortcut icon" type="image/png" href="Images/mobyshortcutlogo.png"/>
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css"></link>
        <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
        <title>Moby | Home</title>



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

                        document.getElementById("Content_loading_div").innerHTML = xmlHttp.responseText;
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
    <%@include file="Moby_Header.jsp" %>
    <body onload="loadproduct()"  >


        <!--Slider Content Start Here-->
        <div id="bio" >
            <div id="slidecon">

                <img src="Images/4g.jpg" class="sliderimg">
                <div id="Searchbox">
                    <div class="search">

                        <div class="search-in">
                            <form>
                                <input type="text" value="Search Moby Store" onfocus="this.value = '';" onblur="if (this.value == '') {
                                            this.value = 'Search Moby Store';
                                        }">
                                <input type="submit" value="Search">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Slider Content End Here-->

        <div  id="Content_loading_div"  >




        </div>

    </body>
</html>
