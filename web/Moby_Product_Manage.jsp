<%-- 
    Document   : Moby_Product_Manage
    Created on : Mar 28, 2015, 1:53:37 PM
    Author     : Sathishka
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
        <title>Moby | Product Manager</title>
    </head>
    <body>
        
        
        <script type="text/javascript">
            
              function statusupdate(x) {

                var id = document.getElementById('u' + x).value;
                var sid = document.getElementById('s' + x).value;

                alert(id);
                alert(sid);

                createXMLHttpRequest();
                var url = "product_status?u=" + id + "&s=" + sid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        //document.getElementById("pro_view").innerHTML = xmlHttp.responseText;
                        alert(xmlHttp.responseText);

                    }
                }





            }
            
            
            
        </script>
        <%

        Session ss = HibernateUtil.getSessionFactory().openSession();

    %>
        <div class="w">


            <div class="flyout">
                <span id="tip"></span>
                <h2>All Product List By Here</h2>
                <div id="product_loader"  class="alert alert-info">

                    <table class="table table-responsive" >
                        <tr style="width: 100%;" >
                            <td>Image</td>
                            <td>Name</td>
                            <td>Price</td>
                            <td>Status</td>
                        </tr>

                        <tr>
                                      <%
                                        Criteria cr1 = ss.createCriteria(DB.ProductReg.class);
                                        List<DB.ProductReg> pro = cr1.list();
                                        for (DB.ProductReg preg : pro) {


                                    %>
                            <td ><img style="width: 60px; height:60px;" src="<%=preg.getProductimage()%>"></td>
                            <td><p><%=preg.getProductname()%></p></td>
                            <td><p><%=preg.getPrice()%></p></td>
                            <td>

                                <select id="s<%=preg.getProductid()%>" class="form-control"  onchange="statusupdate(<%=preg.getProductid()%>)">
                                     <%if (preg.getStatus() == 1) {%>
                                <option value="1">Available</option>
                                <option value="2">Out Of Stock</option>
                                <%} else {%>

                                <option value="2">Out Of Stock</option>
                                <option value="1">Available</option>
                                <%}%>
                                </select>

                            </td>

                        </tr>
                        <input type="hidden" value="<%=preg.getProductid()%>" id="u<%=preg.getProductid()%>"/>
<%}%>
                    </table>



                </div>
            </div>
        </div>










        <style type="text/css">


            #product_loader{

                width: 750px;  
                height: auto;
                margin-top: 15px;
                margin-left: 10px;


            }


            .flyout {
                width: 800px;
                height: auto;
                margin-top: 10px;
                font-size: 11px;
                position: relative;
                margin-top: 15px;
                margin-left: 15px;
                font-family: 'Lucida Grande', Tahoma, Verdana, Arial, sans-serif;
                background-color: white;
                padding: 9px 11px;
                background: rgba(255, 255, 255, 0.9);
                border: 1px solid #c5c5c5;
                -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                -moz-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
            }

            .flyout #tip {
                background-image: url('images/tip.png');
                background-repeat: no-repeat;
                background-size: auto;
                height: 11px;
                position: absolute;
                top: -11px;
                left: 25px;
                width: 20px;
            }

            .flyout h2 {
                text-transform: uppercase;
                color: #666;
                font-size: 1.2em; 
                padding-bottom: 5px;
                margin-bottom: 12px;
                border-bottom: 1px solid #dcdbda;
            }
            .flyout p { padding-bottom: 25px; font-size: 1.1em; color: #222; }    






        </style>


    </body>
</html>
