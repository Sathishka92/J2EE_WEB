<%-- 
    Document   : User_Signup
    Created on : Mar 31, 2015, 3:12:34 PM
    Author     : Sathishka
--%>


<!DOCTYPE html>
<html>
    <head>
        <link href="Css/uikit.min.css" rel="stylesheet" type="text/css" />

        <link href="Css/style.css" rel="stylesheet" type="text/css" />

        <title>Moby | Signup</title>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="Contetntdiv"   >

            <div class="uk-grid">
                <div class="uk-width-medium-1-2">
                    <div class="uk-panel">
                        
                        
                        <%if (ur == null) {%>
                        <form  action="Signup" method="post" class="uk-form">
                            <table class="uk-table" data-uk-margin>
                                <caption>New Customer's</caption>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th><input type="hidden" value="1" name="type"/> </th>
                                    </tr>
                                    <tr>
                                        <th>User Name</th>
                                        <th><input type="text"  name="username"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>E-Mail</td>
                                        <th><input type="text"  name="email"></th>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td>Country</td>
                                        <th><input type="text" value="SriLanka" name="country" readonly="readonly"></th>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <td>Password</td>
                                        <th><input type="password" name="pw"></th>
                                    </tr>
                                    <tr>
                                        <td>Re-Type Password</td>
                                        <th><input type="password" name="cpassword"></th>
                                    </tr>
                                    <tr>

                                        <th><input type="submit" class="btnclr" value="Register..!!!" ></th>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <br><br>
                        <div id="alignlogin">
                            <form  action="Loginsession" method="post"class="uk-form" id="al">
                                <table class="uk-table" data-uk-margin>
                                    <caption>Returning Customer's</caption>
                                    <thead>
                                        <tr>
                                            <th>User Name</th>
                                            <th><input type="text" name="uname"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Password</td>
                                            <th><input type="password" name="pass"></th>
                                        </tr>
                                    </tbody>
                                    <tbody>

                                    </tbody>
                                    <tbody>


                                        <tr>

                                            <th><input type="submit" class="btnclr" value="Login" ></th>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                            <%} else {%>
                            <div >
                                <label class="name1">Please Logout Your Account first</label>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>


            </div>


        </div>







        <style type="text/css">
            #al{

                margin-left: 550px;
                margin-top: -340px;
            }
            #alignlogin{
                height: auto;   


            }
            #Contetntdiv {

                width: 85%;
                height: 250px;
                background-image:url(Images/signup.jpg);
                

                margin-top: 15px;
                padding: 81px;
                -webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                -moz-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                border-radius: 3px;
                //background-color: #ccffcc;


            }

            .aligndiv{
                width: 100%;


            }
            .aligndiv1{
                width: 100%;
                margin-top: -450px;


            }

            .btnclr{

                outline: none;
                border: none;
                padding:8px 25px;
                background: #00cd68;
                width: 100%;
                cursor: pointer;
                font-size: 1em;
                color: white;
                border-radius: 3px;
                font-family: 'PT Sans Narrow', sans-serif;
                -webkit-border-radius:3px;
                -o-border-radius:3px;
                -moz-border-radius:3px;
                -ms-border-radius:3px;
                margin-right: 1%;	

            }



        </style>
        <br>
        <%@include file="Footer.jsp" %>
    </body>
</html>
