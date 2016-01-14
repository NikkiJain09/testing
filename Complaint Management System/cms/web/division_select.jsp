<%-- 
    Document   : Select
    Created on : 18 Aug, 2014, 6:10:13 PM
    Author     : Ammu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cache_admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form action ="Division_Section.jsp" method="POST">
        <select name="DC">
            <option value="Electrical_Dept">Electrical Department</option>
            <option value="Water_Dept">Water Department</option>
            <option value="Civil_Dept">Civil Department</option>
            </select>
        </br>
        <input type="submit" value="Submit">
        </form>
    </body>
</html>
