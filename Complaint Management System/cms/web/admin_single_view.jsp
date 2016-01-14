<%-- 
    Document   : admin_single_view
    Created on : 17 Aug, 2014, 1:43:37 PM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cache_admin.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Single Complaint viewed by Admin</title>
    </head>
    <script type="text/javascript">
        function valid(){
            //alert("Hello");
            if(!document.getElementById("iid").value.length){
                alert("Please enter a Complaint ID");
                return false;
            }
            else{
                return true;
            }
        }
    </script>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <form action="display_single_complaint.jsp" method="post" onsubmit="return valid();">
            <br><br><br><br><br>
        <h1>Hello <%=s%></h1> 
        <br><br>
        <h3> Enter the Complaint ID You want to Monitor     <input type="text" name="iid" id="iid">     <br>
        <input type="submit" name="submit" >
        </form>
    </body>
</html>
