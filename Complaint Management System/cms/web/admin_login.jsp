<%-- 
    Document   : home
    Created on : 13 Aug, 2014, 12:07:58 PM
    Author     : prachi
--%>
<%@page  import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Admin login</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane.jsp"%>
        
    </head>    
    <script type="text/javascript">
        //function pop(){
            //alert("hello");
          //  if(document.getElementById("m").value!== null){
            //    alert("Your session is expired so you are redirected to the login page");
            //}
        //}
        
        function valid(){
            //alert("Hello");
            if(!document.getElementById("textfield").value.length){
                alert("Please enter a Admin ID");
                return false;
            }
            else if(!document.getElementById("textfield2").value.length){
                alert("Please enter your password");
                return false;
            }
            else{
                return true;
            }
        }
   
        
        </script>
    <body onload="pop();">
        
        
        <form action="admin_login_db_check.jsp" id="bck1" method="post" onsubmit="return valid();">
            
            </br></br></br></br></br>        
            
        <%
            String message=null;
            String s= request.getQueryString();
            if(s!=null)
            {
                if(s.equals("message=Your%20Session%20has%20expired")){
                    message="Your Session has expired";
                    
        %>
            <input type="hidden" name="message" value=<%=message %> id="m"> 
        <%
                 }}
        %>    
            
    <canvas id="myCanvas" width="800" height="100"></canvas>
        <script>
            var canvas = document.getElementById('myCanvas');
            var context = canvas.getContext('2d');
            var x = canvas.width / 2;
            var y = canvas.height / 2;

            context.font = '20pt Calibri';
        
            context.fillStyle = 'white';
            context.fillText('ADMIN LOGIN', x, y);
        </script>
    
        <table border=9  width = "1" cellspacing = "3" cellpadding = "4">
            <tbody>
                <tr>
                    <th><h3>Username</h3></th>
                    <th><input type="text" name="uid" id="textfield" /></br></br></th>
                </tr>
                <tr>
                    <th><h3>Password </h3></th> 
                    <th><input type="password" name="upass" id="textfield2" /></br></br></th>
                </tr>                
            </tbody>
        </table>
         
        </br></br><input type="submit" name="submit" id="button" value="LOGIN" onclick="validation();"/></br></br>
        

             
</form>   
    </body>
</html>
