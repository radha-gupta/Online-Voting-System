<%-- 
    Document   : contact2
    Created on : 02-Jan-2017, 21:04:58
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <style>  
            div.box{margin:2px;border-bottom:1px solid white;padding:5px;background:rgba(50,50,50,0.8);color:white}  
        </style>  
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%@ include file="getcon_ladmin.jsp"%>
        <%
            String name = request.getParameter("x");  //getting URL's x parameter
            String email = request.getParameter("y");
            String comment = request.getParameter("z");
            if (comment == null || email == null || comment.trim().equals("") || email.trim().equals("")) {
                out.print("<p>Please write comment</p>");
            } else {

                try {
                    PreparedStatement ps = con.prepareStatement("insert into feedback(name,comment,email) values(?,?,?)");
                    ps.setString(1, name);
                    ps.setString(2, comment);
                    ps.setString(3, email);
                    int i = ps.executeUpdate();   // inserting the comment in feedback table

                    PreparedStatement ps2 = con.prepareStatement("select * from feedback order by sno desc");
                    ResultSet rs = ps2.executeQuery();        // showing all comments

                    out.print("<br/></br><h2>Comments:</h2>");
                    while (rs.next()) {
                        out.print("<div class='box'>");
                        out.print("<p> Name : " + rs.getString(2) + "</p>");
                        out.print("<p>" + rs.getString(3) + "</p>");
                        out.print("<p><strong>By: " + rs.getString(4) + "</strong></p>");
                        out.print("</div>");
                    }

                    con.close();
                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>  
    </body>
</html>
