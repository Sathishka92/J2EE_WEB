<%-- 
    Document   : subscription
    Created on : Nov 5, 2014, 8:01:42 PM
    Author     : Lakmal
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.imagelake.control.SubscriptionUnitPriceDAOImp"%>
<%@page import="com.imagelake.model.SubscriptionUnitPrice"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.imagelake.control.DownloadCountDAOImp"%>
<%@page import="com.imagelake.model.DownloadCount"%>
<%@page import="com.imagelake.control.SubscriptionPackageDAOImp"%>
<%@page import="com.imagelake.model.SubscriptionPackage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purchase</title>
        <link rel="stylesheet" type="text/css" href="css/uikit.docs.min.css">
        <link rel="stylesheet" type="text/css" href="css/highlight.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min_2.css" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        
        <!-- Desktop -->
        <link href="css/desktop.css" rel="stylesheet" type="text/css"  />
   
     <style>
        .btnbtn a{
            font-style: none;
        }
        .btnbtn{
            display: inline-block;
            padding: 4px 12px;
            margin-bottom: 0px;
            font-size: 14px;
            line-height: 20px;
            color: #333;
            text-align: center;
            text-shadow: 0px 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            background-color: #F5F5F5;
            background-image: linear-gradient(to bottom, #FFF, #E6E6E6);
            background-repeat: repeat-x;
            border-width: 1px;
            border-style: solid;
            -moz-border-top-colors: none;
            -moz-border-right-colors: none;
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            border-image: none;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) #B3B3B3;
            border-radius: 4px;
            box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.2) inset, 0px 1px 2px rgba(0, 0, 0, 0.05);
        }
        
        .btnbtn:hover{
            color: #333;
            
            text-decoration: none;
            background-position: 0px 30px;
            transition: background-position 0.1s linear 0s;
       
        }
        .btnbtn-primary{
            background-color: #238DE5;
            color: #FFF;
        }
        #profile-table tr td{
            padding: 10px;
        }
        #edit-profile{
            position: absolute;
            top: 65px;
            right: 150px;
        }
        .gold-alert{
            padding: 8px 35px 8px 14px;
            margin-bottom: 20px;
            text-shadow: 0px 1px 0px rgba(255, 255, 255, 0.5);
            background-color: #FCF8E3;
            border: 1px solid #FBEED5;
            border-radius: 4px;
            color: #C09853;
        }
        .bigimg-div{
            overflow: hidden;
            margin: 0px;
            padding: 0px;
            height: 298px;
            width: 940px;
            position: relative;
        }
        
        .img-div{
        
        margin: 0px;
        padding: 0px;
        border: none;
        width: 940px;
        height: 530px;
        max-width: none;
        position: absolute;
        left: 0px;
        top: -150px;
    }
    .img-cover h1{
        margin-bottom: 0;
        font-size: 60px;
        line-height: 1;
        letter-spacing: -1px;
        color: inherit;
    }
    .img-cover p{
        font-size: 18px;
        font-weight: 200;
        line-height: 30px;
    }
    .rebill{
        font-size: 18px;
        font-weight: 200;
        line-height: 30px;
    }
    .ultimate-div h2{
        color: #666;
        font-size: 22px;
        font-weight: 400;
        font-family: "Helvetica Neue",Arial,Helvetica,sans-serif;
        line-height: 1.3em;
    }
    .unltimate-btn{
        display: inline-block;
            padding: 4px 12px;
            margin-bottom: 0px;
            font-size: 14px;
            line-height: 20px;
            color: #FFF;
            text-align: center;
            text-shadow: 0px 1px 1px rgba(255, 255, 255, 0.75);
            vertical-align: middle;
            cursor: pointer;
            
            
            background-repeat: repeat-x;
            border-width: 1px;
            border-style: solid;
            -moz-border-top-colors: none;
            -moz-border-right-colors: none;
            -moz-border-bottom-colors: none;
            -moz-border-left-colors: none;
            border-image: none;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) #B3B3B3;
            border-radius: 4px;
            box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.2) inset, 0px 1px 2px rgba(0, 0, 0, 0.05);
        padding: 9px 20px;
        font-size: 16px;
        line-height: normal;
        border-radius: 5px;
        text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.25);
        background-color: #238DE5;
        border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
    }
    .unltimate-btn:hover{
        background: none repeat scroll 0% 0% #39F;
        color: #FFF;
        text-shadow: none;
        text-decoration: none;
    }
    .subscription_packs_selector {
        margin: 10px 0px 20px;
        width: 170px;
    }
    .subscription_pack {
    padding: 31px 0px;
    }
    .subscription_packs {
    width: 17%;
    margin: 10px 0px 20px 20px;
    min-height: 108px;
    border: 1px solid #B0B8C5;
    border-radius: 5px;
    cursor: pointer;
    
}
    .title {
        font-size: 17px;
        line-height: 1.1em;
        text-align: center;
    }
    
    .cost {
    font-size: 17px;
    line-height: 1em;
    margin: 7px 0px 5px;
}

