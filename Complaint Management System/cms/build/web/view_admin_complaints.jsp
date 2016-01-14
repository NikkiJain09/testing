<%-- 
    Document   : display_single_complaint
    Created on : 17 Aug, 2014, 2:01:00 PM
    Author     : prachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="cache_admin.jsp"%>
<%@include file="connection_db.jsp"%>
<%@page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>Admin Complaints</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <br><br><br><br><br><br><br>
        <H1>ADMIN COMPLAINTS</H1><br><br>
        <%
        //Class.forName("com.mysql.jdbc.Driver");
        //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","bansal");
        //ResultSet rs=null;
        //Statement st=con.createStatement();
        String query="select * from Complaint where admin_request=1";
        rs=st.executeQuery(query);
        while(rs.next()){
            %>
        <a href="display_single_complaint.jsp?value=<%=rs.getString(1)%>">
            <%out.println("<h3>"+rs.getString(1)+"<h3>");%></a><br>
        <%}
        %>
    </body>
</html>
