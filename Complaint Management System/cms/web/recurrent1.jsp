<%-- 
    Document   : recurrent1
    Created on : 18 Aug, 2014, 10:05:58 AM
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
        <title>Recurrent Complaints</title>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        <form action="admin_home.jsp" method="post">
        <%
        String g=null;
            String c=request.getParameter("l");
            if(c.equals("l")){
 String q="SELECT count( nearby_location ) , nearby_location FROM Complaint GROUP BY nearby_location ORDER BY nearby_location DESC";
 rs=st.executeQuery(q);
 if(rs.next()){
     %>
     <br><br><br><br>  <h1>  TABLE DISPLAYING RECURRENT COMPLAINTS IN DIFFERENT LOCATIONS</h1><br><br>
     <table border="2">
         <h3>
         <tr><td>LOCATION</td>
             
             <td>COUNT</td></tr>
         <tr>
             <td><% g=rs.getString(2);
             out.println(rs.getString(2));%></td>
             
             <td><%out.println(rs.getString(1));%></td>
         </tr>
     
    
     <%
 }
 while(rs.next()){
     %>
     <tr ><td><%out.println(rs.getString(2));%></td>
             <td><%out.println(rs.getString(1));%></td></tr>
     
     <%
 }
 %>
 </table>
 <h3>Hence Complaints occur more recurrently in <%out.println(g);%></h3>
 <%
            }
            else if(c.equals("c")){
                String q="SELECT count(Complaint_category ) , Complaint_category FROM Complaint GROUP BY Complaint_category ORDER BY Complaint_category DESC";
 rs=st.executeQuery(q);
 if(rs.next()){
     %>
     <br><br><br><br><br><br><br>
     <h1>  TABLE DISPLAYING RECURRENT COMPLAINTS IN DIFFERENT CATEGORY</h1><br><br>
     <table border="2">
         <tr><td>CATEGORY</td>
             
             <td>COUNT</td></tr>
         <tr>
             <td><% g=rs.getString(2);
             out.println(rs.getString(2));%></td>
             
             <td><%out.println(rs.getString(1));%></td>
         </tr>
     
    
     <%
 }
 while(rs.next()){
     %>
     <tr ><td><%out.println(rs.getString(2));%></td>
             <td><%out.println(rs.getString(1));%></td></tr>
     
     <%
 }
 %>
 </table>
 <h3>Hence Complaints occur more recurrently in <%out.println(g);%> category</h3><br><br><br><br>
 <%
            }
            else{
                String q="Select * from Complaint";
                rs=st.executeQuery(q);
                int cd=0,wd=0,ed=0;
                while(rs.next()){
                    String h=rs.getString(1);
                    if(h.charAt(1)=='C'){
                        cd++;
                    }
                    else if(h.charAt(1)=='W'){
                        wd++;
                    }
                    else{
                        ed++;
                    }
                }
                %>
                <br><br><br><br><br><br>
                <h1>  TABLE DISPLAYING RECURRENT COMPLAINTS IN DIFFERENT DIVISION</h1><br><br><br><br>
                <table border="2">
                    <tr><td>Department</td>
                        <td>Count</td></tr>
                    <tr><td>CIVIL DIVISION</td>
                    <td><%out.println(cd);%></td></tr>
                    <tr><td>WATER DIVISION</td>
                    <td><%out.println(wd);%></td></tr>
                    <tr><td>ELECTRICITY DIVISION</td>
                    <td><%out.println(ed);%></td></tr>
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
