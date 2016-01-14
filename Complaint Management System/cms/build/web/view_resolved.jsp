<%-- 
    Document   : view_resolved
    Created on : 17 Aug, 2014, 7:23:55 PM
    Author     : prachi
--%>
<%@page import="java.sql.*"%>
<%@include file="connection_db.jsp"%>
           <%@include file="cache_admin.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resolved Complaints</title>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
    </head>
    <body>
        <!--<a href="admin_home.jsp">HOME</a>-->
        <br><br><br>
        <br>
        <h3>RESOLVED COMPLAINTS</h3>
        <%
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","bansal");
            //Statement st=con.createStatement();
            //ResultSet rs=null;
            String q="select * from Complaint where resolved=1";
            rs=st.executeQuery(q);
            while(rs.next()){
                %>
                <a href="display_single_complaint.jsp?value=<%=rs.getString(1)%>"><%out.println(rs.getString(1));%></a>
                <%
            }
            %>
    </body>
</html>
