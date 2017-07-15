<html>
    <head>
        <title>Admin Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="button.css">
        
        <script src="http://code.jquery.com/jquery-1.4.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#new_admin").click(function () {
                    $('#tar1').load('new_admin.html');
                    //alert("Thanks for visiting!");
                });
                $("#new_election").click(function () {
                    $('#tar1').load('new_election.html');
                    //alert("Thanks for visiting!");
                });
                $("#add_candidate").click(function () {
                    $('#tar1').load('new_candidate1.jsp');
                    //alert("Thanks for visiting!");
                });
                $("#add_photo").click(function () {
                    $('#tar1').load('under_construction.jsp');
                    //alert("Thanks for visiting!");
                });
                $("#search").click(function () {
                    $('#tar1').load('search.html');
                    //alert("Thanks for visiting!");
                });
                $("#authenticate").click(function () {
                    $('#tar1').load('authenticate.jsp');
                    //alert("Thanks for visiting!");
                });
                $('a').click(function () {
                    $('#').load($(this).attr('href'));
                    return false;
                });
            });
        </script>
    </head>
    <%
        if (session.getAttribute("who_admin") == null) {
            response.sendRedirect("../login/index.jsp");
        } else {%>
    <body>
        <div style="width:100%;height:10%;background-color:black;text-align: center;color: #FFFFFF;margin: auto;padding-top: 10px "> 
            <h1 color="#000000"> Welcome : <%=session.getAttribute("who_admin")%> </h1>
            
        </div>
        <div style=" float:left; width:20%; height:210%; border-right: 5px solid black;"> 
            <br>
            <br>
            <button class="myButton"> <a id="new_admin"     href="#" style="color:white">  Add new admin</a></button><br><br>
            <button class="myButton"> <a id="new_election"  href="#" style="color:white">  Add new election</a></button><br><br>
            <button class="myButton"> <a id="add_candidate" href="#" style="color:white">  Add candidates</a></button><br><br>
            <button class="myButton"> <a id="add_photo"     href="#" style="color:white">  upload photo</a></button><br><br>
            <button class="myButton"> <a id="search"        href="#" style="color:white">  Search </a></button><br><br>
            <button class="myButton"> <a id="authenticate"  href="#" style="color:white">  Authenticate </a></button><br><br>
            <button class="myButton"> <a href="log.jsp" style="color:white">  Log Out </a></button><br><br>
        </div>
        <div style=" float:left; width:75%; height:90%;" id="tar1">            
        </div>
    </body>
    <%}%>
</html>
