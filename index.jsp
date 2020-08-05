<%-- 
    Document   : index
    Created on : 30 Jul, 2020, 8:46:09 PM
    Author     : PAVINANDY
--%>

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
Statement statement = null,st=null;
ResultSet resultSet = null,rs=null;
%>

<html>
    <head>
        <title>BANKING SYSTEM</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>table, th, td{
            border: 1.5px solid black;
            border-collapse: collapse;
            border-spacing: -0.5rem;
            text-align: center;
            padding: 5px;
            }
            table.center{
                margin-left: auto;
                margin-right: auto;
            }            
        </style>
    </head>
    <body>
           <div style="text-align: center">
            <br><br></br></br>
            <h1 style="color:blue">BANK SYSTEM</h1>
            <p style="font-size:140%"><strong>ACCOUNT DETAILS</strong></p>
            <%
    try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    statement=connection.createStatement();
    String sql ="select * from account_details";
    resultSet = statement.executeQuery(sql);
    while(resultSet.next()){
            %>
    <table class="center">
    <tr>
        <th>    BANK    </th>
        <th>    ACCOUNT HOLDER NAME </th>
        <th>    ACCOUNT NUMBER  </th>
        <th>    BALANCE </th>
    </tr>
    <tr>
        <td><%=resultSet.getString("Bank") %></td>
        <td><%=resultSet.getString("account_holder_name") %></td>
        <td><%=resultSet.getString("account_number") %></td>
        <td><%=resultSet.getInt("Balance") %></td>
    </tr>
    <%
    }
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
    
    </table>                  
                <p style="font-size:140%"><strong>TRANSACTION DETAILS</strong></p>
     <%
    try{
    connection = DriverManager.getConnection(connectionUrl+database, userid, password);
    st=connection.createStatement();
    String query ="select * from transaction limit 5 ";
    rs = st.executeQuery(query);
    while(rs.next())
    {
            %>
    <table class="center">
    <tr>
        <th>    ACCOUNT NUMBER    </th>
        <th>    AMOUNT </th>
        <th>    CURRENT_BALANCE </th>
    </tr>
     <tr>
        <td><%=resultSet.getString("account_num") %></td>
        <td><%=resultSet.getInt("amount") %></td>
        <td><%=resultSet.getInt("current_balance") %></td>
    </tr>  
    <%
    }
    connection.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>  
    </table>
            <p style="font-size:140%"><strong>FUND TRANSFER</strong></p>
            <a href="transfer.jsp"><input type="button" value="FUND"/></a>
           
         </div>
      </body>
</html>

