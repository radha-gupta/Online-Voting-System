<%-- 
    Document   : request_Section
    Created on : 20-Dec-2016, 12:01:15
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="../admin/button.css" />

    </head>
    <%
        if (session.getAttribute("who") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        
        <!-- connection to the databases -->
        <%@ include file="getcon_ladmin.jsp"%>
        <%@ include file="getcon_auth.jsp"%>

        <div id="main"  style="padding-bottom: 30px;">
            <div id="header" style="margin-left: 0px;margin-right: 0px">
                <div id="banner">
                    <div id="welcome">
                        <h1 style="float: left">Your vote Your choice</h1>
                    </div><!--close welcome-->
                    <div id="welcome_slogan">
                        <h1>Welcome <%=session.getAttribute("who")%></h1>
                    </div><!--close welcome_slogan-->
                </div><!--close banner-->
            </div><!--close header-->

            <div id="menubar">
                <ul id="menu">
                    <li><a id="a" href="index.jsp">Home</a></li>
                    <li class="current"><a id="c" href="voters_corner.jsp">Voters Corner</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="about_section.jsp">About Us</a></li>
                    <li><a href="../login/log.jsp">Log out</a></li>
                </ul>
            </div><!--close menubar-->	

            <div id="site_content">		

                <div class="sidebar_container">       
                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h2>New Website</h2>

                            <p>Welcome to our website. Please have a look around, any feedback is much appreciated.</p>
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->     		
                    <div class="sidebar">
                        <div class="sidebar_item">


                            <h2>Latest Update</h2>
                            <h3>January 2017</h3>
                            <p>A very happy new year to all .May this year brings lots of happiness and craziness.</p>         
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->
                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h3>Fee deposit</h3>
                            <p>Deposit the fee for the even semester from Jan 2 - Jan 9 in your respective departments.</p>        
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->  

                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h2>Contact</h2>
                            <p>Phone: +91 86990-72590</p>
                            <p>Email :  rguptaa25@gmail.com</p>
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->
                </div><!--close sidebar_container-->	
                <div id="content" style="color:black;height:580px;border-left: 1px solid grey">

                    <div style="text-align: center;padding:20px;border-radius: 25px;width: 400px;height: 130px; margin: 200px auto;border:2px solid white">

                        <%
                            try {
                                String h = request.getParameter("elec");
                                String u = (String) session.getAttribute("who");
                                Statement t = con1.createStatement();
                                String query = "select username,is_eligible from " + h;
                                ResultSet m1 = t.executeQuery(query);
                                int flag = 0;
                                while (m1.next()) {
                                    if (m1.getString("username").equals(u)) {

                                        if (m1.getString("is_eligible").equals("YES")) {
                                            flag = 1;
                        %>
                        <label class="mylabel" style="color:white">You have already been authenticated...proceed for casting vote</label>
                        <% break;
                        } else {
                            flag = 1;
                        %>   
                        <label class="mylabel" style="color:white">You have already sent request to admin...Please wait for the verification process</label>
                        <%
                                        break;
                                    }
                                }
                            }

                            if (flag == 0) {  // if it the first time requst
                                PreparedStatement k = con1.prepareStatement("insert into " + h + " values(?,?,?,?,?,?)");
                                Statement s = con.createStatement();
                                String temp = "select rollno,branch,email from student where username = '" + u + "'";
                                ResultSet m = s.executeQuery(temp);

                                while (m.next()) {

                                    k.setString(1, u);    //username
                                    k.setString(2, m.getString("rollno"));   //rollno
                                    k.setString(3, m.getString("branch"));   //branch
                                    k.setString(4, m.getString("email"));     //email 
                                    k.setString(5, "NO");     //is_eligible
                                    k.setString(6, "NO");     //is_voted
                                    k.executeUpdate();
                                }
                        %>
                        <label class="mylabel" style="color:white">Request has been sent successfully....</label>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();

                            }
                        %> 
                        <br><br>
                        <a  style="color:grey;font-size: 20px" href="voters_corner.jsp">Back to Voters Corner</a>
                    </div>
                </div>
            </div><!--close site_content--> 



        </div><!--close main-->
        <br>
    </body>
    <%}%>
</html>
