<%-- 
    Document   : Advanced_SearchMoby
    Created on : Mar 28, 2015, 11:42:32 AM
    Author     : Sathishka
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>


<html>
    <head>


        <title>Moby | Advanced Search </title>

        <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="Css/buttons.css" rel="stylesheet" type="text/css" />
        <link href="Css/style.css" rel="stylesheet" type="text/css" />
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






            function loadproduct1() {



                var brand = document.getElementById('b').value;
                var os = document.getElementById('o').value;
                var color = document.getElementById('c').value;
                var mem = document.getElementById('m').value;

                createXMLHttpRequest();
                var url = "ad_search?brn=" + brand + "&clr=" + color + "&os=" + os + "&mem=" + mem;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                        //alert("ok");
                        //alert(xmlHttp.responseText);
                        document.getElementById('wrapper').innerHTML = xmlHttp.responseText;
                    }

                }



            }

            function loadproduct() {
                createXMLHttpRequest();
                var url = "loadproduct";
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                        document.getElementById("wrapper").innerHTML = xmlHttp.responseText;
                        showCart();

                    }

                }



            }


        </script>
    </head>

    <body onload="loadproduct()">

        <%
            Session ss = HibernateUtil.getSessionFactory().openSession();
            int x = 0;
        %>
        <div id="imgcon">
            <img src="Images/phone.jpg">
            
        </div>
        <div class="w">

            <div class="applewrap">
                <div class="col">

                    <table style="width: 100%;" class="table table-striped">
                        <tr>
                            <td>

                                <select class="form-control" name="brn" id="b">
                                    <option value="">Please select a Brand</option>


                                    <%
                                        Criteria cr = ss.createCriteria(DB.Brand.class);
                                        List<DB.Brand> br = cr.list();
                                        for (DB.Brand brnd : br) {


                                    %>

                                    <option value="<%=brnd.getIdBrand()%>" ><%=brnd.getBrand()%></option>
                                    <%}%>

                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select class="form-control" name="clr" id="c">
                                    <option value="">Please select a Color:</option>

                                    <%
                                        Criteria cr1 = ss.createCriteria(DB.Colour.class);
                                        List<DB.Colour> clr = cr1.list();
                                        for (DB.Colour clrr : clr) {


                                    %>


                                    <option value="<%=clrr.getIdColour()%>" ><%=clrr.getColour()%></option>
                                    <%}%>

                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td>


                                <select class="form-control" name="os" id="o">
                                    <option value="">Please select a Os:</option>


                                    <%
                                        Criteria cr3 = ss.createCriteria(DB.Os.class);
                                        List<DB.Os> os1 = cr3.list();
                                        for (DB.Os myos : os1) {


                                    %>

                                    <option value="<%=myos.getIdOs()%>" ><%=myos.getOs()%></option>
                                    <%}%>

                                </select>




                            </td>
                        </tr>

                        <tr>

                            <td>
                                <select class="form-control" name="mem" id="m">
                                    <option value="">Please select a Mem:</option>

                                    <%
                                        Criteria cr4 = ss.createCriteria(DB.Memory.class);
                                        List<DB.Memory> MEM = cr4.list();
                                        for (DB.Memory memo : MEM) {


                                    %>
                                    <option value="<%=memo.getIdMemory()%>" ><%=memo.getMem()%></option>
                                    <%}%>

                                </select>

                            </td>

                        </tr>

                        <tr>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="pure-button pure-button-primary"  onclick="loadproduct1()" >Search Your Mobile</button>
                            </td>
                        </tr>
                    </table>



                </div>
                <div id="wrapper">



                </div>
            </div>

        </div>





        <style type="text/css">
            #imgcon{
             width: auto;
             height: auto;
             margin-top: 10px;
             
                
                
            }
            .applewrap {
                width: 100%;
                display: block;
                height: 800px;
                background: #FCFCFC;
                border: 1px solid;
                alignment-adjust: central;
                margin-left: 5px;
                margin-top: 50px;
                border-color: #e5e5e5 #dbdbdb #d2d2d2;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
                -webkit-box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
                -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
                box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
            }


            .applewrap .col {
                float: left;
                box-sizing: border-box;
                width: 250px;
                height: 800px;
                margin-right: 50px;
                padding: 16px 7px 6px 22px;
                font: 12px/18px "Lucida Grande", "Lucida Sans Unicode", Helvetica, Arial, Verdana, sans-serif;
                color: #343434;
                border-right: 1px solid #dadada;
            }


        </style>
        <br>
        <%@include file="Footer.jsp" %>
    </body>
</html>
