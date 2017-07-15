<%-- 
    Document   : upload_photo
    Created on : 29-Dec-2016, 22:07:38
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Page</title>
        <script>
            var request;
            function enterCan() {
                var value = document.enter_election_form.election.value;
                var url = "upload2.jsp?x=" + value;
         
                
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
                            document.getElementById('info1').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }
            
            function enterCand() {
                var value = document.enter_candidate_form.candidate.value;
                var url = "upload3.jsp?x=" + value;
         
                
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
                            document.getElementById('info2').innerHTML = val;
                        }
                    }//end of function  
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }
            
        </script>  
    </head>
    <body>
        
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
        <%@ page import="javax.servlet.http.*" %>
        <%@ include file="../user/getcon_ladmin.jsp"%>

        <form name="enter_election_form">
            <br><br>
         <label class="mylabel" style="margin-top:50px">Election :</label>
           <select id="election" style="width:200px">
                        
            <%
          
               try{  
                        // Class.forName("com.mysql.jdbc.Driver");
                        // Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ladmin","root","");
                         String a1="select ename from elections ";
                         Statement k1=con.createStatement();
                         ResultSet m1=k1.executeQuery(a1);  
                         
              
                   while(m1.next()){    %>    
                   <option value="<%=m1.getString("ename")%>"><%=m1.getString("ename")%></option>
                   <%
                    }
                   %><script>enterCan();</script><%  
                 }
                 catch(Exception e)
                 {
                 e.printStackTrace();
                 }
            %>        
            </select>
            <input style="margin-left:50px"   type="button" value="Enter" onclick="enterCan()">
        </form>
        <br><br> 
        
        <div id="info1"> </div>
        
        <div id="info2"> </div>
    </body>
</html>
