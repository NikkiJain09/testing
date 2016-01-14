<%-- 
    Document   : recurrent
    Created on : 17 Aug, 2014, 9:22:06 PM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="connection_db.jsp" %>
<%@include file="cache_admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Recurrent Complaints</title>
    </head>
    <script type="text/javascript">
        function valid(){
           
            var ch=document.getElementsByTagName("input");
           
            var c=0;
            for(var i=0;i<ch.length;i++){
                if(ch[i].checked===true && ch[i].type==="radio"){
                    c=1;
                    
                    return true;
                }
            }
            if(!c){
                alert("Please check atleast one radio");
                return false;
            }
        }
    </script>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <br><br><br><br><br>
        <h3>Recurrent Complaints can be searched by <br><br>
        <form action="recurrent1.jsp" method="post" onsubmit="return valid();">
            <input type="radio" value="l" name="l">Display by Location<br><br>
            <input type="radio" value="c" name="l">Display by Complaint Category<br><br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" value="d" name="l">Display by Department<br><br>
        <input type="submit" name="submit" id="submit"><br>
        </h3>
        </form>
    </body>
</html>
