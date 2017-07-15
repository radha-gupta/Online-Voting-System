<%-- 
    Document   : authenticate2
    Created on : 21-Dec-2016, 19:24:07
    Author     : gupta's
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authenticate Page</title>
        <script>
        function a(t){
              document.getElementById('f').innerHTML=t;
            }
        
        function verify(){
            var request;
                var roll = document.getElementById('f').innerHTML;
                var elec = document.getElementById('e').innerHTML;
                var url = "authenticate3.jsp?x=" + elec+"&y="+roll;
         
                
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
                            document.getElementById('info').innerHTML = val;
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
        <%@ include file="../user/getcon_auth.jsp"%>
        
         <div style="margin: 20px">

         <table border="3" color="red" cellpadding="3">
            <tr><th>username  </th>
                <th>rollno  </th>
                <th>branch</th>
                <th>email</th>
                <th>is_eligible</th>
                <th>is_voted</th>
            </tr>
        
        
        <%
            try{
             String h=request.getParameter("v"); //getting the election name
            %>
            <div id="e"><%
            out.println(h); 
            %>
            </div>
             
            
    <%
             Statement k=con1.createStatement();
             String query="select * from "+h;
             ResultSet m=k.executeQuery(query);
             %>
                 
             <%    
             while(m.next())
             {
                String f=m.getString("rollno");
                %>
               <tr> <td><%=m.getString("username") %> </td>
                <td> <%=m.getString("rollno") %> </td>
                <td> <%=m.getString("branch") %> </td>
                <td> <%=m.getString("email") %> </td>
                <td> <%=m.getString("is_eligible") %> </td> 
                <td> <%=m.getString("is_voted") %> </td>  
                <td><button id="<%=m.getString("rollno")%>" onclick="a(this.id)">select</button></td>
               </tr> 
               <% 
                 
             }  %>
             
             </table> 
             <br>
             <br>
             roll no :
             <div id="f">no selection yet</div><br><br>
             
             <form name="auth">
              <input type="button" value="proceed to authenticate" onclick="verify()">
             </form>  
             
     <div style="padding-left: 30px;font-size: 15px;"> Status  : <span id="info" style="padding-left: 20px">none</span>  </div>

        <%
       }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        %>
  
            </div>
        
        
    </body>
</html>
