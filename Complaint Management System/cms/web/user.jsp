<%-- 
    Document   : user
    Created on : Aug 22, 2014, 5:31:30 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <%@include file="header.jsp"%>
        <%@include file="sidepane.jsp"%>
        <%@include file="connection_db.jsp"%>
    </head>
    <body>
        <%
            String name= request.getParameter("uname");
            String pass= request.getParameter("upass");
            //String click= request.getParameter("button1");
            
            
           // if(click.equals("New User/Register"))
            //    response.sendRedirect("register.jsp");
            //else
            //{
                String query="select * from user where User_id='"+name+"' and Password='"+pass+"'";
                rs=st.executeQuery(query);
                if(rs.next()){
                 session.setAttribute("user_id",rs.getString(1) );
                        session.setMaxInactiveInterval(60); 
                //Cookie ck=new Cookie("uid",rs.getString(1));
                //ck.setMaxAge(24*60);
                //response.addCookie(ck);
                    response.sendRedirect("features.jsp");
                }
                else
                {
                    out.println("You are not a registered User or you entered wrong details!");
                    %>
                    <input type="button" value ="Back" name ="Back" onclick="history.back();">            
             <% }
            
            
            //}
            
        
        %>
         
    </body>
</html>
