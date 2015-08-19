<%-- 
    Document   : Delivery
    Created on : Mar 29, 2015, 1:56:33 PM
    Author     : Sathishka
--%>


<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="DB.Delivery"%>
<%@page import="org.hibernate.Criteria"%>
<html>
    <head>
        <link href="Css/buttons.css" rel="stylesheet" type="text/css" />
        <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="Css/Delivery.css" rel="stylesheet" type="text/css" />

        <title>Moby | Checkout</title>
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
        <br><br>
        <div id="contentdiv" class="success">


            <table class="table" id="back">

                <tr class="success">
                    <td><input type="text" placeholder="Name of Card" class="form-control"/></td>
                    <td><input type="text" placeholder="Card Number" class="form-control"/></td>
                </tr>
                <tr class="success">
                    <td colspan="2" ><input type="text"  placeholder="Cvc" style="width: 31%;"/>&nbsp;&nbsp;<input type="text" placeholder="Expire Date" style="width: 31%;"/>
                        &nbsp;&nbsp;<input type="text" placeholder="Date" style="width: 31%;"/>
                    </td>

                </tr>
                <tr class="success">
                    <td colspan="2"><input type="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pay&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" onclick="purchaseProduct()" class="pure-button pure-button-primary">
                        <input type="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total&nbsp;LKR : 25000.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class="pure-button pure-button-primary">
                    </td>
                </tr>

            </table>



        </div>

        <br></br>
        <div id="contentdiv">


            <table class="table " id="back">



                <tr class="success">
                    <td>Product Name</td>
                    <td>Product Count</td>
                    <td>D / Cost</td>
                    <td>Subtotal</td>
                </tr>
                <tr class="success">
                    <td><h4>Pname</h4></td>
                    <td><h4>2</h4></td>
                    <td>150</td>
                    <td>25000.00</td>
                </tr>
                <tr class="success">
                    <td colspan="2"><input type="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Invoice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class="pure-button pure-button-primary">
                        <input type="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class="pure-button pure-button-primary">
                    </td><br>
                <td></td>
                <td></td>
                </tr>


            </table>



        </div>


        <div id="contentdiv1">


            <table class="table " id="back">


                <tr class="success">
                    <td><input type="text" id="ad1" placeholder="Address Line 1" class="form-control"/></td>
                    <td><input type="text" id="ad2" placeholder="Address Line 2" class="form-control"/></td>
                </tr>
                <tr class="success">
                    <td><input type="text" id="dt" placeholder="Date" class="form-control"/></td>
                    <td><input type="text" id="city" placeholder="City" class="form-control"/></td>
                </tr>
                <tr class="success">
                    <td colspan="2"><input type="text" id="town" placeholder="Town" class="form-control"/></td>

                </tr>


                <tr class="success">
                    <td colspan="2"><input type="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" onclick="del()" class="pure-button pure-button-primary">

                    </td>
                </tr>
                <br>
                <tr class="success">
                    <td><select id="com" class="form-control">
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


                        </select></td>
                    <td><input type="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ship to Stable Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" class="pure-button pure-button-primary"></td>
                </tr>
            </table>


        </div>
        <br>
        <%@include file="Footer.jsp" %>

    </body>
</html>
