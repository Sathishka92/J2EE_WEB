<%-- 
    Document   : Moby_Delivery_Chaeckout
    Created on : Apr 1, 2015, 9:23:50 PM
    Author     : Sathishka
--%>


<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="DB.Delivery"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Transaction"%>
<html>
    <head>
        <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <link href="Css/uikit.min.css" rel="stylesheet" type="text/css" />
        <script src="Js/jquery-1.11.1.js"></script>
        <script src="Js/uikit.min.js"></script>
        <title>Moby | Checkout</title>



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

            function del() {

                createXMLHttpRequest();
                var address1 = document.getElementById("ad1").value;
                var address2 = document.getElementById("ad2").value;
                var Date = document.getElementById("dt").value;
                var City = document.getElementById("city").value;
                var Town = document.getElementById("town").value;

                xmlHttp.open("GET", "delivery?ad1=" + address1 + "&ad2=" + address2 + "&dt=" + Date + "&city=" + City + "&town=" + Town, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        alert(xmlHttp.responseText);
                        document.getElementById("com").innerHTML = xmlHttp.responseText;
                    }
                }



            }



        </script>
    </head>
    <body>
        <%@include file="Header.jsp" %>



        <!-- This is the modal -->
        <div id="my-id" class="uk-modal">
            <div class="uk-modal-dialog">
                <a class="uk-modal-close uk-close"></a>
                <div id="backg"><h3>Thank You For Shopping With Us</h3><small id="clr_sm">Moby.LK</small></div>


                <a href="Homepage.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" style="width: 35%;"  value="Go to Homepage" id="fl_btn"></a>


                <style type="text/css">
                    #backg{
                        width: auto;
                        height: auto;
                        padding: 22px;
                        color: #FFFFFF;
                        margin-left: 150px;



                    }
                    #fl_btn
                    {

                        outline: none;
                        border: none;
                        padding:10px 50px;
                        background: #00cd68;
                        margin-left: 150px;
                        width: 100%;
                        cursor: pointer;
                        font-size: 1em;
                        color: white;
                        border-radius: 3px;
                        font-family: 'PT Sans Narrow', sans-serif;
                        -webkit-border-radius:3px;
                        -o-border-radius:3px;
                        -moz-border-radius:3px;
                        -ms-border-radius:3px;
                        margin-right: 1%;	

                    }

                    #clr_sm{
                        color: #000;
                        font-size: 12px;

                    }

                </style>
            </div>
        </div>
        <div id="panel">

            <div id="namecon">imobile Checkout & Delivery From</div>

            <div id="billing" class="uk-alert">
                <div class="uk-form">
                    <table class="uk-table" >
                        <caption>Billing Information</caption>
                        <thead>
                            <tr>
                                <th>Card Type</th>
                                <th><select>
                                        <option>Visa</option>
                                        <option>Master</option>
                                        <option>Paypal</option>
                                    </select></th>
                            </tr>
                        </thead>
                        <thead>
                        <th>Card Holder name</th>
                        <th><input type="text"></th>

                        </thead>

                        <thead>
                        <th>Credit Card Number</th>
                        <th><input type="text"></th>


                        </thead>
                        <thead>
                        <th>Valid</th>
                        <th><input type="number" value="1" min="1" max="31">&nbsp;&nbsp;<input type="number" placeholder="2014" min="2014"  style="width: 60px;"></th>



                        </thead>
                        <thead>
                        <th>Cvc</th>
                        <th><input type="text"></th>


                        </thead>
                        <thead>
                        <th>Address</th>
                        <th><select id="com" class="form-control">
                                <option value='0'>--Select Address--</option>
                                <%
                                    Session ss = HibernateUtil.getSessionFactory().openSession();
                                    Transaction tr = ss.beginTransaction();

                                    Criteria cr2 = ss.createCriteria(Delivery.class);
                                    cr2.add(Restrictions.eq("userReg", ur));

                                    List<Delivery> dli = cr2.list();

                                    for (Delivery c : dli) {
                                %>
                                <option value="<%=c.getIddelivery()%>"><%=c.getAddress1()%></option>



                                <%}%>


                            </select></th>


                        </thead>
                        <thead>
                        <th><img src="Images/Credit-Card-Logos-1.gif" style="width: 200px;height: 40px;"></th>
                        <th><input type="submit" value="Pay" id="btnclr" onclick="purchaseProduct()" class="uk-button"  data-uk-modal="{target:'#my-id'}" ></th>


                        </thead>
                    </table>
                </div>
            </div>


            <div id="addressinfo" class="uk-alert">
                <div class="uk-form">
                    <table class="uk-table"  >
                        <caption>Address Information</caption>
                        <thead>
                            <tr>
                                <th><input type="text" id="ad1" placeholder="Address Line 1"></th>
                            </tr>
                        </thead>
                        <thead>
                            <tr>
                                <td><input type="text" id="ad2" placeholder="Address Line 1 (optional)"></td>
                            </tr>
                        </thead>
                        <thead>
                            <tr>
                                <td><input type="text" id="city" placeholder="City"></td>
                        <input type="hidden" id="dt" placeholder="Date" class="form-control"/>
                        </tr>
                        </thead>
                        <thead>
                            <tr>
                                <td><input type="text" id="town" placeholder="Town"></td>
                                <td><input type="submit" value="Add Address" onclick="del()"  class="btnclr"></td>
                            </tr>
                        </thead>
                    </table>
                </div>         
            </div>


            <div id="subinfo" class="uk-alert">

                <table class="uk-table">
                    <caption>Cart Details</caption>
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Count</th>
                            <th>Sub Total</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td>Count</td>
                            <td>Count</td>
                            <td>Count</td>
                        </tr>
                    </tfoot>

                </table>

            </div>

        </div>


        <br>
        <%@include file="Footer.jsp" %>



        <style type="text/css">
            #btnclr{

                outline: none;
                border: none;
                padding:8px 15px;
                background: #00cd68;
                width: 75%;
                cursor: pointer;
                font-size: 1em;
                color: white;
                border-radius: 3px;
                font-family: 'PT Sans Narrow', sans-serif;
                -webkit-border-radius:3px;
                -o-border-radius:3px;
                -moz-border-radius:3px;
                -ms-border-radius:3px;
                margin-right: 1%;	

            }

            #panel{
                width: auto;
                height: 350px;
                padding: 80px;
                margin-top: 25px;
                background: #006766;
                -webkit-box-shadow: 0 3px 8px rgba(236, 240, 241,1.0);
                -moz-box-shadow: 0 3px 8px rgba(236, 240, 241,1.0);
                box-shadow: 0 3px 8px rgba(236, 240, 241,1.0);
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
                //background-image: url(Images/bl.png);


            }
            #namecon{
                width: 45%;
                height: auto;
                padding: 5x;
                margin-top: -5%;
                color: #FFFFFF;
                border-bottom: 1px solid #FFFFFF;


            }

            #billing{
                width: 45%;
                height: auto;
                border-radius: 8px;
                -webkit-box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
                -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
                box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;

            }

            #addressinfo{
                width: 45%;
                height: auto;
                float: right;
                margin-top: -41.5%;
                border-radius: 8px;


            }
            #subinfo{
                width: 45%;
                height: auto;
                float: right;
                margin-top: -16%;   
                border-radius: 8px;

            }















        </style>


    </body>
</html>
