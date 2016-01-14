<%-- 
    Document   : lodge
    Created on : Aug 23, 2014, 12:50:33 AM
    Author     : abc
--%>
<%@page contentType="text/html" import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lodge Complaints</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <%@include file="cache_user.jsp"%>
        <%@include file="connection_db.jsp"%>
    </head>
    <body>
        
        <form action="features.jsp">
        <input type="hidden" name="hu" value="<%=s1_u%>">
        <%--what to do with C_id --%>
        <table border = "2" width = "1" cellspacing = "1" cellpadding = "2">
            <tr>
                <th>Complaint Description</br></th>
                <th><input type="textarea" name="cd"  id="text1"></th>
            </tr>
            <tr>
                <th>Location</th>
                <th><input type="text" name="location"  id="text2"></th>
            </tr>
            <tr>
                <th>Near By Location</th>
                <th>
                    <select id="text3" name="near">
                        <option value="Kasturba Bhawan">Kasturba Bhawan</option>
                        <option value="Sarojni Bhawan">Sarojni Bhawan</option>
                        <option value="Cautely Bhawan">Cautely Bhawan</option>
                        <option value="Govind Bhawan">Govind Bhawan</option>
                        <option value="Jawahar Bhawan">Jawahar Bhawan</option>
                        <option value="Sports complex">Sports complex</option>
                        <option value="Student's Club">Student's Club</option>
                        <option value="Central Library">Central Library</option>
                    </select>
                </th>
            </tr>
            <tr>
                <th>Complaint Category</th>
                <th>
                    <select id="text4" name="category">
                        <option value="Water Leakage">Water Leakage</option>
                        <option value="Water Impure">Water Impure</option>
                        <option value="Road Damage">Road Damage</option>
                        <option value="Bee hive">Bee hive</option>
                        <option value="Tube light related">Tube light related</option>
                        <option value="Leakage in Washroom Tap">Leakage in Washroom Tap</option>
                    </select>
                </th>
            </tr>
            <tr>
                <th>Complaint Division</th>
                <th>
                    <select id="text5" name="division">
                        <option value="W">Water</option>
                        <option value="E">Electricity</option>
                        <option value="C">Civil</option>
                        
                    </select>
                </th>
            </tr>
        </table>
        
        
        
        <br><br><br><br><br>
        <input type="submit" name="Lodge" value="Lodge Complaint" id="t1" />
        <input type="button" value ="Back" name ="Back" onclick="history.back();">   
        </form>
    </body>
</html>
