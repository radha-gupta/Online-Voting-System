<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

    <head>
        <title>Voters Section</title>
        <meta name="description" content="free website template" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="../admin/button.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/image_slide.js"></script>

    </head>
    <%
        if (session.getAttribute("who") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body>

        <%@page import="java.sql.*"%>
        <%@page import="javax.sql.*"%>
        
        <!-- connection with the database -->
        <%@ include file="getcon_ladmin.jsp"%>

        <div id="main" style=" padding-bottom: 30px;">
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
                    <li><a href="index.jsp">Home</a></li>
                    <li class="current"><a href="voters_corner.jsp">Voters Corner</a></li>
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
                <div id="content">
                    <%
                        try {
                          
                            String a = "select * from elections";   // elections table where info about elections are stored
                            Statement k = con.createStatement();
                            ResultSet m = k.executeQuery(a);

                            Statement k1 = con.createStatement();
                            ResultSet temp = k1.executeQuery(a);
                            while (temp.next()) {
                                String t = temp.getString("ename");
                                String t1 = t.replaceAll("\\s", "");

                                if (temp.getString("is_active").equals("YES")) {    //to see if the elections is in progress or not
                    %>
                    <div style="border-bottom:1px solid grey;border-left: 1px solid grey;padding:8px;">
                        <div>

                            <div style="float:left;width: 20%;height:100px;padding: 10px;"> 
                                <h1 style="font-size: 25px;color:#FFFFFF"> <%=temp.getString("ename")%></h1>
                                <h1 style="font-size: 20px;color:#FFFFFF"> <%=temp.getString("date")%> </h1>
                                <h1 style="font-size: 20px;color:#FFFFFF"> <%=temp.getString("time")%> </h1>
                            </div>

                            <div style="float:left;word-wrap: break-word;width:60%;height:100px;padding: 20px">
                                <p style="font-size:15px;color:white"><%=temp.getString("details")%></p>
                            </div>

                        </div>


                        <div>
                            <button class="myButton"><a href="candidates_section.jsp?elec=<%=t%>"> View candidates</a></button> <!--calling candidates.jsp and sending election name as parameter to it -->
                            <button class="myButton"><a href="request_Section.jsp?elec=<%=t1%>"> Request for vote</a></button>
                            <button class="myButton"><a href="vote_Section.jsp?elec=<%=t1%>"> Click for vote</a></button>
                            <button class="myButton"><a href="result_section.jsp?elec=<%=t%>"> View Results</a></button>

                        </div>
                        <br><br>
                                </div>

                                <%
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>  
                                </div><!--close content-->   
                                </div><!--close site_content--> 
                                </div><!--close main-->


                                </body>
                                <%
                                    }
                                %>   
                                </html>
