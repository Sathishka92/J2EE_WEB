<%-- 
    Document   : mobyUser_Management
    Created on : Nov 21, 2014, 6:15:23 PM
    Author     : SathisHka
--%>

<%@page import="org.hibernate.Criteria"%>
<%@page import="DB.UserType"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Connection.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Css/usermanagement.css" rel="stylesheet" type="text/css">
        <link href="Css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <title>JSP Page</title>
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
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



            function statusupdate(x) {

                var id = document.getElementById('u' + x).value;
                var sid = document.getElementById('s' + x).value;

                alert(id);
                alert(sid);

                createXMLHttpRequest();
                var url = "status?u=" + id + "&s=" + sid;
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        //document.getElementById("pro_view").innerHTML = xmlHttp.responseText;
                        alert(xmlHttp.responseText);

                    }
                }





            }

            function searchAccount() {
                createXMLHttpRequest();
                var url = "viewaccount";
                xmlHttp.open("GET", url, true);
                xmlHttp.send();
                xmlHttp.onreadystatechange = function() {
                    if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
                        document.getElementById("pro_view").innerHTML = xmlHttp.responseText;


                    }
                }
            }


        </script>


    </head>
    <body>

        <!--Content Box -->
        <div id="Wrapper">
            <div id="header">
                Moby User Transaction Form
            </div><br>
            <form action="Signup" method="post">
                <table class="table-striped" align="center">

                    <tr>
                        <td>User Type&nbsp;&nbsp;</td>
                        <td> <select name="type" class="form-control" >
                                <%
                                    Session s = HibernateUtil.getSessionFactory().openSession();

                                    List<UserType> type = s.createCriteria(UserType.class).list();
                                    for (UserType ut : type) {

                                %>

                                <option value="<%= ut.getIduserType()%>"><%= ut.getTypeName()%></option>

                                <%

                                    }%>           </select></td>
                    </tr>

                    <tr>
                        <td> Username</td>
                        <td><input type="text"   name="username" class="form-control"    /></td> 
                    </tr>

                    <tr>
                        <td>Country</td>
                        <td><input type="text"   name="country"  readonly="readonly" value="SRILANKA"  class="form-control"   /></td>
                    </tr>

                    <tr>
                        <td>E-Mail</td>
                        <td><input type="text"    name="email" class="form-control"   /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password"   name="pw" class="form-control"     /></td>
                    </tr>
                    <tr>
                        <td>Confirm pw</td>
                        <td><input type="password"    name="cpassword"  class="form-control"     /></td>
                    </tr>
                    <tr><td>Click here</td>
                        <td ><input type="submit" value="Add a New User" class="button-success"  /></td>
                    </tr>










                </table>

            </form>
        </table>

    </div>

    <%

        Session ss = HibernateUtil.getSessionFactory().openSession();

    %>
    <div id="users_loader" style="height:350px; overflow: auto">
        <div id="header1">
            All Users List by Here
        </div>

        <table   id="pro_view"  >
            <br>
            <tr>


            <table style="width: 100%;" class="table table-striped">
                <thead>
                    <tr>
                        <td>Username</td><td>Password</td><td>Status</td>
                    </tr>
                </thead>

                <tbody >
                    <%  
                        Criteria cr = ss.createCriteria(DB.UserReg.class);
                        List<DB.UserReg> ur = cr.list();
                        for (DB.UserReg ureg : ur) {
                            if (ureg.getUserType().getIduserType() == 1) {
                    %>
                    <tr>
                        <td><%=ureg.getUsername()%></td> 
                        <td><%=ureg.getPassword()%></td>
                        <td><select id="s<%=ureg.getIdUser()%>" class="form-control" style="width: 80%;" onchange="statusupdate(<%=ureg.getIdUser()%>)">
                                <%if (ureg.getStatus() == 1) {%>
                                <option value="1">Active</option>
                                <option value="2">Inactive</option>
                                <%} else {%>

                                <option value="2">Inactive</option>
                                <option value="1">Active</option>
                                <%}%>
                            </select></td>
                    </tr>
                <input type="hidden" value="<%=ureg.getIdUser()%>" id="u<%=ureg.getIdUser()%>"/>
                <%}
                    }%>
                </tbody>

            </table>





            </tr>

        </table>

    </div>
    <br>
    <style type="text/css">

        body{


            #pro_view1{
                font-family: 'PT Sans Narrow', sans-serif;   
                font-size: 16px; 



            }



            #pro_view{
                font-family: 'PT Sans Narrow', sans-serif;   
                font-size: 12px; 

                margin-top: 30px;


            }
        }
        .button-success1 {
            background: rgb(0, 112, 214); 
            border: none;
            color: white;
            font-family: 'PT Sans Narrow', sans-serif;
            cursor: pointer;
            padding: 3px;

        }





        .button-success {
            background: rgb(0, 112, 214); 
            border: none;
            color: white;
            font-family: 'PT Sans Narrow', sans-serif;
            cursor: pointer;
            padding: 8px;
            /* this is a green */
        }
        #Wrapper{
            width: 37%;
            height: 350px;
            margin-top: 80px;
            margin-left: 50px;
            -webkit-box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
            -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
            box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
            background-color: #FFFFFF;



        }
        #users_loader{
            float: right;
            width: 50%;
            height: 350px;
            margin-top: -350px;
            margin-right: 50px;
            -webkit-box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
            -moz-box-shadow: rgba(0,0,0,0.3) 0 1px 3px;
            box-shadow: rgba(0, 0, 0, 0.3) 0 1px 3px;
            background-color: #FFFFFF;   



        }
        #header{
            width: 100%;
            padding: 20px;
            background-color: #27ae60;
            font-family: 'PT Sans Narrow', sans-serif; 
            color: #FFFFFF;


        }
        #header1{
            width: 100%;
            padding: 20px;
            background-color: #2c3e50;
            font-family: 'PT Sans Narrow', sans-serif; 
            color: #FFFFFF;


        }





    </style>  

</body>
</html>
