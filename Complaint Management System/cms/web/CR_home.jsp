<%-- 
    Document   : CR_home
    Created on : Aug 22, 2014, 12:26:38 AM
    Author     : nishtha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cache_CR.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>CR Home</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>

        <div id="leftmenu">

        <div id="leftmenu_top"></div>

	    <div id="leftmenu_main1">
                <h3>CMS Features for Complaint Resolver</h3>
                <table border=5  width = "1" cellspacing = "2" cellpadding = "3">
                    <tbody>
                        <tr><a href="CR_view_complaint.jsp">View all Complaints</a></tr>
                        <tr><a href="CR_take_complaint.jsp">Take on Complaints</a></tr>
                        <tr><a href="CR_update_status.jsp">Update status of Complaints</a></tr>
                    </tbody>
                </table>
            </div>
        
            <div id="leftmenu_bottom"></div>
        </div>

    </body>
