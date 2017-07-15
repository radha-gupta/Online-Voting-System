<%-- 
    Document   : new_admin
    Created on : 16-Dec-2016, 21:34:50
    Author     : gupta's
--%>

<%@page  language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN PAGE</title>
        <link rel="stylesheet" type="text/css" href="button.css">
    </head>
   
    <body> 

        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>

        <%
            String a = request.getParameter("x");
            String b = (String)request.getParameter("y");
            String c = (String)session.getAttribute("who_admin");

            if (a == null || a.trim().equals("")|| b == null || b.trim().equals("")) {
                out.print("<p>Please enter name or password!</p>");
            } else {

                try {
                    Statement k1=con.createStatement();
                    String query="select is_head from login where username='"+c+"'"; // only head admin can add new admins 
                    ResultSet m=k1.executeQuery(query);
                    while(m.next()){
                    
                    if(m.getString("is_head").equals("YES")){     
                    PreparedStatement k = con.prepareStatement("insert into login values(?,?,?)");
                    k.setString(1, a);
                    k.setString(2, b);
                    k.setString(3, "NO");     // is_head is NO for all other admins 
                    k.executeUpdate();
                    out.println("<p>registered successfully...</p>");
                    }
                    else
                    {
                      out.println("<p>ACCESS DENIED</p>");
                    }
                    }
                      con.close();
                }
                catch (Exception e) {
                    out.println("<p>something went wrong..try again</p>");
                }
            }
        %> 
    </body>
 
</html>



