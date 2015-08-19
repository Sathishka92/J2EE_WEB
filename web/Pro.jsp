<%-- 
    Document   : Pro
    Created on : Nov 20, 2014, 8:48:10 PM
    Author     : SathisHka
--%>

<%@page import="DB.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="DB.LoginSessions"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="Css/style.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <ul>
           

            <li>

                
            </li>

            
        </ul>


        <hr/>
         <div class="header_bottom">
                <div class="menu">
                    <ul>
                         <%
                Session sess = HibernateUtil.getSessionFactory().openSession();

                LoginSessions u = (LoginSessions) sess.load(LoginSessions.class, Integer.parseInt(request.getSession().getAttribute("s").toString()));

                Set<Privilages> p = u.getUserLogin().getUserReg().getUserType().getPrivilageses();
                
                for (Privilages pr : p) {
                    
            %>
                        
                        <li><a href="<%= pr.getInterfaces().getUrl()%>">

                    <%= pr.getInterfaces().getDisplayName()%>
                </a></li>
                       
                        <%
                }
            %>
                        
                    </ul>
                </div><br>
       
    </body>
</html>
