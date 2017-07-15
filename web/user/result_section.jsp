<%-- 
    Document   : vote_Section2
    Created on : 22-Dec-2016, 09:50:03
    Author     : gupta's
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voters Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="../admin/button.css" />
        <script src="js/jquery-1.6.3.min.js"></script>
        <script src="js/highcharts.js"></script>
        <script src="js/exporting.js"></script>
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
                    <li><a href="index.jsp">Home</a></li>
                    <li class="current"><a  href="voters_corner.jsp">Voters Corner</a></li>
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

                
                <%
                    // to draw the bar chart
                    ArrayList<String> cand = new ArrayList<String>();
                    ArrayList<Integer> votes = new ArrayList<Integer>();

                    try {

                        String h = request.getParameter("elec");
                        String h1 = h.replaceAll("\\s", "");
                        Statement k1 = con.createStatement();
                        String query1 = "select res_declared from elections where ename='" + h + "'";
                        ResultSet m1 = k1.executeQuery(query1);

                        while (m1.next()) {

                            if (m1.getString("res_declared").equals("NO")) {
                %>
                <div style="text-align: center;padding:20px;border-radius: 25px;width: 600px;height: 130px; margin: 200px auto;border:2px solid white;margin-left: 400px"> 
                    <label class=mylabel style="color: white">Results will be displayed after election is over.</label> <br><br>
                    <a  style="color:grey;font-size: 20px" href="voters_corner.jsp">Back to Voters Corner</a>         
                </div>    
                <%
                } else {
                    Statement k = con.createStatement();
                    String query = "select candidate,votes from " + h1;
                    ResultSet m = k.executeQuery(query);

                    while (m.next()) {
                        cand.add(m.getString("candidate"));
                        String a = (String) m.getString("votes");
                        votes.add(Integer.parseInt(a));

                    }
                %>
                <div id="content" style="color:black;height:580px">
                    <div id="container" style="padding: 100px;height: 400px;"></div>
                </div>
                <script>
                            $(function () {

                            var chart = new Highcharts.Chart({
                            subtitle: {
                            text: '<b>Results</b>'
                            },
                                    title: {

                                    text: '<b><%=request.getParameter("elec")%></b>'

                                    },
                                    chart: {
                                    renderTo: 'container',
                                            type: 'column'
                                    },
                                    xAxis: {
                                    categories:[<% for (String number : cand) {
                    %> '<%=number%>',
                    <%}%>   ]
                                    },
                                    exporting: { enabled: false },
                                    yAxis: {
                                    title: {
                                    enabled: true,
                                            text: '<font size=10><b>Votes</b><font>',
                                            style: {
                                            fontSize:'25px',
                                                    fontWeight: 'normal'
                                            }
                                    }
                                    },
                                    plotOptions: {
                                    series: {
                                    cursor: 'pointer',
                                            point: {
                                            events: {
                                            click: function () {
                                            for (var i = 0; i < this.series.data.length; i++) {
                                            this.series.data[i].update({color: '#ECB631'}, true, false);
                                            }
                                            this.update({color: '#f00'}, true, false)
                                            }
                                            }
                                            }
                                    }
                                    },
                                    series: [{
                                    data: [<% for (Integer number : votes) {
                    %> <%=number%>,
                    <%}%>   ]
                                    }]
                            });
                            });
                </script><%
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();

                    }
                %>




            </div><!--close site_content--> 
        </div><!--close main-->

    </body>
    <%}%>
</html>
