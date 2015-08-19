<%-- 
    Document   : About
    Created on : Nov 17, 2014, 11:04:59 AM
    Author     : SathisHka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <link rel="stylesheet" type="text/css" href="Css/uikit.min.css" />
        <script src="Js/uikit.min.js"></script>
        
    </head>
    <body>
     <!-- This is an anchor toggling the modal -->
<a href="#my-id" data-uk-modal>...</a>

<!-- This is a button toggling the modal -->
<button class="uk-button" data-uk-modal="{target:'#my-id'}">...</button>

<!-- This is the modal -->
<div id="my-id" class="uk-modal">
    <div  class="uk-modal-dialog">
        <a class="uk-modal-close uk-close"></a>
        ...
    </div>
</div>
    </body>
</html>
