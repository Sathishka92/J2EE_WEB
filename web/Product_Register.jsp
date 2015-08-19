<%-- 
    Document   : Product_Register
    Created on : Nov 30, 2014, 1:25:08 PM
    Author     : SathisHka
--%>

<%@page import="moby.ProCategory.Color"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="DB.Brand"%>
<%@page import="java.util.List"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="Css/bootstrapp.css" rel="stylesheet" type="text/css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/productregister.css" rel="stylesheet" type="text/css">


        <title>JSP Page</title>
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


            function loadProduct() {
                createXMLHttpRequest();
                var url = "viewproducttable";
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                        document.getElementById("viewtable").innerHTML = xmlHttp.responseText;

                    }

                }



            }


            function searchProducts() {
                createXMLHttpRequest();
                var url = "searchProduct";
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        document.getElementById("pro_view").innerHTML = xmlHttp.responseText;

                    }
                }
            }

            function updateTotal(sts) {
                var uqty, unitp, tot;
                uqty = document.getElementById("change_qty" + sts).value;
                unitp = document.getElementById("unitp" + sts).innerHTML;
                tot = uqty * unitp;
                document.getElementById("tot" + sts).innerHTML = tot;


            }

            function updateDetails(sts) {
                createXMLHttpRequest();
                var change_qty, proid;

                change_qty = document.getElementById("change_qty" + sts).value;
                proid = document.getElementById("proid" + sts).value;

                var url = "updateProducts?qty=" + change_qty + "&pid=" + proid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange() = function (){
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {



                    }

                    alert("Successfully Update Product Details!!");
                }

            }

            function removeProducts(sts) {
                createXMLHttpRequest();
                var pid = document.getElementById("proid" + sts).value;
                var url = "removeProduct?pid=" + pid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        document.getElementById("pro_view").innerHTML = xmlHttp.responseText;



                    }

                }

            }
            function savepro() {
                createXMLHttpRequest();

                var brand1 = document.getElementById("brand1").value;
                var url = "Brand?brand1=" + brand1;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    // alert("skjgkjg");
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {


                        document.getElementById("brand1");


                        alert(xmlHttp.responseText);

                    }
                }
            }


            function Clrsv() {

                createXMLHttpRequest();

                var clr = document.getElementById("clr2").value;
                var url = "Color?clr=" + clr;
                alert(clr);
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {

                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {


                        document.getElementById("clr");


                        alert("Color Added Successfully..!!!");

                    }
                }
            }

            function Memm() {

                createXMLHttpRequest();

                var mem1 = document.getElementById("mem1").value;
                var url = "Memory?mem1=" + mem1;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {

                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {


                        document.getElementById("mem1");


                        alert("Memory Added Successfully..!!!");

                    }
                }
            }


            function   ossave() {

                createXMLHttpRequest();

                var oss = document.getElementById("oss").value;
                var url = "Os?oss=" + oss;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {

                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {


                        document.getElementById("oss");


                        alert("Os Added Successfully..!!!");

                    }
                }
            }

        </script>
    </head>
    <body >

        <div id="conetntbox">

            <form action="Product_Registration" method="post" enctype="multipart/form-data">
                <table width="60%" class="table table-striped" >
                    <tr>
                        <td>Brand</td>
                        <td>&nbsp;&nbsp;&nbsp;<select  name="brand" >
                                <%Session ss = HibernateUtil.getSessionFactory().openSession();
                                    Criteria cri = ss.createCriteria(Brand.class);

                                    List<Brand> li = cri.list();
                                    for (Brand brnd : li) {


                                %>
                                <option value="<%=brnd.getIdBrand()%>"><%=brnd.getBrand()%></option>
                                <%}%>
                            </select> </td>
                    </tr>
                    <tr>
                        <td>Product Name</td>
                        <td><input type="text" name="pname" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td><input type="text" name="price" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;<select id="clr" name="clrr" >
                                <%Session ss1 = HibernateUtil.getSessionFactory().openSession();
                                    Criteria cri2 = ss1.createCriteria(DB.Colour.class);

                                    List<DB.Colour> li2 = cri2.list();
                                    for (DB.Colour clr : li2) {


                                %>
                                <option value="<%=clr.getIdColour()%>"><%=clr.getColour()%></option>
                                <%}%>
                            </select>  </td>

                    </tr>
                    <tr>
                        <td>Quantity</td>
                        <td><input type="text" name="quty" class="textid"></td>
                    </tr>

                    <tr>
                        <td>Sim</td>
                        <td><input type="text" name="sim" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Announced</td>
                        <td><input type="text" name="announced" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Display Size</td>
                        <td><input type="text" name="dsize" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Front Camera</td>
                        <td><input type="text" name="fcamera" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Second Camera</td>
                        <td><input type="text" name="scamera" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Video</td>
                        <td><input type="text" name="video" class="textid"></td>
                    </tr>
                    <tr>
                        <td>Memory</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;<select id="mem" name="mem" >
                                <%Session ss4 = HibernateUtil.getSessionFactory().openSession();
                                    Criteria cri4 = ss4.createCriteria(DB.Memory.class);

                                    List<DB.Memory> li5 = cri4.list();
                                    for (DB.Memory m : li5) {


                                %>
                                <option value="<%=m.getIdMemory()%>"><%=m.getMem()%></option>
                                <%}%>
                            </select>  </td>
                    </tr>
                    <tr>
                        <td>Os</td>
                        <td>
                            &nbsp;&nbsp;&nbsp;<select id="myos" name="myos" >
                                <%Session ss2 = HibernateUtil.getSessionFactory().openSession();
                                    Criteria cri3 = ss2.createCriteria(DB.Os.class);

                                    List<DB.Os> li3 = cri3.list();
                                    for (DB.Os o : li3) {


                                %>
                                <option value="<%=o.getIdOs()%>"><%=o.getOs()%></option>
                                <%}%>
                            </select>  </td>
                    </tr>
                    <tr>
                        <td>Product Image</td>
                        <td><input type="file" name="pimage" id="line" ></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>&nbsp;&nbsp;&nbsp;<input type="submit" value="Save Product" class="button-success">
                            &nbsp;<input type="submit" value="View Product" onclick="searchProducts()" class="button-success">
                        </td>

                    </tr>


                </table>
            </form>
        
