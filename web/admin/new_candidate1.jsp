<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>ADMIN</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="button.css">
        <script>
            var request;
            function enterInfo() {
                var e = document.getElementById("election");
                var ele = e.options[e.selectedIndex].text;
                ele = ele.replace(/\s/g,'');  
                var name= document.add.name.value;
                var dez = document.add.designation.value;
                var des = document.add.description.value;
                var contact = document.add.contact.value;
                var motto = document.add.motto.value;

                var url = "new_candidate.jsp?x=" +ele +"&y="+name+"&z="+dez+"&w="+des+"&h="+contact+"&q="+motto;
                
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
         <%@ include file="../user/getcon_ladmin.jsp"%>

      <%  
           try{  
                         String a1="select ename from elections ";
                         Statement k1=con.createStatement();
                         ResultSet m1=k1.executeQuery(a1);  
                         
      %>                   
        <form name="add">
            <table style="padding:20px;padding-bottom: 10px;">

            <tr>    
                <td style="width:100px">  <label class="mylabel">Election</label> </td>
                <td style="width:600px">
                    <select id="election" style="width:200px">
                        
            <%
                   while(m1.next()){    %>    
                   <option value="<%=m1.getString("ename")%>"><%=m1.getString("ename")%></option>
                   <%
                    }
                 }
                 catch(Exception e)
                 {
                 e.printStackTrace();
                 }
            %>        
                    </select>
                </td>  
            </tr>
            <tr>
                <td style="width:100px"><label class="mylabel">Name</label></td>
                <td><input type="text" name="name" style="height:30px;width:330px"></td>
            </tr>
            <tr>
                <td><label class="mylabel">Designation</label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add designation" name="designation"></textarea></td>
            </tr>
            <tr>
                <td><label class="mylabel">Description</label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add description" name="description"></textarea></td>
            </tr>
            <tr>
                <td><label class="mylabel">Contact</label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add contact" name="contact"></textarea></td>
            </tr>
            <tr>
                <td><label class="mylabel">Motto</label></td>
                <td><textarea cols="50" rows="8"  placeholder="Add motto" name="motto"></textarea></td>
            </tr>
             <tr>
                  <td colspan=2 style="padding-left:300px;padding-top: 10px"><input type="button" value="ENTER" onclick="enterInfo()"></td>
                </tr>
            </table>
        </form>
        
        
    <div style="padding-left: 100px;font-size: 20px;"> Status  : <span id="info" style="padding-left: 20px">none</span>  </div>
  
        
    </body>
</html>