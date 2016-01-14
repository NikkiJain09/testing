<%-- 
    Document   : profile_preview
    Created on : Aug 22, 2014, 11:52:55 PM
    Author     : abc
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="connection_db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile View</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <%@include file="cache_user.jsp"%>
    </head>
    <body>
        
        <% 
            
            String q="select * from user where User_id="+s1_u+"";
            rs=st.executeQuery(q);
            if(rs.next())
            {
                
        %>
        
                <table  border = "2" width = "1" cellspacing = "1" cellpadding = "2" bgcolor="#0066FF"> 
                        <thead>
                            <tr> 
                                <th>User ID </th> 
                                <th>Name </th> 
                                <th>Address </th>
                                <th>Contact Number </th>
                                <th>Email ID </th>
                                <th>Type </th>
                                <th>Validity </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr> 
                                <th><%=rs.getString(1)%> </th> 
                                <th><%=rs.getString(3)%> </th> 
                                <th><%=rs.getString(4)%> </th>
                                <th><%=rs.getString(5)%> </th>
                                <th><%=rs.getString(6)%> </th>
                                <th><%
                                    if(rs.getString(7).equals('s'))
                                        out.print("Student");
                                    else
                                        out.print("Employee");
                                    %></th>
                                <th><%out.print(rs.getString(8)); %></th>
                            </tr>
                        
                        </tbody>
                </table>
            <%
            }
            %>
            <input type="button" value ="Back" name ="Back" onclick="history.back();">            
    </body>
</html>
