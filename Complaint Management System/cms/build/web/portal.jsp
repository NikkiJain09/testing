<%-- 
    Document   : portal
    Created on : Aug 22, 2014, 1:09:28 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Portal</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane.jsp"%>
        <%@include file="connection_db.jsp"%>
    </head>
    <script type="text/javascript">
        
        function check()
        {    
            if(!document.getElementById("b2").value){
            if(!document.getElementById("text1").value.length)
            {
                alert("Please Enter Your User ID");
                return false;
            }
            else 
                if(!document.getElementById("text2").value.length)
                {
                    alert("Please Enter Your Password");
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
   
    </script>
    <body>
        <%
            String message=null;
            String s= request.getQueryString();
            if(s!=null)
            {
                if(s.equals("message=Your%20Session%20has%20expired"))
                    message="Your Session has expired";
            }
        %>
        
        <canvas id="myCanvas" width="400" height="100"></canvas>
        <script>
            var canvas = document.getElementById('myCanvas');
            var context = canvas.getContext('2d');
            var x = 50;
            var y = 65;
            context.font = '20pt Calibri';
            context.fillStyle = 'white';
            context.fillText('User Portal', x, y);
        </script>                      
       
        <form action="user.jsp" method="post" onsubmit="return check();"> 
            
            <table border=9  width = "1" cellspacing = "3" cellpadding = "4">
            <tbody>
                <tr>
                    <th><h3>User ID</h3></th>
                    <th><input type="text" name="uname" id="text1" /></br></br></th>
                </tr>
                <tr>
                    <th><h3>Password </h3></th> 
                    <th><input type="password" name="upass" id="text2" /></br></br></th>
                </tr>                
            </tbody>
           </table>
            </br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="Login" name="button1"/>
        
        </form></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="New User/Register" formaction="register.jsp" id="b2"/>
    
    </body>
</html>
