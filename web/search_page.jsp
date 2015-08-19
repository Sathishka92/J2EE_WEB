<%-- 
    Document   : search_page
    Created on : Feb 17, 2015, 1:27:48 PM
    Author     : Sathishka
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
                                 <table>
                        <tr style="background-color: gold">
                            <th>Brand</th>
                            <th>Colour</th>
                            <th>os</th>
                            <th>memory</th>
                            
                        </tr>
                        
                        <%
                        
                        int brand = Integer.parseInt(request.getParameter("brand"));
                        int colour = Integer.parseInt(request.getParameter("colour"));
                        int os = Integer.parseInt(request.getParameter("os"));
                        int memory = Integer.parseInt(request.getParameter("memory"));
                        
                        List<DB.ProductReg> phs = new moby.Ad_Search.Advanced_Search_class().getSearch(brand,colour,os,memory);
                        for(DB.ProductReg p : phs){
                        
                        
                        %>
                        
                        <tr>
                            
                            <td><%=p.getBrand()%></td>
                            <td><%=p.getColour().getColour()%></td>
                            <td><%=p.getOs()%></td>
                            <td><%=p.getMemory()%></td>
                            
                            
                        </tr>
                        <%}%>
                    </table>
                    
    </body>
</html>
