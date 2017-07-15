<%-- 
    Document   : search
    Created on : 17-Dec-2016, 06:41:44
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <script type="text/javascript">

        </script>    
    </head>
    <body>

        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>

        <%
            try {
                Statement k = con.createStatement();
                ResultSet m;
                String temp;

                String option = (String) request.getParameter("x");
                String uname  = (String) request.getParameter("y");
                String name   = (String) request.getParameter("z");
                String rollno = (String) request.getParameter("w");
                String course = (String) request.getParameter("q");
                String branch = (String) request.getParameter("r");
                int i = Integer.parseInt(option);

                switch (i) {
                    case 1:
                        temp = "select name,rollno,course,branch,email,mobileno,username from student where username = '" + uname + "'";
                        m = k.executeQuery(temp);
                        break;
                    case 2:
                        temp = "select name,rollno,course,branch,email,mobileno,username from student where name = '" + name + "'";
                        m = k.executeQuery(temp);
                        break;
                    case 3:
                        temp = "select name,rollno,course,branch,email,mobileno,username from student where rollno = '" + rollno + "'";
                        m = k.executeQuery(temp);
                        break;
                    case 4:
                        temp = "select name,rollno,course,branch,email,mobileno,username from student where course = '" + course + "'";
                        m = k.executeQuery(temp);
                        break;
                    case 5:
                        temp = "select name,rollno,course,branch,email,mobileno,username from student where branch= '" + branch + "'";
                        m = k.executeQuery(temp);
                        break;
                    default:
                        temp = "select name,rollno,course,branch,email,mobileno,username from student where 1<2";
                        m = k.executeQuery(temp);
                        break;
                }
                if(m.isBeforeFirst()){ 
                out.print("<table border='3' cellpadding='8' cellspacing='5' width='100%'>");
                out.print("<tr><th>name</th><th>rollno</th><th>course</th><th>branch</th><th>email</th><th>mobileno</th><th>username</th></tr>");

                while (m.next()) {

                    out.print("<tr><td> "+m.getString(1)+"</td><td>" + m.getString(2) + "</td><td> " + m.getString(3) + "</td><td> " + m.getString(4) + "</td><td> " + m.getString(5) + "</td><td> " + m.getString(6) + "</td><td> " + m.getString(7) + " </td><tr> ");

                }

                out.print("</table>");
                }
                else
                {
                    out.println("No search found..");
                }    
                m.close();
                k.close();

                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>




    </body>
</html>
