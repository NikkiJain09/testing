<%-- 
    Document   : CR_take_complaint
    Created on : Aug 22, 2014, 1:26:46 AM
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
        <title>Take Complaints</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>

        <div id="leftmenu">

        <div id="leftmenu_top"></div>

				<div id="leftmenu_main1">

                                    <%
                                    String msg=(String) session.getAttribute("ass_msg");
                                    if(msg!=null)
                                        out.println("<h3>"+msg+"</h3>");
                                    int flag=0;
                                    String id=(String) session.getAttribute("CR_sess_attr") ;
                                    char a=id.charAt(0);
                                    rs=st.executeQuery("select C_id,Complaint_description from Complaint where C_id like '_"+a+"%' and assigned_id is null and resolved=0");%>
                                    
                                  <%  while(rs.next())

                                  {
                                      if(flag==0)
                                          {
                                          %>
                                          <table border="1" align="center" width="80%">
                <tr>
                    <th><h3>Complaint ID</h3></th>
                    <th><h3>Complaint Description</h3></th>
                </tr>
                <%}
                                      flag=1;
               out.println("<tr>");
               out.println("<td><h3><a href=CR_choose_complaint.jsp?value="+rs.getString(1)+">"+rs.getString(1)+"</a></h3></td>");
               out.println("<td><h3>"+rs.getString(2)+"</h3></td>");
               out.println("</tr>");
               }

                                    if(flag==0)
                                        {
                                        out.println("<h3>No unassigned complaints.</h3>");
                                        }
            %>

            </table>
<input type="button" value ="Back" name ="Back" onclick="history.back();" id="button">

</div>


              <div id="leftmenu_bottom"></div>
        </div>

    </body>
