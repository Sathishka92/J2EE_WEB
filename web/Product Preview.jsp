
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="DB.ProductReg"%>
<%@page import="org.hibernate.Query"%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <title>Product Preview</title>
        <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css"></link>
        <%@include file="Header.jsp" %>
        <script type="text/javascript">




            var xmlHttp;

            function createXMLHttpRequest() {
                if (window.XMLHttpRequest) {

                    xmlHttp = new XMLHttpRequest();
                    alert("web");
                } else if (window.ActiveXobject) {
                    xmlHttp = new ActiveXobject("Microsoft.XMLHTTP");

                } else {
                    alert("Please Update Your Browser !!!!");
                }


            }




            function go() {
                var id=document.getElementById('id').value;
                var qty=document.getElementById('aaty').value;
                alert(id);
                alert(qty);
                createXMLHttpRequest();
                var url = "buyingProduct?pid="+id+"&bqty="+qty;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                        alert("ok");
                        
                    }

                }


            }
            function go1() {

                document.getElementById("message").className = "alert alert-info";
                document.getElementById("message").style.display = "Block";
                document.getElementById("message").innerHTML = "(1) item add to Wishlist";



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
        </script>

    </head>

    <body>

        <%
            int pid = Integer.parseInt(request.getParameter("pid"));
            Session ss = HibernateUtil.getSessionFactory().openSession();
            ProductReg pr = (ProductReg) ss.load(ProductReg.class, pid);
            Criteria cri2 = ss.createCriteria(ProductReg.class);
            cri2.add(Restrictions.eq("ProductReg", pid));


        %>
        <div id="content" class="panel-body">

            <div id="image" class="img-rounded">
                <img src="  <%=pr.getProductimage()%>  "/>           
            </div>
            <div id="productname">
                <h3><span></span> <%=pr.getProductname()%></h3>
            </div>
            <div id="qty">
                <h4>Available Quantity &nbsp;<span style="color:blue;font-weight:bold"><%=pr.getQuantity()%></span></h4> <br>
                    <h4 role="presentation">Price <span style="color:blue;font-weight:bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lkr&nbsp;<%=pr.getPrice()%></span></h4> <br>
                                 <input type="hidden" value="<%=pr.getProductid()%>" id="id"/> 
                                <h4>Quantity &nbsp;<input id="aaty"  type="number" value="1" max="<%=pr.getQuantity()%>" maxlength="100" size="25" ></h4> <br>
                            <h4><input  type="submit" value="Add to Cart"  onclick="go()"  class="pure-button pure-button-primary" ></input>&nbsp;<input  type="submit" value="Add to Wishlist" onclick="go1()"  class="pure-button pure-button-primary" ></input> <br>
                                    </div>
                                    <div id="message" class="alert alert-success" role="alert">

                                    </div>

                                    <div id="datatable" >

                                        <table class="table table-striped">
                                            <tr>
                                                <td>Brand</td>
                                                <td><%=pr.getBrand().getBrand()%></td>
                                            </tr>
                                            <tr>
                                                <td>Product Name</td>
                                                <td><%=pr.getProductname()%></td>
                                            </tr>

                                            <tr>
                                                <td>Color</td>
                                                <td><%=pr.getColour().getColour()%></td>
                                            </tr>

                                            <tr>
                                                <td>Sim</td>
                                                <td><%=pr.getSim()%></td>
                                            </tr>
                                            <tr>
                                                <td>Announced</td>
                                                <td><%=pr.getAnnounced()%></td>
                                            </tr>
                                            <tr>
                                                <td>Display Size</td>
                                                <td><%=pr.getDispalysize()%></td>
                                            </tr>
                                            <tr>
                                                <td>Front Camera</td>
                                                <td><%=pr.getFrontcamera()%></td>
                                            </tr>
                                            <tr>
                                                <td>Secondary Camera</td>
                                                <td><%=pr.getSeconderycamera()%></td>
                                            </tr>
                                            <tr>
                                                <td>Video</td>
                                                <td><%=pr.getVideo()%></td>
                                            </tr>
                                            <tr>
                                                <td>Memory</td>
                                                <td><%=pr.getMemory().getMem()%></td>
                                            </tr>
                                            <tr>
                                                <td>Os</td>
                                                <td><%=pr.getOs().getOs()%></td>
                                            </tr>

                                        </table>

                                    </div>

                                    </div>



                                    <style type="text/css">

                                        #content{
                                            width: 1080px;
                                            height: auto;

                                            margin-top: 15px;
                                            //border: 1px solid #000;
                                        }
                                        #image{
                                            width: 150px;
                                            height: 200px;
                                            margin-top: 20px;
                                            margin-left: 25px;
                                            //border: 1px solid #000;



                                        }
                                        #productname{
                                            width: 250px;
                                            height: 30px;
                                            margin-top: -200px;
                                            margin-left: 200px;

                                        }
                                        #qty{
                                            width: 250px;
                                            height: 200px;
                                            margin-top: 25px;
                                            margin-left: 200px;

                                        }
                                        #productname h3{
                                            font-size: 26px;  
                                        }
                                        #datatable{
                                            width: 400px;
                                            height: auto;
                                            margin-top: -270px;
                                            margin-left: 500px;
                                            // border: 1px solid #000;




                                        }
                                        #message{
                                            width: 250px;

                                            margin-left: 200px;
                                            margin-top: -10px;
                                            display: none;

                                        }






                                    </style>
                                    <%@include file="Footer.jsp" %>

                                    </body>
                                    </html>