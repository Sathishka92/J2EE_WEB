
<html>
    <head>


        <title>JSP Page</title>

        <link href="Css/Cart.css" rel="stylesheet" type="text/css" />
         <link href="Css/uikit.min.css" rel="stylesheet" type="text/css" />
        <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css"></link>
        <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />



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

    <body onload="showCart()" >
        <%@include file="Header.jsp" %>

        <div id="contentalign">

            <table id="view" class="uk-table" data-uk-margin >




            </table>

            <div id="message" class="alert alert-success" role="alert">


            </div>
        </div>
        <br>
        <%@include file="Footer.jsp" %>

        <style type="text/css">

            #message{

                margin-top: 15px;
                display: none;



            }

            #contentalign{
                width: auto;
                height: auto;
                padding: 60px; 
                margin-top: 15px;
                -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                -moz-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;

            }


        </style>





    </head>

<body>





</body>
</html>
