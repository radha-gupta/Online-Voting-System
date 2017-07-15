<%-- 
    Document   : search_table
    Created on : 18-Dec-2016, 08:57:42
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search_table Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>
        
        <table border="3" color="red">
            <tr><th>username  </th>
                <th>password  </th>
                <th>branch</th>
                <th>mobile no</th>
            </tr>
             
        <% 
         try
         {
            String s=(String)session.getAttribute("n");
            String a="select name,password,branch,mobileno from student where name='"+s+"'";
            Statement k=con.createStatement();
            ResultSet m=k.executeQuery(a);
            
           if(m.isBeforeFirst()){ %>
               <table border="3" color="red">
            <tr><th>username  </th>
                <th>password  </th>
                <th>branch</th>
                <th>mobile no</th>
            </tr> 
            <%
    
           while(m.next())
           {
               %>
               <tr> <td> <%=m.getString("name") %> </td>
                <td> <%=m.getString("password") %> </td>
                <td> <%=m.getString("branch") %> </td>
                <td> <%=m.getString("mobileno") %> </td>
               </tr> 
               <%
           }
           }
           else
           {
               out.println("No search found...");
           }
          %>

          </table> 
          
          <%
           m.close();
             k.close();
                     
             con.close();
           }  
        
        catch(Exception e)
        {
            e.printStackTrace();
        }
         %>
        
    </body>
</html>
