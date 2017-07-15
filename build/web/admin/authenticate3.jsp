
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authenticate Page</title>
    </head>
    <body>
         <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_auth.jsp"%>
        
            <% 
             try
            {
            String t1=request.getParameter("x");  //election name    
            String t2=request.getParameter("y");  //rollno
            String a="select * from "+t1+" where rollno = '"+t2+"'";
            Statement k=con1.createStatement();
            a="update "+t1+" set is_eligible='"+"YES"+"'"+"where rollno='"+t2+"'";
            k.executeUpdate(a);
            out.println("<p>authenticated successfully...</p>");

            }
           catch(Exception e)
            {
                out.println("<p>something went wrong..try again</p>");
            }    
             
        %>
    </body>
</html>
