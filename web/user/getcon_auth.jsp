<%-- 
    Document   : getcon_auth
    Created on : 23-Jan-2017, 21:10:28
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
   <%@ page import="java.sql.*" %>
   <%
   
   Connection con1=null;
   Class.forName("com.mysql.jdbc.Driver");
   con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/authentication", "root", "");
                              
   %>
    </body>
</html>
