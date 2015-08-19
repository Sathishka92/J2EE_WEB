<%-- 
    Document   : Moby_Cart
    Created on : Mar 31, 2015, 2:14:08 PM
    Author     : Sathishka
--%>


<html>
    <head>
        
        <link href=Css/bootstrap.css rel="stylesheet" type="text/css" />
         <link href="Css/Cart.css" rel="stylesheet" type="text/css" />
        <title>Moby | Cart</title>
        <%@include file="Header.jsp" %>
        
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


            function searchProducts() {
                createXMLHttpRequest();
                var url = "searchProduct";
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        document.getElementById("protbl").innerHTML = xmlHttp.responseText;
                    }

                }



            }




            function showCart() {
                createXMLHttpRequest();

                xmlHttp.open("GET", "showCart", true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        var a = xmlHttp.responseText;
                        document.getElementById("view").innerHTML = a;



                    }
                }
            }

            function removeProducts(sts) {
                createXMLHttpRequest();
                var pid = document.getElementById("proid" + sts).value;
                var url = "RemoveSelectedProduct?pid=" + pid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        document.getElementById("view").innerHTML = xmlHttp.responseText;
                        alert("Item Removed");


                    }

                }

            }


            function removeCart(pid, cid) {
                createXMLHttpRequest();
                var url = "RemoveCart?pid=" + pid + "&cid=" + cid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        showCart();


                    }
                }
            }


            function purchaseProduct() {
                createXMLHttpRequest();


                xmlHttp.open("GET", "PurchaseProduct", true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        document.getElementById("message").style.display = "Block";
                        document.getElementById("message").innerHTML = "Orde is Confirmed.!! Thanks For Purchasing";
                         showCart();


                    }
                }





            }


        </script>
    </head>
    <body onload="showCart() ">
        
        
        
        <table id="view" class="table table-condensed">




        </table>
        
        <div id="message" class="alert alert-success" role="alert">
            
            
        </div>


        <style type="text/css">
            
            #message{
             
             margin-top: 15px;
             display: none;
                
                
                
            }
            
            
        </style>
        
    </body>
</html>