.subscription_packs:hover {
    background: none repeat scroll 0% 0% rgba(1, 49, 120, 0.2);
        background-color: rgba(1, 49, 120, 0.2);
        background-image: none;
        background-repeat: repeat;
        background-attachment: scroll;
        background-position: 0% 0%;
        background-clip: border-box;
        background-origin: padding-box;
        background-size: auto auto;
    border-radius: 5px;
    cursor: pointer;
}
.buy_subs {
    width: 18%;
}
.per_image {
    margin-top: 10px;
    color: rgba(22, 24, 65, 0.53);
}
.wrapper {
    border: 10px solid #DEEAF1;
    background: none repeat scroll 0% 0% #F2F7FA;
    padding: 10px 10px 20px;
}
 .top_border {
    height: 6px;
    background-image: -moz-linear-gradient(center top , #52ABE6, #3385C3);
    background-repeat: repeat-x;
}
.steps {
    font-size: 19px;
    font-family: "Helvetica Neue",Arial,Helvetica,sans-serif;
}

    </style>  
    
      <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null;};
</script>
   
    
    </head>
    
    <body>
        
        <%@include file="header.jsp" %>
        
         <!--Main Section Container-->
        <section style="float:left;">
        <!--MAIN CONTENT-->
      
        <div id="user-content" style="text-align:left;">
        	
            	<!--Search  Top bar-->
                <%@include file="searchbykeyword.jsp" %>
            <!--End of Search top bar-->
            
       
            
            <!--User account content-->
            <div class="user-content" style="width: auto;clear: both;">
            	
                
                
                
                
                
                  
                   
                <div class="container" style="overflow: hidden;border-radius: 10px;margin: 10px 10px 10px 75px;background: none repeat scroll 0% 0% #F9F9F9;border-radius: 4px;float: left;width: 720px;margin-bottom: 20px;">
                    <div class="top_border"></div> 
                    <h2 style="text-align: center;font-size: 22px;"></h2>
                    <div class="row" style="margin-left: 20px;">
                      
                        <div class="col-md-12">
                            
                            <div style="padding: 0px 50px;">
                                <div class="steps">
                                    Step 
                                    <img src="img/2of2.png" style="height: auto;max-width: 100%;vertical-align: middle;"/>
                                </div>
                                 
                                <%
                                     String pckid=request.getParameter("pckid");
                                     String type=request.getParameter("type");
                                     System.out.println(pckid);
                                     System.out.println(type);
                                     DecimalFormat df = new DecimalFormat("#.00"); 
                                     if(user==null){%>
                                     
                                       
                                     <div class="jumbotron" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;font-size: 21px;font-weight: 200;background-color: #EEE;width: 90%;text-align: center;padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">
                                         <ul style="list-style: none;">
                                             <li><h4>You'r not allowed!</h4></li>
                                             <li><span><a href="signup.jsp">Sign up</a></span> | <span><a href="signin.jsp">Sign in</a></span></li>
                                         </ul>
                                     </div>
                                     
                                     
                                     <%}else{
                                        
                                     if(user.getUser_type()==2 || user.getUser_type()==3){
                                     String fn=user.getFirst_name();
                                     String ln=user.getLast_name();
                                     System.out.println("fn:-"+fn);
                                     System.out.println("ln:-"+ln);
                                     if(fn.equals("---")){
                                         fn="";
                                     }
                                     if(ln.equals("---")){
                                         ln="";
                                     }
                                     
                                     try{
                                     double total=0;
                                     
                                     List<SubscriptionPackage> sclist=new SubscriptionPackageDAOImp().listAll();
                                     SubscriptionPackage sub=null;
                                     //SubscriptionUnitPrice supscrip=null;
                                     
                                     for(SubscriptionPackage s:sclist){
                                        if(s.getSubscription_id()==Integer.parseInt(pckid)){
                                            sub=s;
                                            //supscrip=new SubscriptionUnitPriceDAOImp().getSubscriptionUnitPrice(s.getSubscription_unit_price_id());
                                            break;
                                        }
                                        System.gc();
                                     }
                                     DownloadCount dc=new DownloadCountDAOImp().getCount(sub.getCount_id());
                                     
                                %>
                                <h1 style="font-size: 29px;font-weight: 400;font-family: 'Helvetica Neue',Arial,Helvetica,sans-serif;">Start your 
                                    <%
                                    if(type.equals("day")){
                                        if(sub.getDiscount()==0){ 
                                        total=sub.getPer_image()*dc.getCount()*30*sub.getDuration();
                                        }else{ 
                                        total=sub.getPer_image()*dc.getCount()*30*sub.getDuration()-(sub.getPer_image()*dc.getCount()*30*sub.getDuration()*sub.getDiscount()/100);
                                        }
                                    %>
                                    <span><%=sub.getDuration()*30%></span> <span><%=type%></span>
                                    
                                    <%}else if(type.equals("month")){%>
                                        <%
                                            if(sub.getDiscount()==0){
                                            total=sub.getPer_image()*dc.getCount();
                                            }else{ 
                                            total=sub.getPer_image()*dc.getCount()-(sub.getPer_image()*dc.getCount()*(sub.getDiscount()/100));
                                            }
                                        %>
                                        <span><%=dc.getCount()%></span> images a <span><%=type%></span>
                                    
                                    <%}else{
                                        response.sendRedirect("ImagePlans.jsp");
                                    }%>
                                    subscription!</h1>
                                    
                                    
                                    
                                <h2 style="font-weight: 200;font-size: 22px;line-height: 1.3em;color: #666;font-family: 'Helvetica Neue',Arial,Helvetica,sans-serif;">Any <%=dc.getCount()%> images. Any size. Every <%=type%>.</h2>

                                <h2 style="font-weight: 200;font-size:21px;line-height: 1.3em;color: #666;font-family: 'Helvetica Neue',Arial,Helvetica,sans-serif;">Automatic renewal. Cancel anytime. Fuss-free all the way.</h2>
                                 
                                <br></br>
                                
                                <form action="Servlet_purchase" method="POST" >    
                                    <div>
                                        <div>
                                    <input id="totalDays" type="hidden" name="totalDays" value="<%=sub.getDuration()*30%>"/>
                                    <input id="pkId" type="hidden" name="pkId" value="<%=pckid%>"/>
                                    <input id="usId" type="hidden" name="usid" value="<%=user.getUser_id()%>"/>
                                    <input id="dwnCount" type="hidden" name="dwnCount" value="<%=dc.getCount()%>"/>
                                    <input id="type" type="hidden" name="type" value="<%=type%>"/>
                                        </div>
                                    </div>      
                                    
                                 <ul id="card_ul" style="margin-left: 0px;list-style: none outside none;list-style: none;">
                                   <li class="control-group" style="margin: 0px;">
                                        <%  
                                      Object ob=request.getAttribute("error");
                                      if(ob!=null){
                                          %>

                                      <span id="All-error" class="badge badge-important" style="margin-bottom: 10px;"><%=request.getAttribute("error")%></span>
                                      <%}%>
                                  </li>  
                                    <li class="control-group" style="margin: 0px;">
                                        <input id="first_name" style="height: 30px;" class="span2" type="text" required="" maxlength="20" placeholder="First Name" value="<%=fn%>" name="payment[first_name]"/>
                                        <input id="last_name" style="height: 30px;" class="span2" type="text" required="" maxlength="20" placeholder="Last Name" value="<%=ln%>" name="payment[last_name]"/>
                                    </li>
                                    <li class="control-group" style="margin: 0px;">
                                        <input id="x_card_num" style="height: 30px;" class="span3 credit_card_regex inspectletIgnore" type="text" required="" placeholder="Credit Card Number" autocomplete="off" size="20" value="" name="payment[card]" pattern="^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0…3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:3[47][0-9]{13})|(?:2131|1800|35\d{3})\d{11})$"/>
                                        <input id="cc_cvv" style="height: 30px;" class="span1 cvv_regex inspectletIgnore" type="text" required="" autocomplete="off" placeholder="CVV" maxlength="4" size="6" value="" name="payment[cvv]" pattern="^\d{3,4}$"/>
                                        <div style="display: inline-block;">
                                            <img src="img/visa.png" />
                                            <img src="img/mastercard.png"/>
                                            <img src="img/amex.png"/>
                                        </div>
                                    </li>
                                    
                                    <li class="control-group" style="margin: 0px;">
                                        <select onchange="runMyCheck()" id="expiry_month" class="span2" required="" style="display:inline; min-height:inherit;" name="payment[card_expire_month]">
                                            <optgroup label="Month">
                                                
                                                <option value="01">January</option>
                                                <option value="02">February</option>
                                                <option value="03">March</option>
                                                <option value="04">April</option>
                                                <option value="05">May</option>
                                                <option value="06">June</option>
                                                <option value="07">July</option>
                                                <option value="08">August</option>
                                                <option value="09">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </optgroup>
                                            
                                        </select>
                                        <select id="expiry_year" class="span2" required="" style="display:inline; min-height:inherit;" name="payment[card_expire_year]" onchange="runMyCheck()">
                                            <optgroup label="Year">
                                            <%
                                            DateFormat currentYear=new SimpleDateFormat("yyyy");
                                            Calendar calYear=Calendar.getInstance();
                                            String year=currentYear.format(calYear.getTime());
                                            int ye=Integer.parseInt(year); 
                                            int v=0;
                                            while(v<4){ 
                                                
                                            %>                                              
                                            <option value="<%=ye%>"><%=ye%></option>
                                            <% 
                                               ye++; 
                                                v++;
                                            }
                                            %>
                                            </optgroup>
                                            
                                        </select>
                                    </li>
                                    <li class="control-group" style="margin: 0px;">
                                        <select id="country" style="height: 30px;" class="text11pt country_code_select span3" required="" style="display:inline; min-height:inherit;" name="payment[country]" prev_set="true">
                                            <option value="1">Sri lanka</option>
                                        </select>
                                    </li>
                                </ul>

                                <b>You will be charged $ <span><%=df.format(total)%></span> today</b>
                               
                                <p style="font: 400 13px/1.5em Arial,Helvetica,sans-serif;">Your subscription will be expire on <%=sub.getDuration()*30%> Days now on.<br> You can cancel anytime. </p>
                                <span><span><span><input type="hidden" name="total" value="<%=total%>"/></span></span></span>
                                <input type="submit" class="unltimate-btn" value="Start Subscription">
                                <%
                                 }catch(Exception e){
                                         response.sendRedirect("ImagePlans.jsp");
                                     }
                                     
                                     }else{%>
                                        
                                       
                                     <div class="jumbotron" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;font-size: 21px;font-weight: 200;background-color: #EEE;width: 90%;text-align: center;padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">
                                         <h4>You'r not allowed!</h4>
                                     </div>
                                     
                                     
                                    <% }
                                     }
                                     
                                
                                 %>
                                </form>
                                
                            </div>
        
                        </div>
                    </div>
                    
                </div >
                
                <div style="width: 220px;float: left;min-height: 1px;margin-left: 20px;margin: 10px 10px 10px 30px;">
                    <div class="wrapper">
                        
                    </div>
                </div>
                
                
            
            </div><!--End of user account content-->
        </div><!--END OF MAIN CONTENT-->
       
       
        
        
        <!--Footer Content-->
            <div id="footer" style="float:left;">
                <%@include  file="footer.jsp" %>
            </div>
        
     <!--End of Footer content-->
     
        </section><!--End of Main Section Container-->
        
        
        
        <div id="card-id" class="uk-modal">
            <div class="uk-modal-dialog" style="width: 365px;background-color: #EBF3F8;">
                <a class="uk-modal-close uk-close"></a>
                
                <div style="background-color: #EBF3F8;">
                       
                </div>
            </div>
        </div>
        
        
        <script type="text/javascript" src="js/jquery.js"></script>
	
        <script type="text/javascript" src="js/uikit.min.js"></script> 
        <script type="text/javascript" src="js/datepicker.js"></script>
        <script type="text/javascript">
            
                   var xmlHttp;
 
            function createXMLHTTPRequest(){
                if (window.ActiveXObject){
                    xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                     alert("MS");
                  }
                  else{
                   //alert("Update your browser");
                  }
                  if (window.XMLHttpRequest){
                      xmlHttp=new XMLHttpRequest();
                   // alert("Ajax works");
                     alert("WEBKIT");
                  } 
                  else{
                      alert("Update your browser");

                  }
            }       
            
            function formValidation(){
                var uid=document.getElementById('usId').value;
                var totalDays=document.getElementById('totalDays').value;
                var pkId=document.getElementById('pkId').value;
                var dwnCount=document.getElementById('dwnCount').value;
                
                var fn=document.getElementById('first_name').value;
                var ln=document.getElementById('last_name').value;
                
                var card=document.getElementById('x_card_num').value;
                var cvv=document.getElementById('cc_cvv').value;
                
                var expMonth=document.getElementById('expiry_month').value;
                var expYear=document.getElementById('expiry_year').value;
                
                var country=document.getElementById('country').value;
                //var cardPattern=/^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0…3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$/;
            
                createXMLHTTPRequest();
               var url="Servlet_purchase?uid="+uid+"&totalDays="+totalDays+"&pkId="+pkId+"&dwnCount="+dwnCount+"&payment[first_name]="+fn+"&payment[last_name]="+ln+"&payment[card]="+card+"&payment[cvv]="+cvv+"&payment[month]="+expMonth+"&payment[year]="+expYear;
                xmlHttp.open("POST",url,true);
                xmlHttp.send();
                xmlHttp.onreadystatechange=function (){
                    if(xmlHttp.readyState===4 && xmlHttp.status===200){
                        
                    }
                };
                
    }
    
    function runMyCheck(){
    //update value every run
    var expiry_month = document.getElementById("expiry_month").value;
    var expiry_year = document.getElementById("expiry_year").value;

    var today = new Date();
    var selDate = new Date();
         
    if (today.getTime() > selDate.setFullYear(expiry_year, expiry_month)){
     //too late
        alert ("\u2022Expiry month and year cannot be blank/Expiry month and year is before today month and year.");
        return false;
    } else {
    //do good stuff...
    
    }
   
}
        </script>
        
    </body>
</html>
