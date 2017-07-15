<%-- 
    Document   : vote_Section
    Created on : 22-Dec-2016, 08:37:40
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voters Page</title>
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
                <div id="content" style="border-left: 1px solid grey;height:580px">

                    <div style="text-align: center;padding:20px;border-radius: 25px;width: 400px;height: 130px; margin: 200px auto;border:2px solid white">

                        <%
                            try {
                                String t1 = request.getParameter("elec");
                                String a = "select * from " + t1 + " where username = '" + (String) session.getAttribute("who") + "'";
                                Statement k = con1.createStatement();
                                ResultSet m = k.executeQuery(a);

               if (!m.isBeforeFirst()) {    %>
                        <label class=mylabel style="color: white">You have not sent request to admin...</label> <br><br>
                        <a  style="color:grey;font-size: 20px" href="voters_corner.jsp">Back to Voters Corner</a>

                        <%
                        } else {

                            String h = "";
                            String v = "";
                            while (m.next()) {
                                h = m.getString("is_eligible");
                                v = m.getString("is_voted");
                            }

                if (h.equals("NO")) { %>
                        <label class=mylabel style="color: white">You are not authenticated yet...check after sometime...</label><br><br>
                        <a  style="color:grey;font-size: 20px" href="voters_corner.jsp">Back to Voters Corner</a>

                        <%
                    } else {
                        if (v.equals("YES")) { %>
                        <label class=mylabel style="color: white">Already casted vote...</label><br><br>
                        <a  style="color:grey;font-size: 20px" href="voters_corner.jsp">Back to Voters Corner</a>                        
                        <%
                        } else {
                            String a1 = "select candidate from " + t1;
                            Statement k1 = con.createStatement();
                            ResultSet m1 = k1.executeQuery(a1);
                            if (!m1.isBeforeFirst()) {
                        %> <label class=mylabel style="color: white"> No candidates yet ...</label><br><br>
                        <a  style="color:grey;font-size: 20px" href="voters_corner.jsp">Back to Voters Corner</a>                        

                        <%
                        } else {
                        %>

                        <form action="vote_Section2.jsp?v=<%=request.getParameter("elec")%>" method="post">
                            <label class="mylabel" style="color: white">Select Candidate</label>     
                            <select name="sel_candidate" style="width:200px">
                                <%
                                 while (m1.next()) {%>
                                <option value="<%=m1.getString("candidate")%>"><%=m1.getString("candidate")%></option>

                                <%
                                    }

                                %>      
                            </select>
                            <br><br><br><br>
                            <input type="submit" class="myButton" style="width:200px" value="CAST YOUR VOTE">               
                            <%                                          }
                                            }

                                        }
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %> 
                            </div>
                            </div>
                            </div><!--close site_content--> 
                            </div><!--close main-->
                            </body>
                            <%}%>
                            </html>
