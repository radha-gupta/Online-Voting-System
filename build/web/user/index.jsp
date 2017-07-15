<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<!-- front page of the site -->
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

    <head>
        <title>Home</title>
        <meta name="description" content="free website template" />
        <meta name="keywords" content="enter your keywords here" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=9" />
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        
        <!--image slider script -->
        <script type="text/javascript" src="js/image_slide.js"></script>


        <!-- Start WOWSlider.com HEAD section -->
        <link rel="stylesheet" type="text/css" href="../engine1/style.css" />
        <script type="text/javascript" src="../engine1/jquery.js"></script>
        <!-- End WOWSlider.com HEAD section -->

    </head>
    <%
        if (session.getAttribute("who")== null) {  // id user logs out from the site ,then he will be directed to login page
            response.sendRedirect("../login/index.jsp");
        } else {
    %>
    <body>
        <div id="main" style="padding-bottom: 30px">
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
                    <li class="current"><a href="index.jsp">Home</a></li>
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
                            <p>Phone:+91 86990-72590</p>
                            <p>Email :  rguptaa25@gmail.com</p>
                        </div><!--close sidebar_item--> 
                    </div><!--close sidebar-->
                </div><!--close sidebar_container-->	

                <!-- Start WOWSlider.com BODY section -->                
                <div class="slideshow" style="margin-left: 100px">
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
                        <h1>E - VOTING</h1> 
                        <p>Electronic voting also known as e-voting has include on its technology optical scanning vote systems, punched cards and voting kiosks which includes transmission of ballots and votes via Telephone, Internet or Private computer networks.Within the group of Internet voting system users, four core countries have been using Internet voting over the course of several elections: Canada, Estonia, France and Switzerland. Estonia is the only country to offer Internet voting to the entire electorate.</p>	  


                        <p>In automated elections people can trust the results as it allows for a process that is so auditable, transparent and secure. </p>
                        <p>This website is specicially designed to automate the voting procedure in colleges,offices or departments so that the people do not require to present physically to cast their vote.</p>
                        <br style="clear:both"/>

                        <div class="content_container">
                            <p style="text-align: right;font-size: 20px">YOUR VOTE ...</p>

                        </div><!--close content_container-->
                        <div class="content_container">
                            <p style="text-align: left;font-size: 20px">... YOUR RIGHT</p>          

                        </div><!--close content_container-->			  
                    </div><!--close content_item-->
                </div><!--close content-->   
            </div><!--close site_content--> 
        </div><!--close main-->
    </body>
    <%
        }
    %>   
</html>
