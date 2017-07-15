<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

    <head>
        <title>User Section</title>
        <meta name="description" content="free website template" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="../admin/button.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/image_slide.js"></script>
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <script>
            $(function () {
                $('#a').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });
                $('#b').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });
                $('#c').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });
                $('#d').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });
                $('#e').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });

                $('#f').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });

                $('a').click(function () {
                    $('#target').load($(this).attr('href'));
                    return false;
                });



            });

        </script>


    </head>
    <%
        if (session.getAttribute("who") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>

    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*"%>
        <%@ include file="getcon_ladmin.jsp"%>

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
                    <li><a id="b" href="contact.jsp">Contact</a></li>
                    <li><a id="d" href="about_section.jsp">About Us</a></li>
                    <li><a id="f" href="../login/log.jsp">Log out</a></li>
                </ul>
            </div><!--close menubar-->	

            <div id="site_content" style="padding-bottom: 20px">		

                <div class="sidebar_container">       
                    <div class="sidebar">
                        <div class="sidebar_item">
                            <h2>New Website</h2>

                            <p>Welcome to our  website. Please have a look around, any feedback is much appreciated.</p>
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
                <div id="content" style="margin-bottom:0px">

                    <div style="height:60px;border-bottom: 3px solid grey;border-left: 1px solid grey;padding: 20px"> <h1 style="font-size: 40px;text-align:center;color:#FFFFFF"><%=request.getParameter("elec")%></div>
                    <div style="float:left; width:30%; height:580px;border-left: 1px solid grey;color: white"> 
                        <table  style="margin:25px">      

                            <%
                                try {
                                    String h = request.getParameter("elec");
                                    h = h.replaceAll("\\s", "");
                                    Statement k = con.createStatement();
                                    ResultSet m;
                                    String query = "select candidate from " + h + " "; // to get all the candidates of mentioned election
                                    m = k.executeQuery(query);

                                    if (!m.isBeforeFirst()) {
                                        %> <tr style="margin:10px"><td style="width:600px;padding-top: 10px;padding-bottom: 10px;font-size: 20px;"><h3> No candidates yet ...</h3></td></tr>
                            <%
                            } else {
                                while (m.next()) {
                                    String y = m.getString("candidate"); // het a particular candidate in h
                                    y = y.replaceAll("\\s", "");

                            %>    
                            <tr style="margin:20px"><td style="width:400px;padding-top: 10px;padding-bottom: 10px;font-size: 16px;"><%=m.getString("candidate")%></td>
                                <td style="width:50px;margin: 5px"><a style="font-size:20px;color:white"  href="profile_section.jsp?candidate=<%=y%>&election=<%=h%>">Profile</a></td>  
                            </tr>    
                            <%
                                        }
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }

                            %>
                        </table>
                    </div>  
                    <div id="target" style="float:left; height:540px;width:60%;padding: 20px;padding-left: 30px"> 
                    </div>    
                </div><!--close content-->   
            </div><!--close site_content--> 
        </div><!--close main-->
    </body>
    <%}%>
</html>
