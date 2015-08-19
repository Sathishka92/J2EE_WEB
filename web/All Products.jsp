<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>All Products</title>
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
           
            <link href="Css/All Products.css"rel="stylesheet" type="text/css" />
            <link rel="shortcut icon" type="image/png" href="Images/mobyshortcutlogo.png"/>
            
            <%@include file="Header.jsp" %>
    </head>

    <body>
    
        <div id="pagecon">
            <h2 id="text">Home > All Products > Mobile Phones</h2>
        <span id="disp"><div class="page-pigmintation top_page_nav">										
											<ul>
												<li><a class="prev" href="#"><i class="prev"> </i></a></li>
												<li><a href="#">1</a></li>
												<li><a href="#">2</a></li>
												<li><a href="#">3</a></li>
												<li><a class="next" href="#"><i class="next"> </i></a></li>
												<div class="clear"> </div>
											</ul>										
									</div>
                                    </div></span>
  
        </div>
   <div id="main">    
            
  <div id="Category">
      <div id="Header">Search Option </div>
      <div id="table">
          <center>
          <table  width="100%" align="center">
  <tr >
      <td id="dis"><select><option>Color</option></select> </td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">White</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">Gray</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">Pink</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr"  href="#">Purple</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">Brown</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">Black & White</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">Apple Green</a></td>
  </tr>
</table>

          
          
          </center>
      
      
     
  </div>
  </div>
  <br />
    <div id="Category1">
      <div id="Header">SHOP BY OS </div>
      <div id="table">
          <center>
          <table  width="100%" align="center">
  <tr >
    <td id="dis"><a id="tbclr" href="#">ANDROID</a> </td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">APPLE OS (ios)</a></td>
  </tr>
  <tr>
    <td id="dis"><a id="tbclr" href="#">WINDOWS</a></td>
  </tr>
  
  
</table>

          
          
          </center>
      
      
     
  </div>
  </div>
        
       <br />
        <div id="Category2">
      <div id="Header">SHOP BY PRICE </div>
      <div id="table">
          <center>
          <table  width="100%" align="center">
  <tr >
   <td><input id="textid" type="text" placeholder="Amount" /></td>
 </tr>
  <tr>
   <td><input id="textid" type="text" placeholder="Amount" /></td>
  </tr>
   <tr>
   <td><input id="mydefaultbuttonforsbp" type="submit" value="SEARCH" /></td>
  </tr>
 
  
  
</table>

          
          
          </center>
      
      
     
  </div>
  </div> 
  
  <div id="content_div">
  
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/small_samsung-galaxy-s4-mini-smartphone-600x600.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">HTC ONE(Red)</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/salaxy note.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Samsung Galaxy Note</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/1-120x120.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Samsung Galaxy Tab2</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
      <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/01-small.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Nokia X</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <!---Second Line--><br />
  
  
    <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/small.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Sony Xpeia Z</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/small_autocorrect-galaxy-s4-600x600.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Samsung Galaxy S4</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/small_galaxys3-600x600.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Samsung Galaxy S3</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
      <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/01-small (1).jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Nokia Lumia 1020</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <!--3rd Line--->
  
  
    <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/Dialog q243.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">Dialog q243</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/huawei ascend g730.jpg"/></div>
     <div id="itemname">
     
     <h2 id="product_name">huawei ascend g730</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/LG G FLEX 4G 16GB.jpg" /></div>
     <div id="itemname">
     
     <h2 id="product_name">LG G FLEX 4G 16GB)</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
      <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <div id="product_box">
     
     <div id="Header_pro"></div>
     <div id="image"><img src="Images/all pro/120x120-01.jpg"/></div>
     <div id="itemname">
     
     <h2 id="product_name">Nokia Lumia 1020 - Black)</h2>
      <h2 id="product_price"><span> Rs 42,000 </span></h2>
     </div>
     <div id="cart"><input id="quickviewbtn" type="submit" value="Add to Cart" /></div>
  </div>
  
  <br />
 
  
  
  
  
  
  
  
  
  
  </div>
        <hr  id="hrbar"/> 
   </div>
        
     
      
        <%@include file="Footer.jsp" %>
       
      
        
       
        
    </body>
</html>