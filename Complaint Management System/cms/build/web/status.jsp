<%-- 
    Document   : status
    Created on : Aug 23, 2014, 2:01:50 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="connection_db.jsp"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint Status</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane.jsp"%>
        <%@include file="cache_user.jsp"%>
        <%--<%@include file="user_notification.jsp"%>--%>
    </head>
    <body>
        
        <script>
            function f(var v){
                alert(v);
            }
        </script>
        <form >
            <br>
            <br>
            <br>
            <br>
            <h3>
       
       <% 
       String q1="select C_id from Complaint where user_id='"+s1_u+"'";
        rs=st.executeQuery(q1);%>
        <h1>Complaints Registered By You:</h1>
      <%  while(rs.next())
        {
            out.println("<h3>"+rs.getString(1));        
        }%>
        <h3>  Enter the C_id whose Status you want to check: <input type="text" name="vstatus"  id="text1"/>
        <br>
                                                              
        
       <% String g=request.getParameter("vstatus");
       out.println(g);
       if(g!=null){
      String q="select Status_id from Complaint where C_id='"+g+"'";
        rs=st.executeQuery(q);
        if(rs.next())
        {
       String d=rs.getString(1);
       //out.println(d);
       %>
        
           <input type="button"  value="Click Me!" onclick="alert('Your status is  '+<%=d%>)" >
            
        <%}
       }%>
        
            <input type="submit" name="Check Status Again" value="check" id="t1" />
            <input type="button" value ="Back" name ="Back" onclick="history.back();">            
        </form>
        
        
    </body>
</html>
