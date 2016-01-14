<%-- 
    Document   : view_resolved
    Created on : 17 Aug, 2014, 7:23:55 PM
    Author     : prachi
--%>
<%@page import="java.sql.*"%>
<%@include file="connection_db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@include file="cache_admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Location wise Complaints</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <!--<a href="admin_home.jsp">HOME</a>-->
        <br><br><br><br>
        <h1>LOCATION WISE COMPLAINTS</h1><br><br><br><br>
        <%
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","bansal");
            //Statement st=con.createStatement();
            //ResultSet rs=null;
            String s11=request.getParameter("DC");
            String q="select * from Complaint where nearby_location='"+s11+"'";
            rs=st.executeQuery(q);
            while(rs.next()){
                %>
                <a href="display_single_complaint.jsp?value=<%=rs.getString(1)%>"><%out.println("<h3>"+rs.getString(1));%></a>
                </br>
                <%
            }
            %>
            <input type="button" value ="Back" name ="Back" onclick="history.back();">
                </body>
</html>