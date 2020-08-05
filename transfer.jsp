<%-- 
    Document   : transfer
    Created on : 4 Aug, 2020, 12:56:18 PM
    Author     : PAVINANDY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AMOUNT TRANSFER</title>
    </head>
    <body>
        <div style="text-align: center">
            <br><br><br>
            </br></br></br>
        <form action="amountupdate" method="post">
         <p style="font-size:140%"><strong>AMOUNT TRANSFER</strong></p>
         <input type="text" name="account_number" placeholder="account_number">
         <input type="text" name="amount" placeholder="amount">
         <a href="index.jsp"> <input type="button" value="SUBMIT"/></a>
          </form> 
        </div>
    </body>
</html>
