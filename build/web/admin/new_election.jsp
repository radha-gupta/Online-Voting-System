<%-- 
    Document   : new_election
    Created on : 17-Dec-2016, 05:24:09
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN PAGE</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_auth.jsp"%>  
        <%@ include file="../user/getcon_ladmin.jsp"%>
       
        <%

            String a = request.getParameter("x");
            String b = request.getParameter("y");
            String c = request.getParameter("z");
            String d = request.getParameter("w");
            if (a == null || a.trim().equals("") || b == null || b.trim().equals("") || d == null || d.trim().equals("") || c == null || c.trim().equals("")) {
                out.print("<p>Please enter the empty fields!</p>");
            } else {
                try {
                    PreparedStatement k = con.prepareStatement("insert into elections values(?,?,?,?,?,?)");
                    k.setString(1, a);
                    k.setString(2, b);
                    k.setString(3, c);
                    k.setString(4, d);
                    k.setString(5,"YES");
                    k.setString(6,"NO"); 
                    k.executeUpdate();

                    a = a.replaceAll("\\s", "");
                    
                    
                    Statement s = con.createStatement();   //create a dynamic table in ladmin database
                    String m = "create table " + a + " (candidate varchar(40),designation varchar(300),votes INTEGER,description varchar(600),contact varchar(20),motto varchar(200),image_url varchar(300),PRIMARY KEY(candidate))";
                    s.executeUpdate(m);
                    Statement s1 = con1.createStatement();   //create a dynamic table in authentication database
                    String m1 = "create table " + a + " (username varchar(30),rollno varchar(30),branch varchar(30),email varchar(30),is_eligible varchar(10),is_voted varchar (10),PRIMARY KEY(rollno))";
                    s1.executeUpdate(m1);

                    out.println("<p>registered successfully...</p>");
                } catch (Exception e) {
                    out.println("<p>something went wrong..try again</p>");
                }
            }
        %> 
    </body>
</html>
