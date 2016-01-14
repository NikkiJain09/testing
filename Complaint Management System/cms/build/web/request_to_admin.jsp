<%-- 
    Document   : request_to_admin
    Created on : Aug 23, 2014, 2:29:32 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request to Admin</title>
        <%@page import="java.util.*"%> 
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane1.jsp"%>  
        <%@include file="connection_db.jsp"%>
        <%@include file="cache_user.jsp"%>
    </head>
    <body>
        
        
        
        
        <form>
        <%
java.util.Date d= new java.util.Date();

String q1="select * from Complaint where user_id='"+s1_u+"' and resolved=0 and admin_request=0 ";
        rs1=st.executeQuery(q1);%>
        <h1>Complaints Registered By You:</h1>
        <%
        int c=0;
        while(rs1.next())
        {
            
        
            java.sql.Date d1=rs1.getDate(8);
            long diff=d.getTime()-d1.getTime();
                int diffdays=(int)(diff/(24*60*60*1000));
                if(diffdays>180){
                    
                c=1;
            out.println("<h3>"+ rs1.getString(1));  %>
            <input type="checkbox" name="cd" value="<%=rs1.getString(1)%>" id="cd">
        <%
        }
                
        }
        if(c==1){
        %>
        <input type="submit" name="Check Status Again" value="Send to admin" id="t1" />
        <%
        }
        if(c==0){
            out.println("<h3>Currently no complaint is valid to be forwarded to admin");
        }
        
        String g[]=request.getParameterValues("cd");
        if(g!=null){
            for(int i=0;i<g.length;i++){
                String q="update  Complaint set admin_request=1 ,Status_id=6 where C_id='"+g[i]+"'";
                st.executeUpdate(q);
                response.sendRedirect("features.jsp");
            }
        }
        %>
        <br>
        <br>
        
        <input type="button" value ="Back" name ="Back" onclick="history.back();">            
       
       
        
        </form>
        
    </body>
</html>
