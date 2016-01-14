<%-- 
    Document   : admin_home
    Created on : 17 Aug, 2014, 9:36:28 AM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@taglib uri="/tlds/struts-html" prefix="struts-html" %>--%>
<!DOCTYPE html>
<%--<%@include file="cache_admin.jsp" %>--%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Complaints Home</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
<%@include file="connection_db.jsp"%>
<%@include file="cache_admin.jsp"%>
    
        <br>
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <table border=5  width = "1" cellspacing = "2" cellpadding = "3">
            <tbody>
                <tr>
                    <h3><a href="view_all_complaint.jsp">View All Complaints registered in the database</a></h3>
                </tr>
                <tr>
                    <h3><a href="view_student.jsp">View All Student Complaints</a></h3>
                </tr>
                <tr>
                    <h3><a href="view_employee.jsp">View All Employee Complaints</a></h3>
                </tr>
                <tr>
                <h3><a href="location_select.jsp">View Complaints Location wise</a></h3>
                </tr>
            </tbody>
        </table>
            <input type="button" value ="Back" name ="Back" onclick="history.back();">
    </body>
</html>

