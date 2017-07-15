<%-- 
    Document   : new_admin
    Created on : 16-Dec-2016, 21:34:50
    Author     : gupta's
--%>

<!-- this jsp page is called when user enters the security key -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../admin/button.css" /> 
        <link rel="stylesheet" href="css/style.css">
        
        <title>Verification Page</title>
    </head>
    <body>

        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>
        
        
        <div style="background-color: rgba(255,255,255,0.9);display: inline-block;text-align: center;padding:20px;border-radius: 25px; position: fixed;  top: 0; bottom: 30px; left: 0;right: 0;width: 600px;height: 170px; margin: auto;border:2px solid black">
            <form action="#" method="post">
                <label class=mylabel style="font-size:20px;color: red">Please enter the unique key send to your email account.</label> 
                <br><br>
                <label class=mylabel style="font-size:30px">Enter key :</label> <input style="width:400px;height:20px;font-size: 15px" type="text" name="key"><br><br>
                <input class="submitbutton" type="submit" value="submit" name="sub">     
            </form>

            <%
                if (request.getParameter("sub") != null) {
                    String a =(String) request.getParameter("key");
                    a = a.replaceAll("\\s", "");  // removing all white spaces 

                    String user = (String) session.getAttribute("who");
                    
                    try {
                        Statement k = con.createStatement();
                        String query = "select unique_key,is_activated from student where username='" + user + "'";
                        ResultSet m = k.executeQuery(query);

                        while (m.next()) {
                            String s=(String)m.getString("unique_key");
                            if (s.equals(a)) {
                                query = "update student set is_activated = 'YES' where username ='" + user + "'";
                                k.executeUpdate(query);
                                response.sendRedirect("../user/index.jsp");
                        } else { %>
                        <br>
            <label style="padding-top:90px;font-size: 15px; color:red"><% out.println("Wrong key.Cannot activate your account");%></label>
            <br><br> 
            <%
                       }
                     }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>         
        </div>
    </body>
</html>
