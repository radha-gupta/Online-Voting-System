<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

    <head>
        <title>Contact Us</title>
        <meta name="description" content="free website template" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/image_slide.js"></script>
        <style>  
            div.box{margin:2px;border-bottom:1px solid white;padding:5px;background:rgba(50,50,50,0.8);color:white}  
        </style> 
        <script>
            var request;
          
            // function to show comment section instantly by sending the name and email to contact2.jsp through URL
            function sub() {
                var name = document.comment.name.value;
                var email = document.comment.email.value;
                var com = document.comment.message.value;
                
                var url = "contact2.jsp?x=" + name + "&y=" + email + "&z=" + com;
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = function () {
                        if (request.readyState == 4) {
                            var val = request.responseText;
                            document.getElementById('mylocation').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();             //sending url
                } catch (e) { 
                    alert("Unable to connect to server");
                }
            }
        </script>  
    </head>
    <%
        if (session.getAttribute("who") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body>
        <%@ page import="java.sql.*" %>  
        <%@ include file="getcon_ladmin.jsp"%>
        <div id="main"  style="padding-bottom: 30px;">
            <div id="header"  style="margin-left: 0px;margin-right: 0px">
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
                    <li><a href="voters_corner.jsp">Voters Corner</a></li>
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

                <!-- Start WOWSlider.com BODY section --> 
                <div class="slideshow">
                    <ul class="slideshow">
                        <div id="wowslider-container1">
                            <div class="ws_images">
                                <ul>
                                    <li><img style="height: 250px;width: 880px" src="data1/images/nit2.jpg" alt="NIT Jalandhar campus"  id="wows1_0"/></li>
                                    <li><img style="height: 250px;width: 880px" src="data1/images/image2.jpg" alt="NIT Jalandhar campus" id="wows1_1"/></li>
                                    <li><img style="height: 250px;width: 880px" src="data1/images/image3.jpg" alt="NIT Jalandhar campus" id="wows1_2"/></li>
                                </ul></div>
                            <div class="ws_bullets">
                                <div>
                                    <!--<img src="data1/tooltips/image1.jpg"/>
                                    <img src="data1/tooltips/image2.jpg"/>
                                    <img src="data1/tooltips/image3.jpg"/>-->
                                </div>
                            </div>
                            <div class="ws_script" style="position:absolute;left:-99%">
                                <div class="ws_shadow"></div>
                            </div>	
                            <script type="text/javascript" src="../engine1/wowslider.js"></script>
                            <script type="text/javascript" src="../engine1/script.js"></script>
                    </ul>
                </div>
                <!-- End WOWSlider.com BODY section -->              

                <div id="content">
                    <div class="content_item">
                        <div class="form_settings">
                            <h2>Contact Us</h2>
                            <p>Your suggestions are very valuable to us.For any feedback or suggestion, feel free to ping me at my email-id or you can post your comment below. HAPPY VOTING !!</p>
                            <p>&nbsp;</p>
                            <form name="comment">
                                <p><span>Name</span><input class="contact" type="text" name="name" value="<%=session.getAttribute("who_name")%>" /></p>
                                <p><span>Email Address</span><input class="contact" type="text" name="email" value="<%=session.getAttribute("who_mail")%>" /></p>
                                <p><span>Message</span><textarea class="contact textarea" rows="8" cols="50" name="message"></textarea></p>
                                <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="button" onclick="sub()" value="GO" /></p>
                            </form>
                        </div><!--close form_settings-->

                        <span id="mylocation">
                            <%
                                try {
                                    PreparedStatement ps2 = con.prepareStatement("select * from feedback order by sno desc");
                                    ResultSet rs = ps2.executeQuery();

                                    out.print("<br/></br><h2>Comments:</h2>");
                                    while (rs.next()) {
                                        out.print("<div class='box'>");
                                        out.print("<p> Name : " + rs.getString(2) + "</p>");
                                        out.print("<p>" + rs.getString(3) + "</p>");
                                        out.print("<p><strong>By: " + rs.getString(4) + "</strong></p>");
                                        out.print("</div>");
                                    }

                                    con.close();
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>       
                        </span> 

                    </div><!--close content_item-->
                </div><!--close content-->  
            </div><!--close site_content-->  
        </div><!--close main-->

        <% }%>

    </body>
</html>