</div>
            <div class="alert alert-success">

                
                 <table  class="table table-bordered">

                        <tr>
                            <td>Brand&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text" id="brand1"   ></td>
                            <td><input type="submit" value="Add Brand" onclick="savepro()" class="button-success" ></td>

                        </tr>
                         <tr>
                            <td>Color&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text" id="clr2" ></td>
                            <td><input type="submit" value="Add Color" onclick="Clrsv()" class="button-success" ></td>
                        </tr>
                         <tr>
                            <td>Os&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><input type="text" id="oss" ></td>
                            <td><input type="submit" value="Add Os" onclick="ossave()" class="button-success" ></td>
                        </tr>
                         <tr>
                            <td>Memory</td>
                            <td><input type="text" id="mem1" ></td>
                            <td><input type="submit" value="Add Memory" onclick="Memm()" class="button-success" ></td>
                        </tr>

                    </table>
                
                
                
                
                </div>

               


        





        <style type="text/css">
            .button-success {
                background: rgb(0, 112, 214); 
                border: none;
                color: white;
                font-family: 'PT Sans Narrow', sans-serif;
                cursor: pointer;
                padding: 8px;
                /* this is a green */
            }
            #protbl{
                width: 700px;
                height: auto;
                font-family: 'PT Sans Narrow', sans-serif;	
                margin-left: 380px;
                margin-top: -360px;

            } 
            #brandtb{
                width: 320px;
                height: 40px;
                margin-top: -420px;
                margin-left: 450px;
                //border: 1px solid #000000;
                font-family: 'PT Sans Narrow', sans-serif;


            }
            #colortb{
                width: 320px;
                height: 40px;
                margin-top: 15px;
                margin-left: 450px;
                //border: 1px solid #000000;
                font-family: 'PT Sans Narrow', sans-serif;   




            }
            #os{
                width: 320px;
                height: 40px;
                margin-top: 15px;
                margin-left: 450px;
                //border: 1px solid #000000;
                font-family: 'PT Sans Narrow', sans-serif;    
            }
            #memory{
                width: 320px;
                height: 40px;
                margin-top: 15px;
                margin-left: 450px;
                //border: 1px solid #000000;
                font-family: 'PT Sans Narrow', sans-serif;     
            }

            .fileUpload {
                position: relative;
                overflow: hidden;
                margin: 10px;
            }
            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }
        </style>
    </body>
</html>
