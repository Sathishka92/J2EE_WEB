<%-- 
    Document   : view_data
    Created on : Mar 30, 2015, 12:51:26 PM
    Author     : Sathishka
--%>

<%@page import="DB.UserReg"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        
        <%
        
        Session ss = HibernateUtil.getSessionFactory().openSession();
        
      
        
        
        
        
        %>
        <table class="table table-striped">
            
            <tr>
                <td>Product Name</td>
                <td>Price</td>
                <td>Quantity</td>
                
            </tr>
            <%
        
        HttpSession ses=request.getSession();
        DB.Cart ct = null;
        UserReg ur =(UserReg) ses.getAttribute("s1");
        
              Criteria cr2 = ss.createCriteria(DB.Cart.class);
             cr2.add(Restrictions.eq("userReg", ur));
            // List<DB.Cart> ct2 = cr2.list();
            ct =( DB.Cart) cr2.uniqueResult();
             
             
             
               Criteria cr = ss.createCriteria(DB.CartProductReg.class);
               cr.add(Restrictions.eq("cart", ct));
               
               
                        List<DB.CartProductReg> ur2 = cr.list();
                        for (DB.CartProductReg ureg : ur2) {
                            if (ureg.getIsPurchase() == 1) {
            
            
            
            %>
             <tr>
                <td><%=ureg.getProductReg().getProductname()%></td>
                <td><%=ureg.getPrice()%></td>
                <td><%=ureg.getQuantity()%></td>
                
            </tr>
            <%}}%>
        </table>
    </body>
</html>
