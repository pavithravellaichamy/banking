<%-- 
    Document   : trans
    Created on : 1 Aug, 2020, 1:08:22 PM
    Author     : PAVINANDY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "banking";
String userid = "root";
String password = "password";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<html>
    <head>
        <title>BANKING SYSTEM</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body >
        <form action="accountDetails" method="post">
        <div style="text-align: center">
            <br><br></br></br>
            <h1 style="color:blue">BANKING SYSTEM</h1>
            <p style="font-size:140%"><strong>ACCOUNT DETAILS</strong></p>
            <%
    try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from account_details";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
            %>
    <tr>
        <td><%=resultSet.getString("Bank") %></td>
        <td><%=resultSet.getString("account_holder_name") %></td>
        <td><%=resultSet.getString("account_num") %></td>
        <td><%=resultSet.getInt("Balance") %></td>
    </tr>
    <%
    }
    connection.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
    </table>                  
    </div>
        </form>
      </body>
</html>