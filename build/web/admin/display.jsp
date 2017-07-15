<%-- 
    Document   : display.jsp
    Created on : 18-Dec-2016, 21:52:54
    Author     : gupta's
--%>

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
            try {
                Statement k = con.createStatement();
                ResultSet m;
                int temp;
                String option = (String) request.getParameter("x");
                if (option.equals("Election_info")) {
                    temp = 2;
                } else {
                    temp = 1;
                }
                switch (temp) {
                    case 1:
                        String t = "select * from login where 1<2";
                        m = k.executeQuery(t);
                        if (!m.isBeforeFirst()) {
                            out.println("<p>No Record Found!</p>");
                        } else {
                            out.print("<table border='3' cellpadding='3' cellspacing='2' width='50%'>");
                            out.print("<tr><th>username</th><th>password</th></tr>");

                            while (m.next()) {
                                out.print("<tr><td> " + m.getString(1) + "</td><td>" + m.getString(2) + "</td></tr>");
                            }
                            out.print("</table>");
                            m.close();
                            k.close();
                            con.close();       
                        }
                      break;
                     default:

                        String h = "select * from elections where 1<2";
                        m = k.executeQuery(h);
                        if (!m.isBeforeFirst()) {
                            out.println("<p>No Record Found!</p>");
                        } else {
                            out.print("<table border='3' cellpadding='8' cellspacing='5' width='80%'>");
                            out.print("<tr><th>ename</th><th>date</th><th>time</th></tr>");

                            while (m.next()) {
                                out.print("<tr><td> " + m.getString(1) + "</td><td>" + m.getString(2) + "</td><td>" + m.getString(3) + "</td></tr>");

                            }
                            out.print("</table>");
                            m.close();
                            k.close();

                            con.close();
                        }
                }
            }
                catch(Exception e)
                {
                  e.printStackTrace();
                }

        %>


    </body>
</html>
