<%-- 
    Document   : CR_view_complaint
    Created on : Aug 22, 2014, 1:26:05 AM
    Author     : nishtha
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="cache_CR.jsp" %>
<%@include file="connection_db.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Complaints</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>

        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main1">

                                    <% String id=(String) session.getAttribute("CR_sess_attr");
                                    char a=id.charAt(0);
                                    rs=st.executeQuery("select C_id,Complaint_description from Complaint where C_id like '_"+a+"%'");%>
                                    <table border="1" align="center" width="80%">
                <tr>
                    <th><h3>Complaint ID</h3></th>
                    <th><h3>Complaint Description</h3></th>
                </tr>
                                  <%  while(rs.next())

                                  {
               out.println("<tr>");
               out.println("<td><h3><a href=display_single_complaint1.jsp?value="+rs.getString(1)+">"+rs.getString(1)+"</a></h3></td>");
               out.println("<td><h3>"+rs.getString(2)+"</h3></td>");
               out.println("</tr>");
               }
            %>

            </table>
           
       <input type="button" value ="Back" name ="Back" onclick="history.back();" id="button">
                                        
</div>


              <div id="leftmenu_bottom"></div>
        </div>

    </body>
