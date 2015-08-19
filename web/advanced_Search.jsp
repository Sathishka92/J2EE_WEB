<%-- 
    Document   : advanced_Search
    Created on : Feb 15, 2015, 8:31:57 PM
    Author     : Sathishka
--%>

<%@page import="DB.ProductReg"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
                <div class="row">
                    <div id="cl"  class="col-xs-6 col-sm-3">
                        <form action="search_page.jsp">
                            <p>
                                <label class="label">Countries of the United Kingdom:</label>
                                <select class="form-control">
                                    <option value="<%=x%>">Please select a Brand:</option>

                                    <%
                                    Criteria cr=ss.createCriteria(DB.Brand.class);
                                    List<DB.Brand> br=cr.list();
                                    for(DB.Brand brnd:br){
                                    
                                    
                                    %>
                                    <option value="<%=brnd.getIdBrand()%>" ><%=brnd.getBrand()%></option>
                                    <%}%>
                                </select>
                            </p>
                        </form>



                    </div>
                    <div id="cl"  class="col-xs-6 col-sm-3">
                        <form action="">
                            <p>
                                <label class="label">Countries of the United Kingdom:</label>
                                <select class="form-control">
                                    <option value="<%=x%>">Please select a Color:</option>

                                    <% 
                                    Criteria cr1=ss.createCriteria(DB.Colour.class);
                                    List<DB.Colour> clr=cr1.list();
                                    for(DB.Colour clrr:clr){
                                    
                                    
                                    %>
                                    <option value="<%=clrr.getIdColour()%>" ><%=clrr.getColour()%></option>
                                    <%}%>
                                </select>
                            </p>
                        </form>



                    </div>
                    <div id="cl"  class="col-xs-6 col-sm-3">
                        <form action="">
                            <p>
                                <label class="label">Countries of the United Kingdom:</label>
                                <select class="form-control">
                                    <option value="<%=x%>">Please select a Os:</option>

                                    <%
                                    Criteria cr3=ss.createCriteria(DB.Os.class);
                                    List<DB.Os> os1=cr3.list();
                                    for(DB.Os myos:os1){
                                    
                                    
                                    %>
                                    <option value="<%=myos.getIdOs()%>" ><%=myos.getOs()%></option>
                                    <%}%>
                                </select>
                            </p>
                        </form>



                    </div>
                    <div id="cl"  class="col-xs-6 col-sm-3">
                        <form action="">
                            <p>
                                <label class="label">Countries of the United Kingdom:</label>
                                <select class="form-control">
                                    <option value="<%=x%>">Please select a Brand:</option>

                                    <%
                                    Criteria cr4=ss.createCriteria(DB.Memory.class);
                                    List<DB.Memory> MEM=cr4.list();
                                    for(DB.Memory memo:MEM){
                                    
                                    
                                    %>
                                    <option value="<%=memo.getIdMemory()%>" ><%=memo.getMem()%></option>
                                    <%}%>
                                </select>
                            </p>
                        </form>



                    </div>
                </div>
                <div class="row" class="col-md-6">
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-success">Search Your Mobile</button>
                    </div>
                </div>
                                
            </div>
        </div>


        <style type="text/css">
            body{
                background-color: #F5EFEF;


            }
            #main_wrapper{
                background-color: #ffffff;
                height: 500px;
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

    </body>
</html>
