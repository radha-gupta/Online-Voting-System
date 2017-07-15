<%-- 
    Document   : log
    Created on : 27-Dec-2016, 13:02:54
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

        <h1>your session is expired...</h1>
        <%
            session.setAttribute("who_admin",null);
            response.sendRedirect("../login/index.jsp");
        %>
   
    </body>
</html>
