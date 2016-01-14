<%-- 
    Document   : fast_resolved
    Created on : 18 Aug, 2014, 11:05:06 AM
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
        <title>COMPALINTS RESOLVED FAST</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
         <form action="admin_home.jsp" method="post">
             <%
             int r=0;
             String q="select * from Complaint where resolved =1";
             rs=st.executeQuery(q);
             while(rs.next()){
                 r=1;
                 java.sql.Date rd=rs.getDate(11);
                 java.sql.Date bd=rs.getDate(8);
                 long diff=rd.getTime()-bd.getTime();
                int diffdays=(int)(diff/(24*60*60*1000));%>
                <br><br><br><br><h1>  TABLE DISPLAYING COMPLAINTS RESOLVED FAST</h1><br><br>
     <table border="2">
         <tr><td>COMPLAINT ID</td>
             
             <td>DAYS</td></tr>
         <tr>
             <td><a href="display_single_complaint.jsp?value=<%=rs.getString(1)%>"><% 
             out.println(rs.getString(1));%></a></td>
             
             <td><%out.println(diffdays);%></td>
         </tr>
     </table>
             <%
                     }
             %>
             
             <br><br><br><br>
        <input type="button" value ="Back" name ="Back" onclick="history.back();" id="button"><br><br>
        <input type ="submit" value="Ok" id="submit">
        </form>
    </body>
</html>
