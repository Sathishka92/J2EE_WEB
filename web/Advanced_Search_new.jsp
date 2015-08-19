<%-- 
    Document   : Advanced_Search_new
    Created on : Mar 25, 2015, 9:37:35 AM
    Author     : Sathishka
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Css/bootstrap.css">
         <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
   <body>
       
        <%

            Session ss = HibernateUtil.getSessionFactory().openSession();
            int x = 0;
        %>

     
        <div class="container">
            <div id="main_wrapper" class="col-xs-6 col-sm-3"  >
                <div class="page-header">
                     <%
                                    Criteria cr8=ss.createCriteria(DB.ProductReg.class);
                                    List<DB.ProductReg> pr=cr8.list();
                                    
                                    
                                    
                                    %>
                    
                    <h1> <img src="Images/logo.gif"><small> Advanced Search</small></h1>&nbsp&nbsp<a href="#">Available Product Count <span class="badge"></span></a>
                  
                </div>
                <!--<form action="ad_search" method="post">-->
                <div class="row">
                    <div id="cl"  class="col-xs-6 col-sm-3">
                        
                            <p>
                                <label class="label"></label>
                                <select class="form-control" name="brn" id="b">
                                    <option value="">Please select a Brand:</option>

                                    
                                    <%
                                    Criteria cr=ss.createCriteria(DB.Brand.class);
                                    List<DB.Brand> br=cr.list();
                                    for(DB.Brand brnd:br){
                                    
                                    
                                    %>
                                    
                                    <option value="<%=brnd.getIdBrand()%>" ><%=brnd.getBrand()%></option>
                                    <%}%>
                                    
                                </select>
                                
                            </p>
                        



                    </div>
                    <div id="cl"  class="col-xs-6 col-sm-3">
                       
                            <p>
                                <label class="label"></label>
                                <select class="form-control" name="clr" id="c">
                                    <option value="">Please select a Color:</option>
                                    
                                    <% 
                                    Criteria cr1=ss.createCriteria(DB.Colour.class);
                                    List<DB.Colour> clr=cr1.list();
                                    for(DB.Colour clrr:clr){
                                    
                                    
                                    %>

                                   
                                  <option value="<%=clrr.getIdColour()%>" ><%=clrr.getColour()%></option>
                                    <%}%>
                                   
                                </select>
                                
                            </p>
                        



                    </div>
                    <div id="cl"  class="col-xs-6 col-sm-3">
                        
                            <p>
                                <label class="label"></label>
                                <select class="form-control" name="os" id="o">
                                    <option value="">Please select a Os:</option>

                                    
                                    <%
                                    Criteria cr3=ss.createCriteria(DB.Os.class);
                                    List<DB.Os> os1=cr3.list();
                                    for(DB.Os myos:os1){
                                    
                                    
                                    %>
                                    
                                    <option value="<%=myos.getIdOs()%>" ><%=myos.getOs()%></option>
                                    <%}%>
                                    
                                </select>
                              <!--<input type="submit" class="btn btn-success" value="Search Your Mobile">-->
                            </p>
                        



                    </div>
                    <div id="cl"  class="col-xs-6 col-sm-3">
                       
                            <p>
                                <label class="label"></label>
                                <select class="form-control" name="mem" id="m">
                                    <option value="">Please select a Mem:</option>

                                    <%
                                    Criteria cr4=ss.createCriteria(DB.Memory.class);
                                    List<DB.Memory> MEM=cr4.list();
                                    for(DB.Memory memo:MEM){
                                    
                                    
                                    %>
                                    <option value="<%=memo.getIdMemory()%>" ><%=memo.getMem()%></option>
                                    <%}%>
                                   
                                </select>
                                    <!--<input type="submit" class="btn btn-success" value="Search Your Mobile">-->
                                    <button type="submit" class="btn btn-success" onclick="loadproduct()" >Search Your Mobile</button>
                            </p>
                        



                    </div>
                </div>
                                    
                                    <div id="wrapper">
                                       
                                        ABC
                                      
                                        
                                        
                                    </div>
                                        
                                        
                                        
                                    </div>         
                                    
                                    
               <!-- </form>-->
                <div class="row" class="col-md-6">
                    <div class="col-md-6">
                        
                    </div>
                </div>
                                
            </div>
        </div>


        <style type="text/css">
            body{
                background-color: #F5EFEF;


            }
            #wrapper{
                
               width: 97%;
              
               margin-top: 10px;
               margin-left: 15px;
                -webkit-box-shadow: 0 10px 6px -6px #777;
                -moz-box-shadow: 0 10px 6px -6px #777;
                box-shadow: 0 10px 6px -6px #777;
                background-color: #0091ca;
               
                
                
                
            }
            #main_wrapper{
                background-color: #ffffff;
                height: auto;
                width: 105%;
                margin-left: -25px;
                margin-top: 100px;
                border-radius: 10px;
                -webkit-box-shadow: 0 10px 6px -6px #777;
                -moz-box-shadow: 0 10px 6px -6px #777;
                box-shadow: 0 10px 6px -6px #777;
                font-family: 'PT Sans Narrow', sans-serif; 



            }
            #cl{


            }




        </style>

        
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
            
            




            function loadproduct() {
                
                
                
                var brand = document.getElementById('b').value;
                var os = document.getElementById('o').value;
                var color = document.getElementById('c').value;
                var mem = document.getElementById('m').value;
                
                createXMLHttpRequest();
                var url = "ad_search?brn="+brand+"&clr="+color+"&os="+os+"&mem="+mem;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {

                        alert("ok");
                        alert(xmlHttp.responseText);
                        document.getElementById('wrapper').innerHTML=xmlHttp.responseText;
                    }

                }



            }
            
            
            
            
        </script>
    </body>
</html>
