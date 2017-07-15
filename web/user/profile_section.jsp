<%-- 
    Document   : profile_section
    Created on : 20-Dec-2016, 18:55:05
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <%
        if (session.getAttribute("who") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ include file="getcon_ladmin.jsp"%>
        
       <div style="border-left:1px solid white;height: 550px;width:600px;padding-left: 1px">
            <div style="border-left:1px solid white;height: 550px;width:600px;">
       <div>   
            <div style="border:1px solid white;background-image:url(../login/images/pic7.jpg);height:100px;width:100px;margin:15px;float:left">  </div> 
            <div style="float:left;width:400px;height:100px;margin:15px">
            <div style="width:350px;height:30px;margin:5px">
        <%
         String a=(String)request.getParameter("candidate");
         String b=(String)request.getParameter("election");
         String can="";
         String des="";
         String dez="";
         String motto="";
         String cont="";
                              
           try{
             String query="SELECT candidate,description,designation,contact,motto FROM "+b;
             Statement k=con.createStatement();
             ResultSet m=k.executeQuery(query);
             
             while(m.next())
             {
               String temp=(String)m.getString("candidate");
               temp = temp.replaceAll("\\s","");
               if(temp.equals(a)){
              
               can=(String)m.getString("candidate");
               des=(String)m.getString("description");
               dez=(String)m.getString("designation");
               cont=(String)m.getString("contact");
               motto=(String)m.getString("motto");
               
             }
             }
             
           }
           
           catch(Exception e)
           {
               e.printStackTrace();
           }     
        %>  
        <label class="mylabel" style="font-size: 25px;color: white;padding-left: 9px"><%=can%></label>
        <div style="width:350px;height:60px;margin:5px">
            
           <label style="font-size:15px ;padding-left:2px;color:white "><%=dez%></label>
  
        </div>
        
            </div>
            </div>
       </div>
           <br>
       <br>
       <div style="margin-top: 130px;margin-left:10px;height:20px;font-size: 17px;color:white"><u> ABOUT</u> </div>   
           <div style="word-wrap: break-word;width: 550px;height:150px;font-size: 15px;padding: 5px;color:white;margin:10px">  <%=des%>    </div>
           
           <div style="margin-left:10px;width: 550px;height:20px;font-size: 17px;color:white"> <u>CONTACT</u> </div>   
           <div style="word-wrap: break-word;width: 550px;height:30px;font-size: 15px;padding: 5px;color:white;margin:10px">  <%=cont%>    </div>

           
           <div style="margin-left:10px;width: 550px;height:20px;font-size: 17px;color:white"> <u>MOTTO</u> </div>   
           <div style="word-wrap: break-word;width: 550px;height:50px;font-size: 15px;padding: 5px;color:white;margin:10px">  <%=motto%>    </div>

            
          </div>  
        </div> 
    </body>
    <% } %>
</html>
