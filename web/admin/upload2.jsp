<%-- 
    Document   : upload2
    Created on : 30-Dec-2016, 21:37:48
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Page</title>
          
    </head>
    <body>
        <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
        <%@ page import="javax.servlet.http.*" %>

        <%@ include file="../user/getcon_ladmin.jsp"%>

        <%  String ele = request.getParameter("x");
            ele = ele.replaceAll("\\s", "");
        %>

        <form  method="post" action="../uploadServlet" enctype="multipart/form-data">
            <input type="text" placeholder="<%=ele%>" name="ele">
            <label class="mylabel" >Candidate</label>
            <select id="candidate" style="width:200px">

                <%
                    try {

                        String query = "select candidate from  " + ele;
                        Statement k = con.createStatement();
                        ResultSet m = k.executeQuery(query);

                 while (m.next()) {%>    
                <option value="<%=m.getString("candidate")%>"><%=m.getString("candidate")%></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>        
            </select>
            
            <input type="file" name="photo" size="50"/>
            <input style="margin-left:50px"   type="submit" value="Enter">

        </form> 
            



    </body>
</html>
