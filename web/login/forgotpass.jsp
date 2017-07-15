<%-- 
    Document   : new_admin
    Created on : 16-Dec-2016, 21:34:50
    Author     : gupta's
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../admin/button.css" /> 
        <link rel="stylesheet" href="css/style.css">

        <title>Forgot Page</title>
    </head>
    <body>
        <div style="background-color: rgba(255,255,255,0.8);display: inline-block;text-align: center;padding:20px;border-radius: 25px; position: fixed;  top: 0; bottom: 30px; left: 0;right: 0;width: 600px;height: 170px; margin: auto;border:2px solid black">
        <form>
            <label class=mylabel style="font-size:30px">Enter email :</label> <input style="width:400px;height:20px;font-size: 15px" type="text" name="mail" value=""><br><br>
            <input class="submitbutton" type="submit" value="submit" name="sub">     
        </form>
        
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ page import="java.util.*,javax.mail.*"%>
        <%@ page import="javax.mail.internet.*" %>
        <%@ page import="javax.activation.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>

        <%
            if (request.getParameter("sub") != null) {
                String a = request.getParameter("mail");
                Statement k = con.createStatement();
                String query = "select username,password from student where email='" + a + "'";
                ResultSet m = k.executeQuery(query);

                if (!m.isBeforeFirst()) {   // no such email is registered
        %>
        <script>
            alert("invalid email id");
        </script>
        <%
        } else {
            String u = "";
            String t = "";
            while (m.next()) {
                u = (String) m.getString("username");
                t = (String) m.getString("password");
            }

            final String to = request.getParameter("mail");
            final String subject = "Forgot password";

           // final String messg
            String result;

           // Sender's email ID and password needs to be mentioned
            final String from = "-----";

            final String pass = "-----";
            // Defining the gmail host

            String host = "smtp.gmail.com";

            // Creating Properties object
            Properties props = new Properties();

            // Defining properties
            props.put("mail.smtp.host", host);

            props.put("mail.transport.protocol", "smtp");

            props.put("mail.smtp.auth", "true");

            props.put("mail.smtp.starttls.enable", "true");

            props.put("mail.user", from);

            props.put("mail.password", pass);

            props.put("mail.port", "465");

            // Authorized the Session object.
            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

                @Override

                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication(from, pass);

                }

            });
            try {
                MimeMessage message = new MimeMessage(mailSession);

              // Set From: header field of the header.
                message.setFrom(new InternetAddress(from));

             // Set To: header field of the header.
                message.addRecipient(Message.RecipientType.TO,
                        new InternetAddress(to));

             // Set Subject: header field
                message.setSubject(subject);

             // Now set the actual message
             //   message.setText(messg);
                
                StringBuilder s=new StringBuilder();
                  s.append("<div>")
                 .append("  Dear User<br/><br/>")
                 .append("  As per your request,<br/>")
                 .append("  Your username : "+u+"<br/>")
                 .append("  Your password : "+t+"<br/>")                          
                 .append("  <br/><br/>")
                 .append("  Thanks,<br/>")
                 .append("  E-Voting admin")
                 .append("</div>");
                        
                  message.setContent(s.toString(), "text/html; charset=utf-8");


             // Send message
                Transport.send(message);
                result = "\n\n\n\nEmail is sent to our email id.Please check and return to <a href = index.jsp >login</a> again";
            } catch (MessagingException mex) {

                mex.printStackTrace();

                result = "Error: unable to send mail....Try again";

            }

        %>
        <br>
        <label style="padding-top:90px;font-size: 20px; color:red"><% out.println(result);%></label>
                <br><br> 
                <%
                        }
                    }
                %>         
                </div>
                </body>
                </html>
