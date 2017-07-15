
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>


        <%
            String a = request.getParameter("x");
            String b = request.getParameter("y");
            String c = request.getParameter("z");
            String d = "0";
            String e = request.getParameter("w");
            String g = request.getParameter("h");
            String f = request.getParameter("q");

            if (a == null || a.trim().equals("") || b == null || b.trim().equals("")) {
                out.print("<p>Please enter the empty fields!</p>");
            } else {
            try{
            a=a.replaceAll("\\s","");
            PreparedStatement k = con.prepareStatement("insert into " + a + " values(?,?,?,?,?,?,?)");
            k.setString(1, b);
            k.setString(2, c);
            k.setString(3, d);
            k.setString(4, e);
            k.setString(5, g);
            k.setString(6, f);
            k.setString(7, "");
            k.executeUpdate();
            out.println("<p>registered successfully...</p>");
            con.close();
            }
            catch(Exception n){
               out.println("<p>something went wrong..try again</p>");
            }
            }
            
        %>
        

    </body>
</html>
