<%-- 
    Document   : admin_home
    Created on : 17 Aug, 2014, 9:36:28 AM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cache_admin.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Admin Home</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>
        
        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main1">    
                
                <h3>CMS Features for Admin</h3>
                        
                <ul>
                    <li><a href="view_complaint_home.jsp">View all Complaints</a><br><br></li>
                    <li> <a href="view_resolved.jsp">View Resolved Complaints</a><br><br></li>
                    <li><a href="admin_delete_complaints.jsp">Delete Complaints</a><br><br></li>
                    <li><a href="view_admin_complaints.jsp">View Complaints Registered to Admin Portal</a><br><br></li>
            <!--<a href="delete_a_cr.jsp">Delete a Complaint Resolver</a><br><br>-->
            <li><a href="admin_single_view.jsp">View a Specific Complaint</a><br><br></li>
            <li><a href="recurrent.jsp">Recurrent Complaints</a><br><br></li>
            <li><a href="fast_resolved.jsp">Complaint Resolved Fast</a><br><br></li>
                    
                    
                </ul>
</div>
                
                
              <div id="leftmenu_bottom"></div>
        </div>
        
    </body>
</html>