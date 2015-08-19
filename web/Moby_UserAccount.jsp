<%-- 
    Document   : Moby_UserAccount
    Created on : Mar 29, 2015, 4:50:31 PM
    Author     : Sathishka
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="DB.Privilages"%>
<%@page import="java.util.Set"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<%@page import="DB.UserReg"%>

<!DOCTYPE html>
<html>
    <head>

        <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="Css/buttons.css" rel="stylesheet" type="text/css" />
        <link href="Css/uikit.min.css" rel="stylesheet" type="text/css" />
        <title>Moby | User Account</title>


    </head>

    <body>
        <%@include file="Header.jsp" %>

        <div id="Userimageupload"  class="img-thumbnail">


            <table>
                <tr>
                    <td><img src="Images/HipsterLab.png" style="width: 200;height: 200px;" alt="..." class="img-thumbnail"></td>
                </tr>
                <tr>
                    <td>&nbsp;<input  type="file" value="Upload" style="width: 100%;"  class="">&nbsp;</td>
                </tr>
                <tr>
                    <td><input type="submit" value="Save"  style="width: 80%;" class="pure-button pure-button-primary" ></td>
                </tr>

            </table>


            <div id="userinfo">
                <div class="header1">Access Pages</div>
                <ul class="table table-striped">
                    <%
                        UserReg ur1 = (UserReg) session.getAttribute("s1");

                        Session sess = HibernateUtil.getSessionFactory().openSession();

                        //LoginSessions u = (LoginSessions) sess.load(LoginSessions.class, Integer.parseInt(request.getSession().getAttribute("s1").toString()));
                        Set<Privilages> p = ur.getUserType().getPrivilageses();

                        for (Privilages pr : p) {

                    %>
                    <li><a href="<%= pr.getInterfaces().getUrl()%>">

                            <%= pr.getInterfaces().getDisplayName()%>
                        </a></li>
                        <%
                            }
                        %>

                </ul>
            </div>


            <div id="userinfo1">
                <div class="header1">User Details</div>
                <table class="uk-table">

                    <thead>
                        <tr>
                            <th >User Name</th>
                            <th><%=ur1.getUsername()%></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th >Country</th>
                            <th><%=ur1.getCountry()%></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th >E-Mail</th>
                            <th><%=ur1.getEmail()%></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th >Password</th>
                            <th><%=ur1.getPassword()%></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th >Confirm Password</th>
                            <th><%=ur1.getConPassword()%></th>
                        </tr>
                    </thead>
                </table>

            </div>




        </div>
        <div id="localcontent">
            <div id="aligntb">
                <table class="uk-table">
                    <caption>Update User Details</caption>
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th><input type="text" class="form-control"></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th>E-Mail</th>
                            <th><input type="email" class="form-control"></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th>Password</th>
                            <th><input type="password" class="form-control"></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th>Confirm Password</th>
                            <th><input type="password" class="form-control"></th>
                        </tr>
                    </thead>
                    <thead>
                        <tr>
                            <th ></th>
                            <th > <input type="submit" value="Update Records"  style="width: 100%;"  class="pure-button pure-button-primary" ></th>
                        </tr>
                    </thead>
                </table>
            </div>


            <div id="orderinfo">
                <%

                    Session ss = HibernateUtil.getSessionFactory().openSession();


                %>
                <table class="uk-table">
                    <caption>Order Details</caption>
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                        <%            HttpSession ses = request.getSession();
                            DB.Cart ct = null;
                            UserReg ur2 = (UserReg) ses.getAttribute("s1");

                            Criteria cr2 = ss.createCriteria(DB.Cart.class);
                            cr2.add(Restrictions.eq("userReg", ur));
                            // List<DB.Cart> ct2 = cr2.list();
                            ct = (DB.Cart) cr2.uniqueResult();

                            Criteria cr = ss.createCriteria(DB.CartProductReg.class);
                            cr.add(Restrictions.eq("cart", ct));

                            List<DB.CartProductReg> ur3 = cr.list();
                            for (DB.CartProductReg ureg : ur3) {
                                if (ureg.getIsPurchase() == 1) {


                        %>
                    </thead>
                    <tr>
                        <th><%=ureg.getProductReg().getProductname()%></th>
                        <th><%=ureg.getPrice()%></th>
                        <th><%=ureg.getQuantity()%></th>
                    </tr>
                    <%}
                        }%>
                </table>

            </div>


        </div>
        <br>
        <%@include file="Footer.jsp" %>
        <style type="text/css">

            #Userimageupload{
                width: 100%;
                height: auto;
                margin-top: 10px;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
                -webkit-box-shadow: #008abf 0 1px 3px;
                -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
                box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
                //background-color: #66ff66;
                // border: 1px solid #008abf;
                border-radius: 5px;
                padding: 10px;


            }
            #localcontent{
                width: 100%;
                height: auto;
                margin-top: 10px;

                background-color: #ffffff;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
                -webkit-box-shadow: #008abf 0 1px 3px;
                -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
                box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
                border-radius: 5px;
                padding: 10px;   


            }

            #userinfo{
                float: left;
                border: 1px solid #008abf;
                border-radius: 5px;
                width: 20%;
                margin-left: 25%;
                margin-top: -25%;
                height: auto;
                //padding: 15px;


            }

            #userinfo1{
                float: left;
                border: 1px solid #008abf;
                border-radius: 5px;
                width: 40%;
                margin-left: 50%;
                margin-top: -25%;
                height: auto; 



            }
            #aligntb{
                width: 25%;   

            }
            #orderinfo{
                width: 50%;
                height: auto;
                float: right;
                padding: 15px;
                margin-right: 15%;
                margin-top: -25%;
                //background-color: #66ff66;

            }
            .header1{
               width: auto;
               background-color: #008abf;
               padding: 5px;
               color: #ffffff;
                
            }
            #design{
             background-color: #008abf;   
                
            }


        </style>

    </body>


</html>
