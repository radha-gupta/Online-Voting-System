<%-- 
    Document   : authenticate
    Created on : 21-Dec-2016, 08:23:44
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" type="text/css" href="button.css">
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <script>
        $(function() {
            $('a').click(function() {
                $('#tar').load($(this).attr('href'));
                return false;
            });
        });
    
        </script>
    </head>
    <%
        if (session.getAttribute("who_admin") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*"%>
        <%@ include file="../user/getcon_ladmin.jsp"%>

    
          <%
            try{
            Statement k=con.createStatement();
            String query="select * from elections where 1<2";  //selecting all elections
            ResultSet m=k.executeQuery(query);
       
            %><div style="float:left;width:25%;height: 100%">
            <%     
            while(m.next())    
            {  
                String t=m.getString("ename");
                t=t.replaceAll("\\s","");
               %>
               <!-- clicking on any election will lead to showing its table -->
               <Button class="submitbutton" style="width:180px"><a href="authenticate2.jsp?v=<%=t%>"><%=m.getString("ename")%></a> <br>
               
               <%} 
            }  
           catch(Exception e)
            {
                e.printStackTrace();
            }    
               %>
            
            </div>
               <div style="float:left;width:70%;" id="tar">  </div>        

        </form>  
        <% }%>
    </body>
</html>
