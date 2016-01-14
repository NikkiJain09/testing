<%-- 
    Document   : admin_delete_complaints
    Created on : 17 Aug, 2014, 5:24:04 PM
    Author     : prachi
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@include file="connection_db.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="style.css" />
<%@include file="cache_admin.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Delete Complaints</title>
    </head>
    <script type="text/javascript">
        function valid(){
           
            var ch=document.getElementsByTagName("input");
           
            var c=0;
            for(var i=0;i<ch.length;i++){
                if(ch[i].checked===true && ch[i].type==="checkbox"){
                    c=1;
                    
                    return true;
                }
            }
            if(!c){
                alert("Please check atleast one checkbox");
                return false;
            }
        }
    </script>
    
    <body>
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>
        
        <form action="delete_adm.jsp" method="post" onsubmit="return valid();">
            <br><br><br><br><br><br>
        <h1>Resolved and Notified</h1>
        <% int c=0,c1=0;
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cms","root","bansal");
            //ResultSet rs=null;
            //Statement st=con.createStatement();
            String q="select * from Complaint where resolved=1 and notified=1";
            rs=st.executeQuery(q);
            while(rs.next()){ c=1;
              %>
              <a href="display_single_complaint.jsp?value=<%=rs.getString(1)%>"><%
              out.println(rs.getString(1));%></a>
              <input type="checkbox" name="cd" value="<%=rs.getString(1)%>" id="cd">
              <br>
              <%
            }
            if(c==0){
                out.println("<h3>No Corresponding Entry</h3>");
            }
            %>
            <br><br><br><br><br><br>
            <h1>Resolved and Not Notified but User is not active for past 6 months</h1>
            <br>
            <br>
            <%
            q="select * from Complaint where resolved=1 and notified=0";
            rs=st.executeQuery(q);
            while(rs.next()){
            
                java.sql.Date d=rs.getDate(11);
                java.util.Date d1=new java.util.Date();
                long diff=d1.getTime()-d.getTime();
                int diffdays=(int)(diff/(24*60*60*1000));
                if(diffdays>180){
                    c1=1;
                
                    
                %>
                <a href="display_single_complaint.jsp?value=<%=rs.getString(1)%>">
                    <%out.println("<h3>"+rs.getString(1)+"<h3>");%></a>
                    <input type="checkbox" name="cd1" value="<%=rs.getString(1)%>" id="cd1">
                <%
            }
            }
            if(c1==0){
                out.println("<h3>No Corresponding Entry");
            }
            if(c1==1 || c==1){
            %>
            <input type="submit" value="Delete" name="submit"><br><br>
            <%}
            %>
        </form>
            
    </body>
</html>
