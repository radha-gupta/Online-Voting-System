<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
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
        <script type="text/javascript" src="js/image_slide.js"></script>
    </head>
    <%
        if (session.getAttribute("who") == null) {
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
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="voters_corner.jsp">Voters Corner</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li  class="current"><a href="about_section.jsp">About Us</a></li>
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

                <div id="content">

                    <div>    
                        <div style="margin:40px;float:left;border-radius: 75px;height:150px;width:150px;border:2px solid white;background-image:url(images/my_pic2.jpg);background-repeat: no-repeat"></div>     
                        <div style="margin-top:70px;float:left;width:600px;height:150px;margin-left: 30px">    
                            <label class="mylabel" style="font-size: 25px;color: white;">Radhika Gupta</label>
                            <div style="width:700px;height:60px;margin-top: 5px">
                                <label style="font-size:15px ;color:white "><br>Currently  studying  B.Tech  (3rd year) <br>NIT Jalandhar</label>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                        <br>   
                    
                            <div style="margin-left: 60px;margin-top: 200px;height:20px;width:800px;font-size: 15px;color:white">
                              
                                <i>Heyy guys...<br><br>thanks a lot for encouraging me in my endeavour to create a secure,user-friendly and virtual medium to help you
                              cast your votes in various elections going on in the various institutions/firms/offices etc.The site has been specifically
                              designed to make the election process easier and hassle-free for the voters.
                              <br><br>
                                  
                              This online voting system is one of my most ambitious project and with your continuous support and feedbacks ,I aim to make
                              this one of the best systems out there.<br>My sincere gratitude to all those  who have helped me in completing this project. 
                              For any suggestion or query , just drop a message here or ping me personally.                             
                              </i>  
                             </div>   



                </div><!--close content-->      
            </div><!--close site_content--> 
        </div><!--close main-->
    </body>
    <%
        }
    %>   
</html>
